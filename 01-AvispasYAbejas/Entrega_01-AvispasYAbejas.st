!classDefinition: #Avispa category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Avispa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AvispasYAbejasParte2'!
Avispa class
	instanceVariableNames: ''!

!Avispa class methodsFor: 'mensajesBasicos' stamp: 'jp 4/23/2022 17:28:21'!
habitat
	^HabitatDeAvispas.! !

!Avispa class methodsFor: 'mensajesBasicos' stamp: 'jp 4/23/2022 17:29:23'!
intentarReproducirse
	self habitat cantidadDeOrugas > 0 ifTrue: [
	self habitat agregarUnHuevoDeAvispa: self.
	self habitat eliminarOruga.
	]! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
Avispa subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
Avispa subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
Avispa subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOrnella class' category: 'AvispasYAbejasParte2'!
LaAvispaOrnella class
	instanceVariableNames: ''!

!LaAvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'jp 4/23/2022 16:35:33'!
intentarReproducirse
	HabitatDeAvispas cantidadDeOrugas > 0 ifTrue: [
	HabitatDeAvispas agregarUnHuevoDeAvispa: LaAvispaOriana.
	HabitatDeAvispas eliminarOruga.
	]
! !


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
Avispa subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: ''!

!LaAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'jp 4/23/2022 17:38:38'!
intentarReproducirse
	self habitat cantidadDePolillas > 0 ifTrue: [
	self habitat agregarUnHuevoDeAvispa: self.
	self habitat eliminarPolilla.
	]! !


!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejasParte2'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosDeAvispas cantidadDeOrugas cantidadDePolillas cantidadDeHuevosConFirmaGeneticaDeOriana cantidadDeHuevosConFirmaGeneticaDePolly cantidadDeHuevosConFirmaGeneticaDeLara'!

!HabitatDeAvispas class methodsFor: 'mensajesHuevos' stamp: 'jp 4/23/2022 17:41:19'!
agregarUnHuevoConLaFirmaGeneticaDe: unaAvispa
	(unaAvispa isEqualTo: self laAvispaLara ) ifTrue: [
		cantidadDeHuevosConFirmaGeneticaDeLara  := cantidadDeHuevosConFirmaGeneticaDeLara + 1.
	].
	(unaAvispa isEqualTo: self laAvispaOrnella ) ifTrue: [
		cantidadDeHuevosConFirmaGeneticaDeOriana  := cantidadDeHuevosConFirmaGeneticaDeOriana + 1.
	].
	(unaAvispa isEqualTo: self laAvispaOriana ) ifTrue: [
		cantidadDeHuevosConFirmaGeneticaDeOriana  := cantidadDeHuevosConFirmaGeneticaDeOriana + 1.
	].
	(unaAvispa isEqualTo: self laAvispaPolly ) ifTrue: [
		cantidadDeHuevosConFirmaGeneticaDePolly  := cantidadDeHuevosConFirmaGeneticaDePolly + 1.
	].
	! !

!HabitatDeAvispas class methodsFor: 'mensajesHuevos' stamp: 'jp 4/23/2022 17:46:22'!
agregarUnHuevoDeAvispa: unaAvispa
	
	((unaAvispa isEqualTo: self laAvispaLara) and: self hayHuevosParaRobar) ifTrue: [
		self robarHuevo.
		self agregarUnHuevoConLaFirmaGeneticaDe: unaAvispa.
	] ifFalse: [
		self agregarUnHuevoConLaFirmaGeneticaDe: unaAvispa.
		cantidadDeHuevosDeAvispa := cantidadDeHuevosDeAvispa + 1.
	].! !

!HabitatDeAvispas class methodsFor: 'mensajesHuevos' stamp: 'jp 4/23/2022 17:42:25'!
cantidadDeHuevosConLaFirmaGeneticaDe: unaAvispa
	(unaAvispa isEqualTo: self laAvispaLara) ifTrue: [^cantidadDeHuevosConFirmaGeneticaDeLara.].
	(unaAvispa isEqualTo: self laAvispaOrnella) ifTrue: [^cantidadDeHuevosConFirmaGeneticaDeOriana.].
	(unaAvispa isEqualTo: self laAvispaOriana) ifTrue: [^cantidadDeHuevosConFirmaGeneticaDeOriana.].
	(unaAvispa isEqualTo: self laAvispaPolly) ifTrue: [^cantidadDeHuevosConFirmaGeneticaDePolly.].! !

!HabitatDeAvispas class methodsFor: 'mensajesHuevos' stamp: 'jp 4/21/2022 19:59:16'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispa.! !

!HabitatDeAvispas class methodsFor: 'mensajesHuevos' stamp: 'jp 4/23/2022 17:21:06'!
hayHuevosParaRobar
	^(cantidadDeHuevosConFirmaGeneticaDeOriana > 0 or: cantidadDeHuevosConFirmaGeneticaDePolly > 0).! !

