defmodule Grapple.Subscription do
  defstruct [:url, :method, :life, :headers, :body, :query]

  table = :ets.new(:subscrips, [:set, :protected, :named_table])

  def create(subscription) do
    uuid = UUID.uuid4(:default)
    :ets.insert(:subscrips, {uuid, subscription})
  end

  defp start do
    receive do
      {:cast, value, from} -> broadcast(value)
    end
  end

  def broadcast(data) do
    Enum.map(all(), fn subscrip -> IO.puts "TODO: broadcast via HTTP!" end)
  end

  def all do
    :ets.select(:subscrips)
  end

  def matches(data) do
    false
  end
end
