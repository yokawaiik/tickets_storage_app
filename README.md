# Ticket storage (Documents storage)

## Description

A small application project where the user can differentiate between different tickets (or other files). An application can be part of something bigger such as storage for storing documents.

## Content table

- [Ticket storage (Documents storage)](#ticket-storage-documents-storage)
  - [Description](#description)
  - [Content table](#content-table)
  - [Platforms](#platforms)
  - [Stack](#stack)
  - [Features](#features)
    - [Main](#main)
    - [Tickets storage](#tickets-storage)
  - [Demonstration](#demonstration)
  - [Useful links](#useful-links)
  - [Author contacts](#author-contacts)
  - [License](#license)

## Platforms
- Android
- IOS

## Stack
- [x] Bloc state manager;
- [x] Isar database with generators;
- [x] get_it - service locator to dependencies management;
- [x] go_router - navigation;
- [x] flutter_download_manager - to manage download and show progress;
- [x] slang - to localize app;
- [x] and others dependencies...

## Features
### Main
- [x] App icon;
- [x] Settings (with bloc and Shared Preferences);
- [x] Localization (with slang and bloc).

### Tickets storage
- [x] Add PDF file url;
- [x] Download PDF file;
- [x] ListView with infinite scroll;
- [x] Every list item has its state where a state of downloading is controlled;
- [x] Bloc controlls global state where it contains handled data was got from local database;
- [x] User can see a ticket's PDF file if it has been downloaded;
- [x] Delete list item by swipe;
- [x] Delete selected group items.

## Demonstration

## Useful links
- https://m3.material.io/theme-builder#/custom

## Author contacts
Made by @yokawaiik

<p>
  <a href="https://mail.google.com/mail/u/0/#search/yokawaiik%40gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"/></a>
  <a href="https://instagram.com/yokawaiik"><img src="https://img.shields.io/badge/instagram-E4405F.svg?style=for-the-badge&logo=instagram&logoColor=white"/></a>
  <a href="https://linkedin.com/in/danil-shubin"><img src="https://img.shields.io/badge/linkedin-0077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white"/></a>
  <a href="https://t.me/yokawaiik"><img src="https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white"/></a>
</p>

## License
GPL