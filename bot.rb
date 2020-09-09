require 'twitter'

fork do

    client = Twitter::REST::Client.new do |config|
       
    end

    tags = ["#javascript", "#js"]

    correctTag = ["#php","#browser","#programming","#npm","#html","#css","#frontend","#frontEnd","#gamedev","#developement","#Development","#nodejs","#devs","#dev","#coding","#webdev","coder","#mysql","#tech","#AI","ReactJS","React"]

    while true
        tags.each do |tag|
            client.search(tag, result_type: "Latest").take(100).each do |tweet|
                #puts " ---------------------------- "
                #puts tag
                #puts tweet.text
                #puts tweet.user.screen_name
                if tag == "#js"
                    nbtag = 0
                    for cTag in correctTag do
                        #puts /#{cTag}/.match(tweet.text)
                        if /#{cTag}/.match(tweet.text) != nil
                            nbtag += 1
                        end
                    end
                    if nbtag != 0
                        #puts "retweet"
                        begin
                            client.retweet!(tweet)
                        rescue => exception
                            #puts exception
                            #puts "Already Retweeted"
                        else
                            #puts "Retweeted"
                        end
                    end
                end
                if tag == "#javascript"
                    begin
                        client.retweet!(tweet)
                    rescue => exception
                        #puts exception
                        #puts "Already Retweeted"
                    else
                        #puts "Retweeted"
                    end
                end            
            end
        end
        sleep(300)
    end
end
