class Api::ConverterController < ApplicationController
  def convert
    render json: ConverterService.new(from: params[:from], to: params[:to], amount: params[:amount])
                                 .convert
  end
end
