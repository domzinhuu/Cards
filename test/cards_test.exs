defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 52
  end

  test "if shuffle generate a new order deck" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
  end

  test "if create_hand give a hand with the hand_size passed" do
    {hand, _rest_deck} = Cards.create_hand(4)
    hand_length = length(hand)

    assert hand_length === 4
  end

  test "if create_hand give a rest of deck without the hand" do
    {hand, rest_deck} = Cards.create_hand(2)
    [firstCard, secondCard] = hand

    containsFirstCard = Enum.member?(rest_deck, firstCard)
    containsSecondCard = Enum.member?(rest_deck, secondCard)

    assert containsFirstCard === false && containsSecondCard === false
  end


end
