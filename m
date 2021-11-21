Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E2345851C
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238748AbhKURAf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:35 -0500
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:8337
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238344AbhKURAI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k4kB2G0R1p3G60V1a8RT7Za+LQj2NYxAjo54dC8Q8I=;
 b=+DNLeQXNDEJNfB3Dz392XKmP9GRZto0btr20YlnkyvSv8PV6U0UsOSWrXES4IHIhiZ8JODy+Awxr4J/KZEQv7DhmamhAFjPqYEwvlkaQdqg9oniCqUIeaWWdTe+SogkMfqaIIzOpvhjnjJUuWDEiW1f6lGEcUaOr5SpghKGkc6U=
Received: from DB6PR07CA0057.eurprd07.prod.outlook.com (2603:10a6:6:2a::19) by
 DB6PR0801MB1783.eurprd08.prod.outlook.com (2603:10a6:4:2e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22; Sun, 21 Nov 2021 16:57:00 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::8) by DB6PR07CA0057.outlook.office365.com
 (2603:10a6:6:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.12 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:00 +0000
Received: ("Tessian outbound c61f076cbd30:v110"); Sun, 21 Nov 2021 16:57:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20dd9cd09c6b9c20
X-CR-MTA-TID: 64aa7808
Received: from a8d4ac73707f.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 018D6851-D60E-47CF-9DFF-D461E557FDB9.1;
        Sun, 21 Nov 2021 16:56:54 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8d4ac73707f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPBh6PqQtTPUWYHFUUBfz7KZuy/INVWTGYZK65RqjpMqHjtk58//aBUWo8BCOZ0VGqMPCpuhUq4m+yDkJ00b8HVZrOYSYU8b+s3NXWGJCQEUr4cFQWxiT0M02GqLBZt1U0W0QZvC9ZH7V54Y9F5sXvCngVQ0j5Q7ELLFeXmBflK4DDiglB54e4TSm3E6wxyXoovfVX552fE7GPcZeYJ40lNSlOqIyVOVNMQ6x+N3ZVFjXaB3ZG3oGzFTwz08JH6c5TArvur1MauNCtRXMzJ9GTUpuD3um5zyAdkPnE+B34kRb6HzjZeXOPOwLcAwyDJum8ULq8LewKUJZnL6UoLRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9k4kB2G0R1p3G60V1a8RT7Za+LQj2NYxAjo54dC8Q8I=;
 b=mk4Ltjs1jDfOVvldbPl6YeDG/Dj11kvO4OiZ53cpeA+mRyaq2xd8g+ZYgbE2/IWlvMec15pHIK6O5zrxC8r09QdJI9r6FIJ6V0ZN1emUZYgTKTXkGJW4QABaG3VNIiroCSnRUG5nrmTMwLbc2HDuP0dOLIOQEvA63ZwJ1RB4WijzsgY8r56ABKYnlT2K8+GoxP4gYpQcya9flAbA1neJgg262O83GHBoYkftBChRVDMvlfqEsGI/VYYOvcm7nvYJJ/g1Kxypm8p5hyo2dzDXz3z4GsGbKQg65Dk392ANrb7hPWEFcOMfvtaVC7To37sM0PMpR4onmOqoQzRIm2GWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k4kB2G0R1p3G60V1a8RT7Za+LQj2NYxAjo54dC8Q8I=;
 b=+DNLeQXNDEJNfB3Dz392XKmP9GRZto0btr20YlnkyvSv8PV6U0UsOSWrXES4IHIhiZ8JODy+Awxr4J/KZEQv7DhmamhAFjPqYEwvlkaQdqg9oniCqUIeaWWdTe+SogkMfqaIIzOpvhjnjJUuWDEiW1f6lGEcUaOr5SpghKGkc6U=
Received: from AS9PR06CA0419.eurprd06.prod.outlook.com (2603:10a6:20b:461::15)
 by AM5PR0802MB2404.eurprd08.prod.outlook.com (2603:10a6:203:a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Sun, 21 Nov
 2021 16:56:51 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::24) by AS9PR06CA0419.outlook.office365.com
 (2603:10a6:20b:461::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:50 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:48 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:48 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 01/11] pinctrl: apple: fix some formatting issues
Date:   Sun, 21 Nov 2021 16:56:32 +0000
Message-ID: <20211121165642.27883-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98794f1e-bd42-4276-3e04-08d9ad0fefb1
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2404:|DB6PR0801MB1783:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1783DB6FCA557C6BF170ABFA949E9@DB6PR0801MB1783.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:854;OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hEciRTUeUxe8emXdJ7UhB6IvO10XfYHUq5oPK2+YAALjhXlBloQGmUZiwMK+k3pXl74xNt2vb6BMZy7ha0DNK+fZgP4owhnL0ZAZf5ay6n8QivDHtEuhJcOXHoYSg8gPqEeT4QenI0AJldW6jH0ZFg4VP2f8NI6TFgfmOLEO1Rcp6hUw+NtcZVEhMkX+UT4i6Cil9RdURSvHpl5CVqdMA73XKd8xYm/ri5ZWBcTHJOoYVOaDaYfr0VSLYB9z+fiKrIFu05X0J2dNTamGdBzD+EnGqW394q/dsVDSm6X1AxMb3eluIJIt4FFqBoUKGknCdnts6B5qZG/kQFAiaOG1E9g5yibeQojNVheY9Fj61bcbrwymSv/yXn6n2bdSiSzn+/QOdIvsMJa6WLWzEfgnupPM9k4vp+sGbXuZxOR5opytmegcDDWrwXwbmZZ2hTqcGB7ef1kwFu6Nlr30GJxW6ZrwpnbmcGracgA/ge8St8EPOjGv9+x2bR3TdIheC6U3p+cNhkw2Fp90ZxtEN/RltOHL4IHcAdOJfpXfjGu+1AfjWTixqCArIwBLDhJ9OV3C1D7VSOArnlNtqzIuM5+ceGvmIcqsS4r5xbOC8tNHGKPf6VVLSBCjW8uKTQIos3Ywi+dghemjOspsblwqouQv1y9Azvu177zK+xusHeM+mNAt1yXCur7tE2HSpr8pPfkwgQ79t4ulrpq9gx92vJ+iEEElZfYhZ9fM3ED1rcC4Kz0OUsI0wX8p+Vmfrzh//aw0S23PaAMF+UHx+FqZeELmkw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(26005)(316002)(426003)(6666004)(356005)(47076005)(186003)(70586007)(8936002)(70206006)(36756003)(86362001)(7696005)(508600001)(2616005)(44832011)(82310400003)(8676002)(54906003)(2906002)(6916009)(81166007)(4326008)(83380400001)(1076003)(336012)(5660300002)(36860700001)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2404
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8d7e5b9e-8463-4d45-f909-08d9ad0fe9d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p3+Ue+sPLREKwsK9HjQ0vhC65h//mdAzOj6do4Ar+KrhquPoNKwEawdrosWXoQAnSD5JEwKYqGcIACOli4QSn3MXLKI0HJmq4H/OK7hbqt0RzITbzV4AEEg7p87/DsrK0s4jIjEyxBWQQrLtwKiFdVEyegUFzadPjOjZKSAuHDcn8hzLz+Vq9krs/vD3HQsChnurGuZoFXAXWC5BrcYAhFRvC95L1qWeHPkueKymYjO7q619ck3L9tWAzdVErnkepdWvKqGgg5UZMfejwwdZ2w2jyabnR6zrD8iDtNFauzWzZOaOuTvdcCLzojp2xtAydDe6HoQgQlWVQjxDSyfpUHW/FLRmlLqIjd2m6//kJ4VOPZib5Rlc2+li8MyjhUyS2iCuTjORyg99A88sdF1TWSzVYRMNOnRptK9ZTznttUXnikroJTPRBZUeFRsGDB1q7voHTK6hn2u6otXyMvNFKnrmrrTD5hlfHgS2AjW4bxcMWGSrn94adeeP/IWLil2Uxzw/Tgbxq8KrMrTJ05dpomlQK5z5JIWtoVHIDIVBqBIUT5+YZdhtwJgrs4OCxq8pBHpzmZ2y4g+xjI8zrBNpQNkbtkxT1mvZpJJ6LnTwiQhNLUpHbdFTZrPCMdwnTMeQp252dJVNjd/UOSdvzzOCJ2F6PK9EICOReJW7PjdnG+pk+ncikVjE/s9G+YuqBPqfJ1Vh5B8sS4ROvQiFWY+a8hLNEmMaV5lXQRt8sF7ofOE=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(86362001)(6916009)(54906003)(186003)(5660300002)(1076003)(47076005)(26005)(2616005)(8676002)(6666004)(44832011)(70206006)(70586007)(7696005)(508600001)(83380400001)(81166007)(36860700001)(36756003)(316002)(8936002)(336012)(426003)(82310400003)(2906002)(4326008)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:00.7030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98794f1e-bd42-4276-3e04-08d9ad0fefb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1783
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reflow some of the code now that the extra '_gpio' was removed.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 69 +++++++++++-----------------
 1 file changed, 28 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index a7861079a650..7299c7686f7f 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -75,13 +75,13 @@ struct regmap_config regmap_config = {
 
 // No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.
 static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
-			       unsigned int pin, u32 mask, u32 value)
+                               unsigned int pin, u32 mask, u32 value)
 {
 	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
 }
 
 static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
