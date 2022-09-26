Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F9F5E9953
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 08:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbiIZGOO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 02:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbiIZGON (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 02:14:13 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552A527DD5;
        Sun, 25 Sep 2022 23:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpXxQ0OqxQG+m/LMh9QegEYxCxC82c01wEPuCz4ncCDBwTsbhKSU6irnxcAQCUJPegGWyKp91i5qukn5azoELzH+VYzSIaRdgVRU/eQ2Uc90noOnQ+luArtmeV0qnHPumkVf6k54pFxGFdm/t9r4O4sL2HtgpaeLlkibDIr0J0udrEYMIxWkKe7KYwXP1f3CVryTsoQCD3ppvnSygCXIWr/1145ByX6NvwW3uZ3lIbB22jYhK7cfgpgJHali8Rmfy6TSgyseWbn7XeJNCBuNSEs+ZdA7cW/moq6tb7V0I9fqTm8xmWxMXG0Pqqsco9q9FeV1efxH1KNAyRCr2MTpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa3kXANouzF5VkQgHZj5NKCv/hXiJKQaxf8n2pAKlMw=;
 b=jA/7cH087ZC2Fb2WRX8nIz/7a70mgHvkeu+npL6eDdcra2YszomYvIX1Mj636y7wsmpo3ILb/3SF5SLO0a+OLeTJHcYEGxMt22Y4J07g/9OPYuaGJzQspinuYt0H6m4XavZRFCv6FIBcR6JH4xVCXg1CKYaqoXlYUNFwc7QEEaDSmq5p/iQPqvxTnJ369lpz9U+EpuRCDtC+hN9ZpUCBfV+LDY5JPquakDSbb0S72sg0pTECsutUa7omnE0tl4BXCRGavLT+VtX+vCTz6woBQIl81fA6Kd5oZLPqqkagmzgnE6kIXiVOd9Ps8E1PsRNX0+x2Ic1b817guGJ490KlSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa3kXANouzF5VkQgHZj5NKCv/hXiJKQaxf8n2pAKlMw=;
 b=hw2UgmNjbSRA1f8hJUvMebeK8U2nobRqyhxCxNSSQfEgmk1SbaJmRgPFqiHwVxW/QFiQon5YItvLwVCYzNfrXZJu8vlRPtdbzvQG6UnXmqgThf09um2D5Jm97Jzdhb9Hsnspc6tkVpSbRXY9dwrnjZv2rypvNHgGCBM84QGaBwM=
Received: from MW4PR04CA0167.namprd04.prod.outlook.com (2603:10b6:303:85::22)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:14:10 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::8d) by MW4PR04CA0167.outlook.office365.com
 (2603:10b6:303:85::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 06:14:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 06:14:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 01:13:24 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 26 Sep 2022 01:13:22 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v3 2/3] gpio: pca9570: add a platform data structure
Date:   Mon, 26 Sep 2022 11:42:58 +0530
Message-ID: <20220926061259.13491-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
References: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT024:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5438a9-fc29-4985-7b46-08da9f865383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4U4TejVbxR2fZs8iHyyF91gbs+IIVZH1cW+JyGZ/M22H7dL3rq3wBzPgDCfCJuN1l9o00FesUHnKQI2dl8qLuHbJZvzjxsAAviaORTPFHhZ91lIAp9Z8Rxh5oc//IH7pb2dBGs1IBG2MY9SJWXi9QQmmbpAKhue0LHoYQi4RTQtaMfY2S35VU8U+DRQgCupwjzpvaaWwVPBsNh7Vc7tTQ9JUzvtVHL+63RE141sJxomJR7PkVwChmHasCLcoS2aDulT7xmj3JCWWmwCrNnexvsfRFClu28PsrZ2vBCPYhIiOrWhGn0MChgFJxV+8n+2IJmSvaB879DGjirccY3U4N/uf8Elp/qSJmNP6KWwEtWjnB2RcC2k9AYP4EOjK8jQsu8JVw/nXaOSS4KXhM6bPlNEIql5p+QBwjnWgl0yaK5WQ+cgdulAZJ/8WQQLS82AKLE4Q043ddzAENgOJPWHrmethr5iS3cnHp5gWmBLJTeQzv+7ZrbRTctC9b0Looj/MKJ651Tvn8mM7xKWDt4R6ESNffG1mTF8CfqQ4PgCxgGzVv8JUX3n/lqKVl35Oalvuht8mbTen480o1LfFXLKCmYSQBVjAT2y1wNoolcdZjDP1tp+GwoJHfS7QfLxOCeowgVDqq+o8gP1Mawb/KB8hD093W+Xv73A446+mE3mDRyVRQilIJl7BJaVgeejQ6Dy4GwBFCyfoWjX7C52qN8NYN1Xat5vlgCTFW8RSbJZfO5iIwDms3n4wN8q0MlauEaXEatJ5ZnmbZuQJfb0+CjN+xyz9pdUWEBdo2gKXMTXntY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(2616005)(5660300002)(41300700001)(86362001)(6666004)(70586007)(8936002)(4326008)(2906002)(44832011)(316002)(6916009)(54906003)(1076003)(478600001)(82310400005)(26005)(40480700001)(186003)(82740400003)(36756003)(336012)(83380400001)(426003)(47076005)(36860700001)(81166007)(70206006)(356005)(8676002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:14:09.9875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5438a9-fc29-4985-7b46-08da9f865383
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add struct pca9570_platform_data for adding the platform data
structure. Also modify the existing structs for pca9570 and pca9571

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
v3:
split the new patch


 drivers/gpio/gpio-pca9570.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index ab2a652964ec..d49e088e6b43 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -15,6 +15,16 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 
+/**
+ * struct pca9570_platform_data - GPIO platformdata
+ * @ngpio: no of gpios
+ * @command: Command to be sent
+ */
+struct pca9570_platform_data {
+	u16 ngpio;
+	u32 command;
+};
+
 /**
  * struct pca9570 - GPIO driver data
  * @chip: GPIO controller chip
@@ -119,16 +129,24 @@ static int pca9570_probe(struct i2c_client *client)
 	return devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
 }
 
+static const struct pca9570_platform_data pca9570_gpio = {
+	.ngpio = 4,
+};
+
+static const struct pca9570_platform_data pca9571_gpio = {
+	.ngpio = 8,
+};
+
 static const struct i2c_device_id pca9570_id_table[] = {
-	{ "pca9570", 4 },
-	{ "pca9571", 8 },
+	{ "pca9570", (kernel_ulong_t)&pca9570_gpio},
+	{ "pca9571", (kernel_ulong_t)&pca9571_gpio },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
 
 static const struct of_device_id pca9570_of_match_table[] = {
-	{ .compatible = "nxp,pca9570", .data = (void *)4 },
-	{ .compatible = "nxp,pca9571", .data = (void *)8 },
+	{ .compatible = "nxp,pca9570", .data = &pca9570_gpio },
+	{ .compatible = "nxp,pca9571", .data = &pca9571_gpio },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
-- 
2.17.1

