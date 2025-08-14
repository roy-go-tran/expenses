class Expenses::ExpensesSummaryService < ApplicationService
  def initialize(month)
    @month = month
  end

  def call
    result = {
      "month": month,
      "total": expenses_summary.values.sum,
      "by_category": prepare_by_category(expenses_summary)
    }

    ServiceResponse.new(payload: result)
  rescue StandardError => e
    ServiceResponse.new(errors: [ e.message ])
  end

  private

  attr_reader :month

  def start_date
    Date.parse("#{month}-01")
  end

  def end_date
    start_date.next_month
  end

  def prepare_by_category(expenses_summary)
    expenses_summary.map do |category, total| {
      category: category,
      total: total
    }
    end
  end

  def expenses_summary
    Expense.by_date_range(start_date, end_date).group(:category).sum(:total)
  end
end
