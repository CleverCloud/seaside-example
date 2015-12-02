Gofer it
url: 'filetree:///home/deploy';
package: 'WebCounter';
package: 'HelloWorldApp';
load.
FileStream stdout << 'WebCounter installed'; lf.
ZnZincServerAdaptor startOn: 8080.
WAAdmin register: WebCounter asApplicationAt: 'webcounter'.

