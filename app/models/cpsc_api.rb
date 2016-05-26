module CpscApi
  include HTTParty
  cpsc_domain = "http://www.saferproducts.gov/RestWebServices"
  @base_uri = cpsc_domain + "/Recall?format=json"
  @all_results = []
  @searched_results = []

  def self.all_results
    @all_results.class == Array ? @all_results : @all_results.parsed_response
  end

  def self.searched_results
    @searched_results.class == Array ? @searched_results : @searched_results.parsed_response
  end

  def self.all_recalls
    @all_results = HTTParty.get(@base_uri)
  end

  def self.latest_recall
    @all_results.first unless @all_results.empty?
  end

  def self.last_recall_date
    latest_recall["RecallDate"] if self.latest_recall
  end

  def self.new_recall? date
    # code here
  end

  def self.import_all_recalls
    @all_results = HTTParty.get(@base_uri).parsed_response if @all_results.empty
    Product.import(@all_results)
  end

  def self.get_recall(recall_number=nil, recall_date_end=nil, product_name=nil, firm_name=nil)
    uri = @base_uri
    uri += "&RecallNumber=#{recall_number}" unless recall_number.nil?
    uri += "&DateEnd=#{recall_date_end}" unless recall_date_end.nil? # date format ={0:yyyy‐MM‐dd}
    uri += "&ProductName=#{product_name}" unless product_name.nil?
    uri += "&RecallFirm=#{firm_name}" unless firm_name.nil?

    @searched_results = HTTParty.get(uri)
  end

end
