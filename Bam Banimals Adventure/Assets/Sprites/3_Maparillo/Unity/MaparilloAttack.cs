using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaparilloAttack : MonoBehaviour
{
    public Animator anim;
    void Start() 
    {
        anim = GetComponent<Animator>();
    }
    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown("w"))
        {
            anim.Play("MaparilloAttack");
        }

    }
}
