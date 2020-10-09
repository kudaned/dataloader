module Api::V1
  class CarriersController < ApplicationController

    def total_count
      @total_count = Carrier.total_count
    end

  end
end
