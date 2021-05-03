require "./**" # import everything including dir inside ourselves :>
require "./../data/constants_collection.cr"
require "./../models/ducky.cr"
require "./../models/leak.cr"
require "./../models/yak.cr"
require "json"

class Chatty
  getter listening
  @@static_commands = Hash(String, String).new
  self.reload_static_commands

  def self.reload_static_commands : Bool
    @@static_commands.merge! Hash(String, String).from_json(File.read("./src/data/commands.json"))
    return true
  rescue shit_json : JSON::ParseException
    @@static_commands = Hash(String, String).new
    puts "🤬 shit json"
    return false
  rescue shit_path : File::NotFoundError
    puts "🤬 shit path \n#{p! `pwd`}"
    return false
  end

  def initialize(token : String,
                 bot_name : String,
                 channel_name : String,
                 knit_between_fibers : Channel(Following_Info),
                 silent_mode : Bool = false,
                 use_new_irc_msg : Bool = false)
    @bot_name = bot_name
    @channel_name = channel_name
    @knit_between_fibers = knit_between_fibers
    tcp_sock = TCPSocket.new("irc.chat.twitch.tv", 6697)
    @client = OpenSSL::SSL::Socket::Client.new(tcp_sock)
    @silent_mode = silent_mode
    @use_new_irc_msg = use_new_irc_msg

    @client.puts("PASS #{token}")
    @client.puts("NICK #{bot_name}") # twitch doesn't seem to use this ???
    @client.puts("JOIN ##{channel_name}")
    @client.puts("CAP REQ :twitch.tv/tags") # gimme them tags booboo
    puts "I'm alive!"
    say("🌊 hi")
  end

  def say(message : String)
    @client.puts("PRIVMSG ##{@channel_name} :#{message} \r\n")
    @client.flush
  end

  def listen
    @listening = true
    spawn do
      while listening && (raw_irc = @client.gets)
        now = Time.local.to_s
        ircm = IRCMessage.new(raw_irc)
        if ircm.is_ping?
          answer_ping()
        elsif ircm.is_user_msg?
          if should_respond_to_message?(ircm.username, ircm.message)
            # respond_old(ircm.username, ircm.message)
            respond(ircm)
          end
        end
        puts ircm.print
      end
    end

    # fiber stuff for follows
    spawn do
      while listening && (following_event = @knit_between_fibers.receive)
        say("Waaat thanks for quackin' along #{following_event[:user]} Waaat")
      end
    end
  end

  def should_respond_to_message?(username : String, message : String)
    # silent mode == don't say anything to chat
    # also no more bot fights
    return !@silent_mode && username && message && username != @bot_name
  end

  def respond(ircm)
    if Command.is_command?(ircm)
      say Command.get_command(ircm).call(ircm)
    elsif @@static_commands.has_key?(ircm.words.first)
      say(@@static_commands[ircm.words.first])
    elsif ircm.words.first == "!reload"
      ducky = Model::Ducky.find_by(username: ircm.username)
      if ducky.nil? || !ducky.super_cow_power
        say("you don't look like a super cow to me... are you sure you have SUDO cow powers?")
      end
      if Chatty.reload_static_commands
        say("you got it bawhs")
      else # reload failed
        say("theres probably some trailing comma in the shit json, ya wat")
      end
    end
  end

  def goodbye
    say("🌊 bye")
    # part the channel
    # quit the server
    @client.puts("QUIT")
    @listening = false
    # puts @client.gets

    @client.close
    puts "\n🌊\n"
  end

  def answer_ping
    if @silent_mode
      say "have you joined the flock yet? !start_record so we can start feeding you peas :>"
    else
      say PONG_FACTS[Random.rand(PONG_FACTS.size)] # "PONG" :>
    end
  end
end
