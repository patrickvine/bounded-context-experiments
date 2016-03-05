# == Schema Information
#
# Table name: user7s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User7 < ActiveRecord::Base

  validates :name, presence: true

  validates_with User7Validator
  attr_reader :validators

  def add_validation validator
    @validators ||= []
    @validators << validator
  end

  def invite!
    "Send a mail to #{name} #{email}"
  end
end
