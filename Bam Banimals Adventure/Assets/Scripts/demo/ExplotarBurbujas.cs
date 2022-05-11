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
    public ScoreScript ScoreScript;
    public GameOverScene GameOverScene;
    //tags for types of scores
    public GameObject BamBastic;
    public GameObject Noice;
    public GameObject KeepUp;
    public GameObject Oops;
    Transform spawnPop;
    public int maxPoints = 5;
    void Start() 
    {
        CirculoRosa = GameObject.FindGameObjectWithTag("ButtonPink");
        //BamBastic = GameObject.FindGameObjectWithTag("perfect");
        //Noice = GameObject.FindGameObjectWithTag("good");
        //KeepUp = GameObject.FindGameObjectWithTag("bad");
        //Oops = GameObject.FindGameObjectWithTag("miss");
        
    }
    

    void Update() 
    {

        if (Input.GetKeyDown(KeyCode.K) && pressKey)
        {
            float dist = Vector3.Distance(CirculoRosa.transform.position, transform.position);
            //print(dist);
            if (dist <= 0.909983)
            {
                ScoreScript.scoreValue += 3;
                Debug.Log("perfect");
                bum();
                //Instantiate(BamBastic, spawnPop.position, Quaternion.identity);

                
            }
            else if(dist <= 1.819966)
            {
                ScoreScript.scoreValue += 2;
                Debug.Log("good");
                bum();
                //Instantiate(Noice, spawnPop.position, Quaternion.identity);
            }
            else if(dist <= 2.729949)
            {
                ScoreScript.scoreValue += 1;
                Debug.Log("bad");
                bum();
                //Instantiate(KeepUp, spawnPop.position, Quaternion.identity);
            }
            else if(dist > 2.8)
            {
                Debug.Log("miss");
               // Instantiate(Oops, spawnPop.position, Quaternion.identity);
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

    public void GameOver()
    {
        GameOverScene.SetUp(maxPoints);
    }
}
