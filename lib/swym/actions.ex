defmodule Swym.Actions do
    def call_service_a(%Swym.Tweet{} = tweet, rule) do
        IO.inspect(rule, label: "Rule Matched")
        IO.inspect(tweet, label: "call_service_a")
    end

    def call_service_b(%Swym.Tweet{} = tweet, rule) do
        IO.inspect(rule, label: "Rule Matched")
        IO.inspect(tweet, label: "call_service_b")
    end

    def call_service_c(%Swym.Tweet{} = tweet, rule) do
        IO.inspect(rule, label: "Rule Matched")
        IO.inspect(tweet, label: "call_service_c")
    end
end