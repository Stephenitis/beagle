class WidgetController < ApplicationController
  def show
    @bill = Bill.where(bill_id: params[:bill_id]).first
  end
end
