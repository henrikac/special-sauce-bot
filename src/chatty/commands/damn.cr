module Commands
  class Damn < Command
    def execute(caller_name : String, ducky_args : String) : String
      # we dont want just any regular user calling this method (prevent abuse!)
      d = Ducky.find_by(username: caller_name) # Ducky | Nil
      if d && d.super_cow_power                # is the caller a super_cow?
        leak = Leak.new(created_at: Time.utc)
        if leak.save
          return "you get a new key! you get a new key! EVERYBODY GETS A NEW KEY!!"
        end
        return "create_new_leak is busted :( "
      end
      return "not authorized to record a new !leaked keys time"
    end

    # additional methods here
  end
end