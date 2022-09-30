Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8DA5F0954
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 12:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbiI3KwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 06:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbiI3KvS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 06:51:18 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2631A40B6;
        Fri, 30 Sep 2022 03:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJYUv1uKndmj2zH6yvzr9VTp/Imr5UHJN7z+3qpQPlO0XIOfC9gHqzPMZkqdNOI0SngypQfFfjoElGdZ2SXljixv/PJmkS5C8srONVUwtbpzZhaYjWaksdb+R/oM6x1WQKi4bMGRJk9RsAkqoFF5Pik1jvXtsTfHrRCjIoJKIBAnTShvvB5/SJ/rjHf3anFYhy2JxKbF1BrqYyc+twZuKNFjIduMHP7loppH2+F/Gaau67T3gA40ocuKotR/L78HlKiRrQksXQndik0KLgzDWl5jcD1JuIcFVYKJkwjwxhhs50pXZTkjOrmfiPE/M9F+JW0MekF+PxnVzagFyJ0Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlJjuLkHZI/2rlxGECuB9WDDNXR4UiuQKw/hXE7slPY=;
 b=UpatFggUEjBHPK8BN7fSkCIABVqwSYgiDvifx6LkFvCJm/HSXntepp0mG5chS7OlBR+3lskEL7DkiT4+Y8Z86nu+n2Y1CQ1OKjnA5H3l6xPh8VITiQ6+JdfYXsrYgOtPaT1y5BACeHggIEuJVsSDUevaYdXkysZUQMyCIZbs2kteGsw03+PpPTJ5JG2KHt0W63bVfTgM5xzLfVnz0WjjZ3JvUQWxX7m6b+cBLpUIwOT57Aq1iU7zfvaSuFo3oUBRYlwwczIFgM3xFH8MQPg5miUDeIMpPNhFNtF8FQU4bgS2xR7a52/ab3cjDNigiYcvNmc9eAembFIFKaERMWVEMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlJjuLkHZI/2rlxGECuB9WDDNXR4UiuQKw/hXE7slPY=;
 b=mCORaWEaesO14O7DeuKLWj41daF4D7BsNbA7PQyyJ4+bE4tVQBN8aafOYi0qPaA4JUW7rj1esHYKwgo0ppk5bjJlepOvV16v7hBipnKuTLR/04CHKogP2pyFtceNTyPWMlqh4+i/ZqiQGAzvE92+2TMjY7VKAwiQgjGmSIsolmk=
Received: from DS7PR07CA0009.namprd07.prod.outlook.com (2603:10b6:5:3af::9) by
 MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Fri, 30 Sep
 2022 10:23:12 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::2d) by DS7PR07CA0009.outlook.office365.com
 (2603:10b6:5:3af::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 10:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:23:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 05:23:11 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 30 Sep 2022 05:23:09 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v5 3/3] gpio: pca9570: add slg7xl45106 support
Date:   Fri, 30 Sep 2022 15:52:59 +0530
Message-ID: <20220930102259.21918-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT018:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 301a5f15-9198-4ec7-6009-08daa2cdc77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /+l1rx+6D1Jpyv+sQfi8c5xcVi4KXUSZm2bfKwbKwGOAzikrqbMjFE+O/ewq4+gODRnkZrqg0rbThMFb7lpNIAHD45wsNVRBwWLZ4oBQjlILPb6dEF1d+v4qbPIOqADQR1hLGCeXqqAyOaHWzZY/2N7zSNdoylgGZQ1L4FiRZkBtJcOWE1nRk1zffWA11nIUx7F1mQLkENwf4+bdfpVfx/3cSXrNtmG0gGnVtDdef2yhUJjH8rKTghvYsQo29BX+ysuxbDHo8cCahayjyb7PAM7w++slAH1vnk4eXRjT1BsC1PqvhlY8rFcLmHzRa0tYECnmFBS0v+ZPqwF1QcnR2r4eYyUa/6s6gHAO1qX0PTHqtwnWa9Qz1kgJaqUFt69prRO6Lh7b70oJALK4XbYqZPRBaID6Hh5blevRGBc7r2aex6rFEjY3z2H2ghQL/I60kzt6GftGzxIo6OllRuLybmw8CWEGatV7rC1AW++JzAlz+aaFy/NK+QNJeZeyNuE3SrhMjBP1YK+9iunAWr7YX5iSvKfiKPbt/sFG3T8+VmwadL/9evxxuvgrdURQIR1rxAqoZrhGCQm5wAyilP36lFdoIrCOUf/2J/NZbFlzsWtipUxKTdTUnfKpqXROCfpW3YRqRjudjuKf/M285L4BZtzVOccbQAqb836lycRZQU9AQjic0puR1/xej8pJxBcqDjo4QDlcudBiKUu1h3qyGgZyTwO8IwtgAdHQ0Ja+adF8jfsvL2K9V6GysSqW6oaPPSajnNfJ7Mge0GwCr7lpLdvu4JbK7EoN82I1wm++0IY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(1076003)(426003)(83380400001)(2906002)(36756003)(6916009)(4326008)(8936002)(70586007)(70206006)(26005)(44832011)(6666004)(40460700003)(186003)(8676002)(54906003)(316002)(5660300002)(336012)(86362001)(2616005)(40480700001)(41300700001)(82740400003)(36860700001)(478600001)(82310400005)(47076005)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:23:12.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 301a5f15-9198-4ec7-6009-08daa2cdc77b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
The output port is controlled by a data byte with register
address. Add a compatible string for the same. Also update
the driver to write and read from it.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v3)

Changes in v3:
split the new patch
Suggested by Andy Shevchenko

 drivers/gpio/gpio-pca9570.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d49e088e6b43..6c07a8811a7a 100644
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
@@ -28,11 +30,13 @@ struct pca9570_platform_data {
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
@@ -42,7 +46,11 @@ static int pca9570_read(struct pca9570 *gpio, u8 *value)
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
 
@@ -54,6 +62,9 @@ static int pca9570_write(struct pca9570 *gpio, u8 value)
 {
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 
+	if (gpio->p_data->command != 0)
+		return i2c_smbus_write_byte_data(client, gpio->p_data->command, value);
+
 	return i2c_smbus_write_byte(client, value);
 }
 
@@ -116,7 +127,8 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.get = pca9570_get;
 	gpio->chip.set = pca9570_set;
 	gpio->chip.base = -1;
-	gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
+	gpio->p_data = device_get_match_data(&client->dev);
+	gpio->chip.ngpio = gpio->p_data->ngpio;
 	gpio->chip.can_sleep = true;
 
 	mutex_init(&gpio->lock);
@@ -137,14 +149,21 @@ static const struct pca9570_platform_data pca9571_gpio = {
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

