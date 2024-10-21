defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller
  alias Takso.Repo
  alias Takso.Sales.Taxi
  import Ecto.Query, only: [from: 2]

  def new(conn, _params) do
    render conn, "new.html"
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"booking" => %{"pickup_address" => pickup_address, "dropoff_address" => dropoff_address}}) do
    # Query for available taxis
    query = from(t in Taxi, where: t.status == "available", select: t)
    available_taxis = Repo.all(query)

    if length(available_taxis) > 0 do
      # There are taxis available
      conn
      |> put_flash(:info, "Your taxi will arrive in 5 minutes")
      |> redirect(to: ~p"/bookings")  # Redirect to index
    else
      # No taxis available
      conn
      |> put_flash(:error, "At present, there is no taxi available!")
      |> redirect(to: ~p"/bookings")  # Redirect to index
    end
  end

  def show(conn, %{"id" => _id}) do
    # Placeholder for the show action
    # If you're not using it yet, just redirect to index or render a show template
    conn
    |> put_flash(:info, "Your taxi will arrive in 5+ minutes")
    |> redirect(to: ~p"/bookings")
  end
end
