class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email # 任何时候都需要 email
  # 只在创建的时候 必须给我 password_confirmation
  validates_presence_of :password_confirmation, on: [:create]

  # 验证邮箱格式
  validates_format_of :email, with:/.+@.+/ , if: :email
  # 密码长度限制
  validates :password, length:{ minimum: 6},on:[:create], if: :password
end
