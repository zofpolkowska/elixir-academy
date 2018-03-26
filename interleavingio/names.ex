### Examples of interleaving reading and writing IO ###

#Programs implementing OTP Behaviours, i.e. the simplest GenServer of names.

#Client API:
#start_link
#add(serv_ref, name)
#lookup(serv_ref,name)
#list(serv_ref)
#stop(serv_ref)

#Every time client calls a function, server reacts (response, change of state)

defmodule Names do
  use GenServer

  # public API
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def add(server, name) do
    GenServer.call(server, {:add, name})
  end

  def list(server) do
    GenServer.call(server, :list)
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def stop(server) do
    GenServer.stop(server)
  end

  # server callback
  def init(:ok) do
    {:ok, []}
  end

  def handle_call({:add, name}, _from, state) do
    {:reply, :ok, [name|state]}
  end

  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:lookup, name}, _from, state) do
    {:reply, Enum.member?(state, name), state}
  end
end
