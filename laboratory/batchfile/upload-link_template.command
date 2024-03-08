#!/bin/bash

current_dir=$(cd "$(dirname "$0")" && pwd)

youtube_csv="$current_dir/youtube.csv"
tiktok_csv="$current_dir/tiktok.csv"
twitter_csv="$current_dir/twitter.csv"
nicovideo_csv="$current_dir/nicovideo.csv"

youtube_html="$current_dir/youtube.html"
tiktok_html="$current_dir/tiktok.html"
twitter_html="$current_dir/twitter.html"
nicovideo_html="$current_dir/nicovideo.html"

function create_code_start () {
  templates=$(
    cat << EOF
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>$title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/reset.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../app/app-css/upload_link.css">
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-7MY5P9TV7J"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-7MY5P9TV7J');
    </script>
  </head>
  <body>
    <header class="site-header">
      <div class="site-header__wrapper">
        <div class="site-header__start">
          <a href="../../upload-link/app" class="brand">CHEAT</a>
        </div>
        <div class="site-header__middle">
          <nav class="nav">
            <button class="nav__toggle" aria-expanded="false" type="button" aria-haspopup="true" aria-label="menu">
              menu
            </button>
            <ul class="nav__wrapper">
              <!-- <li class="nav__item">
                <a href="../../index">
                  <svg viewBox="0 0 24 24" width="24px" height="24px" x="0" y="0" preserveAspectRatio="xMinYMin meet" class="nav-icon" focusable="false" xmlns="http://www.w3.org/2000/svg">
                    <path d="M22,9.45,12.85,3.26A1.52,1.52,0,0,0,12,3a1.49,1.49,0,0,0-.84.26L2,9.45,3.06,11,4,10.37V20a1,1,0,0,0,1,1h5V16h4v5h5a1,1,0,0,0,1-1V10.37l.94.63Z" class="active-item" style="fill-opacity: 1"></path>
                    <path d="M22,9.45L12.85,3.26a1.5,1.5,0,0,0-1.69,0L2,9.45,3.06,11,4,10.37V20a1,1,0,0,0,1,1h6V16h2v5h6a1,1,0,0,0,1-1V10.37L20.94,11ZM18,19H15V15a1,1,0,0,0-1-1H10a1,1,0,0,0-1,1v4H6V8.89l6-4,6,4V19Z" class="inactive-item" style="fill: currentColor"></path>
                  </svg>
                  <span>Home</span>
                </a>
              </li> -->
              <li class="nav__item">
                <a href="../../share_drive/top">
                  <svg viewBox="0 -25 200 200" width="200px" height="200px" preserveAspectRatio="xMinYMin meet" class="nav-icon" focusable="false" xmlns="http://www.w3.org/2000/svg">
                    <path d="M53.585,185.942a7.556,7.556,0,0,1-7.547-7.548v-4.528a7.555,7.555,0,0,1,7.547-7.547H64.906v-9.812H7.547A7.556,7.556,0,0,1,0,148.961V35a7.555,7.555,0,0,1,7.547-7.547H37.736V35H7.547v93.208H192.453V35H161.51V27.451h30.943A7.555,7.555,0,0,1,200,35V148.961a7.556,7.556,0,0,1-7.547,7.547H135.095v9.812h11.321a7.555,7.555,0,0,1,7.547,7.547v4.528a7.556,7.556,0,0,1-7.547,7.548Zm0-7.548h92.831v-4.528H53.585ZM72.453,166.32h55.094v-9.812H72.453ZM7.547,148.961H192.453V135.753H7.547ZM125.282,97.428,101.105,73.252a3.774,3.774,0,0,1,5.337-5.337l17.709,17.709V23.4a3.774,3.774,0,0,1,7.547,0V85.675l17.76-17.76a3.773,3.773,0,0,1,5.336,5.337L130.618,97.428a3.774,3.774,0,0,1-5.337,0ZM75.824,75.138V12.909L58.115,30.618a3.774,3.774,0,1,1-5.337-5.337L76.955,1.105a3.774,3.774,0,0,1,5.337,0l24.176,24.176a3.773,3.773,0,1,1-5.336,5.337l-17.76-17.76V75.138a3.774,3.774,0,0,1-7.547,0Z" class="active-item" style="fill: currentColor"></path>
                  </svg>
                  <span>Share Drive</span>
                </a>
              </li>
              <li class="nav__item">
                <a href="../../archive/top">
                  <svg viewBox="0 -35 200 200" width="200px" height="200px" x="0" y="0" preserveAspectRatio="xMinYMin meet" class="nav-icon" focusable="false" xmlns="http://www.w3.org/2000/svg">
                    <path d="M129.747,150.842a6.734,6.734,0,0,1-6.734-6.734V131.987a6.734,6.734,0,0,1,6.734-6.735h4.041v-13.8H103.365v13.8h3.485a6.734,6.734,0,0,1,6.734,6.735v12.121a6.734,6.734,0,0,1-6.734,6.734H92.71a6.734,6.734,0,0,1-6.734-6.734V131.987a6.734,6.734,0,0,1,6.734-6.735h3.922v-13.8H65.773v13.8h4.041a6.734,6.734,0,0,1,6.734,6.735v12.121a6.734,6.734,0,0,1-6.734,6.734H55a6.734,6.734,0,0,1-6.734-6.734V131.987A6.734,6.734,0,0,1,55,125.253h4.04V108.081a3.367,3.367,0,0,1,3.367-3.367H96.632V92.256H89.342a6.734,6.734,0,0,1-6.734-6.734V73.4a6.734,6.734,0,0,1,6.734-6.734h20.876a6.734,6.734,0,0,1,6.734,6.734V85.522a6.734,6.734,0,0,1-6.734,6.734h-6.853v12.458h33.788a3.367,3.367,0,0,1,3.367,3.367v17.172h4.04a6.735,6.735,0,0,1,6.735,6.735v12.121a6.734,6.734,0,0,1-6.735,6.734Zm0-6.734h14.815V131.987H129.747Zm-37.037,0h14.141V131.987H92.71Zm-37.71,0H69.814V131.987H55ZM89.342,85.522h20.876V73.4H89.342Zm-50.505,40.4h-1.8a37.037,37.037,0,1,1,0-74.074c.963,0,1.941.038,2.907.113a56.057,56.057,0,0,1,5.773-20.384,57.022,57.022,0,0,1,5.5-8.833A57.39,57.39,0,0,1,96.97,0,57.552,57.552,0,0,1,144.5,25.226a56.153,56.153,0,0,1,7.761,16.9A42.116,42.116,0,0,1,200,83.838a42.1,42.1,0,0,1-39.277,42v-6.75a35.356,35.356,0,1,0-13.7-68.89,50.363,50.363,0,0,0-31.9-40.119A50.651,50.651,0,0,0,55.09,28.853,49.722,49.722,0,0,0,46.465,56.9c0,1.055.035,2.136.1,3.213a30.31,30.31,0,1,0-9.53,59.077h1.8v6.733h0Z" class="active-item" style="fill: currentColor"></path>
                  </svg>
                  <span>Archive</span>
                </a>
              </li>
              <li class="nav__item">
                <a href="../../laboratory/top">
                  <svg viewBox="0 0 24 24" width="24px" height="24px" x="0" y="0" preserveAspectRatio="xMinYMin meet" class="nav-icon" focusable="false" xmlns="http://www.w3.org/2000/svg">
                    <path d="M16,17.85V20a1,1,0,0,1-1,1H1a1,1,0,0,1-1-1V17.85a4,4,0,0,1,2.55-3.73l2.95-1.2V11.71l-0.73-1.3A6,6,0,0,1,4,7.47V6a4,4,0,0,1,4.39-4A4.12,4.12,0,0,1,12,6.21V7.47a6,6,0,0,1-.77,2.94l-0.73,1.3v1.21l2.95,1.2A4,4,0,0,1,16,17.85Zm4.75-3.65L19,13.53v-1a6,6,0,0,0,1-3.31V9a3,3,0,0,0-6,0V9.18a6,6,0,0,0,.61,2.58A3.61,3.61,0,0,0,16,13a3.62,3.62,0,0,1,2,3.24V21h4a1,1,0,0,0,1-1V17.47A3.5,3.5,0,0,0,20.75,14.2Z" class="inactive-item" style="fill-opacity: 1"></path>
                    <path d="M20.74,14.2L19,13.54V12.86l0.25-.41A5,5,0,0,0,20,9.82V9a3,3,0,0,0-6,0V9.82a5,5,0,0,0,.75,2.63L15,12.86v0.68l-1,.37a4,4,0,0,0-.58-0.28l-2.45-1V10.83A8,8,0,0,0,12,7V6A4,4,0,0,0,4,6V7a8,8,0,0,0,1,3.86v1.84l-2.45,1A4,4,0,0,0,0,17.35V20a1,1,0,0,0,1,1H22a1,1,0,0,0,1-1V17.47A3.5,3.5,0,0,0,20.74,14.2ZM16,8.75a1,1,0,0,1,2,0v1.44a3,3,0,0,1-.38,1.46l-0.33.6a0.25,0.25,0,0,1-.22.13H16.93a0.25,0.25,0,0,1-.22-0.13l-0.33-.6A3,3,0,0,1,16,10.19V8.75ZM6,5.85a2,2,0,0,1,4,0V7.28a6,6,0,0,1-.71,2.83L9,10.72a1,1,0,0,1-.88.53H7.92A1,1,0,0,1,7,10.72l-0.33-.61A6,6,0,0,1,6,7.28V5.85ZM14,19H2V17.25a2,2,0,0,1,1.26-1.86L7,13.92v-1a3,3,0,0,0,1,.18H8a3,3,0,0,0,1-.18v1l3.72,1.42A2,2,0,0,1,14,17.21V19Zm7,0H16V17.35a4,4,0,0,0-.55-2l1.05-.4V14.07a2,2,0,0,0,.4.05h0.2a2,2,0,0,0,.4-0.05v0.88l2.53,1a1.5,1.5,0,0,1,1,1.4V19Z" class="active-item" style="fill: currentColor"></path>
                  </svg>
                  <span>Laboratory</span>
                </a>
              </li>
              <li class="nav__item">
                <a href="../app">
                  <svg viewBox="0 0 200 200" width="200px" height="200px" x="0" y="0" preserveAspectRatio="xMinYMin meet" class="nav-icon" focusable="false" xmlns="http://www.w3.org/2000/svg">
                    <path d="M153.2 0a24.32 24.32 0 0 0-16.92 6.7L100 42.98a24.31 24.31 0 0 0 .77 34.32l.54.53 14.4-14.39-.55-.54a4.08 4.08 0 0 1-.77-5.52l36.27-36.27a4.09 4.09 0 0 1 5.53.77l21.92 21.93a4.08 4.08 0 0 1 .78 5.53L142.63 85.6a4.08 4.08 0 0 1-5.52-.77l-.55-.55-14.39 14.4.54.54a24.3 24.3 0 0 0 34.32.77l36.26-36.27a24.31 24.31 0 0 0-.77-34.31L170.6 7.48A24.32 24.32 0 0 0 153.2 0Zm-21.32 59.4a8.85 8.85 0 0 0-6.38 2.58L67.6 119.87l-5.63 5.63A8.85 8.85 0 1 0 74.5 138l5.62-5.62L94.52 118l23.47-23.48 14.4-14.39L138 74.5a8.85 8.85 0 0 0-6.13-15.1Zm-71.2 33.92A24.3 24.3 0 0 0 42.97 100L6.7 136.27a24.31 24.31 0 0 0 .77 34.31l21.92 21.93a24.31 24.31 0 0 0 34.32.77l36.27-36.26a24.3 24.3 0 0 0-.78-34.32l-.54-.53-14.39 14.39.54.53a4.08 4.08 0 0 1 .77 5.53L49.32 178.9a4.08 4.08 0 0 1-5.52-.77l-21.93-21.93a4.08 4.08 0 0 1-.77-5.53l36.26-36.26a4.08 4.08 0 0 1 5.53.77l.54.54 14.4-14.4-.54-.53a24.3 24.3 0 0 0-16.6-7.46Z" class="active-item" style="fill: currentColor"></path>
                  </svg>
                  <span>Upload Link</span>
                </a>
              </li>
              <li class="nav__item">
                <a onclick="authentication()">
                  <svg viewBox="0 -25 200 200" width="200px" height="200px" x="0" y="0" preserveAspectRatio="xMinYMin meet" class="nav-icon" focusable="false" xmlns="http://www.w3.org/2000/svg">
                    <path d="M39.8,0a7.545,7.545,0,0,0-7.559,7.565V21.93A7.545,7.545,0,0,0,39.8,29.495h.83A7.55,7.55,0,0,0,48.2,21.93V7.565A7.55,7.55,0,0,0,40.634,0ZM159.7,0a7.55,7.55,0,0,0-7.565,7.565V21.93a7.55,7.55,0,0,0,7.565,7.565h.83a7.545,7.545,0,0,0,7.559-7.565V7.565A7.545,7.545,0,0,0,160.533,0ZM11.881,15.287A11.881,11.881,0,0,0,0,27.168V159.842a11.881,11.881,0,0,0,11.881,11.881H188.119A11.881,11.881,0,0,0,200,159.842V27.168a11.881,11.881,0,0,0-11.881-11.881H172.646v7.774a11.881,11.881,0,0,1-11.881,11.881h-1.3a11.881,11.881,0,0,1-11.881-11.881V15.287H52.759v7.774A11.881,11.881,0,0,1,40.877,34.942H39.566A11.881,11.881,0,0,1,27.685,23.061V15.287Zm6.927,36.631H181.192a2.97,2.97,0,0,1,2.97,2.97v97.035a2.97,2.97,0,0,1-2.97,2.97H18.808a2.97,2.97,0,0,1-2.97-2.97V54.888A2.97,2.97,0,0,1,18.808,51.917Zm14.55,20.752a2.964,2.964,0,0,0-2.97,2.97V94.692a2.964,2.964,0,0,0,2.97,2.97H64a2.964,2.964,0,0,0,2.97-2.97V75.64A2.964,2.964,0,0,0,64,72.669Zm50.9,0a2.964,2.964,0,0,0-2.97,2.97V94.692a2.964,2.964,0,0,0,2.97,2.97H114.9a2.964,2.964,0,0,0,2.97-2.97V75.64a2.964,2.964,0,0,0-2.97-2.97Zm50.908,0a2.964,2.964,0,0,0-2.97,2.97V94.692a2.964,2.964,0,0,0,2.97,2.97H165.8a2.964,2.964,0,0,0,2.97-2.97V75.64a2.964,2.964,0,0,0-2.97-2.97ZM33.358,112.293a2.964,2.964,0,0,0-2.97,2.97v19.052a2.964,2.964,0,0,0,2.97,2.97H64a2.964,2.964,0,0,0,2.97-2.97V115.264a2.964,2.964,0,0,0-2.97-2.97Zm50.9,0a2.964,2.964,0,0,0-2.97,2.97v19.052a2.964,2.964,0,0,0,2.97,2.97H114.9a2.964,2.964,0,0,0,2.97-2.97V115.264a2.964,2.964,0,0,0-2.97-2.97Zm50.908,0a2.964,2.964,0,0,0-2.97,2.97v19.052a2.964,2.964,0,0,0,2.97,2.97H165.8a2.964,2.964,0,0,0,2.97-2.97V115.264a2.964,2.964,0,0,0-2.97-2.97Z"></path>
                  </svg>
                  <span>Calendar</span>
                </a>
              </li>
              <li class="nav__item">
                <a onclick="notifications()">
                  <svg viewBox="0 0 24 24" width="24px" height="24px" x="0" y="0" preserveAspectRatio="xMinYMin meet" class="nav-icon" focusable="false" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18.94,14H5.06L5.79,8.44A6.26,6.26,0,0,1,12,3h0a6.26,6.26,0,0,1,6.21,5.44Zm2,5-1.71-4H4.78L3.06,19a0.71,0.71,0,0,0-.06.28,0.75,0.75,0,0,0,.75.76H10a2,2,0,1,0,4,0h6.27A0.74,0.74,0,0,0,20.94,19Z" class="inactive-item" style="fill-opacity: 1"></path>
                    <path d="M20.94,19L19,14.49s-0.41-3.06-.8-6.06A6.26,6.26,0,0,0,12,3h0A6.26,6.26,0,0,0,5.79,8.44L5,14.49,3.06,19a0.71,0.71,0,0,0-.06.28,0.75,0.75,0,0,0,.75.76H10a2,2,0,1,0,4,0h6.27A0.74,0.74,0,0,0,20.94,19ZM12,4.75h0a4.39,4.39,0,0,1,4.35,3.81c0.28,2.1.56,4.35,0.7,5.44H7L7.65,8.56A4.39,4.39,0,0,1,12,4.75ZM5.52,18l1.3-3H17.18l1.3,3h-13Z" class="active-item" style="fill: currentColor"></path>
                  </svg>
                  <span>Notifications</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    <div class="margin-0 outerMargin-top makeScrollable outerMargin md:outerMargin overscroll-contain bgColor-opacity bgColor">
      <div class="mx-auto">
        <div class="container mx-auto sm:tableMargin textColor">
          <h2 class="title-while titleSize fontSemibold">$title</h2>
          <div class="makeScrollable">
            <table class="table-minWidth100 table-textSize">
              <colgroup>
                <col>
                <col>
                <col>
              </colgroup>
              <thead class="thead-bgColor">
                <tr class="tr-textLeft">
                  <th class="cellSize">#</th>
                  <th class="cellSize">TITLE</th>
                  <th class="cellSize">STATUS</th>
                </tr>
              </thead>
                <tbody>
EOF
  )
  echo "$templates" >> "$txt_file"
}

