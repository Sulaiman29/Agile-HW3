defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"booking" => %{"pickup_address" => pickup_address, "dropoff_address" => dropoff_address}}) do
    # At this moment, we simply return a success message without database interaction
    # Return a response indicating success, without saving to the database
    conn
    |> put_flash(:info, "Your taxi will arrive in 5 minutes")
    |> redirect(to: ~p"/bookings")  # Redirect to index
  end

  def show(conn, %{"id" => _id}) do
    # Placeholder for the show action
    # If you're not using it yet, just redirect to index or render a show template
    conn
    |> put_flash(:info, "Your taxi will arrive in 5+ minutes")
    |> redirect(to: ~p"/bookings")
  end
end
