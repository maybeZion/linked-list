# frozen_string_literal: true

class LinkedList
  def initialize(head)
    @head = head
  end

  def size
    current_node = @head
    size = 1
    # loop through nodes in linked list
    loop do
      size += 1
      # all nodes except tail node will have truthy children
      break unless current_node.child

      current_node = current_node.child
    end
    size
  end

  def append(value)
    tail.child = Node.new(value, nil)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def tail
    current_node = @head
    current_node = current_node.child while current_node.child
    current_node
  end

  def pop
    current_node = @head
    # loops until tail node is found, then removes it
    loop do
      current_node.child = nil if current_node.child == tail
      break unless current_node.child

      current_node = current_node.child
    end
  end

  def contains?(target_value)
    current_node = @head
    loop do
      current_value = current_node.value
      return true if current_value == target_value

      break unless current_node.child

      current_node = current_node.child
    end
  end

  def at(target_index)
    current_node = @head
    current_index = 0
    loop do
      return current_node if current_index == target_index

      current_index += 1
      break unless current_node.child

      current_node = curr_node.child
    end
  end

  def to_a
    current_node = @head
    array = []
    loop do
      array.append current_node.value
      break unless current_node.child

      current_node = current_node.child
    end
    array
  end
end

class Node
  attr_accessor :value, :child

  def initialize(value, child)
    @value = value
    @child = child
  end
end
