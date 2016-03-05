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

require 'rails_helper'

RSpec.describe User6, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
