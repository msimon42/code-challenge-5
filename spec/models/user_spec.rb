require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'instance methods' do
   
    language_options = ['english', 'spanish', 'indian', 'japanese', 'chinese', 'french', 'italian']
    gender_options = ['male', 'female']
    adult_options = [true, true, false]
      
    2500.times do
      User.create(
        language: language_options.sample,
        gender: gender_options.sample,
        adult: adult_options.sample
      ) 
    end
    
    it 'generates correct output' do
      criteria = {
            demographics: {
                gender: {male: 50.0, female: 50.0},
                adult: {true: 60.0, false: 40.0},
                language: {english: 25.0, japanese: 25.0, french: 25.0, indian: 25.0}
            },
            
            sample: 100
        }

      criteria_list = QueryBuilder.build(criteria)
      users = User.create_user_group_set(criteria_list)

      expect(users.length).to eq(16)
      
      english_male_adult = users.flatten.filter{|user| user.adult == true && user.language == 'english' && user.gender == 'male'}
      french_male_child = users.flatten.filter{|user| user.adult == false && user.language == 'french' && user.gender == 'male'}
      japanese_female_adult = users.flatten.filter{|user| user.adult == true && user.language == 'japanese' && user.gender == 'female'}
      indian_female_child = users.flatten.filter{|user| user.adult == false && user.language == 'indian' && user.gender == 'female'}
      english_male_child = users.flatten.filter{|user| user.adult == false && user.language == 'english' && user.gender == 'male'}

      expect(english_male_adult.length).to eq(8)
      expect(french_male_child.length).to eq(5)
      expect(japanese_female_adult.length).to eq(8)
      expect(indian_female_child.length).to eq(5)
      expect(english_male_child.length).to eq(5)

    end
  end
end
