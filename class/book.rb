require 'date'
require_relative 'item'

class Book < Item
  attr_accessor :author, :publisher, :cover_state
  attr_reader :id, :label

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @id = rand(100_000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if @cover_state == 'bad' || super
      true
    else
      false
    end
  end
end
