class InvitableUser5
  def initialize(user)
    @user = user
  end

  include ActiveModel::Validations
  validates :email, presence: true

  def id
    @user.id
  end

  def name
    @user.name
  end

  def email
    @user.email
  end

  def age
    @user.age
  end

  def valid?
    @user.valid? && super
  end
end
