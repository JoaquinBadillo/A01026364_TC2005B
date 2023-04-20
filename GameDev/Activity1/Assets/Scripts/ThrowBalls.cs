/*
    Creates copies of a ball object to fall on the game scene

    Joaquín Badillo

*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThrowBalls : MonoBehaviour {
    [SerializeField] GameObject ball;
    [SerializeField] float delay;
    [SerializeField] float limit;

    // Start is called before the first frame update
    void Start() {
        InvokeRepeating("CreateBall", delay, delay);
    }

    // Update is called once per frame

    void CreateBall() {
        Vector3 newPos = new Vector3(Random.Range(-limit, limit), 1.8f, 0);
        Instantiate(ball, newPos, Quaternion.identity);
    }
}
