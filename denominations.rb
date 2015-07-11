# Write a function that takes in an amount of money and denominations and
# returns the number of ways to arrive at the amount with those denominations.


denoms = { tens: 10, fives: 5, ones: 1 }

def denominations(amount, denoms)


  temp_amount = amount
  temp_denoms = denoms
  temp_solution = {}

  until amount == 0

    temp_denoms.each do |k,v|
      temp_solution[k] = amount / v
      amount = amount % v

    end

  end
  p temp_solution
  amount = temp_amount
  variations(temp_solution, amount, denoms)


end

def variations(solution, amount, denoms)
  solutions = [solution]
  key = -1
  if solution.values[key] == amount / denoms.values[-1]
    return solutions
  else
    until solution.values[key-1] > 0
      key -= 1
    end

    while solution.values[0] != 0 && solution.values[-1] != (amount / denoms.values[-1])

      until solution.values[key-1] == 0
        solution[solution.keys[key-1]] -= 1
        solution[solution.keys[key]] += denoms.values[key-1] / denoms.values[key]
        p key
        if denoms.values[key] != denoms.values.last && denoms.values[key-1] % denoms.values[key] > 0
          key += 1
          # if denoms.has_value?(denoms.values[key] % denoms.values[key+1])
          #   solution[solution.keys[key]] += 1
          #   key += 1
          # end
        end

      end
      solutions.push(solution)
          p solutions
      until solution.values[key-1] > 0
        key -= 1
      end
    end
  end
  solutions
end
