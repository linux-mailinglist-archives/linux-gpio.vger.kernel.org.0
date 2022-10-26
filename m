Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6361760E44E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 17:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbiJZPRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 11:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbiJZPRO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 11:17:14 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1567122759;
        Wed, 26 Oct 2022 08:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex4/DQGxl4mtfc7i5mQhmBftNukAxRyqYtvchwRRe2zeEOHsKCZQbMe7CLAOvjP3vIyPA73Gqfn5jsO9m/6ZR5FZCuq22UltqD5U7BYIeIYtvaAH8ndH1mpTL6YryQ2eRyV/8z6yncYpk9lelDPR2dH+R6VaTijqbIsUdfD83N//WilTkeiC4U2fzt3L2ZuASqlZscQ0kqYZ+9d0K5H4xAxTigvbCYYXuCY3xW7WW7/rxVuKls2M2LmoBqYrDFnEqz+FgFoeKoQToSaeQCBLmm4uXi/3vhvlz70U59iBvqP/j+FN2rE2dj9mBe+bjdHygUYNzRm5XZq0algsxGaCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfeHZDjRwW+qeRb0jXXmUmTiETerfMWozh7ckSzA6eo=;
 b=dtfrqOT5aegpDmVcoS+L+UKiOa/RohlOS3i14K1BfKApZrF2mg2IGiIHi0uBwswjV/RXl/N5Zfe5/cN7Y9seoAiqZSYrV3fGRCW1GgCjfxoj4cwXaP5VTvIXj+yXVqv9rgm4k00+JBTf1iyQa2AHxYKFxP1d7NLZVtG1Ip92Aux6iqec9JKOMDFFKSChOZS0DPQ1En+3kcIeGjlxu/RAgbo/hnFkT5S6wGUkOdFPsJE9k5uIMHDnwShz8dPRgZWHYuTji2JSQ/yTHGDCCxxHp2De6BjLwsRhQNXLxadUHVTdLo837sGAdKQUAkjjc3jdHz/3RaBP/T/hEqIf9pmjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfeHZDjRwW+qeRb0jXXmUmTiETerfMWozh7ckSzA6eo=;
 b=p+BIOkCicCTvQM54jV5upnNtHGDlNFpzkwWTOySGchSs2vEl04pXYi61KaA1x5DZKu+ATaM6tJcBkSXGvxhXE+KtJYGWWyWXsq+XEK64zd+JcD+rwIHPBh6RqpUuVvYDu3vhoAPQqlphcFItDOohgT1hLarKorDKVy2Kl7nQUyk=
