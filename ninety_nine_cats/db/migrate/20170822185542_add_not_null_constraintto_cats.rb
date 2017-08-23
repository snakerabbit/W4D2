class AddNotNullConstrainttoCats < ActiveRecord::Migration[5.1]
  def change
    change_column :cats, :birth_date, :date, null: false
    change_column :cats, :color, :string, null: false
    change_column :cats, :name, :string, null: false
    change_column :cats, :sex, :string, null: false
    change_column :cats, :description, :text, null: false
  end
end
