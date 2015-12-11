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
    leads = user_teams.where(role: 'team_lead').pluck(:team_id)
    Team.where(id: leads)
  end

  def team_lead?
    user_teams.where(role: 'team_lead').any?
  end

  def set_teams(team_ids)
    current_team_ids = self.teams.pluck(:id)
    to_remove = current_team_ids - team_ids
    to_add = team_ids - current_team_ids
    self.user_teams.where(team_id: to_remove).delete_all
    to_add.each do |id|
      self.user_teams.create!(team_id: id)
    end
  end

  def name
    username.capitalize
  end

end
