class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea > self.happiness
      'sad'
    elsif self.nausea < self.happiness
      'happy'
    end
  end

end