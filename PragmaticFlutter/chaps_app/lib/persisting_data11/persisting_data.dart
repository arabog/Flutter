/*
Persisting Data:
In this chapter, you will learn to persist theme selection using two
approaches: Key/Value datastore (Shared preferences) and Local 
database. Shared preferences are the better choice when there’s a 
tiny amount of data that needs to be stored. Local database is a 
better choice for a huge dataset. In real-world applications, it 
makes sense to use the Shared preference approach to save theme 
selection. The difference between persisting data using Shared 
preferences plugin vs Local database is that Shared preferences 
plugin cannot guarantee persisting writes to disk after app 
restarts. However, saving data to a Local database is more 
reliable.





*/ 