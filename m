Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DACF5B9A1B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 13:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbiIOLyN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 07:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbiIOLxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 07:53:46 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C5A7D7B8;
        Thu, 15 Sep 2022 04:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI0U1rhjgFo7HRJujsJWsEwDQNFdBJ3WAP/oZx1RRKx49jjuqN4QRXjv5uL/Kd7TMOgAHVSofpI0uu+mlLr9t737Rp1cXAkfkijLX4q6dxuwvwghtD1Xw4tlbCnHafLh/BSK3KF6N2CssqQL8M5uj+eMc44+ie0DlaFDYRUx3jtg3LmSiGPgnCtZBMdiW42fRecon2NNMv4ZXaa/Lapg7cwfJLA3Dc3oo2G9LTNueNrpzBFPhsybFBp8F+aFPzIb0539TFyF2h1moAl22ESJ/xTKgTnIGNcgsxCLclEtUcSTtl54sMd8z+IDSnSmM+4v+sYWNTLu4bSj+6Gej4YMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHtpQ6lN4vo64otp+zH/gblduocba9b+261q7c+ZNJg=;
 b=iXG3cbrDuyDv/9cQ2CM74vnfGeqk44N3Rpq7AcmEN3nErZeVrqk0v5xmyWk+0nTj5PjIFcIyl/pcVEJiFVugJYaEfOt41qjE1UbhEYv7DDXiWtlWFTF5Xm7Km0rBWYq8+GTHxSUA19RUqdzUKNGppDUlLiyORABl/8zIqKDi+Ow+woQZjo91j6cWREtLd8OYtV+SZilmxH7LAB+0h54snqfggVHTViktJ8zoduvNxYUd/iWKrP+o9kkXjn+qWNRecaffOzttijlA4NMXXNsyCxCD+4Kyl1xTfcxoSsZ0Imc8fi0k/ewgKkPcNhppN015OtuhX6ciCsB3YqXmPfrf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHtpQ6lN4vo64otp+zH/gblduocba9b+261q7c+ZNJg=;
 b=iQ6vXQ7SeHVQmmzWtmVQL+9TfXJs29FGlZ1VJmyK+eHi7c5DCz9aNmJK2zv2a8A96ZPXBowRYhzffKRQElbN733jKs41sTnNWXtlajb+dSY2OYHCZdjSXMkkf0KxPbXQCoSUCHdXs6ZMLTZO9duZqA4uC3NGbWojD0JlPiI7X4c=
