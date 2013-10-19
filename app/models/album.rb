class Album < ActiveRecord::Base
  
  validates :title, :author, :date, presence: true
  validates :rating, allow_nil: false, numericality: { 
                                        greater_than_or_equal_to: CONSTANTS[:rating][:min],
                                        less_than_or_equal_to: CONSTANTS[:rating][:max]
                                      }
  validates :date, uniqueness: true

  def self.albums_for_month_and_year month, year
    start_date = Date.new year, month, 1
    end_date = start_date + Time.days_in_month(month, year)
    Album.where{ (date >= start_date) & (date < end_date) }
  end

end
