class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validate :validate_username

  has_many :teams, :through => :user_teams
  has_many :tasks, :through => :progresses
  has_many :progresses
  has_many :user_teams

  attr_accessor :login

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def teams_led
    user_teams.where(role: 'team_lead')
  end

  def team_lead?
    user_teams.where(role: 'team_lead').any?
  end
end
