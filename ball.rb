File.open('balls.txt', 'r') do |myFile|
  pp myFile.sysread(1000).split
end



