(MCFileTreeRepository new directory: '/home/deploy' asFileReference) packageDescriptionsFromReadableFileNames  do:
  [:name || version |
  version := (MCFileTreeRepository new directory: '/home/deploy' asFileReference) versionFromFileNamed: name first, '.package'.
  [version load ]
        on: MCMergeOrLoadWarning
        do: [ :ex | [ ex load  ] on: MCNoChangesException do: [] ] ].

FileStream stdout nextPutAll: 'HelloWorldApp installed'; lf.

ZnServer startDefaultOn: 8080.
ZnServer default delegate map: #hello to: HelloWorld new.
