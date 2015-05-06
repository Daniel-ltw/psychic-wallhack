require './lib/Sudoku/cell'

class Puzzle < Object
  attr_accessor :item
  attr_accessor :rows, :columns

  def initialize(row_count, col_count = row_count)
    self.rows = row_count
    self.columns = col_count
    self.item = Array.new(row_count) { Array.new(col_count) { Cell.new } }
  end

  def element(x_value, y_value)
    self.item[x_value][y_value]
  end

  def column(value)
    result = []
    (0..(rows - 1)).each do |i|
      result.push(self.item[value][i].pretty_print)
    end
    result
  end

  def row(value)
    result = []
    (0..(columns - 1)).each do |i|
      result.push(self.item[i][value].pretty_print)
    end
    result
  end

  def square(x_value, y_value)
    sq_col = x_value - (x_value % 3)
    sq_row = y_value - (y_value % 3)
    result = []


    (sq_row..(sq_row + 2)).each do |y|
      (sq_col..(sq_col + 2)).each do |x|
        result.push(self.item[x][y].pretty_print)
      end
    end
    result
  end

  def set(object)
    return unless object.class == String
    object = object.split(/[ \n]/).reject{ |i| i.empty? }
    (0..(rows - 1)).each do |y_index|
      (0..(columns - 1)).each do |x_index|
        element(x_index, y_index).set(object.fetch(0))
        object.delete_at(0)
      end
    end
    self
  end

  def to_s
    result_String = ""
    (0..(rows - 1)).each do |y_index|
      row_string = ""
      (0..(columns - 1)).each do |x_index|
        row_string.concat(self.item[x_index][y_index].pretty_print + " ")
      end
      result_String += row_string + "\n"
    end
    result_String
  end

  def to_note
    result_String = ""
    (0..(rows - 1)).each do |y_index|
      row_string = ""
      (0..(columns - 1)).each do |x_index|
        row_string.concat(self.item[x_index][y_index].note_print + " ")
      end
      result_String += row_string + "\n"
    end
    result_String
  end
end
