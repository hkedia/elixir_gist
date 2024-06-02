defmodule ElixirGistWeb.CreateGistLive do
  use ElixirGistWeb, :live_view

  alias ElixirGistWeb.GistFormComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="em-gradient flex items-center justify-center">
      <h1 class="font-brand font-bold text-3xl text-white">
        Instantly share Elixir code, notes, and snippets.
      </h1>
    </div>
    <.live_component module={GistFormComponent} id="new" current_user={@current_user} />
    """
  end
end
