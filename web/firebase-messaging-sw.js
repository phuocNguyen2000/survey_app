importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyDzKIrq7o9JiJXFL7S-62JbZ7TFz-thHO8",
    authDomain: "esurvey-ee4c3.firebaseapp.com",
    projectId: "esurvey-ee4c3",
    storageBucket: "esurvey-ee4c3.appspot.com",
    messagingSenderId: "1081356236575",
    appId: "1:1081356236575:web:e8d94ec1720e1377cde22a",
    measurementId: "G-QCTQ9DCN24"
  });

const messaging =  firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});