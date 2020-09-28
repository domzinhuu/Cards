defmodule Cards do
  @moduledoc """
  Provide methods to create the deck and handle the deck distribution
  """

  @doc """
  Return the list of string that represent the deck of cards
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Vallet",
      "Queen",
      "King"
    ]

    suits = ["Hearts", "Spades", "Diamonds", "Clubs"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle the argunment `deck` into a new list

  ## Exemples

      iex> deck = Cards.create_deck
      iex> Cards.shuffle(deck)

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check if argument `element` contains in a argument list `deck`. Return **TRUE** if contains and **FALSE** if not.

  ## Exemples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Ten of Spades")
      true

  """
  def contains?(deck, element) do
    Enum.member?(deck, element)
  end

  @doc """
  Divide the deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck,2)
      iex> hand
      ["Ace of Hearts", "Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save the create deck in a **binary file**. The `deck` argument is the deck that you want to save
  and the `filename` is the name of the output file that will save the deck.

  ## Exemples

      iex> deck = Cards.create_deck
      iex> Cards.save(deck,"my_output")
      :ok

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write!(filename, binary)
  end

  @doc """
  Load a **binary file** with the saved deck. The `filename` arguments is the name of the file that will be load.
  This method return a list that contains the deck saved.

  ## Exemples

      iex> Cards.load("my_output")

  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "Não foi possivel ler o arquivo"
    end
  end

  @doc """
  This method call the three principal function in roll, `create_deck`, `shuffle` and  `deal`.
  With this method you can get a hand and the rest of deck that deal returns in only one call, you only need pass the `hand_size` to tell
  how many card the player will receive.

  ## Exemples

      iex> {hand, rest_of_deck} = Cards.create_hand(2)
      iex> hand

  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
