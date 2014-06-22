pair    = []
matched = []

cards = $('.board .card').length / 2

timer = 0

cardCount = () ->
  true if pair.length == 2

resetCards = () ->
  $('.card').removeClass('active')

resetTimer = () ->
  timer = window.setTimeout(resetCards, 2000)

allMatchesMade = () ->
  alert('Good job you won') if matched.length == cards

isPair = (card1, card2) ->
  $card = $(".card[data-name='" + card1 + "']")

  if card1 == card2
    $card.addClass('matched')

    # Keep track of matches
    matched.push(card1)

    allMatchesMade()

  else
    $card.removeClass('active')

    #resetTimer()

  pair = []

$('.card').on 'click', (event) ->

  $this = $(this)

  if $this.hasClass('active')
    return false
  else
    $('.card').removeClass('active')

    card = $this.data('name')

    $this.addClass('active')

    unless matched.indexOf(card) > -1
      cardCount()

      pair.push(card)

      if cardCount() == true
        card1 = pair[0]
        card2 = pair[1]

        isPair(card1, card2)