Received: from MW3PR06CA0004.namprd06.prod.outlook.com (2603:10b6:303:2a::9)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 11:48:15 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::9e) by MW3PR06CA0004.outlook.office365.com
 (2603:10b6:303:2a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Thu, 15 Sep 2022 11:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 11:48:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 15 Sep
 2022 06:48:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 15 Sep
 2022 06:48:12 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 15 Sep 2022 06:48:10 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
Date:   Thu, 15 Sep 2022 17:18:03 +0530
Message-ID: <20220915114803.26185-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: d762c580-aad4-41a2-e167-08da97102c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6lbsSODsBj36+fjhEEOSS6cnxpIKI6xuIbVu9SvCTB0KruEhTDZkKGwxTqALu2JWNh8AvIRFYMCktn//JymcgifkikcY1l8dIa7JaW1dw8s7D5xc3WitXT265b/Gn1hAZJjdYldXlR8FbPZorEWVhbEdTCEdVw62SBxtZA50nzq5sE36PAWH/47YdeBlNdX+239XQQBrKqNCtaIWK+O/ZCMV4g4DiCHpQ+UPo12JthE4IzM5UcW8E2V/MSPCQ0KxxRgyXF5PEfJfPNy2axAqkOABgRpZ4320u5lSnDelDwkQ8jjzeTWtE04gsiI5C1XHvvXM3Xr/pGqXCfhz6AnafI3pCTUNKPhyPCUFKf8z6E+yGYEl2jHz4+Az12lE0aHan0DL+Dta1ILZJD1LcfEZoHdj2f90g9Uypj7zBRoNQfCEWYNoYFg0yyGj1JZKthloo/PcY0EU4ghDQig0c43x7nZLJf7MUUoxAK8bPAqXjOrhiuF1x1Vklb6rvW3y56/bqAlX0VpIlwbxTDnWOooz6G7+KdPYlCEwt887b+WKEqEM7YWfeEfP4+RcWPvrkP5yJBoZMAqlrPSG9Cv34gLAVElrp4yKPXE9hk4bYUkTuGU8wTV+uEqspza8zpsnobI/UsDR5fNxAGSOmUHYUvenlvAYHWJJP9K1ljkW5jGF0B2eunMCXykw/V0i9YhbM+4lA57Zr3Tp3/MSiQZIT8ls2UTU64i5TqlBXB7xFzPVZcCiUGvdwTpOTQ8eB9yLZUxfvO3cpW+1VA67D7412yKK0nqTEgT8LSJQ6bmANJJArypibS2wVEh10W/phRKS7Pl
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(44832011)(40460700003)(478600001)(36756003)(70586007)(70206006)(6916009)(6666004)(41300700001)(4326008)(8676002)(86362001)(54906003)(356005)(82310400005)(8936002)(81166007)(5660300002)(336012)(40480700001)(82740400003)(2616005)(1076003)(186003)(26005)(316002)(47076005)(426003)(83380400001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 11:48:14.6779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d762c580-aad4-41a2-e167-08da97102c86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

slg7xl45106 is a I2C GPO expander.
Add a compatible string for the same. Also update the
driver to write and read from it.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
v2:
Use platform data insted of compatible

 drivers/gpio/gpio-pca9570.c | 39 +++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index ab2a652964ec..4f255347a62d 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -15,6 +15,8 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 
+#define SLG7XL45106_GPO_REG	0xDB
+
 /**
  * struct pca9570 - GPIO driver data
  * @chip: GPIO controller chip
@@ -25,6 +27,12 @@ struct pca9570 {
 	struct gpio_chip chip;
 	struct mutex lock;
 	u8 out;
+	const struct pca9570_platform_data *p_data;
+};
+
+struct pca9570_platform_data {
+	u16 ngpio;
+	u32 command;
 };
 
 static int pca9570_read(struct pca9570 *gpio, u8 *value)
@@ -32,7 +40,11 @@ static int pca9570_read(struct pca9570 *gpio, u8 *value)
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
 
@@ -44,6 +56,9 @@ static int pca9570_write(struct pca9570 *gpio, u8 value)
 {
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 
+	if (gpio->p_data->command != 0)
+		return i2c_smbus_write_byte_data(client, gpio->p_data->command, value);
+
 	return i2c_smbus_write_byte(client, value);
 }
 
@@ -106,7 +121,8 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.get = pca9570_get;
 	gpio->chip.set = pca9570_set;
 	gpio->chip.base = -1;
-	gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
+	gpio->p_data = device_get_match_data(&client->dev);
+	gpio->chip.ngpio = gpio->p_data->ngpio;
 	gpio->chip.can_sleep = true;
 
 	mutex_init(&gpio->lock);
@@ -122,13 +138,28 @@ static int pca9570_probe(struct i2c_client *client)
 static const struct i2c_device_id pca9570_id_table[] = {
 	{ "pca9570", 4 },
 	{ "pca9571", 8 },
+	{ "slg7xl45106", 8 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
 
+static const struct pca9570_platform_data pca9570_gpio = {
+	.ngpio = 4,
+};
+
+static const struct pca9570_platform_data pca9571_gpio = {
+	.ngpio = 8,
+};
+
+static const struct pca9570_platform_data slg7xl45106_gpio = {
+	.ngpio = 8,
+	.command = SLG7XL45106_GPO_REG,
+};
+
 static const struct of_device_id pca9570_of_match_table[] = {
-	{ .compatible = "nxp,pca9570", .data = (void *)4 },
-	{ .compatible = "nxp,pca9571", .data = (void *)8 },
+	{ .compatible = "dlg,slg7xl45106", .data = &slg7xl45106_gpio},
+	{ .compatible = "nxp,pca9570", .data = &pca9570_gpio },
+	{ .compatible = "nxp,pca9571", .data = &pca9571_gpio },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
-- 
2.17.1

