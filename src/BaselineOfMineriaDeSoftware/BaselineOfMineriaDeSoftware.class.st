Class {
	#name : #BaselineOfMineriaDeSoftware,
	#superclass : #BaselineOf,
	#category : #BaselineOfMineriaDeSoftware
}

{ #category : #loading }
BaselineOfMineriaDeSoftware class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'Mineria-de-Software' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfMineriaDeSoftware >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'MineriaDeSoftware'
		]
]
