Mime::Type.register "image/svg+xml", :svg
Mime::Type.register "image/png", :png, %w(image/png), %w(png)
Mime::Type.register "image/gif", :gif, [], %w(gif)
Mime::Type.register "image/jpeg", :jpg, [], %w(jpeg jpg jpe)
Mime::Type.register "image/webp", :webp