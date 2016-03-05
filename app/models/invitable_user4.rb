class InvitableUser4 < SimpleDelegator
  include ActiveModel::Validations

  validates :email, presence: true
end
