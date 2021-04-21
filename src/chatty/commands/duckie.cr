module Commands
  # A duckie is a **...**
  #
  # To create a duckie:
  #
  # ```
  # Duckie.create("quackie")
  # ```
  #
  # To feed a duckie
  #
  # ```
  # Duckie.feed("quackie", "...")
  # ```
  #
  # To delete a duckie
  #
  # ```
  # Duckie.delete("quackie", "quackie")
  # ```
  #
  # TODO: Update "how to feed a duckie example"
  class Duckie
    # Adds a new duckie to the flock - quaaaack!
    def self.create(caller_name : String) : String
      d = Ducky.create(username: caller_name)
      if d.errors.empty?
        return "welcome to the flock!"
      else # we hit some kinda error... :/
        return "we couldn't start a record for you. you might already have one Waaat"
      end
    end

    # Removes a duckie from the flock
    def self.delete(caller_name : String, duckie_args : String) : String
      # !burn_record <caller_name>
      if caller_name != duckie_args.downcase
        return "who're you trying to delete? try !burn_record #{caller_name}"
      end
      # below this line, keep in mind that caller_name == duckie_args
      if ducky = Ducky.find_by(username: caller_name)
        ducky.destroy
        if ducky.destroyed?
          return "burnt to a crisp!"
        else
          return "we found your record but couldn't destroy it..?"
        end
      else
        return "wat. you don't have a record"
      end
    end

    # Feeds a duckie
    def self.feed(caller_name : String, ducky_args : String) : String
      if !SUPER_COWS.includes?(caller_name)
        return "*squint* you dont look like a super cow.. are you sure you have SUDO cow powers?"
      end

      parsed_args = ducky_args.split(' ', remove_empty: true)
      if parsed_args.size != 2
        return "you wat. we expected 2 args."
      end
      prePoints, ducky_name = parsed_args
      points = prePoints.to_i { 0 } # try* to parse to int, if not default to 0
      ducky = Ducky.find_by(username: ducky_name.downcase)

      if ducky.nil?
        # maybe we should make them a record, WITHOUT their consent??
        return "oye! #{caller_name} we don't have a #{ducky_name} in our records. if they would like to receive the feed, they should !start_record ?"
      elsif points.zero?
        return "thats either an invalid number, or something something"
      elsif points.abs > 1000
        return "too much feed"
      else
        ducky.points += points
        if ducky.save
          return "#{ducky_name} now has #{ducky.points} peas"
        else
          return "wat"
        end
      end
    end
  end
end