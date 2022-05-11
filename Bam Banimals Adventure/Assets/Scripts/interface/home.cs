using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class home : MonoBehaviour
{
    public GameObject nicknameR;
    public GameObject continueGO;
    public GameObject settingsGO;
    public GameObject creditsGO;

    public void goToStart(){
        nicknameR.SetActive(true);
        gameObject.SetActive(false);
    }

    public void goToContinue(){
        continueGO.SetActive(true);
        gameObject.SetActive(false);
    }

    public void goToSettings(){
        settingsGO.SetActive(true);
        gameObject.SetActive(false);
    }

    public void goToCredits(){
        creditsGO.SetActive(true);
        gameObject.SetActive(false);
    }
}
