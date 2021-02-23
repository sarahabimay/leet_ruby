# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}

# initial solution:
# def remove_nth_from_end(head, n)
#     find out how long the linked list is:
#     iter = head
#     count = 1
#     count += 1 while (iter = iter.next)
#     # find parent node of node to be deleted
#     parent_node_of_n = count - n
#     if parent_node_of_n <= 0
#         head = head.next
#     else
#         iter = head
#         (parent_node_of_n -1).times do
#           iter = iter.next
#         end
#         iter.next = iter.next.next
#     end

#     head
# end

# faster solution 2 with a hash lookup
def remove_nth_from_end(head, n)
  lookup = {}
  count = 0
  iter = head
  while iter
    lookup[count + 1] = iter
    iter = iter.next
    count += 1
  end

  parent_node = count - n
  parent_iter = lookup[parent_node]
  # if parent_iter is nil and parent_node is 0 then first node is to be removed
  if parent_iter.nil? && parent_node.zero?
    head = head.next
  else
    parent_iter.next = parent_iter.next.next
  end
  head
end
