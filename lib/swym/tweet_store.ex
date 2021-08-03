defmodule Swym.TweetStore do
    use GenServer

    # Client
    def start_link(default) when is_list(default) do
        GenServer.start_link(__MODULE__, default, name: TweetStore)
    end

    def push(tweet) do
        GenServer.cast(TweetStore, {:push, tweet})
    end

    def count(user_name) do
        tweets = GenServer.call(TweetStore, :all)
        Enum.count(tweets, fn tweet -> tweet.user_name == user_name end)
    end

    # Callbacks
    @impl true
    def init(stack) do
        {:ok, stack}
    end

    @impl true
    def handle_call(:all, _from, tweets) do
        {:reply, tweets, tweets}
    end

    @impl true
    def handle_cast({:push, tweet}, state) do
        {:noreply, [tweet | state]}
    end
end

