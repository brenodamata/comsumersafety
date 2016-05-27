module ImportHelper

  # ImportLogger.log_this data_set["label"], "label"
  # ImportLogger.log_this data_set["event"], "event"
  def self.log_this data, type, subtype
    # records_left = data_set["total_records"]
    data_set["partitions"].each do |pack|
      unless log_exists? pack, type, subtype
        ImportLog.new(import_type: type,
                      import_sub_type: subtype,
                      display_name: pack["display_name"],
                      size: pack["size_mb"].to_f,
                      records: pack["records"].to_i,
                      file: pack["file"],
                      date: data_set["export_date"])
      end
      # records_left -= pack["records"].to_i
    end
  end

  def log_exists? pack, type, subtype
    ImportLog.find(import_type: type, import_sub_type: subtype, display_name: pack["display_name"], file: pack["file"], size: pack["size"])
  end
end
