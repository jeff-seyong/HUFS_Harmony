﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace Leap.Unity{
    public class scale : MonoBehaviour
        
    {
        //public GameObject objectToBig;
        // Use this for initialization
        HandModelBase handModel;
        void Start()
        {
            Physics.IgnoreLayerCollision(LayerMask.NameToLayer("hand"), LayerMask.NameToLayer("drum"), true);
            transform.rotation = Quaternion.Euler(90, 0, 90);
        }
        public void scaleUp()
        {

           transform.localScale = new Vector3(0f, 0f, 0f);

        }
        public void scaleDown()
        {
            transform.localScale = new Vector3(0.001f, 0.002f, 0.001f);
            handModel = GameObject.Find("RigidRoundHand_R").GetComponent<ExtendedFingerDetector>().HandModel;
            if (handModel != null)
                transform.position = handModel.GetLeapHand().PalmPosition.ToVector3();

        }

    }
}
