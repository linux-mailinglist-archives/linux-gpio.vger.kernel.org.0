Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2365EC276
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 14:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbiI0MVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 08:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbiI0MUv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 08:20:51 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A3D109747;
        Tue, 27 Sep 2022 05:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeFvWgJbtupQ9aHqCHWjhZKkvPaB5SPR67tzjQBjEH+5vjm4qY/yLTZV6K6fi0lh3B8Cl4UbWsaESEE4KO8N0JX89PBi29TIioxlCr0L7gYoJwPkiWdlBgEMNdcQslFiYio3hJvkzvQZJ6pNL0GKgdHbafL0z1MaIvJ37SE6Q0eevXKs29u2whAfHVXfa8VET+OgCpZRccC3UuolAN0zCwtjBAD5ps5gY19tuUl+W/JltU5GtHnT3YcuG8+pIj4KfOpwrGeEW6B9lCDKEf7jFQJ4HFiO+0RSdS4DbLySOMc/ynKyZK6LuCU+sqAiFjws4QlH52b1cFUG13O6U4HASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr0tpiwZaW3jcEqlkFzpZ+Ret9pXu2U55oXy18bGEdw=;
 b=UR8tB2iK7Efqhh7qLiqstYGYWKyQcm3c2xvM3BEUvkUawc4z1sNand4Z7DKQ7+jn+LKrlt4lpx1W/v3hS0n4ynr9iHXH73kXb/+gg9lblAlCaeFE/GpWzg7/Uc5/SIGHC+w/gbumys6IHGQwaJKPGVDhHV0Td1CITumyztAb47IE57LUuMJ63zVPWmrZSkbinvS2UzLJxRy7mK3ps89KKgCbrmpygYVWs44CKqk39RHLN+6T3lLzoIl6aAMvEJtUIZEjvYc4dTrva0EsKW3dIrgeh0cMbXIva/9AaoeOKlEEIn9H9T6oCRvI/107Ssy5VPyg+ImKWtS0QxcoFn/mlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr0tpiwZaW3jcEqlkFzpZ+Ret9pXu2U55oXy18bGEdw=;
 b=3AZb6zPY3XvignOqwUgc6p+ts9cvK2Q9sxwqs6DxrBHdhAwMII5/d3ZOEfDm0avqcPbFLDyVWioEcJwkU+5ma4RpDPobs4TOWCvRF4lQ6F1IdxPrWpKFfM3KRum7lqOwdI6jbKXKkRBr85xPjWVM7qT4uc1RdY27hq3NPZRCn24=
Received: from BN8PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:70::40)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Tue, 27 Sep
 2022 12:19:29 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::4d) by BN8PR04CA0027.outlook.office365.com
 (2603:10b6:408:70::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 12:19:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 12:19:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:19:26 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 27 Sep 2022 07:19:24 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v4 2/3] gpio: pca9570: add a platform data structure
Date:   Tue, 27 Sep 2022 17:49:17 +0530
Message-ID: <20220927121918.30543-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927121918.30543-1-shubhrajyoti.datta@amd.com>
References: <20220927121918.30543-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc7ecbe-41bd-4d64-a106-08daa0828683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AYa/j72zwKmuuV7V1c2Mf56Im1pn/he83Pexl2eyoDB6w2Oya//dST99xeJ9op8Ty/JsYa6/vwdCU1ybENrC7W563yWVc+zZsimWy7WOXIYEe2otMf7LB8z7f5w8xwynahyjctRE0lyr0zz4dA+o+wC3AS3FUxsxJdCTn27F3IhYZ8ubs+Ak7lXpLoacPaejn4muj96lAuDqd/VHfWqth45zRGF9WDwBygUGebFVSKBXBpzudI2mjKgACbpqxIGlJ5ktSQDUIm2PjV//VUpIZk9q4rNzLkNPRoiIk2DAtKf33jlY62cUNq36vBr9dPAWPnYVTAhQewvRo7fwkY18M+sNNVU8yUwAw6xcJairt39mPPR0j44Ff7aR3nQWRRF9rKcMinbQs6Jc5G0ZnLcPuBydu6tS9qNmlc8WLKs2o5yx4FdlLBstswhxVSvLl7dLhqS/eSaRjy3swHh57jEXdHs81AVDXtpS8Prg1XCB02zFJCabjLX+RdAjhe78KKtigSnNUgcL1tsprt8jNdcdJqYJcPOSBLC6RHGl7GQodWz5LFUbCm5DLGYicjP9YmGvPlR9GS73zs6+jvvDz4S/jA/DxXHGhyDjtTFDZuKCxPgN/+qmRCBRNgk95VpePuJhKMyNsmGb/uvtuIICL04+lt0GowLefOMevBkJi22lJGBdy4fkNtd3nRxN9eL8aMzC6aWKQVSK7VBJk/jC3UFx4/D0gPfsrP3Lk5Wp8kZooCFvQmNTc5QHmVIvWt2afO3E8IkdMEb7EUd7cKuxYF1ysIE3sj9csZr11zq41GQ6Uy81KQi/DjOda7iv4YC9a+CQ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(86362001)(54906003)(6666004)(41300700001)(356005)(82310400005)(2616005)(1076003)(186003)(8936002)(83380400001)(36756003)(426003)(40460700003)(336012)(36860700001)(5660300002)(40480700001)(44832011)(2906002)(47076005)(26005)(82740400003)(478600001)(4326008)(81166007)(8676002)(70586007)(6916009)(70206006)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 12:19:28.8531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc7ecbe-41bd-4d64-a106-08daa0828683
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
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

