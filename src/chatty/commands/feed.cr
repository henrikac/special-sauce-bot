module Commands
  class Feed < Command
    SUPER_COWS = Set{
      "where_is_x", "anthonywritescode", "muumijumala", "somethingaboutus", "zklown", "zockle", "steve7411", "tanerax", "aigle_pt",
    }

    def execute(caller_name : String, ducky_args : String) : String
      if !SUPER_COWS.includes?(caller_name)
        return "*squint* you dont look like a super cow.. are you sure you have SUDO cow powers?"
      end

      parsed_args = args.split(' ', remove_empty: true)
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
      end

      ducky.points += points
      if ducky.save
        return "#{ducky_name} now has #{ducky.points} peas"
      end
      return "wat"
    end

    # additional methods here
  end
end