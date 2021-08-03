defmodule Swym.Tweet do
    alias Swym.RuleEngine

    defstruct [:msg, :user_name, :location, :hashtag]
    def receive(%Swym.Tweet{} = tweet) do
        Process.spawn(RuleEngine, :process, [tweet], [])
    end
end