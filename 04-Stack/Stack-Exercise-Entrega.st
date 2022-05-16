!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinderByPrefix emptyStack stack stackCopy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'jp 5/16/2022 14:21:51'!
test01PrefixWithOneMatch
	| auxiliaryCollection |
	
	self setUp.
	
	auxiliaryCollection  := sentenceFinderByPrefix findSentencesWith: 'Win' in: stack.
	
	self assert: auxiliaryCollection size = 1.
	self assert: auxiliaryCollection includes: 'Winter is here'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'jp 5/16/2022 14:21:57'!
test02PrefixWithManyMatches
	| auxiliaryCollection |
	
	self setUp.
	
	auxiliaryCollection  := sentenceFinderByPrefix findSentencesWith: 'win' in: stack.
	
	self assert: auxiliaryCollection size = 3.
	self assert: auxiliaryCollection includes: 'winter is coming'.
	self assert: auxiliaryCollection includes: 'winter is here'.
	self assert: auxiliaryCollection includes: 'winning is everything'.
	self deny:  (auxiliaryCollection includes: 'Winter is here').
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'jp 5/16/2022 14:22:03'!
test03PrefixWithZeroMatches
	| auxiliaryCollection |
	
	self setUp.
	
	auxiliaryCollection  := sentenceFinderByPrefix findSentencesWith: 'Hello' in: stack.
	
	self assert: auxiliaryCollection size = 0.

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'jp 5/16/2022 14:23:03'!
test04PrefixCannotBeEmptyOrContainSpaces
	self setUp.
	self should: [ sentenceFinderByPrefix findSentencesWith: '' in: stack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix invalidPrefixErrorDescription ].
	
	self should: [ sentenceFinderByPrefix findSentencesWith: 'Winter is here' in: stack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix invalidPrefixErrorDescription ].
		
	self should: [ sentenceFinderByPrefix findSentencesWith: '' in: emptyStack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix invalidPrefixErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'jp 5/16/2022 14:07:10'!
test05StackCannotBeEmpty	
	self setUp.
	self should: [ sentenceFinderByPrefix findSentencesWith: 'win' in: emptyStack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: OOStack stackEmptyErrorDescription]
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'jp 5/16/2022 14:22:15'!
test06InitialStackDoesntChange
	self setUp.
	
	sentenceFinderByPrefix findSentencesWith: 'win' in: stack.
	
	self assert: stack size = 5.
	self assert: stackCopy size = 5.
	
	[stack isEmpty] whileFalse: [
		self assert: stack top = stackCopy top.
		stack pop.
		stackCopy pop.
	]. 
	! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'jp 5/16/2022 14:10:05'!
setUp
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	emptyStack := OOStack new.
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winter is here'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	stackCopy := OOStack new.
	stackCopy push: 'winter is coming'.
	stackCopy push: 'winter is here'.
	stackCopy push: 'winning is everything'.
	stackCopy push: 'The winds of Winter'.
	stackCopy push: 'Winter is here'.
	
	! !


!classDefinition: #OOPrefix category: 'Stack-Exercise'!
Object subclass: #OOPrefix
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOInvalidPrefix category: 'Stack-Exercise'!
OOPrefix subclass: #OOInvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOInvalidPrefix class' category: 'Stack-Exercise'!
OOInvalidPrefix class
	instanceVariableNames: ''!

!OOInvalidPrefix class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 14:27:43'!
canInstantiateWith: aPrefixToCheck
	^((aPrefixToCheck = '') or: [aPrefixToCheck includesSubString: ' ']).! !

!OOInvalidPrefix class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 14:30:53'!
checkPrefixIsValid
	self error: SentenceFinderByPrefix invalidPrefixErrorDescription.
	! !


!classDefinition: #OOValidPrefix category: 'Stack-Exercise'!
OOPrefix subclass: #OOValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOValidPrefix class' category: 'Stack-Exercise'!
OOValidPrefix class
	instanceVariableNames: ''!

!OOValidPrefix class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 14:27:31'!
canInstantiateWith: aPrefixToCheck
	^ ((aPrefixToCheck = '') or: [aPrefixToCheck includesSubString: ' ']) not.! !

!OOValidPrefix class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 14:26:06'!
checkPrefixIsValid! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'jp 5/16/2022 12:32:32'!
isEmpty
	^ contents size = 0.! !

!OOStack methodsFor: 'public' stamp: 'jp 5/16/2022 12:51:49'!
pop
	| lastObject |
	self checkStackIsValid.
	lastObject := contents last.
	contents removeLast.
	^lastObject.
	! !

!OOStack methodsFor: 'public' stamp: 'jp 5/16/2022 12:32:32'!
push: anObject
	contents addLast: anObject .! !

!OOStack methodsFor: 'public' stamp: 'jp 5/16/2022 12:32:32'!
size
	^contents size.! !

!OOStack methodsFor: 'public' stamp: 'jp 5/16/2022 12:48:57'!
top
	self checkStackIsValid.
	^contents last.! !


!OOStack methodsFor: 'initialization' stamp: 'jp 5/16/2022 12:32:32'!
initialize
	contents := OrderedCollection new.! !


!OOStack methodsFor: 'private' stamp: 'jp 5/16/2022 12:50:36'!
checkStackIsValid
	(OOState subclasses detect: [:aSubclass | aSubclass canInstantiateWith: self size]) checkStackIsValid.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOState category: 'Stack-Exercise'!
Object subclass: #OOState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOEmpty category: 'Stack-Exercise'!
OOState subclass: #OOEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmpty class' category: 'Stack-Exercise'!
OOEmpty class
	instanceVariableNames: ''!

!OOEmpty class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 12:50:35'!
canInstantiateWith: aStackSize
	^ aStackSize = 0.! !

!OOEmpty class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 12:48:57'!
checkStackIsValid
	self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #OONotEmpty category: 'Stack-Exercise'!
OOState subclass: #OONotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmpty class' category: 'Stack-Exercise'!
OONotEmpty class
	instanceVariableNames: ''!

!OONotEmpty class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 12:50:35'!
canInstantiateWith: aStackSize
	^ aStackSize > 0.! !

!OONotEmpty class methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 12:48:57'!
checkStackIsValid
	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 14:28:52'!
checkPrefixIsValid: aPrefix
	(OOPrefix subclasses detect: [:aSubclass | aSubclass canInstantiateWith: aPrefix]) checkPrefixIsValid.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jp 5/16/2022 14:29:42'!
findSentencesWith: aPrefix in: aStackOfSentences

	| anAuxiliaryStack allMatches anElement |
	
	"(self isPrefixValid: aPrefix) ifFalse: [ self error: SentenceFinderByPrefix invalidPrefixErrorDescription ]."
	self checkPrefixIsValid: aPrefix.
	aStackOfSentences checkStackIsValid.
	
	
	anAuxiliaryStack := OOStack new.
	allMatches := OrderedCollection new.
	
	[aStackOfSentences isEmpty] whileFalse: [
		anElement := aStackOfSentences pop.
		(anElement beginsWith: aPrefix) ifTrue: [allMatches addLast: anElement].
		anAuxiliaryStack push: anElement 
	].

	[anAuxiliaryStack isEmpty] whileFalse: [aStackOfSentences push: (anAuxiliaryStack pop)].	
	
	^allMatches.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'jp 5/16/2022 14:02:38'!
invalidPrefixErrorDescription
	^'Invalid Prefix'.! !
