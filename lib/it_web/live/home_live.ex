defmodule ItWeb.HomeLive do
  use ItWeb, :live_view

  alias It.Problems

  def mount(_params, _assigns, socket) do
    {:ok, socket |> assign(:stage, 0)}
  end

  def question(assigns) do
    ~L"""
    <%= f = form_for :problem, "#", [phx_submit: "answered"]%>
    <%= label f, :info, "What seems to be the problem?"%>
    <br>
    <br>    
    <%= textarea f, :info %>
    <br>
    <br> 
      <%= submit "Enter"%>
    </form>
    """
  end

  def answer(assigns) do
    ~L"""
    <p>I would suggest shutting your device off and then turning it back on again</p>
    <br>
    <br>
    <p>Didn't work? <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Get a second opinion</a></p>
    """
  end

  def home(assigns) do
    ~L"""
    <%= _ = form_for :start, "#", [phx_submit: "started"] %>
      <%= submit "Get Started" %>
      <p> <%= Problems.get_count!() %> problems solved </p>
    </form>
    """
  end

  def handle_event("started", _params, socket) do
    {:noreply, socket |> assign(:stage, 1)}
  end
  
  def handle_event("answered", _params, socket) do
    Problems.inc_count()
    {:noreply, socket |> assign(:stage, 2)}
  end

end
