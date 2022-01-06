importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyDMs2taQUGHG3CeWkZ44UBEzUaOqXas_cI",
  authDomain: "vrcmart-99c7e.firebaseapp.com",
  projectId: "vrcmart-99c7e",
  storageBucket: "vrcmart-99c7e.appspot.com",
  messagingSenderId: "1061527130306",
  appId: "1:1061527130306:web:d70a67f51dbd57e8df2b5b",
  databaseURL: "...",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});