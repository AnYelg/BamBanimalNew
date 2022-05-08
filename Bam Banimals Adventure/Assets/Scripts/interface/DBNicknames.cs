using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DBNicknames : MonoBehaviour
{
    public GameObject ButtonPrefab;
    public List <string> names;
    public GameObject content;
    public GameObject activate;
    public float THICCCC;
    public string playerName;
    // Start is called before the first frame update
    void Awake()
    {
        content.GetComponent <RectTransform>().sizeDelta = new Vector2 (THICCCC +100, names.Count * 200);
        for (int i = 0; i < names.Count; i++)
        {
            GameObject button = Instantiate(ButtonPrefab);
            button.GetComponent<RectTransform>().SetParent(content.GetComponent <RectTransform>());
            button.GetComponent<RectTransform>().anchoredPosition = new Vector2 (0,-100*i);
            button.GetComponent<RectTransform>().sizeDelta = new Vector2 (THICCCC,100);
            button.GetComponentInChildren<Text>().text = names[i];
            //Text texto = button.transform.GetChild(0).GetComponent<Text>();
            //texto.text = names[i];
            //char[] name = names[i].ToCharArray();
            string name = names[i];
            button.GetComponent<Button>().onClick.AddListener(delegate{chooseNameWhenClicked(name);});
        }
    }

    public void chooseNameWhenClicked(string name){
        playerName = name;
        GlobalVariables.PlayerName = name;

        transform.parent.gameObject.SetActive(false);

        activate.SetActive(true);
    }
}

