class AddExcerptToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :excerpt, :text
  end
end
