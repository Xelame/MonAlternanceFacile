-- Table Intern
CREATE TABLE Intern (
    intern_id SERIAL PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    date_of_birth DATE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    phone_number VARCHAR(20),
    creation_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    profile_update_date TIMESTAMPTZ,
    address VARCHAR(255),
    linkedin_link VARCHAR(255),
    portfolio_link VARCHAR(255)
);

-- Table Company
CREATE TABLE Company (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255),
    activity_domain_id INT REFERENCES Activity_Domain(activity_domain_id),
    company_description TEXT,
    address VARCHAR(255),
    website VARCHAR(255),
    company_size VARCHAR(50),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    logo_link VARCHAR(255),
    creation_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    siret VARCHAR(20),
    is_valid BOOLEAN DEFAULT TRUE
);

-- Table Job_Posting
CREATE TABLE Job_Posting (
    job_posting_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    contract_type_id INT REFERENCES Contract_Type(contract_type_id),
    duration VARCHAR(50),
    start_date DATE,
    geographic_area VARCHAR(255),
    telecommuting_available BOOLEAN,
    level_id INT REFERENCES Level(level_id),
    contact_email VARCHAR(255),
    contact_phone VARCHAR(20),
    activity_domain_id INT REFERENCES Activity_Domain(activity_domain_id),
    description TEXT,
    posting_link VARCHAR(255),
    mandatory_experience TEXT,
    publication_date DATE,
    expiration_date DATE,
    company_id INT REFERENCES Company(company_id),
    status VARCHAR(255)
);

-- Table Application
CREATE TABLE Application (
    application_id SERIAL PRIMARY KEY,
    candidate_id INT REFERENCES Candidate_Profile(candidate_id),
    job_posting_id INT REFERENCES Job_Posting(job_posting_id),
    application_date DATE,
    status VARCHAR(50)
);

-- Table Activity_Domain
CREATE TABLE Activity_Domain (
    activity_domain_id SERIAL PRIMARY KEY,
    label VARCHAR(255)
);

-- Table Contract_Type
CREATE TABLE Contract_Type (
    contract_type_id SERIAL PRIMARY KEY,
    label VARCHAR(255)
);

-- Table Level
CREATE TABLE Level (
    level_id SERIAL PRIMARY KEY,
    label VARCHAR(255)
);

-- Table School
CREATE TABLE School (
    school_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);


-- Table Candidate_Profile
CREATE TABLE Candidate_Profile (
    candidate_profile_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    contract_type_id INT REFERENCES Contract_Type(contract_type_id),
    duration VARCHAR(50),
    start_date DATE,
    geographic_area VARCHAR(255),
    telecommuting_available BOOLEAN,
    level_id INT REFERENCES Level(level_id),
    contact_email VARCHAR(255),
    contact_phone VARCHAR(20),
    activity_domain_id INT REFERENCES Activity_Domain(activity_domain_id),
    motivation_text TEXT,
    cv_link VARCHAR(255),
    experience TEXT,
    publication_date DATE,
    modification_date DATE,
    school_id INT REFERENCES School(school_id),
    candidate_id INT REFERENCES Intern(intern_id),
    status VARCHAR(255)
);