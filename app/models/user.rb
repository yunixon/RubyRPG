# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  beat_game              :boolean          default(FALSE)
#  user_name              :string           default(""), not null
#  admin                  :boolean          default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#  api_token              :string           default(""), not null
#
# Indexes
#
#  index_users_on_api_token             (api_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
	has_many :players, foreign_key: 'user_id', inverse_of: :user
	accepts_nested_attributes_for :players, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  RailsAdmin.config { |c| c.label_methods << :user_name }

  before_save :ensure_api_token

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_by_login(name)
  	user = User.find_by(user_name: name)
  end

  def ensure_api_token
    self.api_token = generate_api_token
  end

  private

  def generate_api_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(api_token: token).first
    end
  end
end
