module Api::V1
  class ClientsController < ApplicationController

    def total_count
      @total_count = Client.total_count
    end

    def list
      page_no = client_params[:page]
      @list = Client.all.page(page_no)
    end

    def policies
      client_id = client_params[:id]
      @policies = Policy.by_client(client_id)
    end

    private

      def client_params
        params.permit(:id, :format, :page)
      end

  end
end
