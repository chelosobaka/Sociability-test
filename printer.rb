class Printer
  def initialize(test)
    @test = test
    begin
      current_path = File.dirname(__FILE__)
      file_path = current_path + "/data/results.txt"
      f = File.open(file_path, "r:UTF-8")
      @results = f.readlines
      f.close
    rescue Errno::ENOENT
      abort "Файл results.txt не найден"
    end
  end

  def result(point)
    case point
    when 0..3 then @results[0]
    when 4..8 then @results[1]
    when 9..13 then @results[2]
    when 14..18 then @results[3]
    when 19..24 then @results[4]
    when 25..29 then @results[5]
    when 30..32 then @results[6]
    end
  end

  def print_result
    puts "Вы набрали #{@test.point} баллов"
    puts
    puts result(@test.point)
  end

  def welcome(user_name)
    puts "Привет #{user_name}, этот тест определит уровень твоей общительности."
    puts "На каждый вопрос можно ответить только Да, Нет или Иногда."
    puts
  end
end
