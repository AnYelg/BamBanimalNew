async function setupChar()
{
    let response = await fetch('http://localhost:5500/api/max_high_score',{
        method: 'GET'
    })

    if(response.ok)
    {
        let results = await response.json()

    const values = Object.values(results)

    const data = {
        labels: [[values [0] ["Nickname"]],
                [values [1] ["Nickname"]],
                [values [2] ["Nickname"]],
                [values [3] ["Nickname"]],
                [values [4] ["Nickname"]],
                [values [5] ["Nickname"]],
                [values [6] ["Nickname"]],
                [values [7] ["Nickname"]],
                [values [8] ["Nickname"]],
                [values [9] ["Nickname"]],],
        datasets: [{
          label: 'Best Score',
          data: [values [0] ["Final_Score"], 
                values [1] ["Final_Score"], 
                values [2] ["Final_Score"], 
                values [3] ["Final_Score"],
                values [4] ["Final_Score"],
                values [5] ["Final_Score"],
                values [6] ["Final_Score"],
                values [7] ["Final_Score"],
                values [8] ["Final_Score"],
                values [9] ["Final_Score"]],
          backgroundColor: [
            'rgb(127,115,227)',
            'rgb(255,172,236)',
            'rgb(255,165,0)',
            'rgb(86,174,255)',
            'rgb(127,115,227)',
            'rgb(255,172,236)',
            'rgb(255,165,0)',
            'rgb(86,174,255)',
            'rgb(127,115,227)',
            'rgb(255,172,236)'
          ],
          hoverOffset: 4
        }]
      }
    
    const ctx = document.getElementById('barChart').getContext('2d')  
    
    const myChart =
          new Chart(ctx, {
        type: "bar",
        data: data,
        options: {}
      });
}
};

setupChar()