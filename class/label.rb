class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = rand(1_000_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items.push(item)
  end
end
