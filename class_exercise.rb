input = File.open('./weather.dat', File::RDONLY){|f| f.read }
array = input.lines.map(&:split)

2.times do 
  array.shift
end

array.pop

temp_min = 0
temp_max = 1000

array.each do |line|
  difference = line[1].to_i - line[2].to_i
  p difference
  if difference < temp_max
    temp_max = difference

  end
end

