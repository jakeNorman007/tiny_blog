class FixSpellingError < ActiveRecord::Migration[6.1]
  def up
    rename_column :articles, :crated_at, :created_at
  end

end
