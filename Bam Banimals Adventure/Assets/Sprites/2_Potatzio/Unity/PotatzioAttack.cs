using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PotatzioAttack : MonoBehaviour
{
    public Animator anim;
    void Start() 
    {
        anim = GetComponent<Animator>();
    }
    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown("k"))
        {
            anim.Play("PotatzioAttack");
        }

    }
}
