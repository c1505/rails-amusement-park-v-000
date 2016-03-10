class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # "Sorry. You do not have enough tickets the #{@attraction.name}."
    # if user.tickets < attraction.tickets
    #   "Sorry. You do not have enough tickets the #{attraction.name}."
    # end

     
    if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
  end

end
