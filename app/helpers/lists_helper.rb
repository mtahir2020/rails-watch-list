module ListsHelper
  def string_half(string)
    overview_string = string.split
    new_string = overview_string.each_slice((overview_string.size / 2.0).round).to_a
    first_half = new_string[0].join(' ')
    second_half = new_string[1].join(' ')
  end
end
