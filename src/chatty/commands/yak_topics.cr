module Commands
  class YakTopics < Command
    def execute(calller_name : String, ducky_args : String) : String
      yaks = Yak.where(:created_at, :gt, 12.hours.ago)
        .where(:topic, :neq, "")
        .select

      topics = yaks.map { |yak| yak.topic }.join(", ")
      return "today we shaved: #{topics}"
    end

    # additional methods here
  end
end