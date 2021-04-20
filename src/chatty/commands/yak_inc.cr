module Commands
  class YakInc < Command
    def execute(caller_name : String, ducky_args : String) : String
      yak = Yak.new(created_at: Time.utc)
      if duckie_args
        yak.topic = duckie_args
      else
        yak.topic = ""
      end
      if yak.save
        yaks_shaved = self.cmd_yak_count("", "")
        # passing in two empty strings because proc expects exact # of args,
        # but isnt using them >_>;;
        return "that's #{yaks_shaved} now! " + YAK_INC_RESP.sample
      end
      return "couldn't shave. Waaat"
    end

    # additional methods here
  end
end