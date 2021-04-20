module Commands
  class Ping < Command
    def execute(caller_name : String, ducky_args : String) : String
      return PONG_FACTS.sample
    end

    # additional methods here
  end
end