-				   unsigned int pin)
+                              unsigned int pin)
 {
 	unsigned int val = 0;
 
@@ -92,9 +92,9 @@ static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
 /* Pin controller functions */
 
 static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
-				     struct device_node *node,
-				     struct pinctrl_map **map,
-				     unsigned *num_maps)
+                                     struct device_node *node,
+                                     struct pinctrl_map **map,
+                                     unsigned *num_maps)
 {
 	unsigned reserved_maps;
 	struct apple_gpio_pinctrl *pctl;
@@ -119,8 +119,7 @@ static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	num_pins = ret;
 
-	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps, num_maps,
-					num_pins);
+	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps, num_maps, num_pins);
 	if (ret)
 		return ret;
 
@@ -138,11 +137,10 @@ static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 		}
 
 		group_name = pinctrl_generic_get_group_name(pctldev, pin);
-		function_name =
-			pinmux_generic_get_function_name(pctl->pctldev, func);
+		function_name = pinmux_generic_get_function_name(pctl->pctldev, func);
 		ret = pinctrl_utils_add_map_mux(pctl->pctldev, map,
-						&reserved_maps, num_maps,
-						group_name, function_name);
+		                                &reserved_maps, num_maps,
+		                                group_name, function_name);
 		if (ret)
 			goto free_map;
 	}
