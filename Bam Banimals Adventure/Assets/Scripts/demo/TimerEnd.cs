using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TimerEnd : MonoBehaviour
{
    public Text timerText;
    float minutes = 1;
    float seconds = 0;
    private float startTime;

    void Start()
    {
        startTime = Time.time;
    }

    void Update()
    {
        if (minutes > 0 && Mathf.Approximately(seconds, 0))
        {
            minutes--;
            seconds = 59;
            timerText.text = minutes.ToString() + ":" + seconds.ToString("f0");
            Debug.Log(minutes + " ." + seconds);
        }
        else if (seconds > 0)
        {
            seconds -= Time.deltaTime;
            timerText.text = minutes.ToString() + ":" + seconds.ToString("f0");
            Debug.Log(minutes + " ." + seconds);
        }
        else if (Mathf.Approximately(minutes, 0) && seconds <= 0)
        {
            timerText.text = "Game Over";
            Debug.Log("GO");
        }
        
    }
}
