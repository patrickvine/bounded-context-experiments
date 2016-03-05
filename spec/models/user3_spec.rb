# == Schema Information
#
# Table name: user3s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User3, type: :model do
  describe "subclass it" do
    it "validates name when valid" do
      andy = User3.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User3.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when User3::Invitable" do
      andy = User3::Invitable.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User3::Invitable.new(name: "Andy Lindeman", email: 'andy@dot.com')
      expect(andy.valid?).to eq true
    end

    it "still validates name" do
      andy = User3::Invitable.new(email: 'andy@dot.com')
      expect(andy.valid?).to eq false
    end
  end

end
