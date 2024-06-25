defmodule ElixirGistWeb.AllGistsLive do
  use ElixirGistWeb, :live_view

  alias ElixirGist.Gists

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(_unsigned_params, _uri, socket) do
    gists = Gists.list_gists()

    IO.inspect(gists)
    socket = assign(socket, gists: gists)
    {:noreply, socket}
  end

  def gist(assigns) do
    ~H"""
    <div class="font-brand text-white">
      <div>
        <%= @current_user.email %> / <%= @gist.name %>
      </div>
      <div>
        <%= @gist.updated_at %>
      </div>
      <div>
        <%= @gist.description %>
      </div>
      <div>
        <%= @gist.markup_text %>
      </div>
    </div>
    """
  end
end
