class Api::ConverterController < ApplicationController
  def convert
    convert_result = ConverterService.new(from: params[:from], to: params[:to], amount: params[:amount]).convert
    conversion = Conversion.new(from: params[:from], to: params[:to], amount: params[:amount], result: convert_result)

    if conversion.save
      render json: conversion
    else
      render json: { errors: conversion.errors.full_messages }, status: :unprocessable_content
    end
  end
end
