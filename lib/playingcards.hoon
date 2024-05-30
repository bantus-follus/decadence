/-  *decadence

|%
++  make-decadence-deck
  ^-  deck
  =/  mydeck  *deck
  =/  i  .1
  |-
  ?:  (gth:rs i .4)
    mydeck
  =/  j  .1
  |-
  ?.  (lte:rs j .9)
    ^$(i (add:rs i .1))
  %=  $
    j       (add:rs j .1)
    mydeck  [[(num-to-suit i) j %.n] mydeck]
  ==
++  make-subdecadence-deck
  ^-  deck
  =/  mydeck  *deck
  =/  i  .1
  |-
  ?:  (gth:rs i .4)
    mydeck
  =/  j  .0
  |-
  ?.  (lte:rs j .9)
      ^$(i (add:rs i .1))
  %=  $
    j       (add:rs j .1)
    mydeck  [[(num-to-suit i) j %.n] mydeck]
  ==
++  num-to-suit
  |=  val=@rs
  ^-  suit
  ?+  val  !!
    %.1  %hearts
    %.2  %spades
    %.3  %clubs
    %.4  %diamonds
  ==
++  shuffle-deck
  |=  [unshuffled=deck entropy=@]
  ^-  deck
  =/  shuffled  *deck
  =/  random  ~(. og entropy)
  =/  remaining  (lent unshuffled)
  |-
  ?:  =(remaining 1)
    :_  shuffled
    (snag 0 unshuffled)
  =^  index  random  (rads:random remaining)
  %=  $
    shuffled      [(snag index unshuffled) shuffled]
    remaining     (dec remaining)
    unshuffled    (oust [index 1] unshuffled)
  ==
++  draw
  |=  [n=@ud d=deck]
  ^-  [hand=deck rest=deck]
  :-  (scag n d)
  (slag n d)
++  flipcard
  |=  flippingcard=darc
  ^-  darc
  [sut.flippingcard val.flippingcard %.y]

++  flipcardfacedown
  |=  flippingcard=darc
  ^-  darc
  ?:  =(faceup.flippingcard %.n)
      flippingcard
  [sut.flippingcard val.flippingcard %.n]
--