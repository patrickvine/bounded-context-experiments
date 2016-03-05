# == Schema Information
#
# Table name: user6s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User6 < ActiveRecord::Base
  validates :name, presence: true
end
