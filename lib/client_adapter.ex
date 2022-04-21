defmodule LmHttpHackney.ClientAdapter do
  @moduledoc """
  This is the Hackney implementation for the Lucid Modules Http.
  """

  alias LmHttp.ClientAdapter
  alias LmHttp.Method

  @behaviour LmHttp.ClientAdapter

  @allowed_methods Method.get_all()

  @spec request(ClientAdapter.serialized_request()) :: ClientAdapter.result()
  @doc """
  Returns response converted to the result
  """
  @impl true
  def request(%{method: method})
      when method not in @allowed_methods,
      do: {:error, "invalid HTTP method"}

  def request(%{method: method, endpoint: url, headers: headers, body: payload}) do
    :hackney.request(method, url, headers, {:form, payload})
    |> handle_result
  end

  def request(%{method: method, endpoint: url, headers: headers}) do
    :hackney.request(method, url, headers)
    |> handle_result
  end

  defp handle_result(result) do
    case result do
      {:ok, status, headers, ref} ->
        %{status: status, body: process_body(ref), headers: headers}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp process_body(ref) do
    case :hackney.body(ref) do
      {:ok, body} ->
        body

      {:error, reason} ->
        {:error, reason}
    end
  end
end
