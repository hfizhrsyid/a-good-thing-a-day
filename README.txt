My Memory Jar — editor update

Files:
- index.html: updated app with the improved text editor.
- manifest.json: original app manifest from the provided files.
- sw.js: service worker updated to memory-jar-v2 so browsers can refresh the app cache.

Install/update:
1. Make a backup of your existing app folder first.
2. Extract these files into the SAME folder as your current index.html, replacing index.html and sw.js.
3. Keep any existing icon files in that folder.
4. Reopen/reload the app. If an installed PWA still shows the old editor, close it fully and reopen it, or clear the site's cached data and reload.

The home page and memory data structure were left unchanged. Existing memories stored in the same browser profile should remain available.

Cloud sync setup:
1. Open the Supabase SQL Editor for the configured project.
2. Run `supabase-schema.sql` once.
3. In Authentication settings, configure email sign-up and email confirmation as desired.
4. Serve this folder over HTTP or HTTPS; opening `index.html` directly does not support service workers or reliable cloud auth.
5. Open Settings in the app, create an account, and sign in on each device.

The app keeps a local offline copy and syncs the complete memory-jar document to the authenticated user's private row when changes are made. Export/import remains available as a manual backup.
