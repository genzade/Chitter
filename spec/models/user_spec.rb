describe User do
  subject!(:user) do 
    described_class.create(full_name: 'Wade Wilson',
                           username: 'Deadpool',
                           email: 'chimichongas@gmail.com',
                           password: 'ihatewolverine92',
                           password_confirmation: 'ihatewolverine92') 
  end
  describe '#authnticate' do
    it 'user with correct details' do
      existent_user = User.authenticate('Deadpool', 'ihatewolverine92')
      expect(existent_user).to eq user
    end

    it 'user with incorrect details' do
      non_existent_user = User.authenticate('Deadpool', 'wrongPassword')
      expect(non_existent_user).to be_nil
    end
  end
  
  describe '#password_recover' do
    it "saves a password recovery token when we generate a token" do
      expect{user.generate_token}.to change{user.password_token}
    end

    it "saves a password recovery token time when we generate a token using" do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end

    it 'can find a user with a valid token' do
      user.generate_token
      expect(User.find_by_valid_token(user.password_token)).to eq user
    end

    it 'cannot find a user with a valid token over one hour in the future' do
      user.generate_token
      Timecop.travel(60 * 60 + 1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end
  end
end
