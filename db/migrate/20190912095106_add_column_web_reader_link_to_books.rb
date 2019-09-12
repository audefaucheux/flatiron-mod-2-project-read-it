class AddColumnWebReaderLinkToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :web_reader_link, :string
  end
end
