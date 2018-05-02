require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order.rb')


# READ orders
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end
#New order
get '/pizza_orders/new' do
  erb(:new)
end
#Create order
post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#Show order
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

#DELETE
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete
  erb(:delete)

end




# UPDATE existing orders

# DELETE orders
