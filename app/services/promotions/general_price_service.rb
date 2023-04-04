module Promotions
  class GeneralPriceService
    class << self
      def get_price_from_current_promotion(params)
        # Interesting usage of the Promotion model here, what
        # was your thought process/motivators to create it?
        promotion = Promotion.where('start_date <= ?', Time.current).where('end_date >= ?', Time.current).order(priority_level: :desc).first

        if promotion.present?
          # Curious to know why did you come up with meta-programming for this solution.
          promotion_service = promotion.name.split(/\s/).map{|word|word.capitalize}.join + 'Service'
          "Promotions::#{promotion_service}".constantize.get_price(params)
        else
          # Make sense in case no promotion, the final price will be just the sum of all prices.
          params['lineItems'].pluck(:price).map{|n|n.to_f}.sum.round(2)
        end
      end
    end
  end
end
