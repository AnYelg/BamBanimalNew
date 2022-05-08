using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundEffects : MonoBehaviour
{
    public AudioSource[] soundFx;


    // Update is called once per frame
    void Update()
    {
        if (Input.GetButtonDown("K"))
        {
            soundFx[0].Play();
        }
        if (Input.GetButtonDown("O"))
        {
            soundFx[1].Play();
        }
        if (Input.GetButtonDown("E"))
        {
            soundFx[2].Play();
        }
        if (Input.GetButtonDown("F"))
        {
            soundFx[3].Play();
        }
        if (Input.GetButtonDown("R"))
        {
            soundFx[4].Play();
        }
        if (Input.GetButtonDown("I"))
        {
            soundFx[5].Play();
        }
    }
}
