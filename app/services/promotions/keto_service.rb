module Promotions
  class KetoService
    class << self
      def get_price(params)
        not_keto_product_prices = params['lineItems'].select{|p|!p['collection'].eql?('KETO')}.pluck(:price).map{|n|n.to_f}
        not_keto_count = not_keto_product_prices.count
        descount = if not_keto_count.eql? 2
          not_keto_product_prices.sum * 0.05
        elsif not_keto_count.eql? 3
          not_keto_product_prices.sum * 0.1
        elsif not_keto_count.eql? 4
          not_keto_product_prices.sum * 0.2
        elsif not_keto_count >= 5
          not_keto_product_prices.sum * 0.25
        end
        final_price = (params['lineItems'].pluck(:price).map{|n|n.to_f}.sum - descount).round(2)
        # case params['lineItems'].count
        # end
      end
    end
  end
end