require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: 'portfolio_app')
    yield(connection)
  ensure
    connection.close
  end
end


def save_message(name, email, content)
  sql = "INSERT INTO messages (name, email, content, created_at)" +
  "VALUES ($1, $2, $3, NOW());"
  connection = PG.connect(dbname: 'portfolio_app')
  connection.exec_params(sql, [name, email, content])
  connection.close
end
