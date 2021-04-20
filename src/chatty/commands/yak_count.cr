module Commands
  class YakCount < Command
    def execute(caller_name : String, ducky_args : String) : String
      yaks = Yak.where(:created_at, :gt, 12.hours.ago).select.size

      if yaks.zero?
        return "the yaks are woolly; here're some Shears have a nice day!"
      end
      return yaks.to_s
    end

    # additional methods here
  end
end