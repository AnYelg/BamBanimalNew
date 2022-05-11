using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class loadLvl : MonoBehaviour
{
    public void loadScene(int scene){
        SceneManager.LoadScene(scene);
    }
}
