class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email # 不能为空
  validates_uniqueness_of :email # 邮箱唯一

  validates_presence_of :password_confirmation, on: [:create]

  validates_format_of :email, with:/.+@.+/ , if: Proc.new { |u| u.email.present? }
  validates :password, length:{ minimum: 6},on:[:create], if: :password
  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end
