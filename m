Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB5A5F0939
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 12:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbiI3Kiq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 06:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232729AbiI3KiE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 06:38:04 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B379F1B6;
        Fri, 30 Sep 2022 03:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hm+gUKtNv4XMNop8lgSki9oZab2ieZF5sH98QZ96Q5urG7lHPO1xPWqs0JLkI6iTXUWUwDMv64e1CdtJ1TMMaoLsiipIIfVYRKWsAUg2ftSU/kiRtcjHTeh8Yf4R/1rh+vDT03wj0r4z36XLRjAbMPHYnLcEaR6RK8/rokWLz+lWJvpzSzWwvNmR5VOwSikhMfJ3a5fbFeKaoRDPJ96JxNDRIt/9PBgxZCN5InGoEbKOZjEFiennP4jPJZudtOowfnabQESXuWZltOY5ormehSh6XhzDQjZnRXikfrV+QklqeqnZKmZ9BtA2Bi+szz4Drfx2l7uFpuwjJXoTvOn1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOwqL8T2EuI6+v3O0CH1lRPoiDfAp49JY75ojcvbfRo=;
 b=SeHtGAX2A5+PHe7zeDDFHYHn4qq166NIfQoqUikJqKJowBBKb2M+Ajusul8929QjJ9zzHeXFrRsoj+awjUlP5bUM0JQxhBFqwabZ8quDjNE+uValKX+9Wimjl1IngyMTkPEkJrabyZuzBfJLOM5B3QxTgQTDsYTfaA+5abFO1OXErOzM+VDCa13EuWxSee6AaXjrkL0aUsG4N8VmbnnkxaJJkb8/yzm9RmHuDMstmZR9MH933gkBM2YmW7wXAlAabdhCkmdoDXxacYwx1IC0Vf62cpt5udGawu8+KpIlBHJkqyIpV513O9xDAeAFh7HjhWZCLmbCa9EmMrxV4M3/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOwqL8T2EuI6+v3O0CH1lRPoiDfAp49JY75ojcvbfRo=;
 b=t6GSQ8M6urSS81YoJz+zPQS/Y5/g4vEwrNRDo+3dBRdSV6e/JBl90XZGdDKYmqtM692W6KqxdCWjK4ZK8l8Kr9MFj52XZUcYokPMRBsEPUtb+UNFIqcQd7mtraTrUTEzCTZ2schyieFUSEEuXmbXn8BqUq+ssy+Df3341qTf5ls=
Received: from DM6PR03CA0036.namprd03.prod.outlook.com (2603:10b6:5:40::49) by
 DM6PR12MB4579.namprd12.prod.outlook.com (2603:10b6:5:2ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Fri, 30 Sep 2022 10:23:09 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::f0) by DM6PR03CA0036.outlook.office365.com
 (2603:10b6:5:40::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 10:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:23:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 05:23:08 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 30 Sep 2022 05:23:06 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v5 2/3] gpio: pca9570: add a platform data structure
Date:   Fri, 30 Sep 2022 15:52:58 +0530
Message-ID: <20220930102259.21918-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT062:EE_|DM6PR12MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: a5bcb8f0-ea52-40c5-971a-08daa2cdc5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TEb+AlwbAdz4g4xrA0/1cP9HoInpm/gQw9j+Ihk94QXelFhWMO8LVOm6QrG3/AqwTDx8PeYjf7a77CpgBR0FE289Ce40IYrNxuDa7emnUgF6NR+06OpXwPShGvNy2+3fAK+e0NoEFIE+eCbvS5UEU36wmhigDPSI2moDaHxElw2gbrF3v1hRPhDsNRYF2GefmhyrsEID8hjcZyDkQI4t/ibVgYkRxqs2+/C42fu+WNpbXcSzMqpfAD+21pxn7kqhGxDlGbGP3MXbZ+LHM3yoLGfxBwRDhElwiXa7MI5IplwSRbGGn+foJAYJObwA1q3AcWDmLeb3sXSchyeTV2ZhfI40DTogju7TNo5AV18ZQpCELroF+rpQczAz9HRzVmN8Qb8oEp7TruuxU6PeuN5EVz0zWWAGvPENlejr/WnqkgypJGXcJsJwaxEjGBVgWFuRZvXGBswRerhkZiNtNv6SUJT1YIGgsIr2saYvieOMBcJ4nSNZMwJahk79PxllBcO492L6bzpWOLESccB2rDGMiyV7khY8z2viWngxjdGTOYvRLlApqDTPDDqTk5QeDN4FKdJOt3Flhfwd3E1aBqRe4M1F0KPZ3cIqy9wwCrfdzCcT6XYUaFK8brzBkJvUPS4LfIfSKz+dx7lN0o1Yu578ywdRlbxo237+ARu+JyItT3Bo1CbJUtEFGbmDOZrxDiEGzrdjnOPxG9wBRqiPncNFQu477etlz8Brhn+YYfz6nkVwt/LiQJ8nWd0rRGP1AWQtaOr25b/EcvM/j6FbjfwhPuxaAarIC5XJ7gxfpAiQYqa+VW0vkq4WeKc7cbOaEo22
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(6666004)(86362001)(26005)(36756003)(8936002)(2906002)(2616005)(70586007)(70206006)(36860700001)(8676002)(54906003)(6916009)(336012)(40460700003)(1076003)(186003)(5660300002)(41300700001)(4326008)(316002)(44832011)(426003)(478600001)(81166007)(40480700001)(83380400001)(356005)(82310400005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:23:09.5399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bcb8f0-ea52-40c5-971a-08daa2cdc5c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4579
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add struct pca9570_platform_data for adding the platform data
structure. Also modify the existing structs for pca9570 and pca9571

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v3)

Changes in v3:
split the new patch
Suggested by Andy Shevchenko

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

