as yet unclassified
handleRequest: request
  request uri path = #hello
    ifFalse: [ ^ ZnResponse notFound: request uri ].
  ^ ZnResponse ok: (ZnEntity text: 'Hello World!')