class ConverterService
  class Error < StandardError; end

  COUNTRY_CODE_FORMAT = /\A[A-Z]{3}\z/.freeze

  def initialize(from:, to:, amount:)
    @from = from.upcase
    @to = to.upcase
    @amount = amount.to_f
  end

  def convert
    validate_currency_code!(@from)
    validate_currency_code!(@to)

    rates = ExchangeRateApiService.new.get_rates

    unless rates.key?(@from) && rates.key?(@to)
      raise Error, "Invalid currency code provided"
    end

    rates[@to] / rates[@from] * @amount
  end

  private

  def validate_currency_code!(code)
    raise Error, "Invalid currency code format #{code}" unless code.match?(COUNTRY_CODE_FORMAT)
  end
end
