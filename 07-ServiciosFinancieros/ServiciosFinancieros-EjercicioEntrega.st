!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:04:31'!
test00EmptyPortfoliohas0Balance
	| aPortfolio |
	
	aPortfolio := Portfolio with: OrderedCollection new.
	
	self assert: 0 * peso equals: aPortfolio balance. 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:15:38'!
test01PortfolioBalanceIsTheSumOfItsAccountsBalance
	
	| aPortfolio |
	
	aPortfolio := Portfolio with: self accountCollection.
	
	self assert: 300 * peso equals: aPortfolio balance. 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:16:56'!
test02PortfolioCanAddAnAccount
	| aPortfolio |

	aPortfolio := Portfolio with: OrderedCollection new.
	
	aPortfolio add: self accountCollection first.
	
	self assert: 100 * peso equals: aPortfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:17:29'!
test03PortfolioCanHaveAnotherPortfolioInside
	| aPortfolio anotherPortfolio |

	aPortfolio := Portfolio with: self accountCollection .
	
	anotherPortfolio := Portfolio with: OrderedCollection new.
	anotherPortfolio add: aPortfolio.
	
	self assert: 300 * peso equals: anotherPortfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/7/2022 17:29:54'!
test04EmptyPortfolioHasNoTransactions
	| aPortfolio |
	
	aPortfolio := Portfolio with: OrderedCollection new.
	
	self assert: 0 equals: aPortfolio transactions size.
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:35:08'!
test05PortfolioHasItsAccountsTransactions
	| aPortfolio someAccounts |
	
	someAccounts := self accountCollection.
	aPortfolio := Portfolio with: someAccounts.
	
	self assert: 2 equals: aPortfolio transactions size. 
	self assert: aPortfolio transactions includes: someAccounts first transactions first.
	self assert: aPortfolio transactions includes: someAccounts last transactions first.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:34:24'!
test06PortfolioWithAnotherPortfolioInsidehasTheRightTransactions
	| aPortfolio anotherPortfolio someAccounts |
	
	someAccounts := self accountCollection.
	
	aPortfolio := Portfolio with: someAccounts.
	
	anotherPortfolio := Portfolio with: OrderedCollection new.
	anotherPortfolio add: aPortfolio.
	
	self assert: 2 equals: aPortfolio transactions size.
	self assert: aPortfolio transactions includes: someAccounts first transactions first.
	self assert: aPortfolio transactions includes: someAccounts last transactions first.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:36:39'!
test07PortfolioRegisersItsAccountsTransactions
	| aPortfolio someAccounts |
	
	someAccounts := self accountCollection.
	
	aPortfolio := Portfolio with: someAccounts .

	self assert: (aPortfolio hasRegistered: someAccounts first transactions first).
	self assert: (aPortfolio hasRegistered: someAccounts last transactions first).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:31:44'!
test08PortfolioWithAnotherPortfolioInsideRegistersTheTransactionsOfTheAccountsOfTheOtherPortfolio
	| aPortfolio anotherPortfolio someAccounts |
	
	someAccounts := self accountCollection.
	
	aPortfolio := Portfolio with: someAccounts.
	
	anotherPortfolio := Portfolio with: OrderedCollection new.
	anotherPortfolio add: aPortfolio.
	
	self assert: (aPortfolio hasRegistered: someAccounts first transactions first).
	self assert: (aPortfolio hasRegistered: someAccounts last transactions first).
	! !


!PortfolioTest methodsFor: 'aux' stamp: 'jp 6/8/2022 13:11:34'!
accountCollection

	| anAccount anotherAccount someAccounts |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 200 * peso on: anotherAccount.
	
	someAccounts := OrderedCollection new.
	someAccounts add: anAccount.
	someAccounts add: anotherAccount.
	
	^ someAccounts .
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jp 6/8/2022 14:01:06'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 200 * peso on: account.
	Withdraw register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jp 6/8/2022 14:00:36'!
test04WithdrawValueIsPositive 	
	self assert: 100 * peso equals: (Withdraw register: 100 * peso on: ReceptiveAccount new) value.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jp 6/8/2022 14:01:31'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 200 * peso on: account.
	withdraw := Withdraw register: 100 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jp 6/8/2022 14:06:55'!
test06TransactionsAreStoredInTransactionsCollection 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 200 * peso on: account.
	withdraw := Withdraw register: 100 * peso on: account.
		
	self assert: 2 equals: account transactions size.
	self assert: (account transactions includes: deposit).
	self assert: (account transactions includes: withdraw).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:41:09'!
test01TransferenceHastheRightValue
	
	| aTransference someAccounts |
	
	someAccounts := self accountCollection.
	
	aTransference := Transference from: someAccounts first to: someAccounts last for: 50 * peso.
	
	self assert: aTransference value equals: 50 * peso.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:42:20'!
test02TransferenceTranfersMoneyFromAnAccountToAnother
		
	| someAccounts |
	
	someAccounts := self accountCollection.
	
	Transference from: someAccounts first to: someAccounts last for: 50 * peso.
	
	self assert: someAccounts first balance equals: 50 * peso.
	self assert: someAccounts last balance equals: 50 * peso.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:45:14'!
