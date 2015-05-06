require './lib/Sudoku/puzzle'
class PuzzleReader

  def self.read(file_path)
    result = ""
    File.open(file_path, "r") do |file|
      file.each_line do |line|
        result += line + " "
      end
    end

    array_result, array = multi_puzzle_handler(result)

    if array
      array_result.each_with_index do |item, index|
        item = item.strip! + "\n "
        array_result[index] = Puzzle.new(9).set(item)
      end
      array_result
    else
      Puzzle.new(9).set(result)
    end
  end

  private

  def self.multi_puzzle_handler(result)
    array_result = []
    if result.count("\n") > 9
      array = true
      # more than one puzzle in file
      int = 0
      puzzle = ""
      result.each_line do |line|
        next unless line.match(/\d/)
        puzzle = puzzle + line
        int = int + 1
        if int == 9
          int = 0
          array_result.push(puzzle)
          puzzle = ""
        end
      end
    end
    [array_result, array]
  end
end
