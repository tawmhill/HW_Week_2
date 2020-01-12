DROP TABLE IF EXISTS tblVideos;
DROP TABLE IF EXISTS tblReviewers;

CREATE TABLE tblVideos
(
  video_id varchar(2) PRIMARY KEY,
  title varchar(255),
  duration smallint,
  url varchar(255)
  );
  
  INSERT INTO tblVideos ( video_id, title, duration, url ) VALUES ( 1, 'How to Make Perfect Bagels at Home | Serious Eats', 7, 'https://www.youtube.com/watch?v=Tzulvifb_GA');
  INSERT INTO tblVideos ( video_id, title, duration, url ) VALUES ( 2, 'How to Make Restaurant-Quality Fish and Chips', 10, 'https://www.youtube.com/watch?v=ah9cyDr0iOc');
  INSERT INTO tblVideos ( video_id, title, duration, url ) VALUES ( 3, 'The Sound of a Chocolate Cut | ASMR (-_-)zzz',  19, 'https://www.youtube.com/watch?v=KZczPprA5Hc');

CREATE TABLE tblReviewers
(
  user_name varchar(30) NOT NULL,
  video_reviewed INT NOT NULL REFERENCES tblVideos,
  rating tinyint,
  review_body varchar(255) NOT NULL
  );

  INSERT INTO tblReviewers ( user_name, video_reviewed, rating, review_body ) VALUES ( 'Asher', 1, 2, "Nice try, but these aren't real NY bagels. The water will never be right!");
  INSERT INTO tblReviewers ( user_name, video_reviewed, rating, review_body ) VALUES ( 'Asher', 2, 3, "That fish doesn't look very fresh :-(");
  INSERT INTO tblReviewers ( user_name, video_reviewed, rating, review_body ) VALUES ('Asher', 3, 5, "10/10, would watch again");
  INSERT INTO tblReviewers ( user_name, video_reviewed, rating, review_body ) VALUES ( 'Cyd', 1, 4, "Where can I buy SAF yeast?");
  INSERT INTO tblReviewers ( user_name, video_reviewed, review_body ) VALUES ( 'Cyd', 3, "What's the matter with you people??");
 
SELECT user_name AS "User", title AS "Title" , duration AS "Duration (minutes)", rating AS "Rating (0-5)", review_body AS "Review"
FROM tblReviewers r
INNER JOIN tblVideos v ON v.video_ID = r.video_reviewed;