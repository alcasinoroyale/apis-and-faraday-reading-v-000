class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'ABUWLCDNH2X5NPMK5ZN52RFNX5EC5DPNGP0UKLOSPLFNW1DM'
      req.params['client_secret'] = 'SHAXBRMQA34TDB1SB51PDTIYFQRZPYGX3EL1H2PCDAPQMG4M'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
