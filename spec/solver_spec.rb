require 'rspec'
require './lib/Sudoku/puzzle'
require './lib/Solver/solver'

describe 'Sudoku solver feature' do
  it 'should be able to solve via Only Possibility' do
    m = Puzzle.new(9).set("5 0 0 0 8 0 0 6 0 \n9 7 2 0 0 1 0 0 0 \n8 6 0 0 3 0 5 0 0 \n4 9 0 8 1 0 0 2 6 \n6 0 0 0 0 0 0 0 8 \n3 2 0 0 6 5 0 9 7 \n0 0 9 0 4 0 0 7 5 \n0 0 0 5 0 0 6 8 1 \n0 5 0 0 2 0 0 0 3 \n")

    Solver.scan(m, :possibility)

    expect(m.to_s).to eq("5 0 0 0 8 0 0 6 0 \n9 7 2 0 5 1 0 0 4 \n8 6 0 0 3 0 5 1 0 \n4 9 0 8 1 0 3 2 6 \n6 1 0 0 0 0 4 5 8 \n3 2 8 4 6 5 1 9 7 \n0 0 9 0 4 0 2 7 5 \n0 0 0 5 0 0 6 8 1 \n0 5 0 0 2 0 9 4 3 \n")
  end

  it 'should be able to solve via Elimination' do
    m = Puzzle.new(9).set("5 0 0 0 8 0 0 6 0 \n9 7 2 0 0 1 0 0 0 \n8 6 0 0 3 0 5 0 0 \n4 9 0 8 1 0 0 2 6 \n6 0 0 0 0 0 0 0 8 \n3 2 0 0 6 5 0 9 7 \n0 0 9 0 4 0 0 7 5 \n0 0 0 5 0 0 6 8 1 \n0 5 0 0 2 0 0 0 3 \n")

    Solver.scan(m, :elimination)
    # still have certain flaws if it is run multiple times

    expect(m.to_s).to eq("5 0 0 0 8 0 0 6 0 \n9 7 2 6 5 1 0 0 0 \n8 6 0 0 3 0 5 0 0 \n4 9 0 8 1 0 0 2 6 \n6 0 0 0 0 0 0 0 8 \n3 2 8 0 6 5 0 9 7 \n0 0 9 0 4 0 2 7 5 \n0 0 0 5 0 0 6 8 1 \n0 5 0 0 2 0 9 0 3 \n")
  end
end
