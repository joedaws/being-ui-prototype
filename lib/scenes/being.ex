defmodule BeingUi.Scene.Being do
  use Scenic.Scene
  alias Scenic.Graph
  import Scenic.Primitives
  import Scenic.Components

  alias BeingUi.Component.Nav
  alias BeingUi.Component.Notes

  @graph Graph.build()
         |> text("Hello World", font_size: 22, translate: {20, 80})
         |> button("Do Something", translate: {20, 180})

  @notes """
     This is the scene where we can view the stats and
     current status of the being.
  """

  def init(scene, _param, _opts) do
    graph =
      @graph
      |> Nav.add_to_graph(__MODULE__)
      |> Notes.add_to_graph(@notes)

    scene =
      scene
      |> assign(:graph, graph)
      |> push_graph(graph)

    {:ok, scene}
  end
end
