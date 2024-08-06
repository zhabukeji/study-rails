class User < ApplicationRecord
  attr_accessor :remember_me
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, if: -> { new_record? || :crypted_password_change? }
  validates :password, confirmation: true, if: -> { new_record? || :crypted_password_change? }
  validates :password_confirmation, presence: true, if: -> { new_record? || :crypted_password_change? }

  validates :email, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "格式不正确"}
end