function create_code_youtube () {
  count=0
  while IFS=, read -r col1 col2 col3 || [[ -n $col3 ]]; do
    count=$((count + 1))
    col2=$(echo "$col2" | tr -d '\r')
    col3=$(echo "$col3" | tr -d '\r')
    if [ "$col3" = "Enable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Enable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    elif [ "$col3" = "Disable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Disable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    fi
    echo "$templates" >> "$youtube_html"
  done < "$youtube_csv"
}

function create_code_tiktok () {
  count=0
  while IFS=, read -r col1 col2 col3 || [[ -n $col3 ]]; do
    count=$((count + 1))
    col2=$(echo "$col2" | tr -d '\r')
    col3=$(echo "$col3" | tr -d '\r')
    if [ "$col3" = "Enable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Enable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    elif [ "$col3" = "Disable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Disable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    fi
    echo "$templates" >> "$tiktok_html"
  done < "$tiktok_csv"
}

function create_code_twitter () {
  count=0
  while IFS=, read -r col1 col2 col3 || [[ -n $col3 ]]; do
    count=$((count + 1))
    col2=$(echo "$col2" | tr -d '\r')
    col3=$(echo "$col3" | tr -d '\r')
    if [ "$col3" = "Enable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Enable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    elif [ "$col3" = "Disable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Disable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    fi
    echo "$templates" >> "$twitter_html"
  done < "$twitter_csv"
}

function create_code_nicovideo () {
  count=0
  while IFS=, read -r col1 col2 col3 || [[ -n $col3 ]]; do
    count=$((count + 1))
    col2=$(echo "$col2" | tr -d '\r')
    col3=$(echo "$col3" | tr -d '\r')
    if [ "$col3" = "Enable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Enable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    elif [ "$col3" = "Disable" ]; then
      templates=$(
        cat << EOF
                  <tr class="borderLine borderColor bgColor">
                    <td class="cellSize">
                      <p class="number">$count</p>
                    </td>
                    <td class="cellSize">
                      <a class="link" href="$col1">
                        <p>$col2</p>
                      </a>
                    </td>
                    <td class="cellSize">
                      <span class="fontSemibold roundedCorner status statusBatch statusBatch-Disable statusBatch-textColor">
                        <span>$col3</span>
                      </span>
                    </td>
                  </tr>
EOF
      )
    fi
    echo "$templates" >> "$nicovideo_html"
  done < "$nicovideo_csv"
}

function create_code_end () {
  templates=$(
    cat << EOF
                </tbody>
              </table>
            <br>
          </div>
        </div>
      </div>
    </div>
    <footer class="automatic_laboratory">
      <p class="automatic_laboratory">☆ cheat.net</p>
    </footer>
    <script src="../../js/admin.js"></script>
  </body>
</html>

<style>
  body,html {
    height: 100%;
    background-color: #1f2937;
  }

  footer {
    width: 100%;
    height: 30px;
  }
</style>
EOF
  )
  templates=$(perl -pe 'chomp if eof' <<< "$templates")
  echo "$templates" | perl -pe 'chomp if eof' >> "$txt_file"
}

function echo_tmp () {
  echo -e "\033[1;31mERROR: 読込用 csv ファイルがありません。 $current_dir に csv ファイルを配置して下さい。\033[0m"
  echo "以下の入力方法に従って、必要なものを記入したものが対象です。"
  echo "一度に変換できるのは一つの csv のみであり、複数のファイルを読み込むとカウントがバグります。"
  echo "※csvの一列目には動画等のURL、二列目にはタイトルを入力します。"
  echo
  echo "| https:// | タイトル1 |"
  echo "| https:// | タイトル2 |"
  echo "| https:// | タイトル3 |"
  echo
  exit 1
}

function echo_tmp_youtube () {
  echo -e "\033[1;32mALL SUCCESSFUL: ファイルの出力処理が正常に終了しました。\033[0m"
  echo -e "\033[1;32m$youtube_html は $current_dir に格納されています。\033[0m"
  echo
}

function echo_tmp_tiktok () {
  echo -e "\033[1;32mALL SUCCESSFUL: ファイルの出力処理が正常に終了しました。\033[0m"
  echo -e "\033[1;32m$tiktok_html は $current_dir に格納されています。\033[0m"
  echo
}

function echo_tmp_twitter () {
  echo -e "\033[1;32mALL SUCCESSFUL: ファイルの出力処理が正常に終了しました。\033[0m"
  echo -e "\033[1;32m$twitter_html は $current_dir に格納されています。\033[0m"
  echo
}

function echo_tmp_nicovideo () {
  echo -e "\033[1;32mALL SUCCESSFUL: ファイルの出力処理が正常に終了しました。\033[0m"
  echo -e "\033[1;32m$nicovideo_html は $current_dir に格納されています。\033[0m"
  echo
}

if [ -f "$youtube_csv" ]; then
  txt_file=$youtube_html
  title="Youtube"
  create_code_start
  create_code_youtube
  create_code_end
  echo_tmp_youtube
fi

if [ -f "$tiktok_csv" ]; then
  txt_file=$tiktok_html
  title="Tiktok"
  create_code_start
  create_code_tiktok
  create_code_end
  echo_tmp_tiktok
fi

if [ -f "$twitter_csv" ]; then
  txt_file=$twitter_html
  title="Twitter"
  create_code_start
  create_code_twitter
  create_code_end
  echo_tmp_twitter
fi

if [ -f "$nicovideo_csv" ]; then
  txt_file=$nicovideo_html
  title="nicovideo"
  create_code_start
  create_code_nicovideo
  create_code_end
  echo_tmp_nicovideo
fi
