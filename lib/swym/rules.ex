defmodule Swym.Rules do
    def all() do
        [
            %{
                
                type: :location,
                value: "US",
                condition: :equal_to,
                action: :call_service_a
            },
            %{
                ## value is 2 so that when we run from console its eaiser to match the rule
                type: :tweets,
                value: 2,
                condition: :greater_than_or_equal_to,
                action: :call_service_b
            },
            %{
                
                type: :user_name_initial_letter,
                value: "A",
                condition: :equal_to,
                action: :call_service_c
            }
        ]
    end
end