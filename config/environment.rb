# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
EmpathiePlante::Application.initialize!

module Moped
  module BSON
    class ObjectId
      alias :to_json :to_s
      alias :as_json :to_s
    end
  end
end