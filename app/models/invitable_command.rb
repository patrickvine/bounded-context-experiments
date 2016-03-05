class InvitableCommand
  def initialize(user)
    @user = user
  end

  include ActiveModel::Validations
  validates :email, presence: true

  def invite!
    "Send a mail to #{@user.name} #{@user.email}"
  end

  def valid?
    @user.valid? && super
  end

  protected

  def email
    @user.email
  end
end
