class Api::ProductsController < ApplicationController
  def index
    ActionController::Parameters.permit_all_parameters = true
    sort = params[:sort] == "price" ? params[:sort] : nil
    filter = filter_for(params[:filter].to_hash) if params[:filter]
    products = Product.order(sort).where(filter)

    paginate json: products
  end

  def show
    begin
      product = Product.find params[:id]
    rescue ActiveRecord::RecordNotFound
      product = Product.new
      product.errors.add(:id, "Wrong ID provided")
      render_error(product, 404) and return
    end

    render json: product
  end

  private

  def filter_for(filter)
    if ["category", "price"].include? filter.keys[0]
      filter
    else
      nil
    end
  end
end
