class RenameVacanciesTokenToOwnerToken < ActiveRecord::Migration
  def up
    remove_index :vacancies, :token
    rename_column :vacancies, :token, :owner_token
    add_index :vacancies, :owner_token
  end

  def down
    remove_index :vacancies, :owner_token
    rename_column :vacancies, :owner_token, :token
    add_index :vacancies, :token
  end
end
