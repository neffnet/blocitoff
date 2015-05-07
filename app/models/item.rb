class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true
  validates :user, presence: true

  def days_left
  	7 - age_in_days
  end

  def age_in_days
  	( DateTime.now.to_date - created_at.to_date ).to_i
  end

  def color
  	if days_left < 2
  		"red"
  	elsif days_left < 5
  		"yellow"
  	else
  		"green"
  	end
  end

end
