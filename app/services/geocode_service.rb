class GeocodeService 

  def self.call(address)
    response = Geocoder.search(address)

    # validate the response data structure
    response or raise StandardError.new "Failed to get Geocoder response"
    response.length > 0 or raise StandardError.new "Geocoder is empty: #{response}"
    data = response.first.data
    data or raise StandardError.new "Geocoder data error"
    data["lat"] or raise StandardError.new "Geocoder latitude is missing"
    data["lon"] or raise StandardError.new "Geocoder longitude is missing"
    data["address"] or raise StandardError.new "Geocoder address is missing" 
    data["address"]["postcode"] or raise StandardError.new "Geocoder postal code is missing" 

    # build geocode data
    geocode = OpenStruct.new
    geocode.latitude = data["lat"].to_f
    geocode.longitude = data["lon"].to_f
    geocode.postal_code = data["address"]["postcode"]
    geocode
  end

end
