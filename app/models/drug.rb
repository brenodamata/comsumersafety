class Drug < ApplicationRecord
  belongs_to :category, optional: true
  has_many :recalls, as: :recallable

  def self.import data_set
    ImportHelper.log_this data_set["label"], self.name, "label"
    ImportHelper.log_this data_set["event"], self.name, "event"
  end

  # Returns true/false if successful/not
  def self.process data, type
    case type
    when "label"
      return self.process_label data
    when "event"
      return self.process_event data
    else
      return false # TODO: implement a failsafe
    end
  end

  # Reads and input Json formatted data about Drug Labels
  # Return true/false if successful/not
  def self.process_label data
    # data in json format
  end

  # Reads and input Json formatted data about Drug Events
  # Return true/false if successful/not
  def self.process_event data
    # data in json format
  end
end
