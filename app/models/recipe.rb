# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  cost        :integer          not null
#  ingredients :string           not null
#  making_time :string           not null
#  serves      :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :making_time, presence: true
  validates :serves, presence: true
  validates :ingredients, presence: true
  validates :cost, presence: true
end
