module Promotions
  class KetoService
    class << self
      def get_price(params)
        not_keto_products = params['lineItems'].select{|p|!p['collection'].eql?('KETO')}
        descount = case not_keto_products.count
          when 0..1
            1
          when 2
            0.95
          when 3
            0.9
          when 4
            0.8
          else
            0.75
          end
        total_price = 0
        line_items = params['lineItems'].map do |product|
          discounted_price = product['collection'].eql?('KETO') ? product['price'].to_f : (product['price'].to_f * descount).round(2)
          total_price += discounted_price
          product.merge({ 'discountedPrice':  discounted_price})
        end
        {
          "cart": {
            "total_price": total_price.round(2),
            "reference": params["reference"],
            "lineItems": line_items
          }
        }
      end
      private
      def total_price(products)
        products.sum{|p|p[:price].to_f}
      end
    end
  end
end