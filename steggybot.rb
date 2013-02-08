require 'cinch'
Dir.glob("plugins/*").each {|x| require_relative x}

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.nick = "steggybot"
    c.channels = ["#csua", "#csuatest"]
    c.plugins.plugins = [Google, UrbanDictionary, TitleGrabber, Quotes, Pokedex, WhoAreThesePeople, Youtube, YaBish]
    c.plugins.options[Quotes] = {
      :quotes_file => "quotes.yml"
    }
    c.plugins.options[Pokedex] = {
      :pokedex => "pokedex.json"
    }
    c.plugins.options[WhoAreThesePeople] = {
      :identities => "identities.yml"
    }
  end
end

bot.start
