class Api::ProductsController < ApplicationController
  def index
    sort = permitted_params[:sort] == "price" ? permitted_params[:sort] : nil
    filter = filter_for(permitted_params[:filter].to_hash) if permitted_params[:filter]
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

  def permitted_params
    params.permit(:filter, :sort)
  end

  def filter_for(filter)
    if ["category", "price"].include? filter.keys[0]
      filter
    else
      nil
    end
  end
end
