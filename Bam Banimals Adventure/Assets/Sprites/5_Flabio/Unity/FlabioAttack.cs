using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FlabioAttack : MonoBehaviour
{
    public Animator anim;
    void Start() 
    {
        anim = GetComponent<Animator>();
    }
    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown("j"))
        {
            anim.Play("FlabioAttack");
        }

    }
}
