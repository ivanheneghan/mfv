class Share < ActiveRecord::Base
  belongs_to :user


  def value
    volume * stock_quote.ask
  end



  private

  def stock_quote
    StockQuote::Stock.quote(ticker)
  end
end
