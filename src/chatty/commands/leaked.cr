module Commands
  class Leaked < Command
    def execute(caller_name : String, ducky_args : String) : String
      leak_record = Leak.order(created_at: :desc).limit(1).select.first

      return "there were no leaks 🙃" if leak_record.nil?
      span = Time.utc - leak_record.created_at
      if span > 1.days
        return "#{span.days} days since we last ducked up"
      elsif span > 1.hours
        return "#{span.hours} hours since we last ducked up"
      end
      return "#{span.minutes} minutes since we last ducked up"
    end

    # additional methods here
  end
end