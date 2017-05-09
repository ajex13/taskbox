if @projects.empty?
  node("notice") { "no projects found "}
else
  object @projects
  attributes :id,:name,:is_completed , :task_count
  child :tasks do
    attributes :id, :title, :due_date
  end
end
