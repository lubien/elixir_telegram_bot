defmodule TelegramApi do
  use Application
  use Supervisor

  def start(_type, _args) do
    require Logger

    Logger.log :debug, "Starting bot supervisors."

    children = [
      supervisor(TelegramApi.Polling, [
        [name: TelegramApi.Polling]
      ])
    ]

    {:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end
end