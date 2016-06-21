require 'sinatra/base'

module SlackBot
  class Web < Sinatra::Base
    get '/' do
      'Tarea 4 de Jonathan Budnik'
    end
  end
end