// Using the module 'node-fetch' to get the functionality of the fetch api: https://github.com/node-fetch/node-fetch
// npm install node-fetch

import fetch from 'node-fetch'


async function fetchData(url)
{
    try
    {
        const response = await fetch(url)
    
        if(response.ok)
            return response.json()
        else
            console.log(`HTTP Error: ${response.status}`)
    }
    catch(error)
    {
        console.log(error)
    }
}

function pickRandomElement(list) 
{
    return list[Math.floor(Math.random() * list.length)];
}

async function getRandomNickname(amount=1)
{
    if(amount<=0) amount = 1
    
    const base_url = 'https://www.randomlists.com/data/names-'
    
    const male_names = await fetchData(base_url + 'male.json')
    const female_names = await fetchData(base_url + 'female.json')

    // Alternative for calling multiple promises:
    // const response = await Promise.all([
    //     fetchData(base_url + 'male.json'),
    //     fetchData(base_url + 'female.json'),
    //     fetchData(base_url + 'surnames.json')
    // ])

    // const [male_names, female_names, surnames] = response;

    const names = male_names.data.concat(female_names.data)

    let nickname_list = []

    for(let i =0; i< amount; i++)
    {
        let nickname = pickRandomElement(names)


        nickname_list.push(`${nickname}`)
    }

    return nickname_list
}

async function getRandomScore(amount=1)
{    
    if(amount<=0) amount = 1

    let score_list = []

    for(let i =0; i< amount; i++)
    {
        let Bambastic = Math.floor(Math.random() * 50)
        let Noice = Math.floor(Math.random() * 50)
        let Keep_trying = Math.floor(Math.random() * 50)
        let Oops = Math.floor(Math.random() * 50)

        score_list.push(`${Bambastic} ${Noice} ${Keep_trying} ${Oops}`)
    }

    return score_list
}

export {getRandomNickname, getRandomScore}