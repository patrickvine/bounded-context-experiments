class InvitableValidator < ActiveModel::Validator
  def validate record
    unless record.email.present?
      record.errors[:email] << 'Email is required.'
    end
  end
end
