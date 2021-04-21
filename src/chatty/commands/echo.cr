module Commands
  class Echo
    def self.run(ducky_args : String) : String
      if duckie_args.empty?
        return "actually, it's !echo <duckie_args you want me to say>"
      elsif duckie_args[0] == '/' || duckie_args[0] == '.' # super secure
        return "nice try. 👅"
      else
        return duckie_args
      end
    end
  end
end