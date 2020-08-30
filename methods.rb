def set_location(input)
    if input.length <5
      return false
    else
      location = input[5..]
      if location.match(/[0-9]/)
        return false
      else
        return location
      end
  end
end