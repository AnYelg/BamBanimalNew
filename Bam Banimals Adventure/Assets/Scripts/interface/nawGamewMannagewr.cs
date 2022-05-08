using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class nawGamewMannagewr : MonoBehaviour
{
    public TMP_InputField texto;
    public GameObject mapObject;

    public void chooseName(){
        GlobalVariables.PlayerName = texto.text;
        mapObject.SetActive(true);
        gameObject.SetActive(false);
    }
}
