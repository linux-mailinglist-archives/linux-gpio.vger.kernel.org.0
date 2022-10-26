Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111E960E44A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 17:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234010AbiJZPQX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 11:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbiJZPQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 11:16:22 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C70FD73DE;
        Wed, 26 Oct 2022 08:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCNAIhb1J6GvhRFVHOJKE4UkgVVGZwQpIlW+ryV9LUGtMNjf4sC/T2f5j74cB2qNlmY20lIk+g1z5o1O8dgUIvdvsjXC7mpXCjWBy/E7G3LOELXZbsMjnNoAYA6cIIYdtrKVaKzoFXZl2bxTi7UbgXpHXH1M1Rnm0GtzuoHwv7upSHW4rSa3pPSKNepVgjbC4T02gChMxHbQ8QtGwV9NdBTGAlHZe/HGy/M30tmffdQ3vM5nXaFxqBi66ftcPp8BGNa8cVClOzQFltkHNiqmmHZ4WvfYSgpWOJkSPvWL82iWHfpaVfodexdaHWSZifodKKqDHCT+qCxPRPUj7LE10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1jlC8ZA7Gl3UWgw5rkrF93aA8LJHAQ0V8DBW888MNc=;
 b=D00TQvI1lUn/B0muiaY6ksvAild29+LIaJCjjYTDliiXdn9kfmDtIg8wYGqevTY+hiEDnrgGvlAKovjdVzOAZM4wm2r8TSQrgdZ885BUFTVHQB+lcquFLV3rNcJB5pluuFz5CnZwz9Ecoo0nX4+CfDr0i+Wrq+6OBCEPUZIbph2N0q+1QTQSrCZOZqnZ/CkQ55+B00mRNiZgvTiff7oBmR67kqHge0t3yKMJ6+021CyKuPhW/67s+axW51FLx86Ypb/7l8YWpdTYlp+U9Q+qxIhsHi2FhBjmu8mSqGfHxDjQ7IW4T1F3gHt+qhECdJu0amFSmwZQbQMIyRkJJXqFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1jlC8ZA7Gl3UWgw5rkrF93aA8LJHAQ0V8DBW888MNc=;
 b=EAYdbnc3P1vdmgUCJB5pZSxZYgK3zaimTjddgLl/G9VDk+r6XUx9491y2l0PbWWTOCH4clC17LNvtjREoaUeNvHC9tw96OhhmZy7wrjhwV1RMfQvX4/+ax12fLgkm2d6UyhS6iaHYjPgSxRtz3MZT2h9/2cl/j4uyav4MvGfXfo=
Received: from BN9PR03CA0922.namprd03.prod.outlook.com (2603:10b6:408:107::27)
 by DM4PR12MB5199.namprd12.prod.outlook.com (2603:10b6:5:396::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 15:16:17 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::b7) by BN9PR03CA0922.outlook.office365.com
 (2603:10b6:408:107::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 15:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 15:16:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:16:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 08:15:53 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 26 Oct 2022 10:15:51 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <geert@linux-m68k.org>
Subject: [PATCH v6 2/3] gpio: pca9570: add a platform data structure
Date:   Wed, 26 Oct 2022 20:45:42 +0530
Message-ID: <20221026151543.20695-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026151543.20695-1-shubhrajyoti.datta@amd.com>
References: <20221026151543.20695-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT006:EE_|DM4PR12MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: aa53ac9b-119b-455a-ef81-08dab76507db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VKH6KH0L+Shq6KgfGGYtLL/v9jZlAtXPCbUTNlcUeEpC15AQBhQphC94G9Z0rS1zsfi96JcejsdiUFytr9zwakVLcx4lM+Ijli+q8nsbpw450iY5tC7rgJNybRAH9csHkvO0DljNS6wgm/sUx6xYvAMgmiYnkg6UfFHeCfpnj/4dfWEY8X4qsTXqMWhaQe0P3CDjRiIZBj4eBHApeR0HtKL474vzq9K8VerPKR6a/AE2sRf+wJSnNQcSij9DMe7fZdpmmf7gd8iUHfJdvaamy7mhSaAXWQqdSgNU0bLG/C8Cpir/JH7GUfMow4VusToQpSGIx8B5Yrk6FVJRUfkc6xfX/CoSCbIOL8E8+vV1TzeHCWX6e2cKDPbDcoiLzEUCiLkRaPn5RMhthsi2Dt1Js1iQhYKKQfWb+molKYIE+MUoJD6ijKQD5l7cl3mqOdX97lOWoqbgSaX90skCJLYx/vp59s8Y8kcGfYRWyI8lGaw1gHzGs+WqMHvZwyS1UKfifNsSHeg5FerHe5Bl/wzLaQubV16uq1hJfckmKDdViWGr6K6aasIy/ci58wSsTThBFsyBk4S1JeS2S9udfJvWP70SginHs93bZEOQqDMgq9GKnBx+cXGlKVVqx5D0YYltKFi0FK2+WDNrS1+wd5jR5ENBeVqY8H+/kUxhUoT4ny+cp+/F4cAgBl7hBcBIy8R3SWOQh5P3b2hfFsiNzlVTlg66PvJevh2i5Lf+FCe/woqLLkVwfrYsL22DwoOOLnNgyGJ4KYF0Bac4ZChU+tvpDh2d+novXlc5fXWwHd8UsLMDL36zyg/CnN1w0V0zsAkT
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(86362001)(36756003)(41300700001)(26005)(5660300002)(44832011)(8936002)(36860700001)(47076005)(81166007)(40460700003)(82740400003)(2616005)(2906002)(82310400005)(1076003)(356005)(83380400001)(186003)(426003)(4326008)(478600001)(40480700001)(336012)(6666004)(70586007)(316002)(70206006)(54906003)(8676002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 15:16:17.7468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa53ac9b-119b-455a-ef81-08dab76507db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5199
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
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

Changes in v6:
Fix the bisectablity reported by Geert Uytterhoeven

Changes in v3:
split the new patch
Suggested by Andy Shevchenko

 drivers/gpio/gpio-pca9570.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index ab2a652964ec..e8c2ddb1bcd8 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -15,14 +15,26 @@
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
+ * @p_data: GPIO controller platform data
  * @lock: Protects write sequences
  * @out: Buffer for device register
  */
 struct pca9570 {
 	struct gpio_chip chip;
+	const struct pca9570_platform_data *p_data;
 	struct mutex lock;
 	u8 out;
 };
@@ -106,7 +118,8 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.get = pca9570_get;
 	gpio->chip.set = pca9570_set;
 	gpio->chip.base = -1;
-	gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
+	gpio->p_data = device_get_match_data(&client->dev);
+	gpio->chip.ngpio = gpio->p_data->ngpio;
 	gpio->chip.can_sleep = true;
 
 	mutex_init(&gpio->lock);
@@ -119,16 +132,24 @@ static int pca9570_probe(struct i2c_client *client)
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

