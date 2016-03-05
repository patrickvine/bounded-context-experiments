# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, if: :with_invitable

  def validate_invitable
    @with_invitable = true
  end

  def with_invitable
    @with_invitable
  end
end
