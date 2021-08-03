defmodule Swym.RuleEngine do
    alias Swym.Actions
    alias Swym.Rules
    alias Swym.Tweet
    def process(%Tweet{} = tweet) do
        rules = Rules.all()
        Enum.each rules, fn(rule) -> rule(tweet, rule) end
    end

    defp rule(tweet, rule) do
        case rule.type do
            :location -> location_rule(tweet, rule.value, rule.condition, rule.action)
            :tweets -> tweets_rule(tweet, rule.value, rule.condition, rule.action)
            :user_name_initial_letter -> user_name_initial_letter_rule(tweet, rule.value, rule.condition, rule.action)
        end
    end

    defp location_rule(%Tweet{location: location} = tweet, value, condition, action) do
        if apply_condition?(condition, location, value) do
            apply(Actions, action, [tweet])
        end
    end
    
    defp tweets_rule(%Tweet{user_name: user_name} = tweet, value, condition, action) do
        if apply_condition?(condition, count_tweets_for_user(user_name), value) do
            apply(Actions, action, [tweet])
        end
    end

    defp user_name_initial_letter_rule(%Tweet{user_name: user_name} = tweet, value, condition, action) do
        if apply_condition?(condition, String.at(user_name, 0), value) do
            apply(Actions, action, [tweet])
        end
    end

    defp apply_condition?(condition, value, expected) do
        case condition do
            :equal_to -> if value == expected, do: true, else: false
            :greater_than_or_equal_to -> if value >= expected, do: true, else: false
        end
    end

    defp count_tweets_for_user(_user_name) do
        Enum.random(8..12)
    end
end