class ApplicationController < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/bakeries' do
    content_type 'application/json'
    Bakery.all.to_json
  end


  get '/bakeries/:id' do
    content_type 'application/json'
    Bakery.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    BakedGood.all.order(price: :desc).to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.all.order(price: :desc).first.to_json
  end

end
