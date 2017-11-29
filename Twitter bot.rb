require 'Twitter' 
while true
    begin
        config = {
            consumer_key:        '',
            consumer_secret:     '',
            access_token:        '',
            access_token_secret: ''
        }
        rClient = Twitter::REST::Client.new config
        sClient = Twitter::Streaming::Client.new(config)

topics = ['#food', '#style', '#manger', '#promo', '#vêtements', '#code promo', '#réduction', '#discount', '#france', '#français']
        sClient.filter(:track => topics.join(',')) do |tweet|
            if tweet.is_a?(Twitter::Tweet)
              puts tweet.text 
              rClient.fav tweet
              rClient.update("@#{tweet.user.screen_name} Hey salut ! Je ne fais que passer. Juste pour te dire que si tu es à la recherche de codes promos pour tout types de sites exemple Foodora, Asos ou autre, Widilo est ton ami ! Vas checker l'app sur ton store et ne remercies pas c'est cadeau l'ami. Allez bisous")
              sleep 300
            end
        end
    rescue
        puts 'error occurred, waiting for 5 seconds'
        sleep 5
    end

end
