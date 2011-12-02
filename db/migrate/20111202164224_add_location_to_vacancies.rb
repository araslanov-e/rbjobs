class AddLocationToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :location, :string
  end
end
