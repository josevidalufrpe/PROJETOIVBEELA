import pyodbc

conn = pyodbc.connect('DRIVER={MySQL ODBC 5.1 Driver};SERVER=127.0.0.1;;DATABASE=dbbeela;UID=root;PWD=root')
print(conn.cursor().execute("SELECT @@TRANCOUNT").fetchall())


