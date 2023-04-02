Rails.application.routes.draw do
  scope '/v1' do

    # integration requests
    scope '/promotions' do
      # post 'orders', to: 'integrations/orders#show' EXAMPLE OF INTEGRATIONS REQUEST
      get 'current_promotion', to: 'promotions#current_promotion'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
