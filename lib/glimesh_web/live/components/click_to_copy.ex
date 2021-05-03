defmodule GlimeshWeb.Components.ClickToCopy do
  @moduledoc """
  This looks like a live_view, but it's a live_component at heart :)
  """
  use GlimeshWeb, :live_view

  @impl true
  def render(assigns) do
    ~L"""
        <button id="<%= @id %>_button" class="btn btn-info <%= assigns.class %>" type="button"
          phx-hook="ClickToCopy"
          data-copy-value="<%= assigns.value %>"
          data-copied-error-text="<%= gettext("Error") %>"
          data-copied-text="<%= gettext("Copied to Clipboard") %>"><%= gettext("Click to Copy") %></button>
    """
  end

  @impl true
  def mount(:not_mounted_at_router, %{"value" => value} = state, socket) do
    {:ok,
     socket
     |> assign(:id, socket.id)
     |> assign(:value, value)
     |> assign(:class, Map.get(state, "class", "")), layout: false}
  end
end
