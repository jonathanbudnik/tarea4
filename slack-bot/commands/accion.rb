module SlackBot
  module Commands
    class Accion < SlackRubyBot::Commands::Base
      match /^hora en (?<location>\w*)\?$/ do |client, data, match|
        require 'date'
        ciudad = match[:location].to_s.capitalize() 
      apiKey = 'DLQWHXQ52IIU'
      url = 'http://api.timezonedb.com/v2/list-time-zone?key='+apiKey+'&format=json&zone=*'+ciudad+'*'
    
      #Obtener pais
      result = HTTParty.get(url)
      json = JSON.parse(result.body)
      pais = json['zones'][0]['countryName'].to_s

      #Obtener hora
      timestamps = json['zones'][0]['timestamp'].to_s
      fecha1 = Time.at(timestamps.to_i).to_s #ARREGLAR 
      fecha2 = fecha1.split(" ")
      tiempo = fecha2[1]

      #Juntar informacion
        texto = "La hora actualmente en  " + ciudad +", "+ pais + " es: " + tiempo
        client.say(channel: data.channel, text: texto)
      end
    end
  end
end