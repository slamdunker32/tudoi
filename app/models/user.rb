class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  # この1行を追加
  validates :name, presence: true, length: { maximum: 50 }
end
