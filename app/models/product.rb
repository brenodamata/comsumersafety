class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :recalls, as: :recallable

  def self.import data_set
    data_set.each do |data|
      prod_data = data["Products"].first
      product = Product.new(name: prod_data["Name"])
      product.description = prod_data["Description"] unless prod_data["Description"].empty? # TODO: might need formating
      product.model = prod_data["Model"] unless prod_data["Model"].empty?
      product.type = prod_data["Type"] unless prod_data["Type"].empty?
      product.manufacturer = get_text(data["Manufacturers"], "Name") unless data["Manufacturers"].empty?
      product.manufacturer_countries = get_text(data["ManufacturerCountries"], "Country") unless data["ManufacturerCountries"].empty?

      if product.save
        recall = product.recalls.new(number: data["RecallNumber"],
                                      description: data["Description"],
                                      url: data["URL"],
                                      title: data["Title"],
                                      consumer_contact: data["ConsumerContact"],
                                    )
        recall.date = data["RecallDate"]
        recall.last_publish_date = data["LastPublishDate"]
        recall.number_of_units = prod_data["NumberOfUnits"].gsub(/[^0-9]/i, '') # TODO: This will have wrong value if there's more than one number in the string. Eg.: "Between 4,000 and 5,000"
        recall.injuries = get_text(data["Injuries"], "Name")
        recall.hazards = get_text(data["Hazards"], "Name")
        recall.remedies = get_text(data["Remedies"], "Name")
        recall.retailers = get_text(data["Retailers"], "Name")
        recall.country = product.manufacturer_countries if product.manufacturer_countries
        unless recall.valid?
          # rollback and log error recall.errors.full_messages.to_sentence
        else
          recall.save
        end
      else
        # throw (or log) an error -> product.errors.full_messages.to_sentence
      end
    end
  end

  private

  def get_text list, key
    list.map{|item| item[key]}.join(", ")
  end

end
