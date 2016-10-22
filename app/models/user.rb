class User < ActiveRecord::Base
	has_secure_password

	has_many :connections
	has_many :invites
	has_many :connections_they_are_inviting, through: :invites, source: :connection

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, :email, :description, presence: true
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :password, length: {minimum: 8}, presence: true, on: :create
	validates_confirmation_of :password, allow_blank: true

end
