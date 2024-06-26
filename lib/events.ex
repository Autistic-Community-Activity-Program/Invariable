defmodule StaticSite.Events do
  alias StaticSite.Event

  use NimblePublisher,
    build: Event,
    from: "./content_src/events/**/*.md",
    as: :events,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @events Enum.sort_by(@events, & &1.start_datetime, {:asc, DateTime})

  # Export the events
  def all_events, do: @events
end
