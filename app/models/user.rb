# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :text             not null
#  name            :string           not null
#  password_digest :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: /\A[\w.!#$%&'*+\/=?^`{|}~-]+@[\w-]+(?:\.[\w-]+)*\z/i}
                    uniqueness: true
  before_validation {email.downcase!}
  has_secure_password
  validates :password, length: {minlength: 6}

  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_many :favorites_blogs, through: :favorites, source: :blog
end
