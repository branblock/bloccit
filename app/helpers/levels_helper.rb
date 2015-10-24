module LevelsHelper
  def levels_to_buttons(levels)
    raw levels.map { |l| link_to l.name, level_path(id: l.id), class: 'btn-xs btn-primary' }.join(' ')
  end
end
