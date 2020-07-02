class Session
  include ActiveModel::Model
  attr_accessor :email, :password, :user
  validates :email, presence: true
  validate :check_email , if: :email # 自定义校验
  validates :password, presence: true

  validates_format_of :email, with:/.+@.+/ , if: :email
  validates :password, length:{ minimum: 6}, if: :password
  validate :email_password_match, if: Proc.new { |s| s.email.present? and s.password.present? }

  def check_email
    @user ||= User.find_by_email email
    if user.nil?
      # 添加一条错误规则, not_found 就是你 i18n 转译对应的 key
      errors.add :email, :not_found
    end
  end

  def email_password_match
    @user ||= User.find_by_email email
    if user and not user.authenticate(password)
      errors.add :password, :missmatch
    end
  end

  end