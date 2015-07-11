 cats = []

100.times do
  cats.push(0)
end

def has_hat?(cat, cats)
  if cats[cat] != 1
    false
  else
    true
  end
end

def add_hat(cat, cats)
  cats[cat] = 1
end

def remove_hat(cat, cats)
  cats[cat] = 0
end

def inspect_cats(cat_array)
  counter = 0
  counter2 = 1
  cats = cat_array
  cats_with_hats = []
  iterations = 100
  cats.length.times do

    until counter >= 100 do
      cat = counter
      if has_hat?(cat, cats)
         remove_hat(cat, cats)
      else
         add_hat(cat, cats)
      end

      if counter2 == 101
        counter = 100
      else
        p counter
       counter += counter2
      end
    end
    counter2 += 1
    counter = counter2 - 1
  end


  cats.each_with_index do |cat, index|
    if has_hat?(index, cats)
      cats_with_hats.push(index)
    end
  end
  p cats_with_hats
end