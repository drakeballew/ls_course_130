class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def << (todo)
    raise TypeError.new("Can only add Todo objects") unless todo.instance_of? Todo
    self.todos << todo
  end
  alias_method :add, :<<


  def size
    self.todos.size
  end

  def first
    self.todos.first
  end

  def last
    self.todos.last
  end

  def item_at(idx)
    self.todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    self.todos.shift
  end

  def pop
    self.todos.pop
  end

  def remove_at(idx)
    self.todos.delete(item_at(idx))
  end

  def to_s
    puts " ---- #{title} ----"
    todos.each do |todo|
      puts todo
    end
  end

  def to_a
    self.todos
  end

  def each
    self.todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    results = TodoList.new(title)
    each do |todo|
      results << todo if yield(todo)
    end
    results
  end

  def find_by_title(string)
    select { |todo| todo.title == string }.item_at(0)
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(string)
    find_by_title(string) && find_by_title(string).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# list.mark_all_done
# list.to_s
# list.mark_all_undone
# list.to_s

# list.mark_done('Go to gym')
# list.to_s

# not_done = list.all_not_done
# not_done.to_s
# done = list.all_done
# done.to_s

