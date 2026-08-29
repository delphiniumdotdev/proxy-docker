sub_filter '</head>' '<link rel="stylesheet" href="/custom.css"></head>';
sub_filter_once on;

location = /custom.css {
    root /usr/share/nginx/html;
}
