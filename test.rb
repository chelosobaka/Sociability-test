class Test
  attr_reader :point
  attr_writer :answer

  def initialize
    begin
      current_path = File.dirname(__FILE__)
      file_path = current_path + "/data/questions.txt"
      f = File.open(file_path, "r:UTF-8")
      @questions = f.readlines
      f.close
    rescue Errno::ENOENT
      abort "Файл questions.txt не найден"
    end

    @point = 0
    @current = 0
    @answer = nil
  end

  def questions
    @questions[@current]
  end

  def questions_size
    @questions.size
  end

  def count_points
    case @answer
    when "y" then  @point += 2
    when "s" then @point += 1
    end
    @current += 1
  end
end

