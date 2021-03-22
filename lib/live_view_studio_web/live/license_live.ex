defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view
  alias LiveViewStudio.Licenses

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 2, amout: Licenses.calculate(2))
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
            <strong>2</strong> seats.
          </span>
        </div>

        <form>
          <input type="range" min="1" max="10" name="seats" value="2" />
        </form>

        <div class="amount">$40</div>
      </div>
    </div>
    """
  end
end