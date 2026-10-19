SELECT * FROM advjava.department;
/*without parameter*/
DELIMITER //
create procedure getCom()
begin
select * from companys;
end //
DELIMITER ;

use advjava;

/*In*/

DELIMITER //
create procedure getCom(in com_id int)
begin
select * from companys where id =com_id;
end //
DELIMITER ;

call getCom(1);
SELECT * FROM companys;

/*out*/
DROP PROCEDURE IF EXISTS getMarks;

DELIMITER //

create procedure getMarks(in m_id int , out m_phy int)
begin
select phy into m_phy
from marksheet where id=m_id;

end //
DELIMITER ;



call getMarks(4,@s);
SELECT @s;

DELIMITER //

CREATE PROCEDURE insertMarks(
    IN m_id INT,
    IN m_name VARCHAR(50),
    IN m_phy INT,
    IN m_maths INT,
    OUT msg VARCHAR(100)
)
BEGIN
    INSERT INTO marksheet(id, name, phy, maths)
    VALUES (m_id, m_name, m_phy, m_maths);

    SET msg = 'Record inserted successfully';
END //

DELIMITER ;

CALL insertMarks(33, 'Shruti', 85, 90, @result);

SELECT @result;

SELECT * FROM marksheet;
/*in out*/
DROP PROCEDURE IF EXISTS doubleMarks;
DELIMITER //

CREATE PROCEDURE doubleMarks(INOUT m_phy INT)
BEGIN
      SET m_phy = m_phy * 2;

END //

DELIMITER ;



CALL doubleMarks(@p);

SELECT @p;

select * from marksheet;

/*merge*/

DROP PROCEDURE IF EXISTS manageMarks;

DELIMITER //

CREATE PROCEDURE manageMarks(
    IN m_id INT,
    OUT m_name VARCHAR(50),
    INOUT m_phy INT
)
BEGIN
    -- OUT: Get student name
    SELECT name INTO m_name
    FROM marksheet
    WHERE id = m_id;

    -- INOUT: Update physics marks
     SET m_phy = m_phy * 2;

    -- Return all records
    SELECT * FROM marksheet;
END //

DELIMITER ;

set @name='';
set @phy=70;
CALL manageMarks(1, @name, @phy);

SELECT @name AS student_name,
       @phy AS updated_physics_marks;
       
       
       use advjava;
       
       /*all*/
       
       DELIMITER //
       create procedure getComp(in com_id int , out com_name  varchar(34) , inout com_age int)
       begin 
       select name into com_name from companys where id=com_id ;
       set com_age=com_age+2;
       end//
        DELIMITER ;
       set @age=2;
       call getComp(1,@name,@age);
       select @name,@age;
       