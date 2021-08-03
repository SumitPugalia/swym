defmodule SwymWeb.Router do
  use SwymWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SwymWeb do
    pipe_through :api
  end
end
