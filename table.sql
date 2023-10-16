-- 사용자 관리 테이블
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * From users;


-- 예약 테이블
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,  -- 예약한 사용자 ID
    field_id INT NOT NULL,  -- 풋살장 ID
    reservation_date DATE NOT NULL,  -- 예약한 날짜
    start_time TIME NOT NULL,  -- 예약 시작 시간
    end_time TIME NOT NULL,  -- 예약 종료 시간
    reservation_date_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- 예약 생성 일자 및 시간
    FOREIGN KEY (user_id) REFERENCES users(user_id),  -- 사용자 테이블과 연결
    FOREIGN KEY (field_id) REFERENCES field(field_id)  -- 풋살장 테이블과 연결
);

select * from reservations;



-- 사용자가 예약 생성
insert into Reservations(user_id, reservation_date, start_time, end_time)
values(1, '2023-10-15', '10:00:00', '12:00:00');

select * from Reservations;

-- 풋살장 정보 저장 테이블
CREATE TABLE field (
    field_id INT AUTO_INCREMENT PRIMARY KEY, -- 고유값 제공
    field_number INT NOT NULL,
    field_type VARCHAR(50) NOT NULL,
    capacity INT,
    rate DECIMAL(10, 2) NOT NULL,
    description TEXT,
    is_available BOOLEAN DEFAULT TRUE
);
-- 풋살장 예약 가능 확인 
SELECT * FROM field
WHERE field_id NOT IN (
    SELECT field_id
    FROM Reservations
    WHERE reservation_date = '2023-10-15'
    AND (
        (start_time >= '10:00:00' AND start_time < '12:00:00')
     OR (end_time > '10:00:00' AND end_time <= '12:00:00')
    )
);