test03TransferenceCanOccurWhenSenderDoesNothaveEnoughMoney
	
	| someAccounts |
	
	someAccounts := self accountCollection.
	
	Transference from: someAccounts first to: someAccounts last for: 200 * peso.
	
	self assert: someAccounts first balance equals: -100 * peso.
	self assert: someAccounts last balance equals: 200 * peso.
	
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:45:55'!
test04TransferenceCannotHaveNegativeValue
	
	| someAccounts |
	
	someAccounts := self accountCollection.
	
	Transference from: someAccounts first to: someAccounts last for: -200 * peso.
	
	self assert: someAccounts first balance equals: 100 * peso.
	self assert: someAccounts last balance equals: 0 * peso.
	
	
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:47:11'!
test05TransferenceKnowsTheCounterpartOfTheSenderAccount
	
	| someAccounts aTransference |
	
	someAccounts := self accountCollection.
	
	aTransference := Transference from: someAccounts first to: someAccounts last for: 200 * peso.
	
	self assert: (aTransference accountCounterpart: someAccounts first) equals: someAccounts last.
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'jp 6/8/2022 13:49:02'!
test06TransferenceKnowsTheCounterpartOfTheSenderTransaction
	
	| aTransference someAccounts |
	
	someAccounts := self accountCollection.
	
	aTransference := Transference from: someAccounts first to: someAccounts last for: 200 * peso.
	
	self assert: (aTransference transactionCounterpart: someAccounts first transactions first) equals: someAccounts last transactions first.
	! !


!TransferenceTest methodsFor: 'aux' stamp: 'jp 6/8/2022 13:40:13'!
accountCollection

	| anAccount anotherAccount someAccounts |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount.
	
	someAccounts := OrderedCollection new.
	someAccounts add: anAccount.
	someAccounts add: anotherAccount.
	
	^ someAccounts .! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'jp 6/7/2022 17:35:05'!
balance
	^self transactions sum: [ :aTransaction | aTransaction effectOnBalance ] ifEmpty: [ 0 ]! !

!Account methodsFor: 'main protocol' stamp: 'jp 6/6/2022 21:38:24'!
hasRegistered: aTransaction
	^self transactions includes: aTransaction.! !

!Account methodsFor: 'main protocol' stamp: 'jp 6/6/2022 21:37:51'!
transactions
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'jp 6/6/2022 20:21:53'!
initializeWith: accountsOrOtherPortfolios
	accounts := accountsOrOtherPortfolios.
	! !


!Portfolio methodsFor: 'main protocol' stamp: 'jp 6/6/2022 20:34:28'!
add: anAccountOrAnotherPortfolio
	accounts add: anAccountOrAnotherPortfolio.! !

!Portfolio methodsFor: 'main protocol' stamp: 'jp 6/7/2022 17:34:20'!
transactions
	| allTransactions |
	allTransactions := OrderedCollection new.
	accounts do: [:anAccount | anAccount transactions do: [:aTransaction | allTransactions add: aTransaction ]].
	^allTransactions.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'initialization' stamp: 'jp 6/6/2022 20:22:15'!
with: accountsOrOtherPortfolios
	^self new initializeWith: accountsOrOtherPortfolios.
	! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'jp 6/7/2022 17:35:10'!
effectOnBalance
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'jp 6/7/2022 17:35:05'!
effectOnBalance
	^ self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'jp 6/8/2022 14:03:12'!
effectOnBalance
	^ self value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value record'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'main protocol' stamp: 'jp 6/7/2022 19:35:20'!
accountCounterpart: anAccount
	record keysDo: [:possibleCounterpart | possibleCounterpart = anAccount ifFalse: [ ^possibleCounterpart ]]! !

!Transference methodsFor: 'main protocol' stamp: 'jp 6/7/2022 19:35:20'!
transactionCounterpart: aTransaction
	record valuesDo: [:possibleCounterpart | possibleCounterpart = aTransaction ifFalse: [ ^possibleCounterpart ]]! !

!Transference methodsFor: 'main protocol' stamp: 'jp 6/7/2022 18:44:47'!
value
	^ value! !


!Transference methodsFor: 'initialization' stamp: 'jp 6/7/2022 19:35:20'!
intializeFrom: senderAccount to: recieverAccount for: anAmountOfMoney
	| depositTransaction withdrawTransaction |
	
	value := anAmountOfMoney.
	record := Dictionary new.
	
	withdrawTransaction := Withdraw register: anAmountOfMoney on: senderAccount.
	depositTransaction := Deposit register: anAmountOfMoney on: recieverAccount.
	
	record at: senderAccount put: withdrawTransaction.
	record at: recieverAccount put: depositTransaction.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'initialization' stamp: 'jp 6/7/2022 18:59:52'!
from: senderAccount to: recieverAccount for: anAmountOfMoney
	anAmountOfMoney >= 0 ifTrue: [^self new intializeFrom: senderAccount to: recieverAccount for: anAmountOfMoney].


	
! !
