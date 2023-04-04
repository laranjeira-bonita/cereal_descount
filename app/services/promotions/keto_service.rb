module Promotions
  class KetoService
    class << self
      def get_price(params)
        not_keto_products = params['lineItems'].select{|p|!p['collection'].eql?('KETO')}
        descount = case not_keto_products.count
          when 0..1
            0
          when 2
            total_price(not_keto_products) * 0.05
          when 3
            total_price(not_keto_products) * 0.1
          when 4
            total_price(not_keto_products) * 0.2
          else
            total_price(not_keto_products) * 0.25
          end
        final_price = (total_price(params['lineItems']) - descount).round(2)
        # case params['lineItems'].count
        # end
      end
      private
      def total_price(products)
        products.sum{|p|p[:price].to_f}
      end
    end
  end
end