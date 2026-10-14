"""Generate CotizaPro brand rasters. Not part of the app runtime."""

from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path('/workspace')
BRAND = ROOT / 'assets' / 'branding'
FONT = ROOT / 'assets' / 'fonts' / 'Manrope-Bold.ttf'

NAVY = (11, 31, 58, 255)
TEAL = (14, 124, 120, 255)
WHITE = (255, 255, 255, 255)
LINE = (176, 190, 204, 255)


def _mark(size: int, document, accent, line, check, background=None) -> Image.Image:
    image = Image.new('RGBA', (size, size), background or (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    margin = int(size * 0.18)
    top = int(size * 0.14)
    left, right = margin, size - margin
    bottom = size - top
    radius = int(size * 0.09)
    draw.rounded_rectangle((left, top, right, bottom), radius=radius, fill=document)

    fold = int(size * 0.18)
    draw.polygon(
        [(right - fold, top), (right, top + fold), (right - fold, top + fold)],
        fill=accent,
    )

    line_left = left + int(size * 0.12)
    line_right = right - int(size * 0.16)
    thickness = max(4, int(size * 0.028))
    for index, ratio in enumerate((0.40, 0.50, 0.60)):
        y = int(size * ratio)
        end = line_right if index else line_right - int(size * 0.12)
        draw.rounded_rectangle(
            (line_left, y, end, y + thickness),
            radius=thickness,
            fill=line,
        )

    radius_badge = int(size * 0.145)
    center_x = int(size * 0.68)
    center_y = int(size * 0.70)
    draw.ellipse(
        (
            center_x - radius_badge,
            center_y - radius_badge,
            center_x + radius_badge,
            center_y + radius_badge,
        ),
        fill=accent,
    )
    stroke = max(6, int(size * 0.045))
    start = (center_x - radius_badge * 0.42, center_y + radius_badge * 0.05)
    mid = (center_x - radius_badge * 0.05, center_y + radius_badge * 0.38)
    end = (center_x + radius_badge * 0.46, center_y - radius_badge * 0.34)
    draw.line((start, mid), fill=check, width=stroke)
    draw.line((mid, end), fill=check, width=stroke)
    return image


def _wordmark(mark: Image.Image, text_color, background=None) -> Image.Image:
    canvas = Image.new('RGBA', (1600, 480), background or (0, 0, 0, 0))
    glyph = mark.resize((360, 360), Image.Resampling.LANCZOS)
    canvas.paste(glyph, (48, 60), glyph)
    draw = ImageDraw.Draw(canvas)
    font = ImageFont.truetype(str(FONT), 148)
    draw.text((450, 145), 'CotizaPro', font=font, fill=text_color)
    return canvas


def _save(image: Image.Image, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    image.save(path, 'PNG')


def main() -> None:
    on_dark = _mark(1024, WHITE, TEAL, (11, 31, 58, 90), WHITE)
    on_light = _mark(1024, NAVY, TEAL, (255, 255, 255, 210), WHITE)
    icon = _mark(1024, WHITE, TEAL, (11, 31, 58, 90), WHITE, background=NAVY)
    _save(on_dark, BRAND / 'mark_on_dark.png')
    _save(on_light, BRAND / 'mark_on_light.png')
    _save(icon, BRAND / 'app_icon.png')
    _save(_wordmark(on_light, NAVY), BRAND / 'logo_light.png')
    _save(_wordmark(on_dark, WHITE, background=NAVY), BRAND / 'logo_dark.png')
    _save(_wordmark(on_light, NAVY, background=(243, 245, 247, 255)), BRAND / 'logo_on_light_surface.png')

    android = {
        'mipmap-mdpi': 48,
        'mipmap-hdpi': 72,
        'mipmap-xhdpi': 96,
        'mipmap-xxhdpi': 144,
        'mipmap-xxxhdpi': 192,
    }
    res = ROOT / 'android/app/src/main/res'
    for folder, size in android.items():
        icon.resize((size, size), Image.Resampling.LANCZOS).save(
            res / folder / 'ic_launcher.png'
        )

    splash = {
        'drawable-mdpi': 96,
        'drawable-hdpi': 144,
        'drawable-xhdpi': 192,
        'drawable-xxhdpi': 288,
        'drawable-xxxhdpi': 384,
    }
    for folder, size in splash.items():
        on_dark.resize((size, size), Image.Resampling.LANCZOS).save(
            res / folder / 'splash_logo.png'
        )

    ios_icon = ROOT / 'ios/Runner/Assets.xcassets/AppIcon.appiconset'
    ios_sizes = {
        'Icon-App-20x20@1x.png': 20,
        'Icon-App-20x20@2x.png': 40,
        'Icon-App-20x20@3x.png': 60,
        'Icon-App-29x29@1x.png': 29,
        'Icon-App-29x29@2x.png': 58,
        'Icon-App-29x29@3x.png': 87,
        'Icon-App-40x40@1x.png': 40,
        'Icon-App-40x40@2x.png': 80,
        'Icon-App-40x40@3x.png': 120,
        'Icon-App-60x60@2x.png': 120,
        'Icon-App-60x60@3x.png': 180,
        'Icon-App-76x76@1x.png': 76,
        'Icon-App-76x76@2x.png': 152,
        'Icon-App-83.5x83.5@2x.png': 167,
        'Icon-App-1024x1024@1x.png': 1024,
    }
    for name, size in ios_sizes.items():
        icon.resize((size, size), Image.Resampling.LANCZOS).save(ios_icon / name)

    launch = ROOT / 'ios/Runner/Assets.xcassets/LaunchImage.imageset'
    for name, size in (
        ('LaunchImage.png', 120),
        ('LaunchImage@2x.png', 240),
        ('LaunchImage@3x.png', 360),
    ):
        on_dark.resize((size, size), Image.Resampling.LANCZOS).save(launch / name)

    print('brand assets written')


if __name__ == '__main__':
    main()
