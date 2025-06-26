require "net/http"

class ConverterService
  def initialize(from:, to:, amount:)
    @from = from.upcase
    @to = to.upcase
    @amount = amount.to_f
  end

  def convert
    rates = get_rates
    rates[@to] / rates[@from] * @amount
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
