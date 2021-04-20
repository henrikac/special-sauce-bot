module Commands
  class Water < Command
    def execute(caller_name : String, ducky_args : String) : String
      # TBD: randomly picks a duck and tags them, asking them to drink
      duckie = Ducky.find_by(username: args.downcase)
      if duckie.nil?
        return "no such duckie, have they `!start_record` yet?"
      elsif duckie.at_me_consent
        return "HYDRATE #{args}! go get your feathers wet :>"
      end
      return "they didn't give us consent to water them :<"
    end

    # additional methods here
  end
end