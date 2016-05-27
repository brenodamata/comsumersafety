require 'net/http'
require 'zip'

class ImportLog < ApplicationRecord
  before_save :set_import_type_id
  after_create :process

  validates :display_name, uniqueness: { scope: [:type_id, :file, :size] }

  TYPES = {
    "none" => 0,
    "product" => 1,
    "food" => 2,
    "drug" => 3,
    "medical_device" => 4
  }

  protected

  def set_import_type_id
    unless TYPES[self.import_type.underscore].nil?
      self.type_id = TYPES[self.import_type.underscore]
    else
      self.type_id = TYPES["none"]
    end
  end

  def process
    unless self.processed
      self.import_type.capitalize.constantize.process self.get_json_from_zip, self.import_sub_type
    end
  end

  def get_json_from_zip
    uri = URI(self.file)
    net = Net::HTTP.start(uri.host).get2(uri.path)

    # Downloads the zip file and saves it in the /tmp directory
    open("tmp/import.zip", "wb") { |file|
      file.write(net.body)
    }

    # Open zip file to extract the json file
    zipfile = Zip::File.open("tmp/import.zip")

    # There will be only one json file per zip file
    json_data = JSON.load(zipfile.first.get_input_stream.read)

    # Delete the zip file
    File.delete("tmp/import.zip") if File.exist?("tmp/import.zip")

    # Return data in JSON format
    json_data
  end

end
