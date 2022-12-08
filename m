Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F875646C06
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 10:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiLHJhs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 04:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiLHJhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 04:37:47 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCCFFACD
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 01:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh+0LwYY99kRkQfE0W2r4bs5oTTnbDfScbkGErQI8PswkeimExLxjUSnmU2cidNwdTqHkFvoO+rrgKWDxp2/ambgHxuHkDSZUayH/myLKSZyV8Q9T3uPuzCqG4CPW+H2n2ZPZ/WGiSSrWLLZbd8LrsEzF/8WZF1mAUEjqHJOKjVTzAjD7GBhvsj1Q49rsBH6gI4lBimGxfBrA+qAKg3URB8tgQBDWsUzprmglb0KOnrfg9b07r0b96U3AmdGUWZl4GBxTXz3nsMZ4QJaPLjfIWrzu3M+wiE4dSB7zGZonDCCwxw44q7UjA4pH/h04hLgYZ4e9iHjj5PhWNEKGQYxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtB25DTdeZidKcKRIgWNtqYioJT8AlXNWaSIpJRlFNg=;
 b=UVrBadxj0XCd9ZywrkTk9DrKGyK94nJ7NWvIzLaHPPyHcqD4IcAjpO8gVg5vbAU9M0Ub7AXemHU4qOKsX9Vv19VHdJ+KkfG2URjXetuWvIFLdt9MSk8mKR5dQsCfPW5hifcc3CFB/ZqG2V6tDfRLn3TfFVfjwwbWDULPQMPkP00wWpRb6vQBCjOJo4G59rW26AFaruQ08P1lbT/kAq+MhGeN/Bd8sTf8oHUQU+bK/ZCMME8UrVoM96us7CyPNFa5qHAgEnsh2Snp4XpfzU7Wuo7l+bke/mQQbrOFthTDs0RybUYRl5X7NF80WGCC2BUMur4u7amzJapc8lzVpgSNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtB25DTdeZidKcKRIgWNtqYioJT8AlXNWaSIpJRlFNg=;
 b=IQGGGWzt2bEEijzJ+ypJvIu1nGfj9ym9Rzpm1N9ZuDRbwh7ygvYmXnWt1j4aPnHti7BA1YByw9d/ixkPCfwoP1VRLs41dsgt4dyoc4dthoDM6Y7CaJY70qZn/yZfvuKfujDWDyH979yP+7AlVFc9AJg5iQOlOIVSubz8kiJ0yS0=
Received: from DM6PR17CA0004.namprd17.prod.outlook.com (2603:10b6:5:1b3::17)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 09:37:42 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::62) by DM6PR17CA0004.outlook.office365.com
 (2603:10b6:5:1b3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Thu, 8 Dec 2022 09:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.16 via Frontend Transport; Thu, 8 Dec 2022 09:37:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Dec
 2022 03:37:39 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     <Rajesh1.Kumar@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Subject: [PATCH] pinctrl: amd: Add Z-state wake control bits
Date:   Thu, 8 Dec 2022 15:07:04 +0530
Message-ID: <20221208093704.1151928-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT009:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 438cf455-214a-4c67-cb9b-08dad8ffdabc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJFKLUhAQFP7DZRupi60FAWJmI8Hg+KtM+yW9pheZirAOTajOFdAuvf6ox3tI+CRhqQ7fRmISeYJeOfBIQvs6h7ei5GIBB7O6JE0SO+2U1fnsbPkxHfQGHqG7VmcgYpirGEGG8DCvlfUgnSQhA4jBkAX5nNRCSclDCBCSBqP3v3VGvKr4Kxst1cQGeq+/L5Mn82+ISwFHr9MaKQJiHO1BrxFPzHaO5r9dUm4v6NOf7KJXEBTIBZG8TGHojmtRwkz7AbfmlJnJzH45qszBRiucJNCfezibqqCikn0jecDwcXmlMRN4QMVQRfvjEWNSN6aIV/FUsGKaoWlNwWoGiZJThNaMqA4OgIlXiBPmRqZbt7zSraiPZJRhtKXtQp5S5yrKLIrdlemz59A/oivWGJhkUfido4cIh755vfjZTfAxG9MUC7EHDmRdGPOZR/zp/r7p4cxQ+E44n6gUTD91ti2h8xeiRA3IvMBWdJ7wKPflQXteAIcoP+s8zYBikIVjA/aMsNBJ1Ul/0t87viPUd7HS7iZCA4AQIAuo3ua3ix5xiYhBLxul4KynJMu+YfJ+05yt6tv3+ksKSijfi8kkdnHrHPphPcGnAShe2Q+ql9nuUONQdTHOpuh4zOqGIVQPkQwmTUCgCsCmGbY7i7I6i/7eaHWAQlSqsI7qX9ER17EHq6ArmxbZvw8Dyp8QDbvOxYTfDkw2/nOMBmXJN57Ou9qY7IAeWrPZTNaBxePGf142XtcArFwc+ijRJxMqE6+okMn
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(426003)(47076005)(40460700003)(186003)(86362001)(41300700001)(478600001)(7696005)(81166007)(36756003)(40480700001)(82310400005)(82740400003)(83380400001)(36860700001)(8676002)(336012)(2616005)(16526019)(1076003)(356005)(5660300002)(70586007)(26005)(6666004)(2906002)(110136005)(54906003)(316002)(4326008)(70206006)(8936002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 09:37:42.3631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 438cf455-214a-4c67-cb9b-08dad8ffdabc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO registers include Bit 27 for WakeCntrlZ used to enable wake in
Z state. Hence add Z-state wake control bits to debugfs output to
debug and analyze Z-states problems.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 7 +++++++
 drivers/pinctrl/pinctrl-amd.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 6be896871718..e944003bb84a 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -218,6 +218,7 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 	char *orientation;
 	char debounce_value[40];
 	char *debounce_enable;
+	char *wake_cntrlz;
 
 	for (bank = 0; bank < gpio_dev->hwbank_num; bank++) {
 		unsigned int time = 0;
@@ -305,6 +306,12 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 				wake_cntrl2 = " ∅";
 			seq_printf(s, "S4/S5 %s| ", wake_cntrl2);
 
+			if (pin_reg & BIT(WAKECNTRL_Z_OFF))
+				wake_cntrlz = "⏰";
+			else
+				wake_cntrlz = " ∅";
+			seq_printf(s, "Z %s| ", wake_cntrlz);
+
 			if (pin_reg & BIT(PULL_UP_ENABLE_OFF)) {
 				pull_up_enable = "+";
 				if (pin_reg & BIT(PULL_UP_SEL_OFF))
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index c8635998465d..81ae8319a1f0 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -42,6 +42,7 @@
 #define OUTPUT_ENABLE_OFF		23
 #define SW_CNTRL_IN_OFF			24
 #define SW_CNTRL_EN_OFF			25
+#define WAKECNTRL_Z_OFF			27
 #define INTERRUPT_STS_OFF		28
 #define WAKE_STS_OFF			29
 
-- 
2.25.1

