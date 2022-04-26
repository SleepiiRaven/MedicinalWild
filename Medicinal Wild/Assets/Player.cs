//remember semicolons!!
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// go into box collider once sprite is done, and make the collision shape good
public class Player : MonoBehaviour {
    

    // these are also variables i think
    private BoxCollider2D boxCollider;

    // these are variables i think
    private Vector3 moveDelta;

    private SpriteRenderer spriteRenderer;

    private void Start() {

        boxCollider = GetComponent<BoxCollider2D>();
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    // don't use this a lot for keybinds
    private void FixedUpdate() {
        // make sure you have a vector that keeps track of the delta movement
        // Look for inputs
        float x = Input.GetAxisRaw("Horizontal");
        float y = Input.GetAxisRaw("Vertical");

        // Reset moveDelta
        moveDelta = new Vector3(x,y,0);

        // swap sprite direction, wether going right or left
        if (moveDelta.x > 0)
            spriteRenderer.flipX = false;
        else if (moveDelta.x < 0)
            spriteRenderer.flipX = true;

        // make it move
        // make speed equal
        
        transform.Translate(moveDelta * Time.deltaTime);
    }
}
