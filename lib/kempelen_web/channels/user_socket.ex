defmodule KempelenWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: Kempelen.Graphql.Schema

  ## Channels
  # channel "room:*", KempelenWeb.RoomChannel

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  def connect(params, socket, _connect_info) do
    {
      :ok,
      Absinthe.Phoenix.Socket.put_options(socket,
        context: %{
          current_account: account_from_session(params)
        }
      )
    }
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     KempelenWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(socket), do: "user_socket:#{socket.assigns.account_id}"

  defp account_from_session(%{"session_id" => id}) do
    Kempelen.Database.Repo.get(Kempelen.Models.Account, id)
  end
end
