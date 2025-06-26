require "net/http"

class ExchangeRateApiService
  def get_rates
    Rails.cache.fetch("exchange_rates", expires_in: 1.hour) do
      fetch_rates
    end
  end

  private

  def fetch_rates
    response = make_request
    parse_response(response)
  end

  def make_request
    api_key = Rails.application.credentials.exchangerate_api_key!
    uri = URI("https://v6.exchangerate-api.com/v6/#{api_key}/latest/USD")
    Net::HTTP.get(uri)
  end

  def parse_response(response)
    response_data = JSON.parse(response)
    response_data["conversion_rates"]
  end
end
