
class User
  def self.create(email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO logins (username, password) VALUES('#{username}, #{password}') RETURNING id, username;")
  end

  # def self.find(username)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'makersbnb_test')
  #   else
  #     connection = PG.connect(dbname: 'makersbnb')
  #   end
  #   connection.exec("SELECT * FROM logins WHERE id = '#{id}'")
  # end
end
