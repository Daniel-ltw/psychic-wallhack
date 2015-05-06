require 'rspec'
require './lib/Sudoku/puzzle'

describe 'Sudoku matrix feature' do
  it 'should handle matrix creation' do
    (3..9).each do |size|
      m = Puzzle.new(size)
      (0..(size - 1)).each do |i|
        expect(m.row(i).count).to eq(size)
        expect(m.column(i).count).to eq(size)
      end
    end
  end

  it 'should print cell value in pretty form' do
    m = Puzzle.new(3)
    expect(m.to_s).to eq("0 0 0 \n0 0 0 \n0 0 0 \n")
  end

  it 'should print cell value in note form' do
    m = Puzzle.new(3)
    expect(m.to_note).to eq("[] [] [] \n[] [] [] \n[] [] [] \n")
  end

  it 'should be able handle assigning values to cell' do
    m = Puzzle.new(3)
    m.element(1, 2).set(3)
    expect(m.to_s).to eq("0 0 0 \n0 0 0 \n0 3 0 \n")
    m.element(1, 0).set(1)
    expect(m.to_s).to eq("0 1 0 \n0 0 0 \n0 3 0 \n")
    m.element(2, 1).set(2)
    expect(m.to_s).to eq("0 1 0 \n0 0 2 \n0 3 0 \n")
  end

  it 'should be able handle noting values to cell' do
    m = Puzzle.new(3)
    m.element(1, 2).mark(3)
    expect(m.to_note).to eq("[] [] [] \n[] [] [] \n[] [3] [] \n")
    m.element(1, 0).mark(1)
    expect(m.to_note).to eq("[] [1] [] \n[] [] [] \n[] [3] [] \n")
    m.element(2, 1).mark(2)
    expect(m.to_note).to eq("[] [1] [] \n[] [] [2] \n[] [3] [] \n")
    m.element(1, 2).mark(1)
    expect(m.to_note).to eq("[] [1] [] \n[] [] [2] \n[] [3, 1] [] \n")
    m.element(1, 2).mark(2)
    expect(m.to_note).to eq("[] [1] [] \n[] [] [2] \n[] [3, 1, 2] [] \n")
    m.element(1, 2).unmark(1)
    expect(m.to_note).to eq("[] [1] [] \n[] [] [2] \n[] [3, 2] [] \n")
    m.element(2, 1).unmark(2)
    expect(m.to_note).to eq("[] [1] [] \n[] [] [] \n[] [3, 2] [] \n")
  end

  it 'should be able to initialize with a pre-define table' do
    m = Puzzle.new(3).set("0 1 0 \n0 0 2 \n0 3 0 \n")
    expect(m.to_s).to eq("0 1 0 \n0 0 2 \n0 3 0 \n")
    m = Puzzle.new(9).set("5 0 0 0 8 0 0 6 0 \n9 7 2 0 0 1 0 0 0 \n8 6 0 0 3 0 5 0 0 \n4 9 0 8 1 0 0 2 6 \n6 0 0 0 0 0 0 0 8 \n3 2 0 0 6 5 0 9 7 \n0 0 9 0 4 0 0 7 5 \n0 0 0 5 0 0 6 8 1 \n0 5 0 0 2 0 0 0 3 \n")
    expect(m.to_s).to eq("5 0 0 0 8 0 0 6 0 \n9 7 2 0 0 1 0 0 0 \n8 6 0 0 3 0 5 0 0 \n4 9 0 8 1 0 0 2 6 \n6 0 0 0 0 0 0 0 8 \n3 2 0 0 6 5 0 9 7 \n0 0 9 0 4 0 0 7 5 \n0 0 0 5 0 0 6 8 1 \n0 5 0 0 2 0 0 0 3 \n")
  end

  it 'should return respective row, column and square' do
    m = Puzzle.new(9).set("5 0 0 0 8 0 0 6 0 \n9 7 2 0 0 1 0 0 0 \n8 6 0 0 3 0 5 0 0 \n4 9 0 8 1 0 0 2 6 \n6 0 0 0 0 0 0 0 8 \n3 2 0 0 6 5 0 9 7 \n0 0 9 0 4 0 0 7 5 \n0 0 0 5 0 0 6 8 1 \n0 5 0 0 2 0 0 0 3 \n")
    expect(m.column(0)).to eq(["5", "9", "8", "4", "6", "3", "0", "0", "0"])
    expect(m.row(1)).to eq(["9", "7", "2", "0", "0", "1", "0", "0", "0"])
    expect(m.square(0,0)).to eq(["5", "0", "0", "9", "7", "2", "8", "6", "0"])
    expect(m.square(1,1)).to eq(["5", "0", "0", "9", "7", "2", "8", "6", "0"])
    expect(m.square(2,2)).to eq(["5", "0", "0", "9", "7", "2", "8", "6", "0"])
    expect(m.square(3,3)).to eq(["8", "1", "0", "0", "0", "0", "0", "6", "5"])
  end
end
