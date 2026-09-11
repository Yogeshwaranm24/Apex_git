CREATE TABLE employee (
    employee_id       NUMBER PRIMARY KEY,
    employee_name     VARCHAR2(200),
    email             VARCHAR2(320),
    manager_id        NUMBER,
    leave_balance     NUMBER(5,2) DEFAULT 0,
    active_flag       CHAR(1) DEFAULT 'Y'
);
