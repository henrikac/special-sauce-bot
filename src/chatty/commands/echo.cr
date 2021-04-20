module Commands
  class Echo < Command
    def execute(caller_name : String, ducky_args : String) : String
      if duckie_args.empty?
        return "actually, it's !echo <duckie_args you want me to say>"
      elsif duckie_args[0] == '/' || duckie_args[0] == '.' # super secure
        return "nice try. 👅"
      end
      return duckie_args
    end

    # additional methods here
  end
end