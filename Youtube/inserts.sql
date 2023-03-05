insert into user values (1, '1234', 'Susana','susana@gmail.com','F','Spain',08310);
insert into user values (2, '1234', 'Andrea','andrea@gmail.com','F','Spain',08310);
insert into user values (3, '1234', 'Pere','pere@gmail.com','M','Spain',08310);

insert into channels values (1,1,'Channel 1', null, now());
insert into channels values (2,3,'Channel 2', null, now());

insert into subscribed_channels values (1,1);
insert into subscribed_channels values (1,2);
insert into subscribed_channels values (3,1);

insert into playlist values (1,'playlist 1', now(), 'Privat', 1);
insert into playlist values (2,'playlist 2', now(), 'Privat', 3);

insert into videos values (1,'video 1', 'description1',123.1, null,null, null, 'Private',1, now());
insert into videos values (2,'video 2', 'description2',123.1, null,null, null, 'Private',1, now());
insert into videos values (3,'video 3', 'description3',123.1, null,null, null, 'Private',2, now());
insert into videos values (4,'video 4', 'description4',123.1, null,null, null, 'Private',3, now());

insert into playlist_has_videos values (1, 1);
insert into playlist_has_videos values (1, 4);
insert into playlist_has_videos values (2, 1);
insert into playlist_has_videos values (2, 2);
insert into playlist_has_videos values (2, 3);
insert into playlist_has_videos values (2, 4);

insert into video_like_dislike values (1,1,'2023-02-25',null);
insert into video_like_dislike values (1,3,null, '2023-02-25');

insert into tags values (1,'tag1');
insert into tags values (2,'tag2');
insert into videos_has_tags values (3,1);

insert into video_information values (4,23,23,12);

insert into comments values (1,1,1,'no me ha gustado', '2023-01-18');
insert into comments values (2,1,1,'Fantástico', '2023-01-18');



