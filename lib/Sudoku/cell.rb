class Cell < Object

  def initialize(value = nil)
    @value = value
    @possible_values = []
  end

  def set (value)
    @value = value.to_i
  end

  def mark(value = nil)
    unless value.nil?
      @possible_values.push(value) unless @possible_values.include? value
    end
  end

  def unmark(value = nil)
    unless value.nil?
      @possible_values.reject!{ |item| item == value }
    end
  end

  def pretty_print
    @value.nil? ? 0.to_s : @value.to_s
  end

  def note_print
    @possible_values.nil? ? 0.to_s : @possible_values.to_s
  end
end
