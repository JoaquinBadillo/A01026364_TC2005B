/*
    Keep track of player's score
*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Score : MonoBehaviour {
    [SerializeField] TMP_Text scoreUI;
    [SerializeField] ParticleSystem scoreAnim;
    int points;
    // Start is called before the first frame update
    void Start() {
        points = 0;
    }

    // Update is called once per frame
    void Update() {
        
    }

    void OnTriggerEnter2D(Collider2D col) {
        points += 1;
        Destroy(col.gameObject);
        scoreAnim.Emit(5);
        scoreUI.text = " Score: " + points;
    }
    
}
