class CreateVacancies < ActiveRecord::Migration
  def change
    create_table  :vacancies do |t|
      t.string    :title
      t.text      :description
      t.text      :salary
      t.string    :location
      t.boolean   :remote
      t.string    :name
      t.string    :email
      t.string    :phone
      t.string    :url
      t.string    :token
      t.datetime  :expire_at
      t.datetime  :approved_at
      t.timestamps
    end
    add_index :vacancies, :created_at
    add_index :vacancies, :approved_at
    add_index :vacancies, :expire_at
    add_index :vacancies, :token
  end
end
