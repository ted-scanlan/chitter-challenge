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

    it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(name: "testname", email: 'test@example.com', username: "test", password: 'password123')
  end

  end

describe '.find' do
  it 'finds a user by username' do
    user_example = User.create(name: "Ted", email: "ted.scanlan@yahoo.com", username: "Teddy_S", password: "coolbeans")
    user_example2 = User.create(name: "John", email: "John.smith@gmail.com", username: "John_Smith", password: "test123")

    result = User.find(username: user_example.username)

    expect(result.id).to eq user_example.id
    expect(result.email).to eq user_example.email
end
# it 'returns nil if there is no username given' do
#     expect(User.find(nil)).to eq nil
#   end
end

end
