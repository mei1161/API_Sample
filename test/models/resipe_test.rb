# == Schema Information
#
# Table name: resipes
#
#  id          :bigint           not null, primary key
#  cost        :integer
#  ingredients :string
#  making_time :string
#  serves      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ResipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
