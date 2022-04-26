//remember semicolons!!
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// go into box collider once sprite is done, and make the collision shape good
public class Player : MonoBehaviour {
    

    // these are variables i think
    private BoxCollider2D boxCollider;
    private Rigidbody2D rig;

    // set up vector for the movement
    private Vector3 moveDelta;

    private SpriteRenderer spriteRenderer;
     
    [SerializeField] private float maxSpeed = 10; // max speed the character can reach
    private float speed = 0; // the current speed

    [SerializeField] private float acceleration = 1; // how fast the character reaches  max speed

    private bool isMoving = false;

    private void Start() {

        boxCollider = GetComponent<BoxCollider2D>();
        spriteRenderer = GetComponent<SpriteRenderer>();
        rig = GetComponent<Rigidbody2D>();

        // starts running the UpdateSpeed coroutine
        StartCoroutine(UpdateSpeed());
    }


    // don't use this a lot for keybinds
    private void Update() {
        // make sure you have a vector that keeps track of the delta movement
        // Look for inputs
        float x = Input.GetAxisRaw("Horizontal");
        float y = Input.GetAxisRaw("Vertical");

        //flips the character to the direction they're moving
        if (x > 0)
            spriteRenderer.flipX = false;
        else if (x < 0)
            spriteRenderer.flipX = true;

        if (x != 0 || y != 0) // if character's moving
        {
            moveDelta = new Vector3(x, y);
            isMoving = true;
        }
        else // if character's not moving
        {
            isMoving = false;
        }

    }

    private void FixedUpdate()
    {   
 
        // moving the character using physics, so it can properly collide with objects
        rig.MovePosition(Vector2.MoveTowards(transform.position, transform.position + moveDelta*10, speed * Time.fixedDeltaTime));
        //                                    current position       target position                        speed
    }


    private IEnumerator UpdateSpeed()
    {
        while(true) // infinite loop
        {   
            // each frame it checks wheter the character's moving or not, and 
            // accelerates or slows down accordingly

            if(isMoving)
            {
                //speed needs to increase towards max speed

                if (speed < maxSpeed)
                    speed += acceleration * Time.deltaTime;

                else if (speed > maxSpeed)
                    speed = maxSpeed;
            }
            if(!isMoving)
            {
                //speed needs to decrease towards 0

                if (speed > 0)
                    speed -= acceleration * Time.deltaTime;

                else if (speed < 0)
                    speed = 0;
            }

            yield return new WaitForEndOfFrame(); // waits for end of frame to continue, like the update function
        }
    }
}
