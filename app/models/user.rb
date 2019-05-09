class User < ApplicationRecord
  include Validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  before_validation :strip_nickname

  validates :nickname, presence: true, length: { in: 2..30, **CAN_BE_BLANK },
                       uniqueness: CAN_BE_BLANK

  private

  def strip_nickname
    nickname.strip!
  end
end
