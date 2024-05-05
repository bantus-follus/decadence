|%
+$  state  [aeonscore=@rs gamescore=@rs game=@ud currentdeck=deck setone=deck settwo=deck subdecadence=?]
::
+$  demon  [@rs @t]
::  cards
+$  suit  ?(%hearts %spades %clubs %diamonds)
+$  darc  [sut=suit val=@rs faceup=?]
+$  deck  (list darc)

::  actions
+$  action
    $%  [%start subdec=?]
        [%deal ~]
        [%flip =@ud]
        [%match setonechoice=@ud settwochoice=@ud]
        [%submit ~]
    ==
--