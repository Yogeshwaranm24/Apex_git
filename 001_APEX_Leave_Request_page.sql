DECLARE
    l_request_id  NUMBER;
    l_manager_id  NUMBER;
BEGIN

    SELECT manager_id
      INTO l_manager_id
      FROM employee
     WHERE employee_id = :P10_EMPLOYEE_ID;

    INSERT INTO leave_request (
        employee_id,
        leave_type,
        from_date,
        to_date,
        number_of_days,
        reason,
        status,
        manager_id
    )
    VALUES (
        :P10_EMPLOYEE_ID,
        :P10_LEAVE_TYPE,
        :P10_FROM_DATE,
        :P10_TO_DATE,
        :P10_NUMBER_OF_DAYS,
        :P10_REASON,
        'PENDING_MANAGER',
        l_manager_id
    )
    RETURNING request_id INTO l_request_id;

    INSERT INTO leave_request_history (
        request_id,
        action_by,
        action_role,
        action,
        old_status,
        new_status,
        comments
    )
    VALUES (
        l_request_id,
        :P10_EMPLOYEE_ID,
        'EMPLOYEE',
        'SUBMIT',
        NULL,
        'PENDING_MANAGER',
        'Leave request submitted'
    );

END;
