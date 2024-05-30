|%
::  state
+$  versioned-state
    $%  state-0
    ==
+$  state-0         [%0 aeonscore=@rs gamescore=@rs game=@ud currentdeck=deck setone=deck settwo=deck selection=[setonecard=(unit darc) settwocard=(unit darc)] subdecadence=? message=tape front=frontend-state]
+$  frontend-state  [=display current-url=path]
+$  demon  [@rs @t]
::  cards
+$  suit  ?(%hearts %spades %clubs %diamonds %null)
+$  darc  [sut=suit val=@rs faceup=?]
+$  deck  (list darc)
::  frontend
+$  display  $~([[%html ~] [[%head ~] ~] [[%body ~] ~] ~] manx)
--