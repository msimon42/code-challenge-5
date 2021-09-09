class User < ApplicationRecord
    def self.create_user_group(demo_criteria, amt)
        where(demo_criteria)
            .limit(amt)
    end

    def self.create_user_group_set(criteria_list)
        criteria_list.map do |item|
            create_user_group(item[:demo_criteria], item[:amount])
        end
    end

    def self.send_tasks(user_criteria, task)
        criteria_list = QueryBuilder.build(user_criteria)
        users = create_user_group_set(criteria_list)

        users.flatten.each do |user|
            user.send(task)
        end
    end

    def send(task)
        ## CODE HERE ##
    end
end
