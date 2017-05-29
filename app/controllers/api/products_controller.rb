class Api::ProductsController < ApplicationController
  def index
    ActionController::Parameters.permit_all_parameters = true
    sort = params[:sort] == "price" ? params[:sort] : nil
    filter = params[:filter]
    products = Product.order(sort).where(filter)

    paginate json: products
  end

  def show
    product = Product.find(params[:id])

    render json: product
  end
end
