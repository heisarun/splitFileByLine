#!C:\darkness\development\ruby\bin ruby.exe
#encoding: ISO-8859-1
#system("clear")
#puts "---------------------------------------------"
#puts "               	START                      "
#puts "---------------------------------------------"

#require './operating_system_detect.rb'
#require './checkInternet.rb'
require 'open3'
require 'awesome_print'


@operating_system
puts ' Please Enter the File-Path! '
@file_path = gets.chomp

@current_directory_print = "dir #{@file_path}"
puts `#{@current_directory_print}`
puts 'Please Enter the Text-Name ! '
@file_name = gets.chomp

@only_file_name = File.basename(@file_name,File.extname(@file_name))

@folder_name = "mkdir #{@only_file_name}"
system(@folder_name)

# @folder_location = "cd #{@file_name}"
#system(@folder_location)
#system("dir")


  content = File.read(@file_name)
  
  @count = 0
  File.readlines('text.txt').each do |line |
    @count += 1
    @file_name_generated = "#{@count}.txt"

    @file_data = File.new(@file_name_generated,"w+")
      @file_data.write(line)
    @file_data.close
  end

  while @count != 0
    @move_from_backwards = "#{@count}.txt"
    @system_move = "move ./#{@move_from_backwards} ./#{@only_file_name}"
    system(@system_move)
    @count -= 1
  end
  
  def compress()
    ap _pwsh = "Compress-Archive ./#{@only_file_name} ./#{@only_file_name}.zip" 
    puts "compressing"
    Open3.capture3(_pwsh)
    #system(_pwsh)
    puts "compressed" 
  end

  def uncompress()
    _pwsh = "Expand-Archive ./#{@only_file_name}.zip"
    `_pwsh`
    puts "uncompressing"
  end
  
  compress

#puts "reaching the expected requirement"
#puts " reaching "
#puts "---------------------------------------------"
#puts "                   END                       "
#puts "---------------------------------------------"
