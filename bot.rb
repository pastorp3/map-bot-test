require 'telegram/bot'
require_relative 'test_json.rb'
require_relative 'methods.rb'


token = "1151751809:AAHdqV2oi3pV-hhhGRCKb3ffUBp25HOp7F0"

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    begin
      @keyword = message.text[%r{/([a-zA-Z]+)}]
    rescue StandardError => e
      log.fatal(e)
      log.fatal(message.text)
    else
      case @keyword
      when '/map'
        m = message.text
        input = set_location(m)
        if input == false
          bot.api.send_message(chat_id: message.chat.id, text: "No valid country type again")
        else
          location = SetLocation.new
          latitud = location.latitud(input)
          longitude = location.longitude(input)
          bot.api.send_location(chat_id: message.chat.id, latitude: latitud, longitude: longitude)
        end
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      when '/end'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      end
      case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      end
    end
  end
end



  

    #bot.api.send_location(chat_id: message.chat.id, latitude: -37.807416, longitude: 144.985339)