# Script to start both host and remote applications
Write-Host "Starting Remote Application..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-Command", "cd remote; npm run dev" -PassThru

Write-Host "Waiting for remote application to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "Starting Host Application..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-Command", "cd host; npm run dev" -PassThru

Write-Host "Applications started!" -ForegroundColor Cyan
Write-Host "Remote App: http://localhost:5001" -ForegroundColor Blue
Write-Host "Host App: http://localhost:3000" -ForegroundColor Blue