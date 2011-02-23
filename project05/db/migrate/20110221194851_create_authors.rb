class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name, :null => false

      t.timestamps
    end
	
	add_column :articles, :author_id, :integer
	rename_column :articles, :author, :author_name
	#grab all the author atrributes from each articles
	#create a new author with that name
	#associate each article with their new author instance
	Articles.all.each do |article|
		author = Author.create(:name => article.author_name)
		articles.author = author
		article.save
	end

	
	#remove author attribute from articles
	remove_column :articles, :author_name
  end

  def self.down
    drop_table :authors
  end
end
