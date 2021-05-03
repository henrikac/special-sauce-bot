require "./../../config/db.cr"

module Model
  class Model::Ducky < Granite::Base
    connection sqlite
    table ducky # Name of the table to use for the model, defaults to class name snake cased

    column id : Int32, primary: true # Primary key, defaults to AUTO INCREMENT
    column username : String
    column points : Int64 = 0
    column at_me_consent : Bool = true
    column super_cow_power : Bool = false
    column created_at : Time = Time.utc

    def self.valid_username?(username : String) : Bool
      /^[A-Za-z0-9_]{4,25}$/.matches?(username)
    end
  end
end
