defmodule Monke do
  use Application
  alias Alchemy.Client
  alias Alchemy.Voice
  alias Alchemy.Embed
  import Embed

  defmodule Commands do
    use Alchemy.Cogs

  #ping command
    Cogs.def ping do
      Cogs.say ("Pong!")
    end
  #monke
    Cogs.def monke do
      %Embed{}
      |> title("Monke")
      |> description("Picture :)")
      |> image("https://www.pbs.org/wnet/nature/files/2014/09/mezzanine_431.jpg")
      |> Embed.send
    end
  end

  def start(type, args) do
    run = Client.start("YOUR_TOKEN_HERE")
    use Commands
    run
  end
end