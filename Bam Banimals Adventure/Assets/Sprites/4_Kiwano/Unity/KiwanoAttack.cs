using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KiwanoAttack : MonoBehaviour
{
    public Animator anim;
    // Start is called before the first frame update
    void Start()
    {
        anim = GetComponent<Animator>();
        // while (true)
        // {
        //     anim.SetInteger("AttackIndex", Random.Range(0,3));
        // }
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown("g"))
        {
            anim.SetInteger("AttackIndex", Random.Range(0,3));
            anim.SetTrigger("Attack");
        }
    }
}
