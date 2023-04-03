# cereal_descount
a route to calculate price with promotion

how to use it:
1, git clone git@github.com:laranjeira-bonita/cereal_descount.git
2, cd cereal_descount
3, bundle install
4, rails db:create
5, rails db:migrate
6, rails db:seed
7, rails s
8, send the json to http://localhost:3000/v1/promotions/current_promotion
 json example:
    {
    "cart": {
      "reference": "2d832fe0-6c96-4515-9be7-4c00983539c1",
      "lineItems": [
        { 
          "name": "Peanut Butter",
          "price": "39.0", 
          "collection": "BEST-SELLERS"
        },
        { "name": "Banana Cake", 
         "price": "34.99", 
         "collection": "DEFAULT"
        },
        { "name": "Cocoa",
         "price": "34.99", 
         "collection": "KETO"
        },
        { "name": "Fruity", 
         "price": "32", 
         "collection": "DEFAULT"
        }
      ]
    }
  }
the number value could be different, but always with the format like above please
