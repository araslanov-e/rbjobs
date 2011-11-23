class AddDescriptionHtmlToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :description_html, :text
  end
end
