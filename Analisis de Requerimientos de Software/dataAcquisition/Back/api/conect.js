import mysql from 'mysql2'

const connection = mysql.createConnection(
    {
        host:'localhost', 
        user:'BBA', 
        password:'AndyAriYo14', 
        database: 'bam_banimals_adventure_db'
    })

connection.connect(error=>
    {
        if (error) console.log(error)
        console.log('Connected to mysql!')
    })

connection.query('select * from USER_SCORE', (error, rows, fields)=> 
{
    if(error) console.log(error)
    for (const r of rows)
    {
        console.log(Object.keys(r))
        console.log(Object.values(r))
    }
    console.log(rows)
    // console.log(fields)
})

    connection.end(error=>
    {
        if(error) console.log(error)
        console.log("Connection closed successfully!")
    })