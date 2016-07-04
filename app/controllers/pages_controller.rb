class PagesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => "test"
  skip_before_filter :authenticate_user!, :only => "home"

  def home
  end

  def phone
    @user = current_user
  end

  def test
  end

end
