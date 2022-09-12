class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/' do
    '<h3>Hello World<h3>'
  end
  
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(inlcude: :baked_goods)
  end

  get '/baked_goods/by_price' do
    Baked_good.all.order(:price).reverse
  end

end
