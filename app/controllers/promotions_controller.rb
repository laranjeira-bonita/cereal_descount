class PromotionsController < ApplicationController
    def current_promotion
        final_price = Promotions::GeneralPriceService.get_price_from_current_promotion(price_param)
        render json: { final_price: final_price }
    end
    private
    def price_param
        params.require(:cart).permit(
            :reference,
            lineItems: [
                :name,
                :price,
                :collection
            ]
        )
    end
end
