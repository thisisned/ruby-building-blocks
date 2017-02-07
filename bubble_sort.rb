def bubble_sort(array)
  swapped = true
  until swapped == false # If no swaps, then numbers are in order and we're done
    swapped = false
    array.each_with_index do |v, i|
      if array[i+1] && array[i+1] < array[i] # If next number exists and is smaller than this one
          array[i], array[i+1] = array[i+1], array[i] # Swap em over
          swapped = true # Mark that a swap has happened
          # p array # Un-comment this if you want to see all the steps getting done
      end
    end
  end
  p array
end



def bubble_sort_by(array)
  swapped = true
  until swapped == false # If no swaps, then strings are in order and we're done
    swapped = false
    array.each_with_index do |v, i|
      if array[i+1] && yield(array[i+1], array[i]) < 0 # If next string exists and result of block is negative
          array[i], array[i+1] = array[i+1], array[i] # Swap em over
          swapped = true # Mark that a swap has happened
          # p array # Un-comment this if you want to see all the steps getting done
      end
    end
  end
  p array
end