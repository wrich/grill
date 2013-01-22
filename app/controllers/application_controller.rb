class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :show_cookies
  
  def show_cookies
    logger.debug "Session Hash: #{session.inspect}"
  end
  
end
