class User7Validator < ActiveModel::Validator
  def validate(record)
    validators = record.validators || []
    validators.each do |v|
      v.validate(record)
    end
  end
end
