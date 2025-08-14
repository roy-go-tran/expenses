class Api::V1::ExpensesSummaryController < ApplicationController
  def expenses_summary
    month = params[:month]
    result = Expenses::ExpensesSummaryService.call(month)
    if result.success?
      render json: result.payload, status: :ok
    else
      render json: { error: result.errors.first }, status: :unprocessable_entity
    end
  end
end
