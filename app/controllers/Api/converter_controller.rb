class Api::ConverterController < ApplicationController
  def convert
    render json: ConverterService.new.convert(params[:from], params[:to], params[:amount])
  end
end
