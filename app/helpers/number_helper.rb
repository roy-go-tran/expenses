module NumberHelper
  include ActionView::Helpers::NumberHelper

  def format_number(value, precision: 2)
    return nil unless value
    number_with_precision(value, precision: precision, delimiter: ",")
  end
end