@@ -165,7 +163,7 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 /* Pin multiplexer functions */
 
 static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned func,
-				    unsigned group)
+                                 unsigned group)
 {
 	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -186,8 +184,7 @@ static const struct pinmux_ops apple_gpio_pinmux_ops = {
 
 /* GPIO chip functions */
 
-static int apple_gpio_get_direction(struct gpio_chip *chip,
-					 unsigned int offset)
+static int apple_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 	unsigned int reg = apple_gpio_get_reg(pctl, offset);
@@ -211,17 +208,14 @@ static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(reg & REG_GPIOx_DATA);
 }
 
-static void apple_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				int value)
+static void apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
-	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA,
-			   value ? REG_GPIOx_DATA : 0);
+	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA, value ? REG_GPIOx_DATA : 0);
 }
 
-static int apple_gpio_direction_input(struct gpio_chip *chip,
-					   unsigned int offset)
+static int apple_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
@@ -234,7 +228,7 @@ static int apple_gpio_direction_input(struct gpio_chip *chip,
 }
 
 static int apple_gpio_direction_output(struct gpio_chip *chip,
-					    unsigned int offset, int value)
+                                       unsigned int offset, int value)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
@@ -249,13 +243,10 @@ static int apple_gpio_direction_output(struct gpio_chip *chip,
 
 static void apple_gpio_irq_ack(struct irq_data *data)
 {
-	struct apple_gpio_pinctrl *pctl =
-		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned int irqgrp =
-		FIELD_GET(REG_GPIOx_GRP, apple_gpio_get_reg(pctl, data->hwirq));
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	unsigned int irqgrp = FIELD_GET(REG_GPIOx_GRP, apple_gpio_get_reg(pctl, data->hwirq));
 
-	writel(BIT(data->hwirq & 31),
-	       pctl->base + REG_IRQ(irqgrp, data->hwirq));
+	writel(BIT(data->hwirq & 31), pctl->base + REG_IRQ(irqgrp, data->hwirq));
 }
 
 static unsigned int apple_gpio_irq_type(unsigned int type)
@@ -278,20 +269,19 @@ static unsigned int apple_gpio_irq_type(unsigned int type)
 
 static void apple_gpio_irq_mask(struct irq_data *data)
 {
-	struct apple_gpio_pinctrl *pctl =
-		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
-			   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
+	                   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
 }
 
 static void apple_gpio_irq_unmask(struct irq_data *data)
 {
-	struct apple_gpio_pinctrl *pctl =
-		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
 	unsigned int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
-			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
+	                   FIELD_PREP(REG_GPIOx_MODE, irqtype));
 }
 
 static unsigned int apple_gpio_irq_startup(struct irq_data *data)
@@ -300,7 +290,7 @@ static unsigned int apple_gpio_irq_startup(struct irq_data *data)
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP,
-			   FIELD_PREP(REG_GPIOx_GRP, 0));
+	                   FIELD_PREP(REG_GPIOx_GRP, 0));
 
 	apple_gpio_direction_input(chip, data->hwirq);
 	apple_gpio_irq_unmask(data);
@@ -308,18 +298,16 @@ static unsigned int apple_gpio_irq_startup(struct irq_data *data)
 	return 0;
 }
 
-static int apple_gpio_irq_set_type(struct irq_data *data,
-					unsigned int type)
+static int apple_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	struct apple_gpio_pinctrl *pctl =
-		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
 	unsigned int irqtype = apple_gpio_irq_type(type);
 
 	if (irqtype == REG_GPIOx_IN_IRQ_OFF)
 		return -EINVAL;
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
-			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
+	                   FIELD_PREP(REG_GPIOx_MODE, irqtype));
 
 	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(data, handle_level_irq);
@@ -402,8 +390,7 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 		}
 
 		for (i = 0; i < girq->num_parents; i++) {
-			ret = platform_get_irq(to_platform_device(pctl->dev),
-					       i);
+			ret = platform_get_irq(to_platform_device(pctl->dev), i);
 			if (ret < 0)
 				goto out;
 
-- 
2.17.1

