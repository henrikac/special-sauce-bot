module Commands
  class Help < Command
    def execute(caller_name : String, ducky_args : String) : String
      intro_bit = "the commands are: "
      keys_bit = DYNAMIC_COMMANDS.keys.sort.join(" | ")
      return intro_bit + keys_bit
    end

    # additional method here
  end
end