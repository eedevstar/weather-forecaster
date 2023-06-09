require 'test_helper'

class GeocodeServiceTest < ActiveSupport::TestCase

  test "call geocoder with the Minneapolis address" do
    address = "1 Twins Way, Minneapolis"
    geocode = GeocodeService.call(address)
    assert_in_delta 44.98, geocode.latitude, 0.1
    assert_in_delta -93.27, geocode.longitude, 0.1
    assert_equal "55403", geocode.postal_code
  end

  test "call geocoder with the wrong address" do
    address = "malaysia"
    assert_raise StandardError do
      GeocodeService.call(address)
    end
  end

end