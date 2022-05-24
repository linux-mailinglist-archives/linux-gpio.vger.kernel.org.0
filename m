Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A63532442
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 09:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiEXHkk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 03:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbiEXHki (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 03:40:38 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F3A7354E
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 00:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlpusmAJj/Zrj4OLwdOPTUhY/9CADuC76ucJ+URTSNHDQb9e16rsHFxASSRitMbf8PeqANVD7NDdYk5FVBswQGdkwNMrEU3JrR2prfNB3HoA5IrwkuJKYdKJ9/3okjwiRNtb7n5H6bN901ehCRuocK/nUgXp7tcSCSBQPaLWazL+7yPfZkRT67//Q3IrUWhyMWTH8ZJzZKOHP0kAV8WtcowB8AIpDML4NtUujHotuUvMkpYjJz2eiX2DLYEA+UaObG7X/hRWTqftJmd4XqLrivL5HjBjwK8DBoJaFY1ekM8pdcL9WpEOHB/10QdzHmW+ZURjrH4YsPwS9VIEudgAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD3MygzVvCHE0aUxYnU62DKhIrRhU6xpfhMI20pUb+0=;
 b=iF3pWgNAIX2lbtcr5KvWP3yUdcxHHhPtHziyZ+Ux6nbrMS11a1+WakOXrxTb0R9e50MPBDOMuJF49spzzmD4D0iT4D49ZuofYPFEduUntdujq0syWrmJN3PrMQSEsZPiudIkQ6PFAXTXc2AqbxHL8BxRpowWZAhzLCuh2WBScoWff+r7Gj8T1leN5EnCOdJSwlmtCgRHpqCgMSnosV1N8qrSPH6ChCTODf5hGi3TTC4BpDe3rGwdE+05NQUkhdg8XN40t6kI/cUAuydoMnXk0DupPdj4YPljYPSqjyeAwkYmXypoQCGejB+UbrjwJlz2+eTZ4A+QOJAmzozaUOdu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD3MygzVvCHE0aUxYnU62DKhIrRhU6xpfhMI20pUb+0=;
 b=zfNUYfBqTRW7Oyt4UvjGLgaIWMz9Fm9Ypz9qscoMUHnF+YjYYSyfO7WKNu0dO+XdEUjEkY6TWSK1RiJMWpXTkU70LUWbyIWOzqCT/ICGLHPEWnGeE/6ptUaJe/W2YwPgl5DBxQrZAOSaqDvVY95ux0PF0yumdubxeTrK0/o/zdo=
Received: from MWHPR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:301:4a::15) by MWHPR12MB1550.namprd12.prod.outlook.com
 (2603:10b6:301:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 07:40:35 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4a:cafe::6) by MWHPR1201CA0005.outlook.office365.com
 (2603:10b6:301:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.21 via Frontend
 Transport; Tue, 24 May 2022 07:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 07:40:35 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 02:40:32 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 1/3] pinctrl: amd: Define and use PINCTRL_GRP
Date:   Tue, 24 May 2022 13:10:05 +0530
Message-ID: <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c82e736-a8b1-43a3-0113-08da3d58b085
X-MS-TrafficTypeDiagnostic: MWHPR12MB1550:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1550DAC5478ADE460CCD689DE6D79@MWHPR12MB1550.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cABMFwQL0dGEYJo+1imKf1rwl/FB6gA+jMh+rayIZ8zasTrNVgE6nn60qR6G+NPTRqR3/1qMCnTBxZTfU5Xp/Nwk+skukVjEccg6NPRcHvVfOtNftAQn87lXEXEnu5I7yEN4xlocJZjGgx0oPiAMCdWSJ10Mfhtrp2CEHsG04u+raivV1QZ2VfBUGfMSXlh0qqWD3f1z2bRKQJsrYElhyjlh0lz0V0P8jrypvJ587TdrgB7oiU/aQ4+1JBVs925FxI/hoYNA0dz2qrJIxy9OBXAyGADcLznzjgAkuQSIjo8pWIGHybP+Hxxro3RSB+EJDEBfyzP0kUUTRIKKDw1z5IQ+bZmgq8MkpGvINksbLJphAHbnrtgdynWLK1k0lJ/gg6wxtDZXPdj7n5bdG5ESRz9/UgAyz9ARaD5Do8KCfC9dS/FkGCK8o4isRprXKWY2JyDsBsm+xarEbEVSC2bKqO7RGKrf5kLSvGUcmZU3XtFnDAZAVnaHkDgB628GO7uRXDUroUcCKvzip3K3ugP6zoa8litSiK0Sg/TjbCYNd2dd2XKP3sDknfVp45EJXWnnedLkHjsPdghCzPhYl9sSkKP4bH25UssyE8urA6sNNuCPInBjuwU8iTPno1RRcET+l2kpYMy5f/243AKftr2PSvh6R+d2/Bh8QT4ucH+xK/iJ3urAYp4xb56Gp/wAVGSNcDzHSYzahRHJL9gLvqh6XZttnsY+LJMjysmL0fV6Dt8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(81166007)(336012)(508600001)(2906002)(7696005)(8936002)(6666004)(36756003)(356005)(5660300002)(8676002)(83380400001)(36860700001)(110136005)(4326008)(316002)(40460700003)(186003)(70206006)(70586007)(2616005)(16526019)(86362001)(82310400005)(1076003)(47076005)(426003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 07:40:35.2394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c82e736-a8b1-43a3-0113-08da3d58b085
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1550
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
Hence define and use PINCTRL_GRP to manage and represent
larger number of pingroups inline.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.h | 39 ++++++++---------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 1d4317073654..de2bc9dddc9c 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -296,37 +296,16 @@ static const unsigned i2c3_pins[] = {19, 20};
 static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
 static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
 
+#define PINCTRL_GRP(_name, _pins, _npins) \
+	{ .name = _name, .pins = _pins, .npins = _npins}
+
 static const struct amd_pingroup kerncz_groups[] = {
-	{
-		.name = "i2c0",
-		.pins = i2c0_pins,
-		.npins = 2,
-	},
-	{
-		.name = "i2c1",
-		.pins = i2c1_pins,
-		.npins = 2,
-	},
-	{
-		.name = "i2c2",
-		.pins = i2c2_pins,
-		.npins = 2,
-	},
-	{
-		.name = "i2c3",
-		.pins = i2c3_pins,
-		.npins = 2,
-	},
-	{
-		.name = "uart0",
-		.pins = uart0_pins,
-		.npins = 5,
-	},
-	{
-		.name = "uart1",
-		.pins = uart1_pins,
-		.npins = 5,
-	},
+	PINCTRL_GRP("i2c0", i2c0_pins, 2),
+	PINCTRL_GRP("i2c1", i2c1_pins, 2),
+	PINCTRL_GRP("i2c2", i2c2_pins, 2),
+	PINCTRL_GRP("i2c3", i2c3_pins, 2),
+	PINCTRL_GRP("uart0", uart0_pins, 5),
+	PINCTRL_GRP("uart1", uart1_pins, 5),
 };
 
 #endif
-- 
2.25.1

