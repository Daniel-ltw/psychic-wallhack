require './lib/Sudoku/puzzle'

class Solver < Object

  def self.scan(puzzle, method)
    (0..8).each do |y|
      row = puzzle.row(y)

      while (x = row.index('0'))
        next if x.nil?

        send(method, puzzle, row, x, y)
      end
    end
  end

  def self.possibility(puzzle, row, x, y)
    values = (puzzle.row(y) | puzzle.column(x) | puzzle.square(x,y)).delete_if{|i| i == '0'}
    if values.count == 8
      # there is only one possible value left
      (1..9).each do |possible_ans|
        unless values.include? possible_ans.to_s
          puzzle.element(x, y).set(possible_ans.to_s)
          break
        end
      end
    else
      row[x] = '-'
    end
  end

  def self.elimination(puzzle, row, x, y)
    values = (puzzle.row(y) | puzzle.column(x) | puzzle.square(x,y)).delete_if{|i| i == '0'}
    invert = []
    (1..9).each do |v|
      next if values.include? v.to_s
      invert.push(v)
    end
    sq_col = x - (x % 3)
    sq_row = y - (y % 3)
    collect = []

    square = puzzle.square(x,y)
    empty_cell_count_other_than_self = square.count('0')

    (0..8).each do |index|
      next unless square[index] == '0'
      cur_col = index % 3 + sq_col
      cur_row = index / 3 + sq_row
      unless cur_col == x and cur_row == y
        cur_cell_values = (puzzle.row(cur_row) | puzzle.column(cur_col)).delete_if{|i| i == '0'}
        cur_cell_values.each do |possible_ans|
          if invert.include? possible_ans.to_i
            collect.push(possible_ans)
          end
        end
      end
    end

    invert.each do |val|
      next if collect.size > (empty_cell_count_other_than_self) || collect.empty?
      if collect.count(val.to_s) == (empty_cell_count_other_than_self - 1)
        puzzle.element(x, y).set(val.to_s)
        return
      end
    end

    row[x] = '-'
  end
end
