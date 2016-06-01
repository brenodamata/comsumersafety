module ImportHelper

  # ImportLogger.log_this data_set["label"], "label"
  # ImportLogger.log_this data_set["event"], "event"
  def self.log_this data, type, subtype
    # records_left = data_set["total_records"]
    data_set["partitions"].each do |pack|
      unless log_exists? pack, type, subtype
        ImportLog.create(import_type: type,
                         import_sub_type: subtype,
                         display_name: pack["display_name"],
                         size: pack["size_mb"].to_f,
                         records: pack["records"].to_i,
                         file: pack["file"],
                         date: data_set["export_date"])
      else
        return # If this log exists we are assuming the rest are in sequence and therefor exists also, so there is no need to check it further.
      end
      # records_left -= pack["records"].to_i
    end
  end

  def self.log_exists? pack, type, subtype
    ImportLog.where(import_type: type, import_sub_type: subtype, display_name: pack["display_name"], file: pack["file"], size: pack["size"])
  end

  def self.log_meta date
    ImportLog.create(import_sub_type: "meta fda", date: date)
  end

  def self.last_meta_date
    log = ImportLog.where(import_sub_type: "meta fda").order(date: :desc)
    log.first.date.to_date unless log.empty?
  end
end
