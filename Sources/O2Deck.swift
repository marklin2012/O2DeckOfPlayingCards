import O2FisherYates
import O2PlayingCard

public struct O2Deck {
  private var cards: [O2PlayingCard]
  
  public static func standard52CardDeck() -> O2Deck {
    let suits: [O2Suit] = [.Spades, .Hearts, .Diamonds, .Clubs]
    let ranks: [O2Rank] = [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King]
    
    var cards: [O2PlayingCard] = []
    for suit in suits {
      for rank in ranks {
        cards.append(O2PlayingCard(rank: rank, suit: suit))
      }
    }
    
    return O2Deck(cards)
  }
  
  public init(_ cards: [O2PlayingCard]) {
    self.cards = cards
  }
  
  public mutating func shuffle() {
    cards.shuffleInPlace()
  }
  
  public mutating func deal() -> O2PlayingCard? {
    guard !cards.isEmpty else { return nil }
    
    return cards.removeLast()
  }
}

// MARK: - ArrayLiteralConvertible

extension O2Deck : ArrayLiteralConvertible {
  public init(arrayLiteral elements: O2PlayingCard...) {
    self.init(elements)
  }
}

// MARK: - Equatable

extension O2Deck : Equatable {}

public func ==(lhs: O2Deck, rhs: O2Deck) -> Bool {
  return lhs.cards == rhs.cards
}