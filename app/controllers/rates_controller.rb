class RatesController < ApplicationController
  def show
    @rates = Rate.find(params[:id])
  end
end
