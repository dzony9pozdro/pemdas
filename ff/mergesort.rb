nums = Array.new(50) { rand(1..999) }

def split(arr)
  mid = arr.length/2
  arr1 = arr[0...mid]
  arr2 = arr[mid..]
  return sort(arr1), sort(arr2)
end

def merge(arr1, arr2)
  arr = []
  until arr1.empty? || arr2.empty?
    if arr1.first >= arr2.first
      arr << arr2.shift
    else 
      arr << arr1.shift
    end
  end

  arr + arr1 + arr2
end
def sort(input)

  if input.length <=1
    return input
  else 
    arr1, arr2 = split(input)
    merge(arr1, arr2)
  end
end

print sort(nums) 


