#!/bin/bash
# Deploy Qubit Sphere to GitHub Pages

echo "🚀 Deploying Qubit Sphere to GitHub Pages..."

# Switch to gh-pages branch
git checkout gh-pages

# Copy files to ensure they're in the right place
cp index.html index.html.bak
cp main.js main.js.bak

# Commit and push
git add .
git commit -m "Deploy Qubit Sphere to /qbt subdirectory"
git push origin gh-pages

# Switch back to main branch
git checkout main

echo "✅ Deployment complete!"
echo "📍 Your project should be available at:"
echo "   - https://stanfordphoto2024.github.io/qbt/"
echo "   - http://sylphold.com/qbt (after DNS configuration)"

# Check deployment status after a delay
echo "⏳ Checking deployment status in 10 seconds..."
sleep 10
curl -s -o /dev/null -w "%{http_code}" https://stanfordphoto2024.github.io/qbt/ | grep -q "200" && echo "✅ GitHub Pages deployment successful!" || echo "⚠️  GitHub Pages deployment may need more time"