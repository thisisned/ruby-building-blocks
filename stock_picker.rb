def stock_picker(price_array)
	best_days = [0,0]
	max_profit = 0
	
  # For every value in the array, generate a smaller array of all the later values.
  # For every item in this smaller array, compare against the original value
  # and save if the difference is highest.
  
  price_array.each_with_index do |buy_price, buy_index| # Note .each_ has default index values
  	sell_array = price_array[buy_index + 1..-1]
    sell_array.each.with_index(buy_index + 1) do |sell_price, sell_index| # Note .each. changes index values
    	profit = sell_price - buy_price
    	if profit > max_profit
    		max_profit = profit
    		best_days = [buy_index, sell_index]
    	end
    end
  end

p best_days
puts "$" + max_profit.to_s

end