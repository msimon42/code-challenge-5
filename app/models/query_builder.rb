class QueryBuilder
    def self.build(criteria)
        # criteria = {
        #     demographics: {
        #         gender: {male: 50.0, female: 50.0},
        #         adult: {true: 60.0, false: 40.0},
        #         language: {english: 25.0, japanese: 25.0, french: 25.0, indian: 25.0}
        #     },
            
        #     sample: 100
        # }
        combos = get_demographic_combos(criteria[:demographics])
        query_criteria_list = combos.map{|combo| build_query_criteria(combo)}   
    end

    def self.get_demographic_combos(demographics)
        array = [{}]
        demographics.each_pair do |key, values|
            array.map! do |hash| 
                values.map do |value|
                    hash.merge({key=> value})
                end
            end.flatten!
        end
        
        return array
    end

    def self.build_query_criteria(combo)
        query_criteria = {demo_criteria:{}}
        amount = 100
        combo.each do |c, v|
            query_criteria[:demo_criteria][c] = v[0]
            amount *= (v[1] / 100)
        end

        query_criteria[:amount] = amount.round()
        return query_criteria
    end

end