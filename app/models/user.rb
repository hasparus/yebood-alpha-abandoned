# frozen_string_literal: true
class User < ApplicationRecord
  attr_accessor :oauth_callback
  attr_accessor :current_password

  validates :email, presence: { if: :email_required? }
  validates :email, uniqueness: { allow_blank: true, if: :email_changed? }
  validates     :email, format: { with: Devise.email_regexp, allow_blank: true, if: :email_changed? }

  validates     :password, presence: { if: :password_required? }
  validates :password, confirmation: { if: :password_required? }
  validates :password, length: { within: Devise.password_length, allow_blank: true }

  def password_required?
    return false if email.blank? || !email_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    @oauth_callback != true
  end
  has_many :identities, dependent: :destroy
  enum role: [:user, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  def facebook
    identities.where(provider: 'facebook').first
  end

  def facebook_client
    @facebook_client ||= Facebook.client(access_token: facebook.accesstoken)
  end

  def github
    identities.where(provider: 'github').first
  end

  def github_client
    @github_client ||= Octokit::Client.new(access_token: github.accesstoken)
  end

  def google_oauth2
    identities.where(provider: 'google_oauth2').first
  end

  def google_oauth2_client
    @google_oauth2_client ||= GoogleAppsClient.client(google_oauth2)
  end
end
