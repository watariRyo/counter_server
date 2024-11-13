defmodule CounterServer do
  use GenServer
  # クライアントAPI
  # サーバの起動
  def start_link(initial_count) do
      # name: __MODULE__ というオプションを指定することで、プロセスをモジュール名で参照できるようにする
    GenServer.start_link(__MODULE__, initial_count, name: __MODULE__)
  end

  # :get_countリクエスト
  def get_count do
    GenServer.call(__MODULE__, :get_count)
  end

  # :incrementリクエスト
  def increment do
    GenServer.cast(__MODULE__, :increment)
  end

  # サーバコールバック
  # サーバプロセス起動時の初期状態設定
  def init(initial_count) do
    { :ok, initial_count } # 正常な初期化完了を示す
  end

  # 同期リクエスト処理
  def handle_call(:get_count, _from, current_count) do
    {:reply, current_count, current_count }
  end

  # 非同期リクエスト処理
    # 動機リクエスト処理
    def handle_cast(:increment, current_count) do
      {:noreply, current_count+1 }
    end
end
