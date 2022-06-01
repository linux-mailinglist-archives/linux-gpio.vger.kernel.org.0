Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131FE53AA16
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351511AbiFAP3p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345782AbiFAP3o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:29:44 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BB52F385
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhrXzWT0M7nyD1sEkkG5Kaz5Al3YIKRePgx/JDaBi/LfgRRtj+3ycvw9SY289MzKkhsgAkg972jPx8iRZChl4BzEmSXbdUyUKkoyIskRh5yT2LxxTe3URzWSPX5bh4OFNSBKWg6CbhNOeawCS8PVsCHurhqIzM4a/D2IyDsDwVpiVdYdGtxeHvCIwr6paUqX4NKfyhK0gdDs/CetK/ZMyOURX+FFcLCQARZI48IHN+HBq+j1Ggl9WXYzCI+KwsQDDVRjLETVhNC6qGaDHF6tUrIFJ4q0/oqI2hL+nhns51MIJzmGVeCNYJXNnMZmp98YAVVCybvBJVPujhTkBzOO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c264V5/GFmVNmAk+Rj4umCgOXOi0QI8fuJH16dGYqII=;
 b=fM8OAvD1qnH0PQNqnTSs2k/YZUyEC4aX0OD4IHj2qzwFIKrzaHJkNe3LJutvciiwj6GuTp9XC/f8vsDFWbGDoqjhbRAib9AtSE2krE3KzBn9prim6bhI4UePawDQlG1uuP1i8JQrYtgPJUOavxlzkwYsZY3+ajIVbmZzBDFK3H0efElD63nQVwy0y8sfyPa98DyBIsOG4mpScqyw+/DCm1JaievvDc+RuIsfZ1R9a7i7jFamOVWZguw5qQnDAAlKpfAF/ka5M6gXlKsPG6bcFcMX4BrPnqg3YkAu/RbefLZHR50bc0dOi1YCYPFQQGfNxZKEYHaqkNyUUCwWDYxu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c264V5/GFmVNmAk+Rj4umCgOXOi0QI8fuJH16dGYqII=;
 b=l8RHG0nFEk6V6a4DQLS4N6JR75Qi0WQHMhjLuXmiVeyTyvVueW0gNE89DD9xe4zHp2aFH52RbUBT7DNU3sadBry3ZJ5MQbz7bAfed10a0JmQtJrI6gMHxC1inBCE9nccv9HkWt7IWMOz1zUL4bBWlFrZfrOss2yBPBhDyNx2ujQ=
Received: from MW4PR03CA0011.namprd03.prod.outlook.com (2603:10b6:303:8f::16)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 15:29:40 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::3a) by MW4PR03CA0011.outlook.office365.com
 (2603:10b6:303:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Wed, 1 Jun 2022 15:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 15:29:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 10:29:37 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 4/6] pinctrl: amd: Define and use AMD_PINS macro
Date:   Wed, 1 Jun 2022 20:58:58 +0530
Message-ID: <20220601152900.1012813-5-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
References: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d32d7a0-d899-4a0f-de48-08da43e38b74
X-MS-TrafficTypeDiagnostic: MN0PR12MB5788:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB57883C3D1D471798A793324AE6DF9@MN0PR12MB5788.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iS1J9lQr9/b9xYmLAHWKCo8tXkRuLukEWVyQEKS8U2xZDx5F3ZaX7YN5NNeZ0zRum3K+EQccMml2Ovh7FoY2Wq1rcedyQf1UppV6Hupa/87Od4oXOgBmcMinTimK/txSaJ+xVJ9UUXsl6AiKiz9Yt5aM8ChLOiOPUkLa82dCOt2I92/Y8Ob4F8KkmySzrFwuzeS03bj+Htv+R/lHYrrj/YeavTCWZWq0KLUOr0jN8faaGRZ/F2HP/b3hyw9oN1EdjUvb0uzbFKBW48Hpok8Ek9kWzXcZpIKy5mIm1El6w4DewB30eabG6eBwzjvOpx1ZgMdcukIC1/XswjenMCnTcAKQYpAV1oMojrajp92D24LOLNvPh6hc0H/FOM/1FOl3ZPCZXlbVmpSVpGvKfaCYdlliszydCv+mDHDWpVp1kc7oFlb/ijYx6iz1RskCDFVszQaYfVbkVxB6HonIVfpwBAlAGlFAxZ1JKOzA+DamijKIe8l+YhOwsjjl8Nfbj+ElQ+lNRAfeMNZpBwe84Nscadzw2SSCYU0pwPSSOFxunjPfH0MqIJq7VHF24IqU9unBOt71pMt2SUoIhu/cbJF/WRZ1Os1k6fe2/Y4ropOHXMsmgkY0BWelOE2LVcRLZJmP0BKiE9q8jEaQLmkG7zCVkor1/KRszzcqKAcp4HaUvp6J6HAR8fI+yeWQCDfviYe/mSHWRxh+Bifrd4YuGwkzuJRQALU3mvCzu/zHcn2sfik=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(5660300002)(16526019)(336012)(2616005)(8936002)(1076003)(508600001)(426003)(186003)(6666004)(86362001)(40460700003)(47076005)(7696005)(26005)(2906002)(81166007)(36756003)(83380400001)(110136005)(70586007)(8676002)(4326008)(70206006)(36860700001)(82310400005)(316002)(356005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:29:40.0332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d32d7a0-d899-4a0f-de48-08da43e38b74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788
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

