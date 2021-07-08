var currentTime = document.getElementById("currentTime");
var currentDay = document.getElementById("currentDay");
var date = new Date();
var weekday = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var minutes = date.getMinutes();
minutes = minutes < 10 ? '0' + minutes : minutes;

var prettyTime = `${date.getHours()}:${minutes}`
var prettyDate = `${weekday[date.getDay()]} ${date.getDate()} ${month[date.getMonth()]}`

console.log(prettyTime);
console.log(prettyDate);

currentTime.innerHTML = prettyTime;
currentDay.innerHTML = prettyDate;
