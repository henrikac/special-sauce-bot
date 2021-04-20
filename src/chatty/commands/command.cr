module Commands
  abstract class Command
    def execute(caller_name : String, ducky_args : String) : String
    end
  end
end