Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1, format: 'json' do
  #     get 'clients/total_count'
  #   end
  # end
  namespace :api do
    namespace :v1 do

      resources :clients, format: 'json' do
        collection do
          get 'total_count'
          get 'list'
        end
        member do
          get 'policies'
        end
      end

      resources :carriers, format: 'json' do
        collection do
          get 'total_count'
        end
      end

      resources :policies, format: 'json' do
        collection do
          get 'total_count'
        end
      end

    end
  end

  root "pages#index"

end
