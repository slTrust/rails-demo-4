class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://hedabao.cn'
    mail(to: @user.email, subject: '欢迎来到 My First Rails Project')
  end
end
