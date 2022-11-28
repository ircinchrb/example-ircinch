require "ircinch"

class Hello
  include Cinch::Plugin

  match "hello"

  def execute(m)
    m.reply "Hello, #{m.user.nick}"
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.libera.chat"
    c.channels = ["#ircinch-bots"]
    c.plugins.plugins = [Hello]
  end

  on :message, "hi" do |m|
    m.reply "Hi, #{m.user.nick}"
  end
end

bot.start
