/*
    Move the player object horizontally using the keyboard

    Joaquin Badillo
*/


using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HorizontalMovement : MonoBehaviour {
    [SerializeField] float speed;
    [SerializeField] float limit;
    Vector3 move;

    void Start() {
        
    }

    // Update is called once per frame
    void Update() {
        move.x = Input.GetAxis("Horizontal");

        if (transform.position.x < -limit && move.x < 0) {
            move.x = 0;
        }
        else if (transform.position.x > limit && move.x > 0) {
            move.x = 0;
        }

        transform.Translate(move * speed * Time.deltaTime);
           
    }
}
