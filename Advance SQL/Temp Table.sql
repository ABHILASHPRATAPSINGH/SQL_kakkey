

/*What is temporary table?
temporary table is much similiar to permanent table, permanent table are in database that you are specify and still be there until you 
explicitly delete that table, whereas temporary table is created in tempdb database and it automatically deleted , when they no long in use.

Types of temporary table:-
	Local temporary table
	Global temporary table

Local temporary table:-
	it is created by single #symbol
	it is avaible only that connection from where it is created, it is not used in other connection
	if the connection is closed then automatically local temp table will deleted, or you can also explicitly deleted by droping statement
	the name of local temporary table contains many underscore___ and end with some random number which is created by system.
	it is possible that diffrent connection have same local temporary table name, but internally system will specify the some no. at the end of the table


Global temporary table:-
	it is created by double ##symbol.
	it is available globally for all connection.
	it will not automaticlly delete until the last will closed.
	the name of global temporary table is same as you provided at time of creation


