class Reservation < ActiveRecord::Base
  attr_accessible :booked_for, :hour, :party_size, :user_id
  
  belongs_to :user
  
  # def user
  #   @user ||= User.find_by_id(self.user_id)
  #   
  #   # @user = @user || User.find_by_id(self.user_id)
  #   
  #   # if @user.nil?
  #   #   @user = User.find_by_id(self.user_id)
  #   # end
  #   # return @user
  # end
  
  after_create :add_user_points
  after_destroy :remove_user_points
  
  def remove_user_points
    self.user.points -= self.party_size * 10
    self.user.save
  end
  
  def add_user_points
    # self.user.update_attributes(points: self.user.points + self.party_size * 10)
    # self.user.points = self.user.points + self.party_size * 10
    self.user.points += self.party_size * 10
    self.user.save
  end
  
  validate :less_than_max_occupancy
  
  def less_than_max_occupancy
    other_people = Reservation.where(:booked_for => self.booked_for, :hour => self.hour).sum(:party_size)
    
    if other_people + self.party_size > 30
      errors.add(:base, "Sorry, too many people!")
    end
  end
  
end
