Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8C253A4A9
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 14:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351760AbiFAMQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 08:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348712AbiFAMQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 08:16:18 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14845C770
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 05:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZhWDeVLIdbDrA7pkZjufNqfJ41h2RovTiGafdaIot7yVe7G7ru4qs9Tx5HYwBaEeOhyy9EgUVT1IpK246raxWPYTKsO89raTnNufG4tBvf0lvW207S+osub0xejJv+3PJe7GIsUh33MY8Ke9p+iRA/sz/5smS3mzLON7399BZm6MT4bWN6kZ25D/vtD4tStOkRBfiTC7sS6VT6c9O2Z8bIGV+COasFHGEXVvhqAYCEf9dne7ge2QUrsyVrHYcuFJ/XE9p2kJmiFk2yg6i1v9A9vUatV348mSr7jYSLEm1QCfHB0ss/F1T97d91wZqxIUdZ8SbqFJt3T2ZW78b2lQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c264V5/GFmVNmAk+Rj4umCgOXOi0QI8fuJH16dGYqII=;
 b=fCMybwljgYL23j/cxN+WKR4ZURfoETdGjBdvq34kwLA8nkRLgzRkf20LxC54aROJFieNwxNLsYn+tHrP0C0+iqKFm0XmQAtCIbwkwb/XdziY/OGBf89Ay0SWkxDh/DkLthYEuI7zivcNwDr5F2UGSmiDz3Ynfu8fVz3CMh+U6fLptlJZIF/gHNVp9vAze+qsNj7Kzy6tdApRMov6WgneCqHPbA73aqffmQeR2kdIIYP8UVHUJG7sPdBDq5jLciAr7MzVKeUvV4JHsPbuRigVIMhowJt5jshnXSNZdIzTkBHqqSY1tLUwD8oDa5Zc8cdgrIZy50WSjECEQxsIUIO4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c264V5/GFmVNmAk+Rj4umCgOXOi0QI8fuJH16dGYqII=;
 b=3pFE8qDaIMEdrwAoPvj/42Iz4Uy0H0JPAkeG4J38/CoEUONBxpJjT96jPeZ4Kc8jdF3TY46JhBJx2U51P7ZwbiJmCXmTDrI1YJcdnBQHk/4zRJE2tcHQu3GnqqEuvSnl74YJJ+bpDhtmQAXjbdauPuUDQByBQM5tgpu+qyeDKzk=
Received: from MW4PR03CA0210.namprd03.prod.outlook.com (2603:10b6:303:b8::35)
 by DM6PR12MB4500.namprd12.prod.outlook.com (2603:10b6:5:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 12:16:16 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::ba) by MW4PR03CA0210.outlook.office365.com
 (2603:10b6:303:b8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Wed, 1 Jun 2022 12:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 12:16:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 07:15:55 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 4/6] pinctrl: amd: Define and use AMD_PINS macro
Date:   Wed, 1 Jun 2022 17:44:36 +0530
Message-ID: <20220601121438.999369-5-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
References: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5093f4aa-120c-4add-88f9-08da43c883ff
X-MS-TrafficTypeDiagnostic: DM6PR12MB4500:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB450063DED9ECA8A7B8ACB777E6DF9@DM6PR12MB4500.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DWAUtapoco7NOITYZLZK7RU+rCV58qZvI1kHRpI+9T0OgpzbNNhXJiCKJQU/9PV9EpjP5k43oxWzT2Jv6y+L0++0pt41m7pH35nPO6YM05WfEOw6n1DlCvYrXGzW15jVDqd/iixfljk1dpLzviQV5qP4KfkXnxfyVmPNfHwoCzLnctnNs5WkTc0n20Q4sQgDQSkhRKIiXLvd85s/JiQ4G+sD/FM3mEHMH+TfuugYpIU8+JVpPRZA//ez4Y9RpBig7JOC9Jc7v5kDumPYQsUj1xk0fGrgw2EnnTwfYGL2gym7CJwD8nCmaIZpksILV+6KgNwt4hyyjT5GHP8A9G6S++9zVW1V4d4awgFrrFoALkGb/2vf5Wq9spfVEVVuNdhBUUa4TrQukUBUNJYhA0HVaXTRVImGelFkxfZmaVFA4ygu2YApzPuQo5X/GNxGRXcm6I6hGif3X6kcHJB+KamtUekc8VPIjCdjgfBls1DxfOn7L0VhVFWcUFhU+GlAyNEsJUQYtkHc4E0DVV4/061ymTWlxOSnkcHUzh/UsDEfmGbUa5JfnY10tClEJP7B23DmGbfcxp8vs3uSptMG2RqqKo9b2l4IWza6S/51KOgl4ZZHPtmw7z89N29xF8Hcumbny0jyHA86BxlT43duGjL2m99sHHkXlUSMPb1jCdHvOD9YqEX8hR2iS7ATkkHfvW2pByeiE+00oJVLl8Q7naMQrdZCbhGbEL3yI3Nhi6pq30=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(336012)(186003)(16526019)(47076005)(426003)(86362001)(82310400005)(316002)(1076003)(2616005)(5660300002)(8936002)(36860700001)(356005)(70206006)(40460700003)(70586007)(8676002)(4326008)(2906002)(81166007)(6666004)(36756003)(110136005)(508600001)(26005)(7696005)(83380400001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:16:11.1710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5093f4aa-120c-4add-88f9-08da43c883ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AMD pingroup can be extended to support multi-function pins.
Hence define and use a macro "AMD_PINS" to represent larger
number of pins.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-amd.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index ac3ebfaadb7e..e2523738fe51 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -282,21 +282,14 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(183, "GPIO_183"),
 };
 
-static const unsigned i2c0_pins[] = {145, 146};
-static const unsigned i2c1_pins[] = {147, 148};
-static const unsigned i2c2_pins[] = {113, 114};
-static const unsigned i2c3_pins[] = {19, 20};
-
-static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
-static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
-
+#define AMD_PINS(...) (const unsigned int []){__VA_ARGS__}
 static const struct pingroup kerncz_groups[] = {
-	PINCTRL_PINGROUP("i2c0", i2c0_pins, 2),
-	PINCTRL_PINGROUP("i2c1", i2c1_pins, 2),
-	PINCTRL_PINGROUP("i2c2", i2c2_pins, 2),
-	PINCTRL_PINGROUP("i2c3", i2c3_pins, 2),
-	PINCTRL_PINGROUP("uart0", uart0_pins, 5),
-	PINCTRL_PINGROUP("uart1", uart1_pins, 5),
+	PINCTRL_PINGROUP("i2c0", AMD_PINS(145, 146), 2),
+	PINCTRL_PINGROUP("i2c1", AMD_PINS(147, 148), 2),
+	PINCTRL_PINGROUP("i2c2", AMD_PINS(113, 114), 2),
+	PINCTRL_PINGROUP("i2c3", AMD_PINS(19, 20), 2),
+	PINCTRL_PINGROUP("uart0", AMD_PINS(135, 136, 137, 138, 139), 5),
+	PINCTRL_PINGROUP("uart1", AMD_PINS(140, 141, 142, 143, 144), 5),
 };
 
 #endif
-- 
2.25.1

