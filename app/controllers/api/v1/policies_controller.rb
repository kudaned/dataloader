module Api::V1
  class PoliciesController < ApplicationController

    def total_count
      @total_count = Policy.total_count
    end

  end
end
