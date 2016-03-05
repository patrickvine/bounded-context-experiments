# == Schema Information
#
# Table name: user2s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User2 < ActiveRecord::Base
  validates :name, presence: true

  def validate_invitable
    self.singleton_class.send(:include,  User2::Invitable)
  end
end
