using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnBubble : MonoBehaviour
{
    public GameObject Bubble;
    public float delay;
    public Transform origin;

    int countBubble;
    public int maxBubbles;
    // Start is called before the first frame update
    void Start()
    {
        InvokeRepeating("CreateBubble", delay, delay);
    }

    // Update is called once per frame
    void CreateBubble()
    {

        Instantiate(Bubble, origin.position, Quaternion.identity);
        countBubble++;
        if (countBubble == maxBubbles)
        {
            CancelInvoke();
        }   
    }
}
