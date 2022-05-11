import mysql from 'mysql2'
import { getRandomNickname, getRandomScore } from './fetch_random.js'

function randomString(length) 
{
    let result = ''
    let characters= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    let charactersLength = characters.length;

    for (let i = 0; i < length; i++ ) 
      result += characters.charAt(Math.floor(Math.random() * charactersLength))
   
   return result
}

const names = await getRandomNickname(20)
const scores = await getRandomScore(20)

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

for(const n of names)
{
    let [nickname] = n.split(" ")
    const USER = { nickname: nickname}

    connection.query('insert into USER set ?', USER, (error, rows, fields)=> 
    {
        if(error) console.log(error)
        console.log(`Added ${nickname} successfully!`)
    })
}



for(const sc of scores)
{
    let [Bambastic, Noice, Keep_trying, Oops] = sc.split(" ")
    const USER_SCORE = {Bambastic: Bambastic, Noice: Noice, Keep_trying: Keep_trying, Oops: Oops}

    connection.query('insert into USER_SCORE set ?', USER_SCORE, (error, rows, fields)=> 
    {
        if(error) console.log(error)
        console.log(`Added ${Bambastic} ${Noice} ${Keep_trying} ${Oops} successfully!`)
    })
}


connection.end(error=>
    {
        if(error) console.log(error)
        console.log("Connection closed successfully!")
    })