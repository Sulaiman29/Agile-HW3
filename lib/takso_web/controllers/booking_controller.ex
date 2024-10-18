defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

   def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"booking" => _booking_params}) do
    # At this moment, we simply return a success message without database interaction
    # Return a response indicating success, without saving to the database
    conn
    |> put_flash(:info, "Your taxi will arrive in 2 minutes.")
    |> redirect(to: ~p"/bookings")  # Redirect to index
  end
end
