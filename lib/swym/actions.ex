defmodule Swym.Actions do
    def call_service_a(%Swym.Tweet{} = tweet) do
        IO.inspect(tweet, label: "call_service_a")
    end

    def call_service_b(%Swym.Tweet{} = tweet) do
        IO.inspect(tweet, label: "call_service_b")
    end

    def call_service_c(%Swym.Tweet{} = tweet) do
        IO.inspect(tweet, label: "call_service_c")
    end
end