module Promotions
  class GeneralPriceService
    class << self
      def get_price_from_current_promotion(params)
        promotion = Promotion.where('start_date <= ?', Time.current).where('end_date >= ?', Time.current).order(priority_level: :desc).first
        promotion_service = promotion.name.split(/\s/).map{|word|word.capitalize}.join + 'Service'
        "Promotions::#{promotion_service}".constantize.get_price(params)     #calculate
      end
    end
  end
end