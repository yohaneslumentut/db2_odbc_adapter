module ODBCAdapter
  class Db2Adapter < ActiveRecord::ConnectionAdapters::ODBCAdapter

    def arel_visitor
      Arel::Visitors::IBM_DB.new(self)
    end

    def prepared_statements
      false
    end

    def supports_migrations?
      false
    end
  end
end