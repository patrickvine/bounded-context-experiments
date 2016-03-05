module User2::Invitable
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true
  end
end
