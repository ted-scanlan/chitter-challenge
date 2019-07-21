require 'database_helpers'

describe User do

  describe '.create' do
    it 'creates a user' do
      user_example = User.create(name: "Ted", email: "ted.scanlan@yahoo.com", username: "Teddy_S", password: "coolbeans")

      database_row = get_database_row_from_db_user(id: user_example.id)

      expect(database_row['name']).to eq "Ted"
      expect(database_row['email']).to eq "ted.scanlan@yahoo.com"
      expect(database_row['username']).to eq "Teddy_S"
      expect(database_row['password']).to eq "coolbeans"

    end

  end


end
