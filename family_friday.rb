MIN_SIZE = 3
MAX_SIZE = 5

def family_friday(list)
  groups = list.shuffle.each_slice(MIN_SIZE).to_a
  last_group = groups.last

  if last_group.size < MIN_SIZE
    last_group.each_with_index do |member, index|
      remaining_group_size = groups.size - 1
      groups[index % remaining_group_size].push(member)
    end

    groups = groups[0..(groups.size - 2)]
  end

  groups
end
