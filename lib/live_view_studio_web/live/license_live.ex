defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view
  alias LiveViewStudio.Licenses
  import Number.Currency
  import Inflex

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 2, amount: Licenses.calculate(2), copy: "seats")
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Team License</h1>
    <div class="card">
      <div class="content">
        <div class="seats">
          <img src="images/license.svg" />
          <span>
            Your license is currently for
            <strong><%= @seats %></strong> <%= @copy %>.
          </span>
        </div>

        <form phx-change="update">
          <input type="range" min="1" max="10" name="seats" value="<%= @seats %>" />
        </form>

        <div class="amount"><%= number_to_currency(@amount) %></div>
      </div>
    </div>
    """
  end

  def handle_event("update", %{"seats" => seats}, socket) do
  seats = String.to_integer(seats)
    socket = assign(socket, 
        seats: seats,
        amount: Licenses.calculate(seats),
        copy: Inflex.inflect("seat", seats))
    {:noreply, socket}
  end
end
