defmodule ElixirGistWeb.UserLoginLive do
  use ElixirGistWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="em-gradient flex flex-col items-center justify-center">
      <h1 class="font-brand font-bold text-3xl text-white py-2">
        Sign in to account
      </h1>
      <h3 class="font-brand font-bold text-l text-white">
        Don't have an account?
        <.link
          navigate={~p"/users/register"}
          class="font-semibold text-brand hover:underline text-emLavender-dark"
        >
          Sign up
        </.link>
        for an account now.
      </h3>
    </div>
    <div class="mx-auto max-w-sm">
      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
          <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
            Forgot your password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Logging in..." class="w-full">
            Log in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