Received: from MW4PR03CA0255.namprd03.prod.outlook.com (2603:10b6:303:b4::20)
 by DS7PR12MB5934.namprd12.prod.outlook.com (2603:10b6:8:7d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 15:17:11 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::9) by MW4PR03CA0255.outlook.office365.com
 (2603:10b6:303:b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 15:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.18 via Frontend Transport; Wed, 26 Oct 2022 15:17:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:16:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:15:58 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 26 Oct 2022 10:15:55 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <geert@linux-m68k.org>
Subject: [PATCH v6 3/3] gpio: pca9570: add slg7xl45106 support
Date:   Wed, 26 Oct 2022 20:45:43 +0530
Message-ID: <20221026151543.20695-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026151543.20695-1-shubhrajyoti.datta@amd.com>
References: <20221026151543.20695-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|DS7PR12MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 228e8e9e-103e-4619-185f-08dab76527f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+xG2gTRMsrIHrmOLXeOYVURU+ufmyh6jdHJkv03MM9VDt/N6NtIdTk9j4EYmGB7r2rFzykqMpD3S418SxUsYKw8/A2M9XC91FqVkGURNYsdUFNXe7gh5CYghqq08eL61HSXcfDI+u5XtXPBdO15wqUeUebtnz056EtehlVaceDGj9AuACn9kXUtgnQdqywsSCrBrsdxyFXrWrTyLPMFJPcZ8goU9dmI2esimbCygbK4KBATk6ZtmCOr6zJziFmdWpX5R3onxnlZeoVvcxaI8/D2D+bPnWinh4JNguS4GevGE7hNfjZSlDiSt9frYu3DF304IKbCAO6Gc/rA5LIeGQC3R8szYh/Cc0WORVF2kIrsnLAjgyJYf3MPbewp/I33VwunfzTNqt58jDi+0oZ4pJWore0raiaUj6sD3yRu4/t60smNBCVzRgeRAaZ7mf/d/hMk8bSlKtIqsQO+83E0uqxDc/eYMhXJzmmcuzkm9pJ4MOuRKO6VptPponAZL2A3u+v5kIE5rym9dVbP1KKZjbkWbUaqi/oRBkmTHS4upcGaqHyPcY8AEOok1ZPq3siy35JDvSN2rpjOqk5sNnmm6Nh4STTODkfX7hVQh5nYHgYNFFUoh2MvpT/acwR4MLOT3NjCHEI/XvOKVw9i+F9l8BebzOYzl0lP/3ReGEi27+hhXScWGwKLbLyc8lR/AvFvnpLXzAHHsUchIFD4W9lPbA7ub1dHaAD/J6UrGJ3PLm0Sr/154igT/RAqQ8MLwCi/iVboiN4vpHDKDH73q42C5B8SLe7EsMwdnpSQMDzj/1E=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(2616005)(1076003)(6666004)(356005)(426003)(336012)(47076005)(81166007)(86362001)(40460700003)(82740400003)(41300700001)(36860700001)(83380400001)(44832011)(2906002)(82310400005)(8936002)(54906003)(70206006)(40480700001)(5660300002)(478600001)(26005)(70586007)(316002)(8676002)(4326008)(186003)(6916009)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 15:17:11.4622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 228e8e9e-103e-4619-185f-08dab76527f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5934
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
The output port is controlled by a data byte with register
address. Add a compatible string for the same. Also update
the driver to write and read from it.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v6:
Fix the bisectability remove the device_get_match_data change

Changes in v3:
split the new patch
Suggested by Andy Shevchenko

 drivers/gpio/gpio-pca9570.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index e8c2ddb1bcd8..6c07a8811a7a 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -15,6 +15,8 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 
+#define SLG7XL45106_GPO_REG	0xDB
+
 /**
  * struct pca9570_platform_data - GPIO platformdata
  * @ngpio: no of gpios
@@ -44,7 +46,11 @@ static int pca9570_read(struct pca9570 *gpio, u8 *value)
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 	int ret;
 
-	ret = i2c_smbus_read_byte(client);
+	if (gpio->p_data->command != 0)
+		ret = i2c_smbus_read_byte_data(client, gpio->p_data->command);
+	else
+		ret = i2c_smbus_read_byte(client);
+
 	if (ret < 0)
 		return ret;
 
@@ -56,6 +62,9 @@ static int pca9570_write(struct pca9570 *gpio, u8 value)
 {
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 
+	if (gpio->p_data->command != 0)
+		return i2c_smbus_write_byte_data(client, gpio->p_data->command, value);
+
 	return i2c_smbus_write_byte(client, value);
 }
 
@@ -140,14 +149,21 @@ static const struct pca9570_platform_data pca9571_gpio = {
 	.ngpio = 8,
 };
 
+static const struct pca9570_platform_data slg7xl45106_gpio = {
+	.ngpio = 8,
+	.command = SLG7XL45106_GPO_REG,
+};
+
 static const struct i2c_device_id pca9570_id_table[] = {
 	{ "pca9570", (kernel_ulong_t)&pca9570_gpio},
 	{ "pca9571", (kernel_ulong_t)&pca9571_gpio },
+	{ "slg7xl45106", (kernel_ulong_t)&slg7xl45106_gpio },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
 
 static const struct of_device_id pca9570_of_match_table[] = {
+	{ .compatible = "dlg,slg7xl45106", .data = &slg7xl45106_gpio},
 	{ .compatible = "nxp,pca9570", .data = &pca9570_gpio },
 	{ .compatible = "nxp,pca9571", .data = &pca9571_gpio },
 	{ /* sentinel */ }
-- 
2.17.1

