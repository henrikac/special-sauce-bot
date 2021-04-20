module Commands
  class Shoutout < Command
    def execute(caller_name : String, ducky_args : String) : String
      return "nice try, 👅" if !valid_caller_name?(duckie_args)
      search_result = `twitch api get search/channels?query=#{duckie_args}`
      data = JSON.parse(search_result).dig("data") # => JSON::Any
      user = data.as_a.find { |user| user["display_name"].to_s.downcase == duckie_args.downcase }
      if user
        return "go check out twitch.tv/#{user["display_name"]}, they were last working on '#{user["title"]}'"
      end
      return "you can't spell mat"
    end

    # additional methods here
  end
end