module Commands
  class DeleteDuckie < Command
    def execute(caller_name : String, ducky_args : String) : String
      # !burn_record <caller_name>
      if caller_name != duckie_args.downcase
        return "who're you trying to delete? try !burn_record #{caller_name}"
      end
      # below this line, keep in mind that caller_name == duckie_args
      if ducky = Ducky.find_by(username: caller_name)
        ducky.destroy
        if ducky.destroyed?
          return "burnt to a crisp!"
        end
        return "we found your record but couldn't destroy it..?"
      end
      return "wat. you don't have a record"
    end

    # additional methods here
  end
end