def century_from_year(year)
    century = (year - 1) / 100 + 1
    suffix =
      case century % 10
      when 1
        "st"
      when 2
        "nd"
      when 3
        "rd"
      else
        "th"
      end
  
    "#{century}#{suffix} century"
  end