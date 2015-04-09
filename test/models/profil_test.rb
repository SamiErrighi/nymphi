require 'test_helper'

class ProfilTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
end
