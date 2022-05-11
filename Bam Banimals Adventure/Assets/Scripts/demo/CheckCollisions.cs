using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckCollisions : MonoBehaviour
{
    private enum checkCollisions {miss, bad, good, perfect}

    private checkCollisions currentColli = 0;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter2D(Collider2D other) 
    {
        currentColli++;
        Debug.Log(currentColli);
    }

    void OnTriggerExit2D(Collider2D other) 
    {
        currentColli--;
        Debug.Log(currentColli);
        
    }
}
