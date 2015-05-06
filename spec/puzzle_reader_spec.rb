require 'rspec'
require './lib/Sudoku/puzzle'
require './lib/Sudoku/puzzle_reader'
require 'pry-byebug'

describe 'Puzzle File Reader' do
  it 'should read a file and be able to create a puzzle from it' do
    array = []
    Dir.glob("./spec/puzzle_*.pzl").each do |file|
      m = PuzzleReader.read(file)
      array.push(*m)
    end

    array.flatten!

    expect(array.length).to eq(3)

    expect(array[0].to_s).to eq("7 9 0 0 0 0 3 0 0 \n0 0 0 0 0 6 9 0 0 \n8 0 0 0 3 0 0 7 6 \n0 0 0 0 0 5 0 0 2 \n0 0 5 4 1 8 7 0 0 \n4 0 0 7 0 0 0 0 0 \n6 1 0 0 9 0 0 0 8 \n0 0 2 3 0 0 0 0 0 \n0 0 9 0 0 0 0 5 4 \n")
    expect(array[1].to_s).to eq("7 9 0 0 0 0 3 0 0 \n0 0 0 0 0 6 9 0 0 \n8 0 0 0 3 0 0 7 6 \n0 0 0 0 0 5 0 0 2 \n0 0 5 4 1 8 7 0 0 \n4 0 0 7 0 0 0 0 0 \n6 1 0 0 9 0 0 0 8 \n0 0 2 3 0 0 0 0 0 \n0 0 9 0 0 0 0 5 4 \n")
    expect(array[2].to_s).to eq("2 0 4 1 0 0 0 0 0 \n0 0 0 5 0 3 6 0 7 \n0 0 0 9 0 0 4 0 0 \n9 0 0 4 0 0 0 1 0 \n6 5 0 0 1 0 0 7 4 \n0 2 0 0 0 8 0 0 9 \n0 0 9 0 0 5 0 0 0 \n5 0 2 3 0 1 0 0 0 \n0 0 0 0 0 4 1 0 2 \n")
  end
end