!HabitatDeAvispas class methodsFor: 'mensajesHuevos' stamp: 'jp 4/23/2022 17:09:20'!
robarHuevo
	cantidadDeHuevosConFirmaGeneticaDeOriana > 0 ifTrue: [
		cantidadDeHuevosConFirmaGeneticaDeOriana := cantidadDeHuevosConFirmaGeneticaDeOriana - 1.
	].
	cantidadDeHuevosConFirmaGeneticaDePolly > 0 ifTrue: [
		cantidadDeHuevosConFirmaGeneticaDePolly := cantidadDeHuevosConFirmaGeneticaDePolly - 1.
	]
	! !


!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/21/2022 20:15:18'!
agregarOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.! !

!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/21/2022 20:33:04'!
agregarPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !

!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/21/2022 20:46:24'!
agregarRecursosSuficientes
	cantidadDeOrugas := 2.
	cantidadDePolillas := 2.! !

!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/21/2022 20:18:11'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/21/2022 20:44:58'!
cantidadDePolillas
	^cantidadDePolillas.! !

!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/21/2022 20:16:58'!
eliminarOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/21/2022 20:33:29'!
eliminarPolilla
	cantidadDePolillas := cantidadDePolillas - 1! !

!HabitatDeAvispas class methodsFor: 'mensajesBasicos' stamp: 'jp 4/23/2022 16:40:21'!
volverAlInicioDeLosTiempos
	cantidadDeHuevosDeAvispa := 0.
	cantidadDeHuevosConFirmaGeneticaDeOriana := 0.
	cantidadDeHuevosConFirmaGeneticaDePolly := 0.
	cantidadDeHuevosConFirmaGeneticaDeLara := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.! !


!HabitatDeAvispas class methodsFor: 'avispas' stamp: 'jp 4/23/2022 17:40:04'!
laAvispaLara
	^LaAvispaLara.! !

!HabitatDeAvispas class methodsFor: 'avispas' stamp: 'jp 4/23/2022 17:40:26'!
laAvispaOriana
	^LaAvispaOriana .! !

!HabitatDeAvispas class methodsFor: 'avispas' stamp: 'jp 4/23/2022 17:40:16'!
laAvispaOrnella
	^LaAvispaOrnella .! !

!HabitatDeAvispas class methodsFor: 'avispas' stamp: 'jp 4/23/2022 17:39:48'!
laAvispaPolly
	^LaAvispaPolly.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'jp 4/23/2022 22:10:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeAvispas := nil.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	cantidadDeHuevosConFirmaGeneticaDeOriana := 0.
	cantidadDeHuevosConFirmaGeneticaDePolly := 1.
	cantidadDeHuevosConFirmaGeneticaDeLara := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'jp 4/21/2022 19:51:54'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'jp 4/21/2022 20:43:12'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'jp 4/21/2022 20:43:12'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'jp 4/21/2022 20:43:12'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'jp 4/21/2022 20:43:12'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'jp 4/21/2022 20:43:12'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'jp 4/21/2022 20:43:23'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'jp 4/21/2022 20:43:23'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'jp 4/21/2022 20:43:23'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'jp 4/21/2022 20:43:42'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'jp 4/21/2022 20:43:42'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'jp 4/21/2022 20:43:42'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'jp 4/21/2022 20:43:42'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'jp 4/21/2022 20:43:12'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'jp 4/21/2022 20:43:12'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'jp 4/21/2022 20:43:42'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'jp 4/21/2022 20:43:23'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'jp 4/21/2022 20:43:23'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'jp 4/21/2022 20:43:12'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'jp 4/21/2022 20:43:42'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:23:23'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDe: self laAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:23:18'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ self habitat cantidadDeHuevosConLaFirmaGeneticaDe: self laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:23:14'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDe: self laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:23:10'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ self habitat cantidadDeHuevosConLaFirmaGeneticaDe: self laAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/21/2022 19:55:05'!
habitat
	^HabitatDeAvispas ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:22:16'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat agregarRecursosSuficientes.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 16:41:31'!
laAvispaLara
	^LaAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/21/2022 20:43:12'!
laAvispaOriana
	^LaAvispaOriana ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/21/2022 20:43:23'!
laAvispaOrnella
	^LaAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/21/2022 20:43:42'!
laAvispaPolly
	^LaAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:22:33'!
queElHabitatTengaDosOrugasMas
	self habitat agregarOruga.
	self habitat agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:22:44'!
queElHabitatTengaDosPolillasMas
	self habitat agregarPolilla.
	self habitat agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:22:49'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:22:54'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jp 4/23/2022 17:23:01'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat volverAlInicioDeLosTiempos.! !

HabitatDeAvispas initializeAfterFileIn!