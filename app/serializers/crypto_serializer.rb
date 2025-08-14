class CryptoSerializer < ActiveModel::Serializer
  include NumberHelper

  attributes :coin, :price, :market_cap, :change_24h, :fetched_at

  def price
    format_number(object.price)
  end

  def market_cap
    format_number(object.market_cap)
  end

  def change_24h
    format_number(object.change_24h)
  end
end
