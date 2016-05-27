class MedicalDevice < ApplicationRecord
  belongs_to :category, optional: true
  has_many :recalls, as: :recallable
  
  def self.import data_set
    import_event data_set["classification"]
    import_label data_set["recall"]
    import_label data_set["registrationlisting"]
    import_label data_set["pma"]
    import_label data_set["event"]
  end

  def self.import_event event_set

  end

  def self.import_label label_set
    # Zip::File.open(params[:archive].tempfile) do |zip_file|
    #   zip_file.each do |entry|
    #     json_data = JSON.load(entry.get_input_stream.read)
    #   end
    # end
  end

end
