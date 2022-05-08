using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bolitasMover : MonoBehaviour
{
    //public GameObject bubble;
    //public Transform placeToSpawn;
    //public Transform placeOfEnd;

    public float rotationAmmount;
    Vector3 vec;
    Vector3 center;
    float radius;
    float angle;
    //public float speed;
    //float BPM;

    private void Start() 
    {
        center = transform.position;
        //vec = new Vector3(transform.position.x, transform.position.y);
        radius = 2;
        //BPM = BPM / 60;
        //speed = ((2 * (radius * Mathf.PI)* 1/2) / BPM) * 10;

    }
    private void Update() 
    {
        vec.x = radius*Mathf.Cos(angle);
        vec.y = radius *Mathf.Sin(angle);
        transform.position = center + vec;
        angle += rotationAmmount;
    }

    void OnDrawGizmosSelected()
    {
        if (true) {
            Gizmos.DrawWireSphere(transform.position, 0.909983f);
            Gizmos.DrawWireSphere(transform.position, 1.819966f);
            Gizmos.DrawWireSphere(transform.position, 2.729949f);

        }
    }
}
