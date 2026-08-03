import sys
from PIL import Image

def make_transparent(img_path, out_path):
    img = Image.open(img_path).convert("RGBA")
    data = img.getdata()

    # The background color is a light off-white (e.g. RGB(246, 243, 227) roughly).
    # Sample from top left
    bg_color = data[0]
    
    new_data = []
    for item in data:
        # Calculate color distance
        dist = ((item[0] - bg_color[0])**2 + (item[1] - bg_color[1])**2 + (item[2] - bg_color[2])**2) ** 0.5
        
        if dist < 20:
            # Transparent
            new_data.append((item[0], item[1], item[2], 0))
        elif dist < 80:
            # Anti-aliased edge fading
            alpha = int((dist - 20) / 60.0 * 255)
            new_data.append((item[0], item[1], item[2], alpha))
        else:
            new_data.append(item)
            
    img.putdata(new_data)
    img.save(out_path, "PNG")

make_transparent(
    r"C:\Users\admin\.gemini\antigravity\brain\9aae2a2c-ff29-42c1-8a1e-6a129124cbd4\media__1785781735400.png",
    r"assets\farida-logo.png"
)
