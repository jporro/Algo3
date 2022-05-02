!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!NotFound methodsFor: 'as yet unclassified' stamp: 'jp 5/1/2022 22:13:23'!
signal
	^'Error, Customer Not Found'.! !


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 19:21:40'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assert: (self executing: [customerBook addCustomerNamed: 'John Lennon'] doesNotTakeMoreMillisecondsThan: 50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 19:24:05'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assert: (self executing: [customerBook addCustomerNamed: paulMcCartney] doesNotTakeMoreMillisecondsThan: 50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 22:00:37'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	[ customerBook addCustomerNamed: ''. self fail ] 
	on: Error do: [ :anError |  self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage ].
	self assert: customerBook isEmpty. 
		
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 21:49:34'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		
	[ customerBook removeCustomerNamed: 'Paul McCartney'].
	self ensureCustomerBook: customerBook includesCustomer: johnLennon andHasThisNumberOfCustomers: 1.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 21:53:17'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney charactersitics |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomer: paulMcCartney shouldItBeSuspend: true shouldItBeRemoved: false.
	
	charactersitics := OrderedCollection with: 0 with: 1 with: 1.
	
	self ensureCustomerBook: customerBook verifiesThisCharacteristics: charactersitics.
	self ensureCustomerBook: customerBook includesCustomer: paulMcCartney is: true.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 21:53:11'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney charactersitics |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomer: paulMcCartney shouldItBeSuspend: true shouldItBeRemoved: true.
	
	charactersitics := OrderedCollection with: 0 with: 0 with: 0.
	
	self ensureCustomerBook: customerBook verifiesThisCharacteristics: charactersitics.
	self ensureCustomerBook: customerBook includesCustomer: paulMcCartney is: false.

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 21:53:56'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr' ].
	self ensureCustomerBook: customerBook includesCustomer: johnLennon andHasThisNumberOfCustomers: 1.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jp 5/1/2022 21:53:46'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomer: johnLennon shouldItBeSuspend: true shouldItBeRemoved: false.
	
	[ customerBook suspendCustomerNamed: johnLennon ].
	self ensureCustomerBook: customerBook includesCustomer: johnLennon andHasThisNumberOfCustomers: 1.
! !


!CustomerBookTest methodsFor: 'time' stamp: 'jp 5/1/2022 21:55:14'!
executing: aClosure doesNotTakeMoreMillisecondsThan: anAmountOfTimeinMilliseconds
	| timeTaken |
	
	timeTaken := self getExecutionTime: aClosure.
	
	^ timeTaken < anAmountOfTimeinMilliseconds.! !

!CustomerBookTest methodsFor: 'time' stamp: 'jp 5/1/2022 21:55:26'!
getExecutionTime: aClosure
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning - millisecondsBeforeRunning.! !


!CustomerBookTest methodsFor: 'ensure' stamp: 'jp 5/2/2022 09:17:18'!
ensureCustomerBook: aCustomerBook includesCustomer: aName andHasThisNumberOfCustomers: aNumber 
	self assert: aCustomerBook numberOfCustomers = aNumber.
	self ensureCustomerBook: aCustomerBook includesCustomer: aName is: true.! !

!CustomerBookTest methodsFor: 'ensure' stamp: 'jp 5/2/2022 09:17:32'!
ensureCustomerBook: aCustomerBook includesCustomer: aName is: shouldBeIncluded
	shouldBeIncluded 
		ifTrue: [self assert: (aCustomerBook includesCustomerNamed: aName)] 
		ifFalse: [self deny: (aCustomerBook includesCustomerNamed: aName)]! !

!CustomerBookTest methodsFor: 'ensure' stamp: 'jp 5/2/2022 09:17:46'!
ensureCustomerBook: aCustomeerBook verifiesThisCharacteristics: aCollectionOfNumbers
	self assert: (aCollectionOfNumbers at: 1) equals: aCustomeerBook numberOfActiveCustomers.
	self assert: (aCollectionOfNumbers at: 2) equals: aCustomeerBook numberOfSuspendedCustomers.
	self assert: (aCollectionOfNumbers at: 3) equals: aCustomeerBook numberOfCustomers.
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'jp 5/2/2022 09:17:07'!
addCustomer: aName shouldItBeSuspend: shouldBeSuspened shouldItBeRemoved: shouldBeRemoved
	self addCustomerNamed: aName.
	shouldBeSuspened ifTrue: [ self suspendCustomerNamed: aName ].
	shouldBeRemoved ifTrue: [ self removeCustomerNamed: aName ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'jp 5/2/2022 09:15:35'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'jp 5/2/2022 09:05:38'!
removeCustomerNamed: aName 

	|removedFromActive removedFromSuspended|
	
	removedFromActive := self removeCustomerNamed: aName fromCollection: active.
	removedFromSuspended := self removeCustomerNamed: aName fromCollection: suspended.
	
	((removedFromActive isEqualTo: aName) or: (removedFromSuspended isEqualTo: aName)) ifTrue: [ ^aName ].
	
	^NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'jp 5/2/2022 09:16:48'!
removeCustomerNamed: aName fromCollection: customerCollection
	^ customerCollection remove: aName ifAbsent: ['The Customer was not in this Collection'].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
