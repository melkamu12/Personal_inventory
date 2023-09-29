def save_Books
  books_data = []
  @books.each do |book|
    books_data.push({ publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
                label: { title: book.label.title, color: book.label.color } })
  end
  File.write('data/books.json', JSON.pretty_generate(books_data))
end

def load_Books
    if File.exist?('data/books.json')
    begin
      data = JSON.parse(File.read('data/books.json'))
      @books = data.map do |book_data|
        book = Book.new(book_data['publish_date'], book_data['publisher'], book_data['cover_state'])

        # Check if the book data contains label information
        if book_data.key?('label')
          label_data = book_data['label']
          # Create or find the label based on title and color
          label = @labels.find { |item| item.title == label_data['title'] && item.color == label_data['color'] }
          if label.nil?
            label = Label.new(label_data['title'], label_data['color'])
            @labels << label
          end
          # Assign the label to the book
          book.label = label
        end
        book
      end
    rescue JSON::ParserError => e
      puts "Error parsing JSON data: #{e.message}"
      @books = []
    end
  else
    @books = []
  end
end

def save_Labels
  File.open('data/labels.json', 'w') do |file|
    label_data = @labels.map do |label|
      {
        'id' => label.id,
        'title' => label.title,
        'color' => label.color
      }
    end
    file.write(JSON.generate(label_data))
  end
end

def load_labels
  File.new('data/labels.json', 'w') unless File.exist?('data/labels.json')
  labels = File.read('data/labels.json')
  return if labels.empty?

  JSON.parse(labels).each do |label|
    @labels.push(Label.new(label['title'], label['color']))
  end
end
