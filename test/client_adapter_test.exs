defmodule LmHttpHackney.ClientAdapterTest do
  use ExUnit.Case, async: false

  alias LmHttpHackney.ClientAdapter

  #  TODO: create fake internal endpoint?
  describe "given Line Api Hackney Adapter" do
    test "it requests GET" do
      assert %{status: _, body: _, headers: _} = ClientAdapter.request(%{
        method: :get,
        endpoint: "https://google.com",
        headers: []
      })
    end

    test "it executes POST" do
      assert %{status: _, body: _, headers: _} = ClientAdapter.request(%{
        method: :post,
        endpoint: "https://google.com",
        headers: [],
        body: [{:foo, :bar}]
      })
    end
  end
end
