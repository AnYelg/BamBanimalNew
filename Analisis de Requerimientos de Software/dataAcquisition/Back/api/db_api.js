"use strict"

import express from 'express'
import mysql from 'mysql'
import fs from 'fs'

const app = express();
const port = 5500;

app.use(express.json());

app.use('/js', express.static('./js'))
app.use('/css', express.static('./css'))


app.use('/html', express.static('./html'))

function connectToDB()
{
    try{
        return mysql.createConnection({host:'localhost', user:'BBA', password:'AndyAriYo14', database:'bam_banimals_adventure_db'});
    }
    catch(error)
    {
        console.log(error);
    }   
}

app.get('/', (request,response)=>{
    fs.readFile('./html/stad.html', 'utf8', (err, html)=>{
        if(err) response.status(500).send('There was an error: ' + err);
        console.log('Loading page...');
        response.send(html);
    })
});


app.get('/api/max_high_score', (request, response)=>{
    let connection = connectToDB();

    try{

        connection.connect();

        connection.query('select * from max_high_score', (error, results, fields)=>{
            if(error) console.log(error);
            console.log(JSON.stringify(results));
            response.json(results);
        });

        connection.end();
    }
    catch(error)
    {
        response.json(error);
        console.log(error);
    }
});






app.listen(port, ()=>
{
    console.log(`App listening at http://localhost:${port}`);
});








// app.post('/api/top_high_scores', (request, response)=>{

//     try{
//         console.log(request.headers);

//         let connection = connectToDB();
//         connection.connect();
//         console.log(request.body);
//         const query = connection.query('insert into top_high_scores set ?', request.body ,(error, results, fields)=>{
//             if(error) 
//                 console.log(error);
//             else
//                 response.json({'message': "Data inserted correctly."})
//         });

//         connection.end();
//     }
//     catch(error)
//     {
//         response.json(error);
//         console.log(error);
//     }
// });

// app.post('/api/user_info', (request, response)=>{

//     try{
//         console.log(request.headers);

//         let connection = connectToDB();
//         connection.connect();
//         console.log(request.body);
//         const query = connection.query('insert into user_info set ?', request.body ,(error, results, fields)=>{
//             if(error) 
//                 console.log(error);
//             else
//                 response.json({'message': "Data inserted correctly."})
//         });

//         connection.end();
//     }
//     catch(error)
//     {
//         response.json(error);
//         console.log(error);
//     }
// });

// app.put('/api/user_info', (request, response)=>{
//     try{
//         let connection = connectToDB();
//         connection.connect();

//         const query = connection.query('update user_info set name = ?, mail = ?, age = ?, country = ? where id_user_info= ?', [request.body['name'], request.body['mail'], request.body['age'], request.body['country'], request.body['userID']] ,(error, results, fields)=>{
//             if(error) 
//                 console.log(error);
//             else
//                 response.json({'message': "Data updated correctly."})
//         });

//         connection.end();
//     }
//     catch(error)
//     {
//         response.json(error);
//         console.log(error);
//     }
// });

// app.delete('/api/user_info', (request, response)=>{
//     try
//     {
//         let connection = connectToDB();
//         connection.connect();

//         const query = connection.query('delete from user_info where id_user_info= ?', [request.body['userID']] ,(error, results, fields)=>{
//             if(error) 
//                 console.log(error);
//             else
//                 response.json({'message': "Data deleted correctly."})
//         });

//         connection.end();
//     }
//     catch(error)
//     {
//         response.json(error);
//         console.log(error);
//     }
// })
