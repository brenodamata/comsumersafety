module FdaApi
  include HTTParty
  fda_domain = "https://api.fda.gov"
  @base_uri = fda_domain + "/download.json"
  # with key 240 requests per minute (per key) / 120000 requests per day (per key)
  # without key 40 requests per minute (per IP) / 1000 requests per day (per IP)
  @api_key = "isoACFSRdrA01pXyUMUKrOzf75Xoi3BjW1bpjvcP"
  @all_results = []
  @searched_results = []

  def self.all_results
    @all_results.class == Array ? @all_results : @all_results.parsed_response
  end

  def self.searched_results
    @searched_results.class == Array ? @searched_results : @searched_results.parsed_response
  end

  def self.last_updated
    all_data_files["meta"]["last_updated"]
  end

  def self.all_data_files force=false
    @all_results = HTTParty.get(@base_uri) if force || @all_results.empty?
    all_results
  end

  # Import all data from FDA API
  def self.import_all
    [Food, Drug, MedicalDevice].each do |type|
      name = (type == MedicalDevice ? "device" : type.to_s.underscore)
      type.import self.all_data_files["results"][name]
    end
  end

  # Import new data from FDA API
  def self.import_new
    # If it's the first time or data has it been updated
    if ImportHelper.last_meta_date.nil? || all_results["meta"]["last_updated"].to_date > ImportHelper.last_meta_date
      ImportHelper.log_meta all_results["meta"]["last_updated"]

      import_all
    end
  end


# sandbox start
  def self.all_food
    all_data_files["results"]["food"]["enforcement"]
  end

  def self.import_all_food
    Food.import all_food
  end

  def self.all_drug_event
    all_data_files["results"]["drug"]["event"]
  end

  def self.all_drug_label
    all_data_files["results"]["drug"]["label"]
  end

  def self.import_all_drug
    Drug.import all_data_files["results"]["drug"]
  end

  # Timely method
  def self.get_all_food_data
    all = all_data_files
    total_records = all["results"]["food"]["enforcement"]["total_records"]
    skip = 0
    results = []
    (total_records/100.0).ceil.times do
      uri = fda_domain + "/food/enforcement.json?" + api_key + "&limit=100&skip=#{skip}"
      data = HTTParty.get(uri)
      results << data["results"]
      skip += 100
    end
    results.flatten.compact
  end
# sandbox end
end
