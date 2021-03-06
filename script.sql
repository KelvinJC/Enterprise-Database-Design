
CREATE TABLE IF NOT EXISTS contact (
                        contact_id CHAR(10) NOT NULL PRIMARY KEY,
                        contact_description VARCHAR(20) NOT NULL,
                        street VARCHAR(50),
                        city VARCHAR(20),
                        state VARCHAR(20),
                        zipcode INT,
                        email VARCHAR(50),
                        phone CHAR(20)
                        );

CREATE TABLE IF NOT EXISTS consultant (
                        consultant_id CHAR(10) NOT NULL PRIMARY KEY,
                        first_name VARCHAR(20) NOT NULL,
                        last_name VARCHAR(20) NOT NULL,
                        contact_id CHAR(10) NOT NULL,
                        FOREIGN KEY (contact_id) REFERENCES contact (contact_id)
                        );

CREATE TABLE IF NOT EXISTS wedding (
                        wedding_id CHAR(10) NOT NULL PRIMARY KEY,
                        wedding_name VARCHAR NOT NULL,
                        contract_date DATE NOT NULL,
                        consultant_id INTEGER NOT NULL,
                        estimated_cost MONEY NOT NULL,
                        actual_cost MONEY,
                        FOREIGN KEY (consultant_id) REFERENCES consultant (consultant_id)
                        );

CREATE TABLE IF NOT EXISTS client (
                        client_id CHAR(10) NOT NULL PRIMARY KEY,
                        client_wedding_id CHAR(10) NOT NULL,
                        contact_id CHAR(10) NOT NULL,
                        first_name VARCHAR(20) NOT NULL,
                        last_name VARCHAR(20) NOT NULL,
                        FOREIGN KEY (client_wedding_id) REFERENCES client_wedding (client_wedding_id),
                        FOREIGN KEY (contact_id) REFERENCES contact (contact_id)
                        );

CREATE TABLE IF NOT EXISTS client_wedding (
                        client_wedding_id CHAR(10) NOT NULL PRIMARY KEY,
                        wedding_id CHAR(10) NOT NULL,
                        client_id CHAR(10) NOT NULL,
                        FOREIGN KEY (wedding_id) REFERENCES wedding (wedding_id),
                        FOREIGN KEY (client_id) REFERENCES client (client_id)
                        );

CREATE TABLE IF NOT EXISTS event (
                        event_id CHAR(10) NOT NULL PRIMARY KEY,
                        event_name VARCHAR NOT NULL,
                        event_type VARCHAR NOT NULL,
                        description VARCHAR NOT NULL,
                        beginning_date DATE NOT NULL,
                        beginning_time TIMESTAMP NOT NULL,
                        ending_date DATE NOT NULL,
                        ending_time TIMESTAMP NOT NULL,
                        wedding_id CHAR(10) NOT NULL,
                        loc_id CHAR(10),
                        FOREIGN KEY (wedding_id) REFERENCES wedding (wedding_id),
                        FOREIGN KEY (loc_id) REFERENCES location (loc_id)
                        );

CREATE TABLE IF NOT EXISTS location (
                        loc_id CHAR(10) NOT NULL PRIMARY KEY,
                        name VARCHAR NOT NULL,
                        type VARCHAR NOT NULL,
                        address VARCHAR NOT NULL
                        );

CREATE TABLE IF NOT EXISTS guest_attendance (
                        attendance_id CHAR(10) NOT NULL PRIMARY KEY,
                        event_id CHAR(10) NOT NULL,
                        first_name VARCHAR(20) NOT NULL,
                        last_name VARCHAR(20) NOT NULL,
                        is_invited BOOLEAN NOT NULL,
                        contact_id INTEGER NOT NULL,
                        FOREIGN KEY (event_id) REFERENCES event (event_id),
                        FOREIGN KEY (contact_id) REFERENCES contact (contact_id)
                        );

CREATE TABLE IF NOT EXISTS guest_invited (
                        invitation_id CHAR(10) NOT NULL PRIMARY KEY,
                        event_id CHAR(10) NOT NULL,
                        first_name VARCHAR(20) NOT NULL,
                        last_name VARCHAR(20) NOT NULL,
                        is_attended BOOLEAN,
                        contact_id INTEGER NOT NULL,
                        FOREIGN KEY (event_id) REFERENCES event (event_id),
                        FOREIGN KEY (contact_id) REFERENCES contact (contact_id)
                        );

CREATE TABLE IF NOT EXISTS service_selection (
                        selection_id CHAR(10) NOT NULL PRIMARY KEY,
                        service_id CHAR(10) NOT NULL,
                        event_id CHAR(10) NOT NULL,
                        estimated_cost MONEY NOT NULL,
                        actual_cost MONEY NOT NULL,
                        scheduled_date DATE NOT NULL,
                        actual_start_date DATE NOT NULL,
                        scheduled_contractor_id CHAR(10) NOT NULL,
                        actual_contractor_id CHAR(10) NOT NULL,
                        FOREIGN KEY (event_id) REFERENCES event (event_id),
                        FOREIGN KEY (service_id) REFERENCES service (service_id),
                        FOREIGN KEY (scheduled_contractor_id) REFERENCES contractor (contractor_id),
                        FOREIGN KEY (actual_contractor_id) REFERENCES contractor (contractor_id)
                        );

CREATE TABLE IF NOT EXISTS service (
                        service_id CHAR(3) NOT NULL PRIMARY KEY, /* Considering that the number of services is unlikely to exceed 999 */
                        name VARCHAR NOT NULL,
                        type VARCHAR NOT NULL,
                        description VARCHAR NOT NULL
                      );

CREATE TABLE IF NOT EXISTS service_contract (
                        service_contract_id CHAR(10) NOT NULL PRIMARY KEY,
                        detailed_service_description VARCHAR NOT NULL,
                        cost MONEY NOT NULL,
                        service_id CHAR(10) NOT NULL,
                        FOREIGN KEY (service_id) REFERENCES service (service_id),
                        FOREIGN KEY (contractor_id) REFERENCES contractor (contractor_id)
                        );

CREATE TABLE IF NOT EXISTS contractor (
                        contractor_id CHAR(10) NOT NULL PRIMARY KEY,
                        company_name VARCHAR NOT NULL,
                        contact_id CHAR(10) NOT NULL,
                        FOREIGN KEY (contact_id) REFERENCES contact (contact_id)
                        );
