class ChangeVacanciesExpireAtFromDatetimeToDate < ActiveRecord::Migration
  def up
    remove_index :vacancies, :expire_at
    change_column :vacancies, :expire_at, :date
    add_index :vacancies, :expire_at
  end

  def down
    remove_index :vacancies, :expire_at
    change_column :vacancies, :expire_at, :datetime
    add_index :vacancies, :expire_at
  end
end
