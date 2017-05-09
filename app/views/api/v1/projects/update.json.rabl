if @project.errors.any?
  node(:errors) {"#{@project.errors.full_messages.join(", ")}"}

else

  object @project
  attributes :id,:name,:is_completed
end
