-- 사용자 관리 테이블
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * From users;
-- 예약 정보 저장 테이블
CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    reservation_date DATE,
    start_time TIME,
    end_time TIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

SELECT * FROM reservations;



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
