async function setupChar()
{
    let response = await fetch('http://localhost:5500/api/max_high_score',{
        method: 'GET'
    })

    if(response.ok)
    {
        let results = await response.json()
    console.log(results ["Bambastic"])

    const values = Object.values(results)
    console.log(values [0] ["Nickname"])

    const data = {
        labels: [
          'Bambastic',
          'Noice',
          'Keep_trying',
          'Oops'
        ],
        datasets: [{
          label: 'Final Score',
          data: [values [0] ["Bambastic"], values [0] ["Noice"], values [0] ["Keep_trying"], values [0] ["Oops"]],
          backgroundColor: [
            'rgb(127,115,227)',
            'rgb(255,172,236)',
            'rgb(255,165,0)',
            'rgb(86,174,255)'
          ],
          hoverOffset: 4
        }]
      }
    
    const ctx = document.getElementById('pieChart').getContext('2d')  
    
    const myChart =
          new Chart(ctx, {
        type: "pie",
        data: data,
        options: {}
      });
}
};

setupChar()