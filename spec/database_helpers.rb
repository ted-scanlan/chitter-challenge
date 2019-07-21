require 'pg'

def get_database_row_from_db(id:)

  connection = PG.connect(dbname: 'peep_manager_test')
  result = connection.exec("SELECT * FROM peeps WHERE id = #{id};")
  result.first

end


def get_database_row_from_db_user(id:)

  connection = PG.connect(dbname: 'peep_manager_test')
  result = connection.exec("SELECT * FROM users WHERE id = #{id};")
  result.first

end
