module MigrateUtil
  def self.foreign_key(table, column, to_table, options = {})
    options[:to_column] ||= "id"
    options[:on_delete] ||= "cascade"
    "alter table #{table} add constraint #{table}_#{column}_fk foreign key (#{column}) " +
    "references #{to_table}(#{options[:to_column]}) on delete #{options[:on_delete]}"
  end
end
