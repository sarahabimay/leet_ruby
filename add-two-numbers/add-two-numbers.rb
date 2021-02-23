# https://leetcode.com/problems/add-two-numbers/
# 
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
# def add_two_numbers(list1, list2)
#     result = []

#     list1_iter = list1
#     list2_iter = list2

#     tens = 0
#     while list1_iter || list2_iter
#         next_val1 = 0
#         next_val2 = 0
#         next_val1 = list1_iter.val if list1_iter
#         next_val2 = list2_iter.val if list2_iter
#         sum = next_val1 + next_val2 + tens
#         tens = sum / 10
#         result << sum % 10
#         list1_iter = list1_iter.next if list1_iter
#         list2_iter = list2_iter.next if list2_iter
#     end
#     result << tens if tens > 0

#     result
# end

# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

# Input: l1 = [0], l2 = [0]
# Output: [0]

# Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# Output: [8,9,9,9,0,0,0,1]

def add_two_numbers(list1, list2)
  result = []
  list1_iter = list1
  list2_iter = list2
  tens = 0
  while list1_iter || list2_iter || tens.positive?
    sum = 0
    if list1_iter
      sum += list1_iter.val
      list1_iter = list1_iter.next
    end
    if list2_iter
      sum += list2_iter.val
      list2_iter = list2_iter.next
    end

    sum += tens
    tens = sum / 10
    result << sum % 10
  end

  result
end
