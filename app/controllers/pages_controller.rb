class PagesController < ApplicationController

  def home
  end

  def phone
    @user = current_user
  end

  def test
  end

end
