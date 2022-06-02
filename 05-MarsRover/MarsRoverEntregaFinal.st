!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:41:54'!
test01RoverBeginsInTheOrigin
	|marsRover|
	
	marsRover := MarsRover new.
	
	self assert: marsRover position equals: 0@0.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:42:13'!
test02RoverBeginsFacingNorth
	|marsRover|
	
	marsRover := MarsRover new.
	
	self assert: marsRover facing equals: 'N'.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:43:40'!
test03RoverCanMoveForwardOnce
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'f'.
	
	self assert: marsRover position equals: 1@0.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:43:06'!
test04RoverCanMoveForwardManyTimes
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'f'.
	marsRover command: 'f'.
	marsRover command: 'f'.

	self assert: marsRover position equals: 3@0.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:43:29'!
test05RoverCanRotateLeftOnce
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'l'.

	self assert: marsRover facing equals: 'O'.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:44:16'!
test06RoverCanRotateLeftManyTimes
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'l'.
	marsRover command: 'l'.
	marsRover command: 'l'.

	self assert: marsRover facing equals: 'E'.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:54:12'!
test07RoverCanRotateRightOnce
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'r'.

	self assert: marsRover facing equals: 'E'.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:47:06'!
test08RoverCanRotateRightManyTimes
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'r'.
	marsRover command: 'r'.
	marsRover command: 'r'.

	self assert: marsRover facing equals: 'O'.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:47:20'!
test09RoverCanGoBackwardsOnce
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'b'.

	self assert: marsRover position equals: -1@0.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:47:30'!
test10RoverCanGoBackwardsManyTimes
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'b'.
	marsRover command: 'b'.
	marsRover command: 'b'.

	self assert: marsRover position equals: -3@0.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:50:39'!
test11RoverCanMoveForwardAfterRotating
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'f'.
	marsRover command: 'r'.
	marsRover command: 'f'.

	self assert: marsRover position equals: 1@1.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:50:07'!
test12RoverCanMoveForwardWhenFacingAnyDirection
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'f'.
	marsRover command: 'r'.
	marsRover command: 'f'.
	marsRover command: 'r'.
	marsRover command: 'f'.
	marsRover command: 'r'.
	marsRover command: 'f'.

	self assert: marsRover position equals: 0@0.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:51:58'!
test13RoverCanGoBackwardsAfterRotating
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'b'.
	marsRover command: 'r'.
	marsRover command: 'b'.

	self assert: marsRover position equals: -1@-1.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:52:27'!
test14RoverCanGoBackwardsWhenFacingAnyDirection
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'b'.
	marsRover command: 'r'.
	marsRover command: 'b'.
	marsRover command: 'r'.
	marsRover command: 'b'.
	marsRover command: 'r'.
	marsRover command: 'b'.

	self assert: marsRover position equals: 0@0.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 11:53:26'!
test15RoverCanMoveInAnyDirectionWhenFacingAnyDirection
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover command: 'b'.
	marsRover command: 'r'.
	marsRover command: 'b'.
	marsRover command: 'r'.
	marsRover command: 'f'.
	marsRover command: 'l'.
	marsRover command: 'f'.
	marsRover command: 'f'.

	self assert: marsRover position equals: -2@1.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'jp 6/2/2022 12:08:27'!
test16RoverStopsWhenGivenAnIncorrectCommand
	|marsRover|
	
	marsRover := MarsRover new.

	marsRover command: 'f'.
	marsRover command: 'f'.
	marsRover command: 'r'.
	marsRover command: 'f'.
	marsRover command: 'w'.
	marsRover command: 'f'.
	marsRover command: 'f'.
	marsRover command: 'l'.
	marsRover command: 'b'.
	

	self assert: marsRover position equals: 2@1.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position facing active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'public' stamp: 'jp 6/2/2022 12:05:43'!
command: aCommand 

	(#('f' 'l' 'r' 'b') includes: aCommand) ifFalse: [ active := false ].
	
	aCommand  = 'f' & active ifTrue: [ self forward. ].
	
	aCommand = 'l' & active ifTrue: [ self rotateLeft. ].
	
	aCommand = 'r' & active ifTrue: [ self rotateRight. ].

	aCommand  = 'b' & active ifTrue: [ self backward. ]
	! !

!MarsRover methodsFor: 'public' stamp: 'jp 6/2/2022 10:48:43'!
facing
	^facing! !

!MarsRover methodsFor: 'public' stamp: 'jp 6/2/2022 10:42:08'!
position
	^position! !


!MarsRover methodsFor: 'initialization' stamp: 'jp 6/2/2022 12:05:08'!
initialize
	position := 0@0.
	facing := 'N'.
	active := true.! !


!MarsRover methodsFor: 'private' stamp: 'jp 6/2/2022 11:39:00'!
backward
	facing = 'N' ifTrue: [ position := position - (1@0) ].
	facing = 'E' ifTrue: [ position := position - (0@1) ].
	facing = 'S' ifTrue: [ position := position + (1@0) ].
	facing = 'O' ifTrue: [ position := position + (0@1) ].
	
	
! !

!MarsRover methodsFor: 'private' stamp: 'jp 6/2/2022 11:38:47'!
forward
	facing = 'N' ifTrue: [ position := position + (1@0) ].
	facing = 'E' ifTrue: [ position := position + (0@1) ].
	facing = 'S' ifTrue: [ position := position - (1@0) ].
	facing = 'O' ifTrue: [ position := position - (0@1) ].
	! !

!MarsRover methodsFor: 'private' stamp: 'jp 6/2/2022 11:39:31'!
rotateLeft
	facing = 'N' ifTrue: [^facing := 'O'].
	facing = 'O' ifTrue: [^facing := 'S'].
	facing = 'S' ifTrue: [^facing := 'E'].
	facing = 'E' ifTrue: [^facing := 'N'].
	
	
	
	! !

!MarsRover methodsFor: 'private' stamp: 'jp 6/2/2022 11:22:08'!
rotateRight
	facing = 'N' ifTrue: [^facing := 'E'].
	facing = 'O' ifTrue: [^facing := 'N'].
	facing = 'S' ifTrue: [^facing := 'O'].
	facing = 'E' ifTrue: [^facing := 'S'].



	
	
	! !
