module Commands
  class CreateDuckie < Command
    def execute(caller_name : String, ducky_args : String) : String
      d = Ducky.create(username: caller_name)
      if d.errors.empty?
        return "welcome to the flock!"
      end 
      # we hit some kinda error... :/
      return "we couldn't start a record for you. you might already have one Waaat"
    end

    # additional methods here
  end
end