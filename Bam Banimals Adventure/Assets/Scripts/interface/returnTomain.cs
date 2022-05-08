using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class returnTomain : MonoBehaviour
{
    public GameObject toReturn;

    public void doReturn(){
        toReturn.SetActive(true);
        gameObject.SetActive(false);
    }
}
