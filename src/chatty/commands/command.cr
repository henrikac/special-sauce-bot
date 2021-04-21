# The Commands module contains a collection of commands
module Commands
  class Command
    def self.run(cmd : String, caller_name = "", ducky_args = "")
      case cmd
      when "!consent"
        Consent.run(caller_name, ducky_args)
      when "!echo"
        Echo.run(duckie_args)
      when "!feed"
        Duckie.feed(caller_name, duckie_args)
      when "!start_record"
        Duckie.create(caller_name)
      when "!burn_record"
        Duckie.delete(caller_name, duckie_args)
      end
    end
  end
end