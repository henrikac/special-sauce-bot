module Commands
  class Quote < Command
    def execute(caller_name : String, ducky_args : String) : String
      return QUOTES.sample
    end

    # additional methods here
  end
end