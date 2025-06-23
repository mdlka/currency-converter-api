require "net/http"

class ConverterService
  def convert(from, to, amount)
    rates = get_rates
    from_rate = rates[from.upcase]
    to_rate = rates[to.upcase]

    to_rate / from_rate * amount.to_f
  end

  private

  def get_rates
    api_key = Rails.application.credentials.exchangerate_api_key!
    uri = URI("https://v6.exchangerate-api.com/v6/#{api_key}/latest/USD")
    response_json = Net::HTTP.get(uri)
    response = JSON.parse(response_json)

    response["conversion_rates"]
  end
end
