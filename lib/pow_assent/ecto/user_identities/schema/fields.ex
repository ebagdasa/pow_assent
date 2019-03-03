defmodule PowAssent.Ecto.UserIdentities.Schema.Fields do
  @moduledoc """
  Handles the Ecto schema fields for user.
  """
  alias PowAssent.Config

  @attrs [
    {:provider, :string, null: false},
    {:uid, :string, null: false},
    {:tokens, :map, null: false},
    {:data, :map, null: false}
  ]

  @doc """
  List of attributes for the ecto schema.

  ## Configuration options

    * `:users_table` - users table, defaults to "users".
  """
  @spec attrs(Config.t()) :: [tuple()]
  def attrs(config) do
    users_table = Config.get(config, :users_table, "users")

    [{:user_id, {:references, users_table}}] ++ @attrs
  end

  @doc """
  List of indexes for the ecto schema.
  """
  @spec indexes(Config.t()) :: [tuple()]
  def indexes(_config) do
    [{[:uid, :provider], true}]
  end
end
