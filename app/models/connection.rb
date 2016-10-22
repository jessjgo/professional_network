class Connection < ActiveRecord::Base
  belongs_to :user
  has_many :invites
  has_many :users_they_are_invited_to, through: :invites, source: :user
end
