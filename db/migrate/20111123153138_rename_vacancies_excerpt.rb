class RenameVacanciesExcerpt < ActiveRecord::Migration
  def up
    rename_column :vacancies, :excerpt, :excerpt_html
  end

  def down
    rename_column :vacancies, :excerpt_html, :excerpt
  end
end
