class Album < ActiveRecord::Base

  def self.albums_for_month_and_year month, year
    start_date = Date.new year, month, 1
    end_date = start_date + Time.days_in_month(month, year)
    Album.where{ (date >= start_date) & (date < end_date) }
  end

end
