class List < ApplicationRecord
  belongs_to :group
  validates_presence_of :group_id
  validates :name, length: {minimum: 5, maximum:100}
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |list|
        csv << list.attributes.values_at(*column_names)
      end
    end
  end
end

