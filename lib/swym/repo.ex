defmodule Swym.Repo do
  use Ecto.Repo,
    otp_app: :swym,
    adapter: Ecto.Adapters.Postgres
end
