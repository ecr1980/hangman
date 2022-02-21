class PlayRound

  def initialize(word)
    @word = word.split("")
    @game_board = Array.new(word.length, "_")
    puts "Iniitialized!"
  end

  def compare(guess)
    @correct = false
    @word.each_with_index do |letter, i|
      if letter == guess
        @game_board[i] = "#{guess}"
        @correct = true
      end
    end
    @correct
  end

  def display
    puts @game_board.join.to_s
  end

  def check_for_win
    if @word == @game_board
      return true
    else
      return false
    end
  end
end


def get_word_array(dif)
  file = File.open("google-10000-english-no-swears.txt", "r")
  contents = file.read
  file.close
  temp_contents = contents.split("\n")
  trimmed_contents = []
  temp_contents.each do |word|
    if word.length >= dif[0] && word.length <= dif[1]
      trimmed_contents << word
    end
  end
  n = rand(trimmed_contents.length)
  word = trimmed_contents[n]  
end

def get_difficulty()
  difficulty = ""
  while difficulty != "e" && difficulty != "m" && difficulty != "h"
    puts "Welcome to Hangman! You know the rules!"
    puts "Want easy, medium, or hard?"
    difficulty = gets.downcase.chr
    if difficulty != "e" && difficulty != "m" && difficulty != "h"
      puts "Just enter one of those choices."
    end
  end
  choice_array = difficulty_choice(difficulty)
end

def difficulty_choice(difficulty)
  if difficulty == "e"
    choice_array = [2,4]
  elsif difficulty == "m"
    choice_array = [4,7]
  else
    choice_array = [5,100]
  end
  choice_array
end

def was_picked(c, picked)
  was_picked = false
  picked.each do |letter|
    if letter == c
      was_picked = true
    end
  end
  return was_picked
end

def valid_entry(c)
  case c
  when "a"
    return true
  when "b"
    return true
  when "c"
    return true
  when "d"
    return true
  when "e"
    return true
  when "f"
    return true
  when "g"
    return true
  when "h"
    return true
  when "i"
    return true
  when "j"
    return true
  when "k"
    return true
  when "l"
    return true
  when "m"
    return true
  when "n"
    return true
  when "o"
    return true
  when "p"
    return true
  when "q"
    return true
  when "r"
    return true
  when "s"
    return true
  when "t"
    return true
  when "u"
    return true
  when "v"
    return true
  when "w"
    return true
  when "x"
    return true
  when "y"
    return true
  when "z"
    return true
  else
    return false
  end
end

def play_a_round(round)
  keep_going = true
  wrong = 0
  count = 0
  picked = []
  while keep_going
    puts "Enter a letter"
    if count > 0
      puts "Chosen letters are:"
      puts ""
      puts "#{picked.sort!.join(" ").to_s}"
    end
    puts ""
    round.display
    puts ""
    c = gets.downcase.chr
    if valid_entry(c)
      if was_picked(c, picked) == false
        picked << c
        correct = round.compare(c)
        if correct == false
          wrong += 1
        end
        if wrong >= 8
          puts "Hangman. Game Over."
          keep_going = false
        end
        if round.check_for_win
          keep_going = false
          puts "You Win!"
        end
        count += 1
      else
        puts "You've already picked that letter."
      end
    else
      puts "#{c} is not a letter."
    end
  end
  puts ""
end

def play()
  choose_difficulty = get_difficulty()
  word = get_word_array(choose_difficulty)
  round = PlayRound.new(word)
  play_a_round(round)
    
end

play()