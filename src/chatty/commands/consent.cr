module Commands
  class Consent < Command
    def execute(caller_name : String, ducky_args : String) : String
      update = Update.parse?(duckie_args)
      ducky = Ducky.find_by(username: caller_name)

      if ducky.nil?
        return "sorry, we couldn't find you. have you already `!start_record` ?"
      end

      case update
      in Nil
        return "try !consent <give/revoke>"
      in Update::Revoke
        ducky.at_me_consent = false
      in Update::Give
        ducky.at_me_consent = true
      end
      if ducky.save
        return "aye aye!"
      end
      return "that failed :( time to git blame/annotate where_is_x"
    end
    
    # additional methods here
  end
end