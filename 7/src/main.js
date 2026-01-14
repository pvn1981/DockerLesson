// src/main.js
import './style.css' // если есть стили

document.querySelector('#app').innerHTML = `
  <div>
    <h1>Hello Docker 2026!</h1>
    <p>Приложение успешно собрано и запущено внутри контейнера.</p>
  </div>
`

console.log("Приложение запущено под Node.js:", import.meta.env.VITE_NODE_VERSION);
