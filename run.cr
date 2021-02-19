require "./charlie.cr"
require "./bobbie.cr"
require "socket"
require "openssl"

alias Following_Info = NamedTuple(broadcaster: String, user: String)
# alias TwitchEvent = NamedTuple(event_type: String, broadcaster: String, user: String)

channel = Channel(Following_Info).new(10)

charlie = Charlie.new(
  token: ENV["TWITCH_CHAT_TOKEN"],
  bot_name: ENV["BOT_NAME"],
  channel_name: ENV["CHANNEL_NAME"],
  knit_between_fibers: channel,
)

charlie.listen

bobbie = Bobbie.new(
  knit_between_fibers: channel
)

bobbie.listen

Signal::INT.trap { charlie.goodbye; exit }
# bobbie.goodbye please

while charlie.listening && (yana_says = gets)
  yana_says = yana_says.chomp
  if yana_says == "quit"
    charlie.goodbye
  else
    charlie.say(yana_says)
  end
end
