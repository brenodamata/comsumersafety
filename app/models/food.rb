class Food < ApplicationRecord
  belongs_to :category, optional: true
  has_many :recalls, as: :recallable

  def self.import data_set
    ImportHelper.log_this data_set["enforcement"], self.name, "enforcement"
  end

  # I am leaving this method to follow the patter as the others did
  # In case more data is added, this method will act as a controller (see drug.rb)
  # Returns true/false if successful/not
  def self.process data, type
    return process_enforcemnt data
  end

  # Reads and input Json formatted data about Food Enforcements
  # Return true/false if successful/not
  def self.process_enforcemnt data
    # data in json format
  end

end
