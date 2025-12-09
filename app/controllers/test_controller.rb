class TestController < ApplicationController
  def index
    puts Item.first.item_name
    render("test/top")
  end
end
