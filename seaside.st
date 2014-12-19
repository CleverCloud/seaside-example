(MCFileTreeRepository new directory: '/home/deploy' asFileReference) packageDescriptionsFromReadableFileNames  do:
  [:name || version |
  version := (MCFileTreeRepository new directory: '/home/deploy' asFileReference) versionFromFileNamed: name first, '.package'.
  [version load ]
        on: MCMergeOrLoadWarning
        do: [ :ex | [ ex load  ] on: MCNoChangesException do: [] ] ].

FileStream stdout nextPutAll: 'WebCounter installed'; lf.

ZnZincServerAdaptor startOn: 8080.
WAAdmin register: WebCounter asApplicationAt: 'webcounter'.
