# sorted alphabetically by value (proc name) and then by key (command string)

DYNAMIC_COMMANDS = {
  "!help"     => ->Commands.cmd_help(String, String),
  "!commands" => ->Commands.cmd_help(String, String),
  "!damn"     => ->Commands.cmd_damn(String, String),
  "!echo"     => ->Commands.cmd_echo(String, String),
  "!feed"     => ->Commands.cmd_feed(String, String),
  "!leaked"   => ->Commands.cmd_leaked(String, String),
  "!my_peas"  => ->Commands.cmd_peas(String, String),
  "!ping"     => ->Commands.cmd_ping(String, String),
  "!quote"    => ->Commands.cmd_quote(String, String),
  "!so"       => ->Commands.cmd_shoutout(String, String),
  "!water"    => ->Commands.cmd_water(String, String),
  # "!uptime" => ->Commands.cmd_uptime(String, String),
  # "!whoami" => ->Commands.cmd_whoami(String, String),

  "!start_record" => ->Commands.cmd_create_duckie(String, String),
  "!burn_record"  => ->Commands.cmd_delete_duckie(String, String),
  "!consent"      => ->Commands.cmd_consent(String, String),

  "!yak_count"    => ->Commands.cmd_yak_count(String, String),
  "!yak++"        => ->Commands.cmd_yak_inc(String, String),
  "!todayishaved" => ->Commands.cmd_yak_topics(String, String),
}

SUPER_COWS = Set{
  "where_is_x", "anthonywritescode", "muumijumala", "somethingaboutus", "zklown", "zockle", "steve7411", "tanerax", "aigle_pt",
}

module Commands
  enum Update
    Revoke
    Give
  end

  # does caller_name try to escape and call more duckie_args in our terminal?!
  def self.valid_caller_name?(caller_name : String)
    /^[A-Za-z0-9_]{4,25}$/.matches?(caller_name)
  end
end
