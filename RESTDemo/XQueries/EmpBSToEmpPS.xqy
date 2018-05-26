xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/EmployeeService_getEmployees_request";
(:: import schema at "../Resources/Employee.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/EmployeeBS";
(:: import schema at "../Resources/EmployeeBS_table.xsd" ::)

declare variable $empCollection as element() (:: schema-element(ns1:EmployeesCollection) ::) external;

declare function local:func($empCollection as element() (:: schema-element(ns1:EmployeesCollection) ::)) as element() (:: schema-element(ns2:EmployeeList) ::) {
    <ns2:EmployeeList>
        {
            for $Employees in $empCollection/ns1:Employees
            return 
            <ns2:Employee>
                <ns2:employeeId>{fn:data($Employees/ns1:employeeId)}</ns2:employeeId>
                <ns2:firstName>{fn:data($Employees/ns1:firstName)}</ns2:firstName>
                <ns2:lastName>{fn:data($Employees/ns1:lastName)}</ns2:lastName>
                <ns2:email>{fn:data($Employees/ns1:email)}</ns2:email>
                <ns2:phoneNumber>{fn:data($Employees/ns1:phoneNumber)}</ns2:phoneNumber>
                <ns2:jobId>{fn:data($Employees/ns1:jobId)}</ns2:jobId>
                <ns2:salary>{fn:data($Employees/ns1:salary)}</ns2:salary>
                <ns2:commissionPct>{fn:data($Employees/ns1:commissionPct)}</ns2:commissionPct>
                <ns2:departmentId>{fn:data($Employees/ns1:departmentId)}</ns2:departmentId></ns2:Employee>
        }
    </ns2:EmployeeList>
};

local:func($empCollection)