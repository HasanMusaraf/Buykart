# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # include CurrentCart
  # before_action :set_cart
end
