module Commands
  class Peas < Command
    def execute(caller_name : String, ducky_args : String) : String
      ducky = Ducky.find_by(username: caller_name) # Ducky | Nil
      if ducky
        return "you have #{ducky.points} peas!"
      end
      return "we couldn't find you; have you already !start_record ? "
    end

    # additional methods here
  end
end