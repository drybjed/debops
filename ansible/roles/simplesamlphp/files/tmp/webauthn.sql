/* Copyright (C) 2019-2020 Stefan Winter <stefan.winter@restena.lu>
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

CREATE TABLE credentials (
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id VARCHAR(80) NOT NULL,
    credentialId VARCHAR(500) NOT NULL,
    credential MEDIUMBLOB NOT NULL,
    signCounter INT NOT NULL,
    friendlyName VARCHAR(100) DEFAULT "Unnamed Token",
    UNIQUE (user_id,credentialId)
);

CREATE TABLE userstatus (
    user_id VARCHAR(80) NOT NULL,
    fido2Status ENUM("FIDO2Disabled","FIDO2Enabled") NOT NULL DEFAULT "FIDO2Disabled",
    UNIQUE (user_id)
);
