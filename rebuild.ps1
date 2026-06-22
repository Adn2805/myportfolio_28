$b64 = [System.IO.File]::ReadAllText('C:\Users\admin\.gemini\antigravity\scratch\adnan-portfolio\photo_b64.txt')
$imgSrc = "data:image/jpeg;base64,$b64"

$html = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mohammed Adnan P — Full-Stack Developer | AI Engineer | IoT Builder</title>
  <meta name="description" content="Portfolio of Mohammed Adnan P — Integrated M.Tech Software Engineering student specialising in full-stack development, AI-powered applications, and embedded IoT systems.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;600&family=Space+Grotesk:wght@400;500;600;700;900&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg:#050810;--surface:#0D1117;--primary:#00F5C4;--secondary:#7C3AED;
      --accent:#FF6B35;--text:#E2E8F0;--text-muted:#64748B;
      --font-display:'Space Grotesk',sans-serif;--font-body:'Inter',sans-serif;
      --font-mono:'JetBrains Mono',monospace;
      --glass-bg:rgba(13,17,23,.6);--glass-border:rgba(0,245,196,.12);
      --radius:12px;--radius-lg:20px;--radius-pill:100px;
    }
    *,*::before,*::after{margin:0;padding:0;box-sizing:border-box;}
    html{scroll-behavior:smooth;scrollbar-width:thin;scrollbar-color:var(--primary) var(--bg);}
    html::-webkit-scrollbar{width:4px;}
    html::-webkit-scrollbar-track{background:var(--bg);}
    html::-webkit-scrollbar-thumb{background:var(--primary);border-radius:10px;}
    body{font-family:var(--font-body);background:var(--bg);color:var(--text);overflow-x:hidden;cursor:none;line-height:1.6;-webkit-font-smoothing:antialiased;}
    a{color:inherit;text-decoration:none;}
    button{border:none;background:none;cursor:none;font-family:inherit;color:inherit;}
    @media(prefers-reduced-motion:reduce){
      *,*::before,*::after{animation-duration:.01ms!important;animation-iteration-count:1!important;transition-duration:.01ms!important;scroll-behavior:auto!important;}
      .custom-cursor,.cursor-ring{display:none!important;}
      body{cursor:auto;}a,button{cursor:pointer;}
      #particle-canvas{display:none!important;}
    }

    /* SCROLL PROGRESS */
    .scroll-progress{position:fixed;top:0;left:0;width:0%;height:3px;background:linear-gradient(90deg,var(--primary),var(--secondary));z-index:10002;box-shadow:0 0 8px var(--primary);}

    /* BG */
    .bg-mesh{position:fixed;inset:0;z-index:-2;background:radial-gradient(ellipse 80% 60% at 20% 10%,rgba(124,58,237,.08) 0%,transparent 60%),radial-gradient(ellipse 60% 80% at 80% 90%,rgba(0,245,196,.06) 0%,transparent 60%),radial-gradient(ellipse 70% 50% at 60% 40%,rgba(255,107,53,.04) 0%,transparent 60%);animation:meshDrift 20s ease-in-out infinite alternate;}
    @keyframes meshDrift{0%{filter:hue-rotate(0deg);transform:scale(1);}50%{filter:hue-rotate(15deg);transform:scale(1.05);}100%{filter:hue-rotate(-10deg);transform:scale(1);}}
    .noise-overlay{position:fixed;inset:0;z-index:-1;opacity:.03;pointer-events:none;}
    .noise-overlay svg{width:100%;height:100%;}

    /* CURSOR */
    .custom-cursor{position:fixed;width:8px;height:8px;background:var(--primary);border-radius:50%;pointer-events:none;z-index:10001;transform:translate(-50%,-50%);transition:width .2s,height .2s,background .2s;}
    .cursor-ring{position:fixed;width:36px;height:36px;border:1.5px solid var(--primary);border-radius:50%;pointer-events:none;z-index:10000;transform:translate(-50%,-50%);transition:width .3s ease-out,height .3s ease-out,border-color .3s,opacity .3s,background .3s,border-radius .3s;opacity:.5;}
    .cursor-ring.hovering{width:52px;height:52px;border-color:var(--accent);opacity:.85;}
    .cursor-ring.btn-hover{width:52px;height:52px;background:rgba(0,245,196,.12);border-color:var(--primary);opacity:1;}
    .cursor-ring.aperture{border-radius:0;transform:translate(-50%,-50%) rotate(45deg);width:44px;height:44px;border-color:var(--primary);}
    .custom-cursor.hovering{width:10px;height:10px;background:var(--accent);}
    .custom-cursor.btn-hover{background:var(--primary);}

    /* LOADER */
    .loader{position:fixed;inset:0;z-index:9999;background:var(--bg);display:flex;align-items:center;justify-content:center;transition:opacity .6s ease,visibility .6s ease;}
    .loader.hidden{opacity:0;visibility:hidden;}
    .loader-monogram svg{width:100px;height:100px;}
    .loader-monogram path{fill:none;stroke:var(--primary);stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:400;stroke-dashoffset:400;animation:drawMono 1.2s ease-out forwards;}
    @keyframes drawMono{to{stroke-dashoffset:0;}}

    /* NAV */
    .floating-nav{position:fixed;top:24px;left:50%;transform:translateX(-50%);z-index:1000;display:flex;align-items:center;gap:4px;padding:6px 8px;background:rgba(13,17,23,.75);backdrop-filter:blur(20px) saturate(1.5);-webkit-backdrop-filter:blur(20px) saturate(1.5);border:1px solid var(--glass-border);border-radius:var(--radius-pill);box-shadow:0 8px 32px rgba(0,0,0,.3);}
    .nav-link{position:relative;padding:8px 18px;font-family:var(--font-body);font-size:.85rem;font-weight:500;color:var(--text-muted);border-radius:var(--radius-pill);transition:color .3s;white-space:nowrap;}
    .nav-link:hover,.nav-link:focus-visible{color:var(--text);}
    .nav-link.active{color:var(--primary);}
    .nav-indicator{position:absolute;bottom:4px;height:2px;background:var(--primary);border-radius:2px;transition:left .35s cubic-bezier(.4,0,.2,1),width .35s cubic-bezier(.4,0,.2,1);pointer-events:none;box-shadow:0 0 8px var(--primary);}

    /* HERO */
    .hero{position:relative;min-height:100vh;display:flex;align-items:center;overflow:hidden;}
    .hero-photo-wrap{position:absolute;top:0;right:0;width:55%;height:100%;z-index:0;overflow:hidden;}
    .hero-photo-wrap img{width:100%;height:100%;object-fit:cover;object-position:top center;display:block;}
    .hero-photo-wrap::before{content:'';position:absolute;inset:0;z-index:1;background:rgba(0,40,60,.18);mix-blend-mode:color;}
    .hero-photo-wrap::after{content:'';position:absolute;inset:0;z-index:2;background:linear-gradient(to right,var(--bg) 0%,rgba(5,8,16,.7) 30%,rgba(5,8,16,.1) 70%,transparent 100%),linear-gradient(to top,var(--bg) 0%,transparent 40%);}
    #particle-canvas{position:absolute;inset:0;z-index:1;pointer-events:none;}
    .scanline-overlay{position:absolute;inset:0;z-index:3;background:repeating-linear-gradient(0deg,transparent,transparent 2px,rgba(0,245,196,.015) 2px,rgba(0,245,196,.015) 4px);pointer-events:none;}
    .otw-badge{position:absolute;top:100px;left:48px;z-index:4;display:inline-flex;align-items:center;gap:10px;padding:10px 20px;background:rgba(13,17,23,.7);backdrop-filter:blur(16px);-webkit-backdrop-filter:blur(16px);border:1px solid rgba(0,245,196,.2);border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:.78rem;color:var(--text);}
    .otw-dot{width:8px;height:8px;border-radius:50%;background:#22c55e;box-shadow:0 0 6px #22c55e;animation:pulse 2s ease-in-out infinite;}
    @keyframes pulse{0%,100%{box-shadow:0 0 6px #22c55e;}50%{box-shadow:0 0 14px #22c55e,0 0 22px rgba(34,197,94,.4);}}
    .hero-content{position:relative;z-index:4;padding:80px 48px 0;max-width:700px;}
    .hero-name-line1{font-family:var(--font-display);font-size:clamp(3.5rem,9vw,8rem);font-weight:900;letter-spacing:-0.03em;line-height:.95;color:var(--text);display:block;}
    .hero-name-line2{font-family:var(--font-display);font-size:clamp(3.5rem,9vw,8rem);font-weight:900;letter-spacing:-0.03em;line-height:.95;background:linear-gradient(90deg,var(--primary),var(--secondary));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;display:block;margin-bottom:20px;}
    .hero-name-rule{width:60px;height:1px;background:var(--primary);margin:16px 0 20px;box-shadow:0 0 8px var(--primary);}
    .hero-subtitle-container{height:36px;overflow:hidden;position:relative;margin-bottom:36px;}
    .hero-subtitle{font-family:var(--font-display);font-size:1.15rem;font-weight:500;color:var(--text-muted);position:absolute;width:100%;left:0;opacity:0;transform:translateY(20px);transition:opacity .5s ease,transform .5s ease;}
    .hero-subtitle.active{opacity:1;transform:translateY(0);}
    .hero-subtitle.exit{opacity:0;transform:translateY(-20px);}
    .hero-cta-group{display:flex;gap:14px;flex-wrap:wrap;}
    .btn{display:inline-flex;align-items:center;gap:8px;padding:14px 32px;border-radius:var(--radius-pill);font-family:var(--font-display);font-weight:600;font-size:.95rem;position:relative;overflow:hidden;transition:transform .3s,box-shadow .3s;}
    .btn:focus-visible{outline:2px solid var(--primary);outline-offset:3px;}
    .btn-primary{background:var(--primary);color:var(--bg);}
    .btn-primary:hover{transform:translateY(-2px);box-shadow:0 10px 30px rgba(0,245,196,.3);}
    .btn-outline{border:1.5px solid var(--primary);color:var(--primary);}
    .btn-outline:hover{background:rgba(0,245,196,.06);transform:translateY(-2px);}
    .btn .ripple{position:absolute;border-radius:50%;background:rgba(255,255,255,.25);transform:scale(0);animation:rippleAnim .6s linear;pointer-events:none;}
    @keyframes rippleAnim{to{transform:scale(4);opacity:0;}}

    /* SECTIONS */
    .section{padding:100px 48px;max-width:1200px;margin:0 auto;}
    .section-label{font-family:var(--font-mono);font-size:.8rem;color:var(--primary);letter-spacing:3px;text-transform:uppercase;margin-bottom:12px;}
    .section-title{font-family:var(--font-display);font-size:clamp(1.8rem,4vw,2.8rem);font-weight:700;margin-bottom:48px;line-height:1.2;}
    .reveal{opacity:0;transform:translateY(30px);transition:opacity .6s ease,transform .6s ease;}
    .reveal.visible{opacity:1;transform:translateY(0);}

    /* ABOUT */
    .about-grid{display:grid;grid-template-columns:1fr 1fr;gap:56px;align-items:center;}
    .about-bio{display:flex;flex-direction:column;gap:20px;}
    .about-bio p{font-size:1.08rem;color:var(--text);line-height:1.9;opacity:.92;}
    .about-bio .highlight{color:var(--primary);font-weight:600;}
    .about-bio .tag-row{display:flex;flex-wrap:wrap;gap:8px;margin-top:8px;}
    .about-bio .tag{padding:5px 14px;border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:.72rem;border:1px solid rgba(0,245,196,.18);color:var(--primary);background:rgba(0,245,196,.06);}

    /* TERMINAL */
    .term-panel{background:#0a0e1a;border:1px solid rgba(0,245,196,.15);border-radius:var(--radius-lg);overflow:hidden;box-shadow:0 0 40px rgba(0,245,196,.06),0 20px 60px rgba(0,0,0,.4);}
    .term-header{display:flex;align-items:center;gap:8px;padding:12px 20px;background:rgba(255,255,255,.03);border-bottom:1px solid rgba(255,255,255,.05);}
    .term-dot{width:12px;height:12px;border-radius:50%;}
    .term-dot.red{background:#ff5f57;}.term-dot.yellow{background:#febc2e;}.term-dot.green{background:#28c840;}
    .term-title{margin-left:auto;margin-right:auto;font-family:var(--font-mono);font-size:.72rem;color:var(--text-muted);}
    .term-body{padding:24px 28px;font-family:var(--font-mono);font-size:.8rem;line-height:2;min-height:240px;}
    .term-line{display:flex;gap:10px;opacity:0;transform:translateY(6px);transition:opacity .3s,transform .3s;}
    .term-line.visible{opacity:1;transform:translateY(0);}
    .term-prompt{color:var(--primary);flex-shrink:0;}
    .term-cmd{color:#7dd3fc;}
    .term-key{color:#94a3b8;}
    .term-val{color:var(--text);}
    .term-val.mint{color:var(--primary);}.term-val.violet{color:#a78bfa;}.term-val.orange{color:var(--accent);}.term-val.green{color:#4ade80;}
    .term-cursor{display:inline-block;width:8px;height:1em;background:var(--primary);margin-left:2px;vertical-align:text-bottom;animation:blink .8s step-end infinite;}
    @keyframes blink{0%,100%{opacity:1;}50%{opacity:0;}}

    /* SKILLS */
    .skills-filter{display:flex;flex-wrap:wrap;gap:10px;margin-bottom:36px;}
    .filter-btn{padding:8px 20px;border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:.78rem;font-weight:600;border:1px solid rgba(255,255,255,.1);color:var(--text-muted);transition:color .3s,border-color .3s,box-shadow .3s;}
    .filter-btn:hover{color:var(--text);border-color:rgba(255,255,255,.25);}
    .filter-btn.active{color:var(--primary);border-color:var(--primary);box-shadow:0 0 12px rgba(0,245,196,.2);text-decoration:underline;text-underline-offset:4px;}
    .skills-cloud{display:flex;flex-wrap:wrap;gap:12px;justify-content:center;}
    .skill-pill{display:inline-flex;align-items:center;gap:6px;padding:10px 20px;border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:.82rem;font-weight:500;background:rgba(13,17,23,.5);backdrop-filter:blur(12px);-webkit-backdrop-filter:blur(12px);border:1px solid rgba(255,255,255,.06);transition:transform .4s ease,box-shadow .4s ease,border-color .4s ease,opacity .4s ease;animation:float var(--float-dur,6s) ease-in-out infinite alternate;animation-delay:var(--float-delay,0s);}
    @keyframes float{0%{transform:translateY(0px) rotate(0deg);}100%{transform:translateY(-8px) rotate(1deg);}}
    .skill-pill:hover{transform:translateY(-6px) scale(1.08)!important;border-color:var(--glow);box-shadow:0 0 20px color-mix(in srgb,var(--glow) 30%,transparent),inset 0 0 20px color-mix(in srgb,var(--glow) 8%,transparent);z-index:2;}
    .skill-pill.dimmed{opacity:.2;transform:scale(.97);}
    .skill-pill[data-cat="lang"]{--glow:var(--primary);}
    .skill-pill[data-cat="ai"]{--glow:var(--secondary);}
    .skill-pill[data-cat="web"]{--glow:#3B82F6;}
    .skill-pill[data-cat="db"]{--glow:#F59E0B;}
    .skill-pill[data-cat="tools"]{--glow:var(--accent);}
    .skill-pill[data-cat="embedded"]{--glow:#EC4899;}
    .skill-dot{width:6px;height:6px;border-radius:50%;background:var(--glow);flex-shrink:0;}

    /* PROJECTS */
    .projects-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:28px;}
    .flip-card{perspective:1000px;height:400px;}
    .flip-card-inner{position:relative;width:100%;height:100%;transition:transform .7s cubic-bezier(.4,0,.2,1);transform-style:preserve-3d;}
    .flip-card:hover .flip-card-inner,.flip-card:focus-within .flip-card-inner{transform:rotateY(180deg);}
    .flip-card-front,.flip-card-back{position:absolute;inset:0;backface-visibility:hidden;-webkit-backface-visibility:hidden;border-radius:var(--radius-lg);padding:28px;display:flex;flex-direction:column;}
    .flip-card-front{background:var(--surface);overflow:hidden;}
    .flip-card-front::before{content:'';position:absolute;inset:-2px;border-radius:calc(var(--radius-lg) + 2px);background:conic-gradient(from 0deg,var(--primary),var(--secondary),var(--accent),var(--primary));animation:spinBorder 4s linear infinite;z-index:-1;}
    .flip-card-front::after{content:'';position:absolute;inset:2px;border-radius:calc(var(--radius-lg) - 1px);background:var(--surface);z-index:-1;}
    @keyframes spinBorder{to{transform:rotate(360deg);}}
    .flip-card-back{background:var(--surface);border:1px solid var(--glass-border);transform:rotateY(180deg);justify-content:space-between;}
    .card-badges{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:16px;}
    .project-category{display:inline-block;padding:4px 12px;border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:.68rem;font-weight:600;letter-spacing:1px;text-transform:uppercase;}
    .cat-ai{background:rgba(124,58,237,.2);color:var(--secondary);}
    .cat-iot{background:rgba(236,72,153,.2);color:#EC4899;}
    .cat-fullstack{background:rgba(0,245,196,.2);color:var(--primary);}
    .card-tag-badge{display:inline-flex;align-items:center;gap:5px;padding:4px 12px;border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:.68rem;font-weight:600;background:rgba(255,107,53,.15);color:var(--accent);}
    .project-name{font-family:var(--font-display);font-size:1.4rem;font-weight:700;margin-bottom:10px;line-height:1.3;}
    .project-oneliner{color:var(--text-muted);font-size:.92rem;line-height:1.6;flex:1;}
    .project-date{font-family:var(--font-mono);font-size:.72rem;color:var(--text-muted);margin-top:14px;}
    .flip-hint{font-size:.72rem;color:var(--text-muted);margin-top:auto;opacity:.5;}
    .project-back-title{font-family:var(--font-display);font-size:1.05rem;font-weight:700;margin-bottom:10px;color:var(--primary);}
    .project-details{font-size:.85rem;color:var(--text);line-height:1.7;flex:1;}
    .project-details li{list-style:none;padding-left:16px;position:relative;margin-bottom:7px;}
    .project-details li::before{content:'&#9658;';position:absolute;left:0;color:var(--primary);}
    .project-stack{display:flex;flex-wrap:wrap;gap:6px;margin:12px 0;}
    .stack-tag{padding:4px 10px;border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:.66rem;background:rgba(0,245,196,.1);border:1px solid rgba(0,245,196,.15);color:var(--primary);}

    /* CERTS */
    .certs-ribbon-wrapper{overflow-x:auto;padding-bottom:16px;scrollbar-width:thin;scrollbar-color:var(--secondary) var(--surface);}
    .certs-ribbon-wrapper::-webkit-scrollbar{height:4px;}
    .certs-ribbon-wrapper::-webkit-scrollbar-track{background:var(--surface);border-radius:4px;}
    .certs-ribbon-wrapper::-webkit-scrollbar-thumb{background:var(--secondary);border-radius:4px;}
    .certs-ribbon{display:flex;gap:20px;min-width:max-content;padding:4px;}
    .cert-card{flex-shrink:0;width:300px;padding:28px;background:var(--glass-bg);backdrop-filter:blur(16px);-webkit-backdrop-filter:blur(16px);border:1px solid var(--glass-border);border-radius:var(--radius-lg);transition:transform .3s,border-color .3s;}
    .cert-card:hover{transform:translateY(-4px);border-color:var(--secondary);}
    .cert-icon{width:44px;height:44px;border-radius:var(--radius);background:rgba(124,58,237,.15);display:flex;align-items:center;justify-content:center;margin-bottom:16px;font-size:1.2rem;}
    .cert-title{font-family:var(--font-display);font-size:1.02rem;font-weight:600;margin-bottom:6px;}
    .cert-issuer{font-size:.83rem;color:var(--text-muted);}

    /* CONTACT */
    .contact-wrapper{display:flex;justify-content:center;}
    .contact-card{max-width:580px;width:100%;padding:48px;background:var(--glass-bg);backdrop-filter:blur(24px);-webkit-backdrop-filter:blur(24px);border:1px solid var(--glass-border);border-radius:var(--radius-lg);text-align:center;}
    .contact-title{font-family:var(--font-display);font-size:1.8rem;font-weight:700;margin-bottom:10px;}
    .contact-sub{color:var(--text-muted);margin-bottom:32px;font-size:.98rem;}
    .contact-links{display:flex;flex-wrap:wrap;gap:12px;justify-content:center;margin-bottom:28px;}
    .contact-link{display:inline-flex;align-items:center;gap:8px;padding:12px 22px;border-radius:var(--radius-pill);border:1px solid rgba(255,255,255,.08);background:rgba(255,255,255,.03);font-size:.88rem;font-weight:500;transition:transform .3s,border-color .3s,background .3s;}
    .contact-link:hover{border-color:var(--primary);background:rgba(0,245,196,.06);}
    .contact-link:focus-visible{outline:2px solid var(--primary);outline-offset:2px;}
    .contact-link svg{width:17px;height:17px;flex-shrink:0;}
    .copy-email-btn{display:inline-flex;align-items:center;gap:8px;padding:12px 28px;border-radius:var(--radius-pill);background:rgba(0,245,196,.1);border:1px solid rgba(0,245,196,.2);font-family:var(--font-mono);font-size:.83rem;color:var(--primary);transition:background .3s,transform .3s;}
    .copy-email-btn:hover{background:rgba(0,245,196,.18);transform:translateY(-2px);}
    .copy-email-btn:focus-visible{outline:2px solid var(--primary);outline-offset:2px;}
    .copy-email-btn .checkmark{display:none;}
    .copy-email-btn.copied .copy-icon{display:none;}
    .copy-email-btn.copied .checkmark{display:inline;animation:popIn .3s ease;}
    @keyframes popIn{0%{transform:scale(0);}70%{transform:scale(1.2);}100%{transform:scale(1);}}

    /* FOOTER */
    .site-footer{text-align:center;padding:40px 24px;border-top:1px solid rgba(255,255,255,.04);}
    .footer-text{font-size:.85rem;color:var(--text-muted);}
    .footer-name{font-weight:600;background:linear-gradient(90deg,var(--primary),var(--secondary),var(--accent));background-size:200% auto;-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;animation:gradientText 4s linear infinite;}
    @keyframes gradientText{0%{background-position:0% center;}100%{background-position:200% center;}}

    /* MOBILE */
    .mobile-nav-toggle{display:none;}
    @media(max-width:1024px){.projects-grid{grid-template-columns:repeat(2,1fr);}}
    @media(max-width:768px){
      .floating-nav{display:none;}
      .mobile-nav-toggle{display:flex!important;position:fixed;top:20px;right:20px;z-index:1001;width:44px;height:44px;align-items:center;justify-content:center;background:var(--glass-bg);backdrop-filter:blur(20px);-webkit-backdrop-filter:blur(20px);border:1px solid var(--glass-border);border-radius:50%;}
      .mobile-nav-toggle span{display:block;width:20px;height:2px;background:var(--text);position:relative;transition:background .3s;}
      .mobile-nav-toggle span::before,.mobile-nav-toggle span::after{content:'';position:absolute;width:20px;height:2px;background:var(--text);transition:transform .3s;}
      .mobile-nav-toggle span::before{top:-6px;}.mobile-nav-toggle span::after{top:6px;}
      .mobile-nav-toggle.active span{background:transparent;}
      .mobile-nav-toggle.active span::before{transform:rotate(45deg) translate(4px,5px);}
      .mobile-nav-toggle.active span::after{transform:rotate(-45deg) translate(4px,-5px);}
      .mobile-menu{position:fixed;inset:0;z-index:999;background:rgba(5,8,16,.95);backdrop-filter:blur(20px);-webkit-backdrop-filter:blur(20px);display:flex;flex-direction:column;align-items:center;justify-content:center;gap:24px;opacity:0;visibility:hidden;transition:opacity .3s,visibility .3s;}
      .mobile-menu.open{opacity:1;visibility:visible;}
      .mobile-menu .nav-link{font-size:1.3rem;padding:12px 24px;}
      .hero{flex-direction:column;min-height:100vh;}
      .hero-photo-wrap{position:relative;width:100%;height:50vh;}
      .hero-photo-wrap::after{background:linear-gradient(to bottom,transparent 40%,var(--bg) 100%);}
      .hero-content{padding:32px 24px;max-width:100%;padding-top:24px;}
      .hero-name-line1,.hero-name-line2{font-size:clamp(2.5rem,12vw,5rem);}
      .otw-badge{top:60px;left:20px;}
      .about-grid{grid-template-columns:1fr;gap:32px;}
      .projects-grid{grid-template-columns:1fr;}
      .flip-card{height:380px;}
      .section{padding:64px 24px;}
      .contact-card{padding:32px 24px;}
      .custom-cursor,.cursor-ring{display:none!important;}
      body{cursor:auto;}a,button{cursor:pointer;}
    }
    @media(max-width:480px){
      .hero-cta-group{flex-direction:column;}
      .btn{width:100%;max-width:260px;justify-content:center;}
    }
    *:focus-visible{outline:2px solid var(--primary);outline-offset:3px;border-radius:4px;}
    .skip-link{position:fixed;top:-100%;left:16px;z-index:10002;padding:12px 24px;background:var(--primary);color:var(--bg);font-weight:600;border-radius:var(--radius);transition:top .3s;}
    .skip-link:focus{top:16px;}
  </style>
</head>
<body>
  <a href="#main-content" class="skip-link">Skip to main content</a>
  <div class="scroll-progress" id="scroll-progress" aria-hidden="true"></div>
  <div class="noise-overlay" aria-hidden="true"><svg width="100%" height="100%"><filter id="noise"><feTurbulence type="fractalNoise" baseFrequency="0.65" numOctaves="3" stitchTiles="stitch"/><feColorMatrix type="saturate" values="0"/></filter><rect width="100%" height="100%" filter="url(#noise)"/></svg></div>
  <div class="bg-mesh" aria-hidden="true"></div>
  <div class="custom-cursor" aria-hidden="true"></div>
  <div class="cursor-ring" aria-hidden="true"></div>

  <div class="loader" id="loader" aria-label="Loading">
    <div class="loader-monogram"><svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M15 80 L15 20 L35 55 L55 20 L55 80 M65 80 L65 20 L90 50 L65 80 Z"/></svg></div>
  </div>

  <nav class="floating-nav" aria-label="Main navigation">
    <a href="#hero" class="nav-link active" data-section="hero">Home</a>
    <a href="#skills" class="nav-link" data-section="skills">Skills</a>
    <a href="#projects" class="nav-link" data-section="projects">Projects</a>
    <a href="#certifications" class="nav-link" data-section="certifications">Certs</a>
    <a href="#contact" class="nav-link" data-section="contact">Contact</a>
    <div class="nav-indicator" aria-hidden="true"></div>
  </nav>
  <button class="mobile-nav-toggle" aria-label="Toggle navigation" aria-expanded="false"><span></span></button>
  <div class="mobile-menu" id="mobile-menu" aria-hidden="true">
    <a href="#hero" class="nav-link" data-mobile-nav>Home</a>
    <a href="#skills" class="nav-link" data-mobile-nav>Skills</a>
    <a href="#projects" class="nav-link" data-mobile-nav>Projects</a>
    <a href="#certifications" class="nav-link" data-mobile-nav>Certs</a>
    <a href="#contact" class="nav-link" data-mobile-nav>Contact</a>
  </div>

  <header class="hero" id="hero">
    <div class="hero-photo-wrap">
      <img src="PHOTO_PLACEHOLDER" alt="Mohammed Adnan P" loading="eager">
    </div>
    <canvas id="particle-canvas" aria-hidden="true"></canvas>
    <div class="scanline-overlay" aria-hidden="true"></div>
    <div class="otw-badge" aria-label="Open to work"><span class="otw-dot" aria-hidden="true"></span>Open to Work</div>
    <div class="hero-content">
      <span class="hero-name-line1 reveal">MOHAMMED</span>
      <span class="hero-name-line2 reveal">ADNAN</span>
      <div class="hero-name-rule reveal" aria-hidden="true"></div>
      <div class="hero-subtitle-container reveal" aria-live="polite">
        <span class="hero-subtitle active" id="sub-0">Full-Stack Developer</span>
        <span class="hero-subtitle" id="sub-1">AI Systems Engineer</span>
        <span class="hero-subtitle" id="sub-2">IoT Security Builder</span>
      </div>
      <div class="hero-cta-group reveal">
        <a href="#projects" class="btn btn-primary magnetic-btn">View My Work</a>
        <a href="#contact" class="btn btn-outline magnetic-btn">Get In Touch</a>
      </div>
    </div>
  </header>

  <main id="main-content">
    <section class="section" id="about" aria-labelledby="about-title">
      <p class="section-label reveal">About Me</p>
      <h2 class="section-title reveal" id="about-title">Designing intelligence,<br>one system at a time.</h2>
      <div class="about-grid">
        <div class="about-bio reveal">
          <p>I engineer systems at the boundary of <span class="highlight">machine cognition</span> and <span class="highlight">hardware reality</span> &mdash; where a transformer's attention mechanism and a microcontroller's interrupt handler are equally native territory.</p>
          <p>I compress complexity into clean, reasoned abstractions: <span class="highlight">RAG pipelines</span> that retrieve with precision, <span class="highlight">embedded protocols</span> hardened against adversarial replay, and interfaces that anticipate the user before they act.</p>
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
            <div class="term-line" id="tl-3"><span class="term-key">&nbsp;&nbsp;domain&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="term-val violet">Full-Stack / AI / IoT Security</span></div>
            <div class="term-line" id="tl-4"><span class="term-key">&nbsp;&nbsp;models&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="term-val mint">DistilBERT &bull; Whisper &bull; SentenceTransformers</span></div>
            <div class="term-line" id="tl-5"><span class="term-key">&nbsp;&nbsp;security&nbsp;&nbsp;&nbsp;</span><span class="term-val orange">AES-128 &bull; SHA-256 &bull; Session-Key Rotation</span></div>
            <div class="term-line" id="tl-6"><span class="term-key">&nbsp;&nbsp;cgpa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="term-val green">7.53 / 10.0 &mdash; VIT Vellore</span></div>
            <div class="term-line" id="tl-7"><span class="term-prompt">&#36;</span><span class="term-cmd">&nbsp;status</span></div>
            <div class="term-line" id="tl-8"><span class="term-val green">&nbsp;[ONLINE]&nbsp;</span><span class="term-val">Open to opportunities &mdash; building in 2026</span></div>
            <div class="term-line" id="tl-9"><span class="term-prompt">&#36;</span><span class="term-cursor" aria-hidden="true"></span></div>
          </div>
        </div>
      </div>
    </section>

    <section class="section" id="skills" aria-labelledby="skills-title">
      <p class="section-label reveal">Tech Arsenal</p>
      <h2 class="section-title reveal" id="skills-title">Languages, frameworks, and tools I wield.</h2>
      <div class="skills-filter reveal" role="group" aria-label="Filter skills">
        <button class="filter-btn active" data-filter="all">All</button>
        <button class="filter-btn" data-filter="ai">AI &amp; ML</button>
        <button class="filter-btn" data-filter="web">Web &amp; Frontend</button>
        <button class="filter-btn" data-filter="embedded">Embedded</button>
        <button class="filter-btn" data-filter="tools">DevOps &amp; Tools</button>
        <button class="filter-btn" data-filter="lang">Languages</button>
        <button class="filter-btn" data-filter="db">Databases</button>
      </div>
      <div class="skills-cloud reveal" role="list">
        <span class="skill-pill" data-cat="lang" role="listitem" style="--float-dur:5.5s;--float-delay:0s"><span class="skill-dot"></span>Java</span>
        <span class="skill-pill" data-cat="lang" role="listitem" style="--float-dur:6.2s;--float-delay:.3s"><span class="skill-dot"></span>Python</span>
        <span class="skill-pill" data-cat="lang" role="listitem" style="--float-dur:5.8s;--float-delay:.1s"><span class="skill-dot"></span>JavaScript</span>
        <span class="skill-pill" data-cat="lang" role="listitem" style="--float-dur:6.5s;--float-delay:.5s"><span class="skill-dot"></span>C</span>
        <span class="skill-pill" data-cat="lang" role="listitem" style="--float-dur:7s;--float-delay:.2s"><span class="skill-dot"></span>C++</span>
        <span class="skill-pill" data-cat="db" role="listitem" style="--float-dur:6.8s;--float-delay:.4s"><span class="skill-dot"></span>SQL</span>
        <span class="skill-pill" data-cat="db" role="listitem" style="--float-dur:5.3s;--float-delay:.7s"><span class="skill-dot"></span>Firebase</span>
        <span class="skill-pill" data-cat="db" role="listitem" style="--float-dur:6s;--float-delay:.15s"><span class="skill-dot"></span>MongoDB</span>
        <span class="skill-pill" data-cat="tools" role="listitem" style="--float-dur:5.7s;--float-delay:.6s"><span class="skill-dot"></span>Git</span>
        <span class="skill-pill" data-cat="tools" role="listitem" style="--float-dur:6.3s;--float-delay:.35s"><span class="skill-dot"></span>Docker</span>
        <span class="skill-pill" data-cat="tools" role="listitem" style="--float-dur:7.2s;--float-delay:.8s"><span class="skill-dot"></span>FAISS</span>
        <span class="skill-pill" data-cat="tools" role="listitem" style="--float-dur:5.5s;--float-delay:.45s"><span class="skill-dot"></span>Power BI</span>
        <span class="skill-pill" data-cat="tools" role="listitem" style="--float-dur:6.6s;--float-delay:.25s"><span class="skill-dot"></span>Nmap</span>
        <span class="skill-pill" data-cat="tools" role="listitem" style="--float-dur:5.9s;--float-delay:.55s"><span class="skill-dot"></span>Wireshark</span>
        <span class="skill-pill" data-cat="tools" role="listitem" style="--float-dur:6.1s;--float-delay:.1s"><span class="skill-dot"></span>VS Code</span>
        <span class="skill-pill" data-cat="web" role="listitem" style="--float-dur:5.4s;--float-delay:.65s"><span class="skill-dot"></span>React.js</span>
        <span class="skill-pill" data-cat="web" role="listitem" style="--float-dur:6.7s;--float-delay:.2s"><span class="skill-dot"></span>Next.js</span>
        <span class="skill-pill" data-cat="ai" role="listitem" style="--float-dur:5.6s;--float-delay:.5s"><span class="skill-dot"></span>FastAPI</span>
        <span class="skill-pill" data-cat="ai" role="listitem" style="--float-dur:7.1s;--float-delay:.75s"><span class="skill-dot"></span>Streamlit</span>
        <span class="skill-pill" data-cat="ai" role="listitem" style="--float-dur:6.4s;--float-delay:.3s"><span class="skill-dot"></span>PyTorch</span>
        <span class="skill-pill" data-cat="ai" role="listitem" style="--float-dur:5.2s;--float-delay:.4s"><span class="skill-dot"></span>Scikit-Learn</span>
        <span class="skill-pill" data-cat="ai" role="listitem" style="--float-dur:6.9s;--float-delay:.6s"><span class="skill-dot"></span>Hugging Face</span>
        <span class="skill-pill" data-cat="ai" role="listitem" style="--float-dur:5.8s;--float-delay:.15s"><span class="skill-dot"></span>SentenceTransformers</span>
        <span class="skill-pill" data-cat="web" role="listitem" style="--float-dur:6.2s;--float-delay:.85s"><span class="skill-dot"></span>Zustand</span>
        <span class="skill-pill" data-cat="web" role="listitem" style="--float-dur:5.5s;--float-delay:.5s"><span class="skill-dot"></span>Recharts</span>
        <span class="skill-pill" data-cat="web" role="listitem" style="--float-dur:6.6s;--float-delay:.35s"><span class="skill-dot"></span>Framer Motion</span>
        <span class="skill-pill" data-cat="web" role="listitem" style="--float-dur:5.3s;--float-delay:.7s"><span class="skill-dot"></span>HTML &amp; CSS</span>
        <span class="skill-pill" data-cat="web" role="listitem" style="--float-dur:6.8s;--float-delay:.2s"><span class="skill-dot"></span>REST APIs</span>
        <span class="skill-pill" data-cat="embedded" role="listitem" style="--float-dur:7s;--float-delay:.45s"><span class="skill-dot"></span>ESP32</span>
        <span class="skill-pill" data-cat="embedded" role="listitem" style="--float-dur:5.7s;--float-delay:.55s"><span class="skill-dot"></span>Arduino</span>
        <span class="skill-pill" data-cat="embedded" role="listitem" style="--float-dur:6.3s;--float-delay:.1s"><span class="skill-dot"></span>AES-128</span>
        <span class="skill-pill" data-cat="embedded" role="listitem" style="--float-dur:5.9s;--float-delay:.8s"><span class="skill-dot"></span>SHA-256</span>
        <span class="skill-pill" data-cat="embedded" role="listitem" style="--float-dur:6.5s;--float-delay:.3s"><span class="skill-dot"></span>Embedded C</span>
      </div>
    </section>

    <section class="section" id="projects" aria-labelledby="projects-title">
      <p class="section-label reveal">Featured Work</p>
      <h2 class="section-title reveal" id="projects-title">Projects that push boundaries.</h2>
      <div class="projects-grid">
        <article class="flip-card reveal" aria-label="NexusIntel project">
          <div class="flip-card-inner" tabindex="0" role="button" aria-label="Flip for details">
            <div class="flip-card-front">
              <div class="card-badges"><span class="project-category cat-fullstack">Full-Stack &middot; AI</span><span class="card-tag-badge">&#128200; FinTech AI</span></div>
              <h3 class="project-name">NexusIntel</h3>
              <p class="project-oneliner">AI-powered market impact intelligence platform delivering real-time news-driven financial insights and stock-sector analytics.</p>
              <span class="project-date">Dec 2025 &mdash; Jan 2026</span>
              <span class="flip-hint">&#8635; Hover to flip</span>
            </div>
            <div class="flip-card-back">
              <h3 class="project-back-title">NexusIntel &mdash; Deep Dive</h3>
              <ul class="project-details">
                <li>Real-time dashboard monitoring global news impact on stocks &amp; sectors</li>
                <li>Rules-based AI engine for market impact scoring and financial insights</li>
                <li>Dynamic UI with efficient state management and rich data visualisation</li>
              </ul>
              <div class="project-stack"><span class="stack-tag">Next.js</span><span class="stack-tag">React</span><span class="stack-tag">Zustand</span><span class="stack-tag">Recharts</span><span class="stack-tag">Framer Motion</span></div>
            </div>
          </div>
        </article>
        <article class="flip-card reveal" aria-label="ESP32 Secure Data Encryption project">
          <div class="flip-card-inner" tabindex="0" role="button" aria-label="Flip for details">
            <div class="flip-card-front">
              <div class="card-badges"><span class="project-category cat-iot">IoT &middot; Security</span><span class="card-tag-badge">&#128272; IoT Security</span></div>
              <h3 class="project-name">ESP32 Secure Encryption</h3>
              <p class="project-oneliner">Hardware-level AES-128 + SHA-256 encryption system with session key rotation and replay attack protection.</p>
              <span class="project-date">Feb &mdash; Mar 2025</span>
              <span class="flip-hint">&#8635; Hover to flip</span>
            </div>
            <div class="flip-card-back">
              <h3 class="project-back-title">ESP32 Encryption &mdash; Deep Dive</h3>
              <ul class="project-details">
                <li>ESP32 communication module with AES-128 + SHA-256 security layers</li>
                <li>Session-based key generation with automatic rotation protocol</li>
                <li>Replay attack protection optimised for embedded memory constraints</li>
              </ul>
              <div class="project-stack"><span class="stack-tag">Arduino</span><span class="stack-tag">C/C++</span><span class="stack-tag">AES-128</span><span class="stack-tag">SHA-256</span><span class="stack-tag">HC-SR04</span></div>
            </div>
          </div>
        </article>
        <article class="flip-card reveal" aria-label="VisualDebate project">
          <div class="flip-card-inner" tabindex="0" role="button" aria-label="Flip for details">
            <div class="flip-card-front">
              <div class="card-badges"><span class="project-category cat-ai">AI &middot; NLP</span><span class="card-tag-badge">&#129504; NLP / AI</span></div>
              <h3 class="project-name">VisualDebate</h3>
              <p class="project-oneliner">AI credibility intelligence platform that transcribes video, identifies claims via NLP, and generates fact-checked rebuttals.</p>
              <span class="project-date">Mar &mdash; Apr 2026</span>
              <span class="flip-hint">&#8635; Hover to flip</span>
            </div>
            <div class="flip-card-back">
              <h3 class="project-back-title">VisualDebate &mdash; Deep Dive</h3>
              <ul class="project-details">
                <li>Analyses YouTube videos, transcribes speech, identifies checkworthy claims</li>
                <li>RAG-based fact-checking pipeline with FAISS + DistilBERT evidence retrieval</li>
                <li>Dashboard with credibility scoring, timeline viz, AI-generated rebuttals</li>
              </ul>
              <div class="project-stack"><span class="stack-tag">Python</span><span class="stack-tag">FastAPI</span><span class="stack-tag">Streamlit</span><span class="stack-tag">Docker</span><span class="stack-tag">DistilBERT</span><span class="stack-tag">FAISS</span><span class="stack-tag">Faster-Whisper</span></div>
            </div>
          </div>
        </article>
      </div>
    </section>

    <section class="section" id="certifications" aria-labelledby="certs-title">
      <p class="section-label reveal">Credentials</p>
      <h2 class="section-title reveal" id="certs-title">Certified knowledge, applied expertise.</h2>
      <div class="certs-ribbon-wrapper reveal">
        <div class="certs-ribbon" role="list">
          <article class="cert-card" role="listitem"><div class="cert-icon" aria-hidden="true">&#128737;</div><h3 class="cert-title">Cybersecurity Foundations</h3><p class="cert-issuer">Infosys Springboard</p></article>
          <article class="cert-card" role="listitem"><div class="cert-icon" aria-hidden="true">&#128202;</div><h3 class="cert-title">Power BI &amp; Data Analytics</h3><p class="cert-issuer">Hack the Dash Workshop</p></article>
          <article class="cert-card" role="listitem"><div class="cert-icon" aria-hidden="true">&#9883;</div><h3 class="cert-title">Quantum Programming &mdash; QISKIT</h3><p class="cert-issuer">VIT School of CSE &amp; IS / Qiskit</p></article>
        </div>
      </div>
    </section>

    <section class="section" id="contact" aria-labelledby="contact-title">
      <div class="contact-wrapper">
        <div class="contact-card reveal">
          <p class="section-label">Let's Connect</p>
          <h2 class="contact-title" id="contact-title">Have an idea? Let's build it.</h2>
          <p class="contact-sub">Always open to collaborating on projects that push the boundaries of what software can do.</p>
          <div class="contact-links">
            <a href="mailto:mdadnan1903472@gmail.com" class="contact-link magnetic-el" aria-label="Email">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="M22 4L12 13 2 4"/></svg>Email</a>
            <a href="tel:+918778146085" class="contact-link magnetic-el" aria-label="Phone">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 16.92z"/></svg>+91 8778146085</a>
            <a href="http://www.linkedin.com/in/mohammed-adnan28" class="contact-link magnetic-el" target="_blank" rel="noopener noreferrer" aria-label="LinkedIn">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-4 0v7h-4v-7a6 6 0 016-6z"/><rect x="2" y="9" width="4" height="12"/><circle cx="4" cy="4" r="2"/></svg>LinkedIn</a>
            <a href="https://github.com/dashboard" class="contact-link magnetic-el" target="_blank" rel="noopener noreferrer" aria-label="GitHub">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 00-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0020 4.77 5.07 5.07 0 0019.91 1S18.73.65 16 2.48a13.38 13.38 0 00-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 005 4.77a5.44 5.44 0 00-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 009 18.13V22"/></svg>GitHub</a>
          </div>
          <button class="copy-email-btn" id="copy-email" aria-label="Copy email">
            <span class="copy-icon">&#128203;</span><span class="checkmark">&#10003;</span>
            <span id="copy-text">mdadnan1903472@gmail.com</span>
          </button>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <p class="footer-text">Crafted with obsession by <span class="footer-name">Mohammed Adnan</span> &mdash; 2026</p>
  </footer>

  <script>
    window.addEventListener('load',function(){var l=document.getElementById('loader');setTimeout(function(){l.classList.add('hidden');l.addEventListener('transitionend',function(){l.style.display='none';},{once:true});},1500);});

    window.addEventListener('scroll',function(){var p=document.getElementById('scroll-progress');p.style.width=Math.min((window.scrollY/(document.body.scrollHeight-window.innerHeight))*100,100)+'%';},{passive:true});

    (function(){
      var dot=document.querySelector('.custom-cursor'),ring=document.querySelector('.cursor-ring');
      if(!dot||!ring||'ontouchstart' in window)return;
      var mx=0,my=0,rx=0,ry=0;
      document.addEventListener('mousemove',function(e){mx=e.clientX;my=e.clientY;dot.style.left=mx+'px';dot.style.top=my+'px';});
      (function anim(){rx+=(mx-rx)*.12;ry+=(my-ry)*.12;ring.style.left=rx+'px';ring.style.top=ry+'px';requestAnimationFrame(anim);})();
      function addHover(els,dc,rc){els.forEach(function(el){el.addEventListener('mouseenter',function(){dot.classList.add(dc);ring.classList.add(rc);});el.addEventListener('mouseleave',function(){dot.classList.remove(dc);ring.classList.remove(rc);});});}
      addHover(document.querySelectorAll('.btn,.copy-email-btn,.filter-btn'),'btn-hover','btn-hover');
      addHover(document.querySelectorAll('a:not(.btn),.flip-card-inner,.skill-pill,.contact-link'),'hovering','hovering');
      var pw=document.querySelector('.hero-photo-wrap');
      if(pw){pw.addEventListener('mouseenter',function(){ring.classList.add('aperture');});pw.addEventListener('mouseleave',function(){ring.classList.remove('aperture');});}
    })();

    (function(){
      var canvas=document.getElementById('particle-canvas');if(!canvas)return;
      var ctx=canvas.getContext('2d'),particles=[],mouse={x:-9999,y:-9999},N=80;
      function resize(){canvas.width=canvas.offsetWidth;canvas.height=canvas.offsetHeight;}
      resize();window.addEventListener('resize',resize);
      canvas.parentElement.addEventListener('mousemove',function(e){var r=canvas.getBoundingClientRect();mouse.x=e.clientX-r.left;mouse.y=e.clientY-r.top;});
      canvas.parentElement.addEventListener('mouseleave',function(){mouse.x=-9999;mouse.y=-9999;});
      for(var i=0;i<N;i++)particles.push({x:Math.random()*canvas.width,y:Math.random()*canvas.height,vx:(Math.random()-.5)*.4,vy:(Math.random()-.5)*.4,r:Math.random()*1.5+.5,o:Math.random()*.5+.2});
      if(window.matchMedia('(prefers-reduced-motion:reduce)').matches)return;
      function draw(){
        ctx.clearRect(0,0,canvas.width,canvas.height);var cw=canvas.width;
        for(var i=0;i<particles.length;i++){
          var p=particles[i],dx=p.x-mouse.x,dy=p.y-mouse.y,d=Math.sqrt(dx*dx+dy*dy);
          if(d<100&&d>0){var f=(100-d)/100;p.vx+=dx/d*f*.3;p.vy+=dy/d*f*.3;}
          p.vx*=.99;p.vy*=.99;p.x+=p.vx;p.y+=p.vy;
          if(p.x<0)p.x=cw;if(p.x>cw)p.x=0;if(p.y<0)p.y=canvas.height;if(p.y>canvas.height)p.y=0;
          var ratio=p.x/cw,r=Math.round(ratio*80),g=Math.round(245-ratio*100),b=Math.round(196-ratio*80);
          ctx.beginPath();ctx.arc(p.x,p.y,p.r,0,Math.PI*2);ctx.fillStyle='rgba('+r+','+g+','+b+','+p.o+')';ctx.fill();
          for(var j=i+1;j<particles.length;j++){var q=particles[j],dd=Math.sqrt((p.x-q.x)*(p.x-q.x)+(p.y-q.y)*(p.y-q.y));if(dd<120){ctx.beginPath();ctx.moveTo(p.x,p.y);ctx.lineTo(q.x,q.y);ctx.strokeStyle='rgba(0,245,196,'+(1-dd/120)*.14+')';ctx.lineWidth=.5;ctx.stroke();}}
        }
        requestAnimationFrame(draw);
      }
      draw();
    })();

    (function(){
      var subs=[document.getElementById('sub-0'),document.getElementById('sub-1'),document.getElementById('sub-2')],cur=0;
      setInterval(function(){subs[cur].classList.remove('active');subs[cur].classList.add('exit');setTimeout(function(){subs.forEach(function(s){s.classList.remove('exit');});},500);cur=(cur+1)%subs.length;subs[cur].classList.add('active');},3000);
    })();

    (function(){
      var reveals=document.querySelectorAll('.reveal');
      var obs=new IntersectionObserver(function(entries){entries.forEach(function(e){if(!e.isIntersecting)return;var parent=e.target.closest('.section')||e.target.closest('.hero');if(parent){var siblings=parent.querySelectorAll('.reveal'),idx=Array.prototype.indexOf.call(siblings,e.target);e.target.style.transitionDelay=(idx*60)+'ms';}e.target.classList.add('visible');obs.unobserve(e.target);});},{threshold:.1,rootMargin:'0px 0px -40px 0px'});
      reveals.forEach(function(el){obs.observe(el);});
    })();

    (function(){
      var panel=document.getElementById('term-panel');if(!panel)return;
      var lines=panel.querySelectorAll('.term-line'),triggered=false;
      var obs=new IntersectionObserver(function(entries){if(!entries[0].isIntersecting||triggered)return;triggered=true;lines.forEach(function(line,i){setTimeout(function(){line.classList.add('visible');},i*130);});obs.disconnect();},{threshold:.3});
      obs.observe(panel);
    })();

    (function(){
      var btns=document.querySelectorAll('.filter-btn'),pills=document.querySelectorAll('.skill-pill');
      btns.forEach(function(btn){btn.addEventListener('click',function(){btns.forEach(function(b){b.classList.remove('active');});btn.classList.add('active');var filter=btn.getAttribute('data-filter');pills.forEach(function(p){if(filter==='all'||p.getAttribute('data-cat')===filter){p.classList.remove('dimmed');}else{p.classList.add('dimmed');}});});});
    })();

    (function(){
      var navLinks=document.querySelectorAll('.floating-nav .nav-link'),indicator=document.querySelector('.nav-indicator'),sections=document.querySelectorAll('section[id],header[id]');
      function setInd(l){if(!l||!indicator)return;indicator.style.left=l.offsetLeft+'px';indicator.style.width=l.offsetWidth+'px';}
      function update(){var sy=window.scrollY+window.innerHeight/3,cur='';sections.forEach(function(s){if(s.offsetTop<=sy)cur=s.id;});navLinks.forEach(function(l){l.classList.remove('active');if(l.getAttribute('data-section')===cur){l.classList.add('active');setInd(l);}});}
      window.addEventListener('scroll',update,{passive:true});update();setInd(document.querySelector('.nav-link.active'));
    })();

    (function(){
      var toggle=document.querySelector('.mobile-nav-toggle'),menu=document.getElementById('mobile-menu'),links=document.querySelectorAll('[data-mobile-nav]');
      if(!toggle||!menu)return;
      toggle.addEventListener('click',function(){var open=menu.classList.toggle('open');toggle.classList.toggle('active');toggle.setAttribute('aria-expanded',open);menu.setAttribute('aria-hidden',!open);});
      links.forEach(function(l){l.addEventListener('click',function(){menu.classList.remove('open');toggle.classList.remove('active');toggle.setAttribute('aria-expanded','false');menu.setAttribute('aria-hidden','true');});});
    })();

    (function(){
      var btn=document.getElementById('copy-email');if(!btn)return;
      btn.addEventListener('click',function(){navigator.clipboard.writeText('mdadnan1903472@gmail.com').then(function(){btn.classList.add('copied');document.getElementById('copy-text').textContent='Copied!';setTimeout(function(){btn.classList.remove('copied');document.getElementById('copy-text').textContent='mdadnan1903472@gmail.com';},2000);});});
    })();

    (function(){
      document.querySelectorAll('.magnetic-el,.magnetic-btn').forEach(function(el){el.addEventListener('mousemove',function(e){var r=el.getBoundingClientRect(),x=e.clientX-r.left-r.width/2,y=e.clientY-r.top-r.height/2;el.style.transform='translate('+(x*.18)+'px,'+(y*.18)+'px)';});el.addEventListener('mouseleave',function(){el.style.transition='transform .4s ease';el.style.transform='translate(0,0)';setTimeout(function(){el.style.transition='';},400);});});
    })();

    (function(){
      document.querySelectorAll('.btn').forEach(function(btn){btn.addEventListener('click',function(e){var r=btn.getBoundingClientRect(),rip=document.createElement('span'),size=Math.max(r.width,r.height);rip.className='ripple';rip.style.width=rip.style.height=size+'px';rip.style.left=e.clientX-r.left-size/2+'px';rip.style.top=e.clientY-r.top-size/2+'px';btn.appendChild(rip);rip.addEventListener('animationend',function(){rip.remove();});});});
    })();
  </script>
</body>
</html>
'@

$html = $html -replace 'PHOTO_PLACEHOLDER', $imgSrc
[System.IO.File]::WriteAllText('C:\Users\admin\.gemini\antigravity\scratch\adnan-portfolio\index.html', $html, [System.Text.Encoding]::UTF8)
Write-Host "Rebuilt successfully."
