

function Start-App() {
  echo "`n>> npm install `n"  ; npm install
  echo "`n>> npm start `n"    ; npm start
}

Write-Output "Starting app..."

Start-App
