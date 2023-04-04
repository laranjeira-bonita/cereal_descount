module Promotions
  class KetoService
    class << self
      def get_price(params)
        # CON: Usage of 4 different maps, could solve with 2:
        #
        # not_keto_prices_sum = params['lineItems'].select { |p| p['collection'] != 'KETO' }.sum { |p| p[:price].to_f }
        #
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
        # CON: Usage of 3 different maps, could solve in a single one:
        #
        # total_sum = params['lineItems'].sum { |item| item[:price].to_f }
        # final_price = (total_sum - descount).round(2)
        #
        final_price = (params['lineItems'].pluck(:price).map{|n|n.to_f}.sum - descount).round(2)
        # case params['lineItems'].count
        # end
      end
    end
  end
end
