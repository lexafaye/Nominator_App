class Nominate < ActiveRecord::Base
belongs_to :user
end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |nominate|
        csv << nominate.attributes.values_at(*column_names)
      end
    end
  end
