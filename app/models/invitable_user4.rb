class InvitableUser4 < SimpleDelegator
  include ActiveModel::Validations

  validates :email, presence: true

  def valid?
    __getobj__.valid? && super
  end
end
