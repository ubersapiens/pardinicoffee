class AdminController < ApplicationController
  def dashboard
  end

  def sales
  end

  def visitors 
  end

  def orders
    @orders_roasted
    @orders_delivered
  end
end
