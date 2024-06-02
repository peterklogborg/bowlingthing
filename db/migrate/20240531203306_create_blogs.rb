class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string 
    add_column :users, :last_name, :string 
    add_column :users, :email, :string 
     
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end


  end
end
