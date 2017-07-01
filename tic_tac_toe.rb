class Move < Struct.new(:spot, :value); end

PLAYER_X = 1
PLAYER_O = 0
EMPTY = -1

board = [
    PLAYER_O, PLAYER_O, EMPTY,
    PLAYER_X, EMPTY, EMPTY,
    PLAYER_X, EMPTY, EMPTY
]

def player_won?(board, player)
  (board[0] == player && board[1] == player && board[2] == player) ||
      (board[3] == player && board[4] == player && board[5] == player) ||
      (board[6] == player && board[7] == player && board[8] == player) ||
      (board[0] == player && board[3] == player && board[6] == player) ||
      (board[1] == player && board[4] == player && board[7] == player) ||
      (board[2] == player && board[5] == player && board[8] == player) ||
      (board[0] == player && board[4] == player && board[8] == player) ||
      (board[2] == player && board[4] == player && board[6] == player)
end

def available_moves(board)
  board.each_with_index.select { |v, _| v == EMPTY }.map(&:last)
end

def minimax(board, player, optimize_for)
  empty_spots = available_moves(board)
  opponent = optimize_for == PLAYER_X ? PLAYER_O : PLAYER_X

  if player_won?(board, optimize_for)
    return 10
  elsif player_won?(board, opponent)
    return -10
  elsif empty_spots.empty?
    return 0
  end

  moves = []

  empty_spots.each do |spot|
    move = Move.new(spot, nil)
    board[spot] = player

    move.value = (player == PLAYER_X) ?
        minimax(board, PLAYER_O, optimize_for) :
        minimax(board, PLAYER_X, optimize_for)

    board[spot] = EMPTY

    moves << move
  end

  player == optimize_for ? moves.max_by { |move| move.value }.spot : moves.min_by { |move| move.value }.value
end

def play(board, player)
  loop do
    return :tie if available_moves(board).empty?
    return :won if player_won?(board, PLAYER_X)
    return :lost if player_won?(board, PLAYER_O)

    best_move = minimax(board, player, player)
    p "Player #{player == PLAYER_X ? 'X' : 'O'} moved to #{best_move}"
    board[best_move] = player
    player = player == PLAYER_X ? PLAYER_O : PLAYER_X
  end
end

p play(board, PLAYER_X)
