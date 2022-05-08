function main()
{

    formSelect_score.onsubmit = async (e) =>{
        e.preventDefault()

        let response = await fetch('http://localhost:5500/api/max_high_score',{
            method: 'GET'
        })
        
        if(response.ok)
        {
            let results = await response.json()
        
            const headers = Object.keys(results[0])
            const values = Object.values(results)

            let table = document.createElement("table")

            let tr = table.insertRow(-1)                  

            for(const header of headers)
            {
                let th = document.createElement("th")     
                th.innerHTML = header
                tr.appendChild(th)
            }

            for(const row of values)
            {
                let tr = table.insertRow(-1)

                for(const key of Object.keys(row))
                {
                    let tabCell = tr.insertCell(-1)
                    tabCell.innerHTML = row[key]
                }
            }

            const container = document.getElementById('getResults_score')
            container.innerHTML = ''
            container.appendChild(table)
        }
        else{
            getResults.innerHTML = response.status
        }
    }
    
    

    // formInsert_user.onsubmit = async(e)=>
    // {
    //     e.preventDefault()

    //     const data = new FormData(formInsert_user)
    //     const dataObj = Object.fromEntries(data.entries())
    //     console.log(dataObj)

    //     let response = await fetch('http://localhost:5000/api/user_info',{
    //         method: 'POST',
    //         headers: {'Content-Type': 'application/json'},
    //         body: JSON.stringify(dataObj)
    //     })
        
    //     if(response.ok)
    //     {
    //         let results = await response.json()
        
    //         console.log(results)
    //         postResults.innerHTML = results.message
    //     }
    //     else{
    //         postResults.innerHTML = response.status
    //     }
    // }

    // formUpdate_user.onsubmit = async(e)=>
    // {
    //     e.preventDefault()

    //     const data = new FormData(formUpdate_user)
    //     const dataObj = Object.fromEntries(data.entries())

    //     let response = await fetch('http://localhost:5000/api/user_info',{
    //         method: 'PUT',
    //         headers: {'Content-Type': 'application/json'},
    //         body: JSON.stringify(dataObj)
    //     })
        
    //     if(response.ok)
    //     {
    //         let results = await response.json()
        
    //         console.log(results)
    //         putResults.innerHTML = results.message
    //     }
    //     else{
    //         putResults.innerHTML = response.status
    //     }
    // }

    // formDelete_user.onsubmit = async(e)=>
    // {
    //     e.preventDefault()

    //     const data = new FormData(formDelete_user)
    //     const dataObj = Object.fromEntries(data.entries())

    //     let response = await fetch('http://localhost:5000/api/user_info',{
    //         method: 'DELETE',
    //         headers: {'Content-Type': 'application/json'},
    //         body: JSON.stringify(dataObj)
    //     })
        
    //     if(response.ok)
    //     {
    //         let results = await response.json()
        
    //         console.log(results)
    //         deleteResults.innerHTML = results.message
    //     }
    //     else{
    //         deleteResults.innerHTML = response.status
    //     }
    // }
}

main()