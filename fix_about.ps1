$file = 'C:\Users\admin\.gemini\antigravity\scratch\adnan-portfolio\index.html'
$lines = [System.IO.File]::ReadAllLines($file, [System.Text.Encoding]::UTF8)

# Replace lines 790-815 (0-indexed: 789-814) with new about content
$newAbout = @'
        <div class="about-bio reveal">
          <p>
            I engineer systems at the boundary of <span class="highlight">machine cognition</span> and
            <span class="highlight">hardware reality</span> &mdash; where a transformer's attention mechanism
            and a microcontroller's interrupt handler are equally native territory.
          </p>
          <p>
            I compress complexity into clean, reasoned abstractions:
            <span class="highlight">RAG pipelines</span> that retrieve with precision,
            <span class="highlight">embedded protocols</span> hardened against adversarial replay,
            and interfaces that anticipate the user before they act.
          </p>
          <div class="tag-row">
            <span class="tag">Systems Thinker</span>
            <span class="tag">ML Practitioner</span>
            <span class="tag">Security-Aware</span>
            <span class="tag">VIT Vellore &rsquo;27</span>
          </div>
        </div>
        <div class="term-panel reveal" id="term-panel" aria-label="Developer profile terminal">
          <div class="term-header">
            <span class="term-dot red" aria-hidden="true"></span>
            <span class="term-dot yellow" aria-hidden="true"></span>
            <span class="term-dot green" aria-hidden="true"></span>
            <span class="term-title">adnan@vit ~ profile.sh</span>
          </div>
          <div class="term-body" id="term-body" aria-live="polite">
            <div class="term-line" id="tl-0"><span class="term-prompt">&#36;</span><span class="term-cmd">&nbsp;whoami</span></div>
            <div class="term-line" id="tl-1"><span class="term-val mint">Mohammed Adnan P &mdash; M.Tech Integrated CSE</span></div>
            <div class="term-line" id="tl-2"><span class="term-prompt">&#36;</span><span class="term-cmd">&nbsp;cat stack.json</span></div>
            <div class="term-line" id="tl-3"><span class="term-key">&nbsp; domain&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="term-val violet">Full-Stack / AI / IoT Security</span></div>
            <div class="term-line" id="tl-4"><span class="term-key">&nbsp; models&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="term-val mint">DistilBERT &bull; Whisper &bull; SentenceTransformers</span></div>
            <div class="term-line" id="tl-5"><span class="term-key">&nbsp; protocols&nbsp;&nbsp;&nbsp;</span><span class="term-val orange">AES-128 &bull; SHA-256 &bull; Session-Key Rotation</span></div>
            <div class="term-line" id="tl-6"><span class="term-key">&nbsp; cgpa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="term-val green">7.53 / 10.0 &mdash; VIT Vellore</span></div>
            <div class="term-line" id="tl-7"><span class="term-prompt">&#36;</span><span class="term-cmd">&nbsp;status</span></div>
            <div class="term-line" id="tl-8"><span class="term-val green">&nbsp; [ONLINE]&nbsp;</span><span class="term-val">Open to opportunities &mdash; building in 2026</span></div>
            <div class="term-line" id="tl-9"><span class="term-prompt">&#36;</span><span class="term-cursor" aria-hidden="true"></span></div>
          </div>
        </div>
'@

# Build new line array: keep lines 0..788, insert new content, keep lines 815..end
$before = $lines[0..789]
$after  = $lines[815..($lines.Length-1)]
$newLines = $before + $newAbout.Split("`n") + $after

[System.IO.File]::WriteAllLines($file, $newLines, [System.Text.Encoding]::UTF8)

# Now also fix the footer line
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Fix footer - find and replace the broken footer text
$content = $content -replace '<p class="footer-text">Crafted with obsession by <span class="footer-name">Mohammed Adnan</span>[^<]*</p>', '<p class="footer-text">Crafted with obsession by <span class="footer-name">Mohammed Adnan</span> &mdash; 2026</p>'

[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)

Write-Host "Done. Lines replaced and footer fixed."
