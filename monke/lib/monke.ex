defmodule Monke do
  use Application
  alias Alchemy.Client
  alias Alchemy.User
  alias Alchemy.Cache.Channels
  alias Alchemy.Voice
  alias Alchemy.Embed
  import Embed

  defmodule Commands do
    use Alchemy.Cogs

  #ping command
    Cogs.def ping do
      tempo = Time.utc_now()
      Cogs.say ('Pinging...')
      temporesposta = Time.diff(Time.utc_now(), tempo, :millisecond)
      %Embed{}
      |> title("Discord API Ping")
      |> description("The current ping of the API is **#{temporesposta}MS**")
      |> color(0xc45854)
      |> Embed.send
    end
  #monke
    Cogs.def monke do
      %Embed{}
      |> title("Monke")
      |> description("Picture :)")
      |> image("https://www.pbs.org/wnet/nature/files/2014/09/mezzanine_431.jpg")
      |> Embed.send
    end

    Cogs.def sysinfo do
      system = [
        {"Prefix", "!"},
        {"Version", "0.1.0"},
        {"Elixir Version", System.version()},
        {"Processes", "#{length(:erlang.processes())}"},
        {"Memory Usage", "#{div(:erlang.memory(:total), 1_000_000)} MB"}
        {"Process ID", "{#System.pid()}"}
      ]

      Enum.reduce(system, %Embed{color: 0xc46236, title: "Monke"}, fn {name, value}, embed ->
        Embed.field(embed, name, value, inline: true)
      end)
      |> Embed.thumbnail("https://pngimg.com/uploads/monkey/monkey_PNG18722.png")
      |> Embed.url("https://github.com/synterrr/MonkeBOT")
      |> Embed.send()
    end

  end

  def start(type, args) do
    run = Client.start("YOUR_TOKEN_HERE")
    use Commands
    run
  end
end
