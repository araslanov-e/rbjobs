class AddAdminTokenToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :admin_token, :string
    add_index :vacancies, :admin_token
  end
end
