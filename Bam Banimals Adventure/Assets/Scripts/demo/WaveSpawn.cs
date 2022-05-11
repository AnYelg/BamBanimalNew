using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[System.Serializable]

public class Wave
{
    public string waveName;
    public int numOfBubbles;
    public GameObject[] typeOfEnemies;
    public float spawnInterval;
}
public class WaveSpawn : MonoBehaviour
{
    //all the waves we ever gonna have
    public Wave[] waves;
    public Transform[] spawnPoints;
    public Transform endPoint;
    private Wave currentWave;
    // check in what wave are you current in
    private int currentWaveNumber;
    private float nextSpawnTime;

    private bool canSpawn = true;
    private void Update() 
    {
        currentWave = waves[currentWaveNumber];
        SpawnWave();
        GameObject[] totalBubbles = GameObject.FindGameObjectsWithTag("bubbles");
        if (totalBubbles.Length == 0 && !canSpawn && currentWaveNumber + 1 != waves.Length)
        {
            currentWaveNumber++;
            canSpawn = true;
        }
    }
    void SpawnWave()
    {
        if(canSpawn && nextSpawnTime < Time.time)
        {
            GameObject randomEnemy = currentWave.typeOfEnemies[Random.Range(0, currentWave.typeOfEnemies.Length)];
            Transform randomPoint = spawnPoints[Random.Range(0, spawnPoints.Length)];
            Instantiate(randomEnemy, randomPoint.position, Quaternion.identity);
            currentWave.numOfBubbles--;

            if (currentWave.numOfBubbles == 0)
            {
                canSpawn = false;
            }
        }
    }
}
