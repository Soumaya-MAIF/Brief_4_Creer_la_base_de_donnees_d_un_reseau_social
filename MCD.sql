CREATE DATABASE my_social_network

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name         VARCHAR(70) NOT NULL,
  lastname     VARCHAR(70) NOT NULL,
  mail         VARCHAR(100) NOT NULL,
  password     VARCHAR(42),
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE share_group (
   id SERIAL PRIMARY KEY,
   membre VARCHAR(100),
);

CREATE TABLE post (
  id SERIAL PRIMARY KEY,
  title        VARCHAR(100),
  content      TEXT,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  users_id      INT NOT NULL REFERENCES users(id)
  parent_post INT REFERENCES post(id)
  notification BOOLEAN false
  share_group_id INT REFERENCES share_group(id)
);

CREATE TABLE role (
   id SERIAL PRIMARY KEY,
   administrateur VARCHAR(100),
   moderateur VARCHAR (100),
   visiteur VARCHAR (100)
);

CREATE TABLE attachement (
  id SERIAL PRIMARY KEY,
  picture VARCHAR (250),
  link     VARCHAR(100),
  post_id INT NOT NULL REFERENCES post(id)
);


CREATE TABLE share_group_post (
  share_group_id INT NOT NULL,
  users_id INT NOT NULL,
  PRIMARY KEY(share_group_id, users_id),
  FOREIGN KEY (share_group_id) REFERENCES share_group(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);


CREATE TABLE follow (
  users_id INT NOT NULL,
  follower_id  INT NOT NULL,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(users_id, follower_id),
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE share_group_role (
  share_group_id INT NOT NULL,
  role_id  INT NOT NULL,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(share_group_id, role_id),
  FOREIGN KEY (share_group_id) REFERENCES share_group(id),
  FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE users_role (
  users_id INT NOT NULL,
  role_id  INT NOT NULL,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(users_id, role_id),
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (role_id) REFERENCES role(id)
);




