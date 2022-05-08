using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
//using UnityEngine.Events;


public class ExplotarBurbujas : MonoBehaviour
{
    // hacer un loop del movimiento de la burbuja principal

    bool pressKey = false;

    public GameObject CirculoRosa;

    void Start() 
    {
        CirculoRosa = GameObject.FindGameObjectWithTag("ButtonPink");
        
    }
    

    void Update() 
    {

        if (Input.GetKeyDown(KeyCode.K) && pressKey)
        {
            float dist = Vector3.Distance(CirculoRosa.transform.position, transform.position);
            print(dist);
            if (dist <= 0.909983)
            {
                KeepScore.Score += 3;
                Debug.Log("perfect");
                bum();
                
            }
            else if(dist <= 1.819966)
            {
                KeepScore.Score += 2;
                Debug.Log("good");
                bum();
            }
            else if(dist <= 2.729949)
            {
                KeepScore.Score += 1;
                Debug.Log("bad");
                bum();
            }
            else if(dist > 2.8)
            {
                Debug.Log("miss");
            }
        }
        
    }
    void bum()
    {
        Destroy(gameObject);

    }

    void OnTriggerEnter2D(Collider2D other) 
    {
        if (other.gameObject.tag == "ButtonPink")
        {
            pressKey = true;
        }
        
    }

    void OnTriggerExit2D(Collider2D other) 
    {
        if (other.gameObject.tag == "ButtonPink")
        {
            pressKey = false;
        }
    }

}
