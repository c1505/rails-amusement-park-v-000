class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    unless nausea.nil? || happiness.nil?
      if nausea > happiness
        'sad'
      elsif nausea < happiness
        'happy'
      end
    end
  end

end