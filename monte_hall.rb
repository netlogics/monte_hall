class MonteHall
  def play switch: false
    doors = ['empty', 'prize', 'empty'].shuffle
    contestants_pick = rand(0..(doors.length-1))
    montes_pick = nil
    doors.each_with_index do |door, index|
      next if index == contestants_pick
      next if door == 'prize'
      montes_pick = index if door == 'empty'
    end

    if switch
      switched_pick = doors.length - (contestants_pick + montes_pick)
    end

    final_pick = switch ? switched_pick : contestants_pick
    doors[final_pick]
  end
end

iterations = 1000
wins = 0
losses = 0

iterations.times do
  game = MonteHall.new
  result = game.play switch: false
  wins += 1 if result == 'prize'
  losses  += 1 if result == 'empty'
end

puts "wins: #{wins}"
puts "losses: #{losses}"
odds = (wins.to_f / iterations.to_f) * 100
puts "odds: #{odds}"
