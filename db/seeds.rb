LOREM = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis arcu luctus, gravida justo nec, molestie nibh. Sed rutrum tellus quis sem mollis, eget elementum mi tincidunt. Nunc sit amet enim id tortor cursus sodales. Etiam malesuada ligula in cursus mattis. Integer blandit nec nunc quis tempus. Nullam nec eros ut sem accumsan feugiat non vel nunc. Fusce dictum, nisl et pretium commodo, ipsum metus condimentum eros, sit amet dignissim nisi massa accumsan augue. Nullam vel molestie mi. Maecenas mollis diam eu ipsum rhoncus blandit quis at mauris. Sed et mauris molestie, luctus dui ac, congue nisi. Donec nec congue ipsum. Cras cursus orci tellus, ac suscipit turpis lacinia id. Donec id diam eget est cursus ultrices ac sit amet ante. Etiam diam sapien, feugiat at tristique vitae, ullamcorper sed purus. Aenean gravida eu nulla ac mattis.'

obj = 'Class'
cat = 'class'

parent = Node.create('name' => obj, 'category' => cat)
parent.save
3.times do
  child = parent.children.create('name' => "Sub#{parent.name}", 'category' => cat)
  child.save
end

children = Node.find_by(id: 1).children

children.each do |child|
  5.times do
    sibling = child.children.create('name' => "Sub#{child.name}", 'category' => cat)
    sibling.save
  end
end

class_list_id = (2..9).to_a
4.times do
  my_id = class_list_id.sample
  sib_module = Node.find_by(id: my_id).siblings.create('name' => "Module#{my_id}", 'category' => 'module')
  sib_module.save
  class_list_id - [my_id]
end

Node.all.each do |n|
  5.times do
    meth = n.children.create('name' => "method_#{n.name.downcase}", 'category' => 'instance_method')
    meth.save
    meth = n.children.create('name' => "method_#{n.name.downcase}", 'category' => 'method')
    meth.save
  end
end

Node.all.each do |n|
  n.documentation = LOREM
  n.save
end
