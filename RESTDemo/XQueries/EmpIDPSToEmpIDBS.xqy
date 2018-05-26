xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/OSB12cDemo/RESTDemo/EmployeeService";
(:: import schema at "../Resources/EmployeeService.wsdl" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/top/EmployeeBS";
(:: import schema at "../Resources/EmployeeBS_table.xsd" ::)

declare variable $empId as element() (:: schema-element(ns1:getEmployeeByKey_params) ::) external;

declare function local:func($empId as element() (:: schema-element(ns1:getEmployeeByKey_params) ::)) as element() (:: schema-element(ns2:EmployeesPrimaryKey) ::) {
    <ns2:EmployeesPrimaryKey>
        <ns2:employeeId>{fn:data($empId/ns1:employee_id)}</ns2:employeeId>
    </ns2:EmployeesPrimaryKey>
};

local:func($empId)
