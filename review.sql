CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,  -- 후기를 작성한 사용자 ID
    field_id INT NOT NULL,  -- 풋살장 ID
    rating TINYINT NOT NULL,  -- 평점 (1-5 등급 등)
    review_text TEXT,  -- 후기 텍스트
    review_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- 후기 작성 일자
    FOREIGN KEY (user_id) REFERENCES users(user_id),  -- 사용자 테이블과 연결
    FOREIGN KEY (field_id) REFERENCES field(field_id)  -- 풋살장 테이블과 연결
);

select * from field;