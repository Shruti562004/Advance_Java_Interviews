SELECT * FROM advjava.marksheet;
use advjava;
/*single index*/
create index idx_marks
on marksheet(name);

SELECT * FROM marksheet
WHERE name = "abc";

/*. Composite Index*/

create index phy_chem
on marksheet(phy,chem);

SELECT * FROM marksheet
WHERE phy = 76 and chem=78;

/*unique*/

create unique index unique_mark
on marksheet(phy);

select * from marksheet
where phy=78;

/*primary*/
SELECT * FROM marksheet
WHERE id = 2;