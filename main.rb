require_relative "lib/test.rb"
require_relative "lib/printer.rb"

user = ARGV[0]

if Gem.win_platform? && ARGV[0]
  user = user.encode("UTF-8").capitalize
end

if user.nil?
  user = "незнакомец"
elsif user == "-v"
  puts version
  exit
end

TRUE_ANSWER = ["y", "n", "s"]

test = Test.new
printer = Printer.new(test)

printer.welcome(user)

test.questions_size.times do
  puts test.questions

  answer = nil
  until TRUE_ANSWER.include?(answer)
    puts "Ответьте: y - да, n - нет, s - иногда"
    answer = STDIN.gets.chomp.downcase
  end

  test.answer = answer #отправить ответ
  test.count_points #подсчитать балл
  system "clear" or system "cls"
end

printer.print_result

