class Food < ApplicationRecord
  belongs_to :category, optional: true
  has_many :recalls, as: :recallable

  def self.import data_set
    ImportHelper.log_this data_set["enforcement"], self.name, "enforcement"
  end

# not used
  def self.import_new data_set
    unless ImportHelper.log_exists? data_set["enforcement"].first, self.name, "enforcement"
      import data_set
    end
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
    "results": [
      {
        "classification": "Class II",
        "center_classification_date": "20160415",
        "report_date": "20160427",
        "postal_code": "78218-5415",
        "recall_initiation_date": "20160316",
        "recall_number": "F-1083-2016",
        "city": "San Antonio",
        "event_id": "73576",
        "distribution_pattern": "Texas",
        "openfda": {},
        "recalling_firm": "HEB Retail Support Center",
        "voluntary_mandated": "Voluntary: Firm Initiated",
        "state": "TX",
        "reason_for_recall": "The product may have been under processed.",
        "initial_firm_notification": "Two or more of the following: Email, Fax, Letter, Press Release, Telephone, Visit",
        "status": "Ongoing",
        "product_type": "Food",
        "country": "United States",
        "product_description": "Hill Country Fare Chunk Light Tuna in pure vegetable oil NET WT. 5 OZ (142g) packaged in a metal can.",
        "code_info": " UPC 041220653355 lot code 6O9FZ SCEES",
        "address_1": "4710 N Pan Am Expy",
        "address_2": "",
        "product_quantity": "5,376 units"
  end

end
