Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABE344F420
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbhKMQc6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:32:58 -0500
Received: from mail-eopbgr00056.outbound.protection.outlook.com ([40.107.0.56]:38529
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235909AbhKMQc5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2SJg8qFQHtCK0RzMPRlVPNFfskVWXkAANXaebBiCuY=;
 b=PXuPC5n2RIWVc1ZkDW/osYNCcFFCwwtrjPpXlTITIZNbIQRcvc+jTK7RnMfcC9gTAPD0NfVU2mYSPoZFt/gj4hE9kC+x2XrjpLDBEb3X+QWQNtaDdQhnUnzzogWhvgRU4OH2vdMI124AaXH9d/voR7PovQ7ZAZ7Mlc+Lyq9Rfd8=
Received: from AS9PR06CA0105.eurprd06.prod.outlook.com (2603:10a6:20b:465::27)
 by AM0PR08MB3634.eurprd08.prod.outlook.com (2603:10a6:208:d6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Sat, 13 Nov
 2021 16:30:01 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::c2) by AS9PR06CA0105.outlook.office365.com
 (2603:10a6:20b:465::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:30:01 +0000
Received: ("Tessian outbound f65bc39c8ea9:v109"); Sat, 13 Nov 2021 16:30:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 207628c0c43ae417
X-CR-MTA-TID: 64aa7808
Received: from ccd730139c56.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 90B551E7-A781-46B6-B75B-92188015808D.1;
        Sat, 13 Nov 2021 16:29:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ccd730139c56.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:29:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkE30GoyfhO1ZKwFdZqPV0it8eLnUPV5pwqgSyTGSO1Gijhw6ODW5JkB6Pb4TapNmdTSd6EJ06jOmWWTWqGh6BjsviDw0FJZL4kU6kBirqINLlxiBp+dMe0RZdONikNWrCeeO3QD6FSpdHJ84KghX0Slofur4TkD2Mvyt4FAbEgzIn6AZcK+AQxf3yr7GRtERVqCn4ZtyXCio5rHny2FKuaWNJVwX3v5L12PX1GyZJB7cDNReGT3VB7s6wv9qmgfVlhvIDQ/CKoJAj7cBg9bWmUuKRTAEqT2genefmFwHX0HQVrCPHJIqsrabqdGyuy12E87wDIuxonRuHTfrNYhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2SJg8qFQHtCK0RzMPRlVPNFfskVWXkAANXaebBiCuY=;
 b=OnKngueUW6SzGqTAXxkCGYo/xqTObBT7gP5Dpkf2FjB7WpIyhE0dswjQSzEaxnY0xpH4fKR5tHgpCXWcsfGHbqoOV5j5Nl+sH/pozb+rnRF7+LrhIxRiDTDWnwB8TKL2YM/iTlQBfjSA8efObEVYcLatbJnGO1P5pcKgA+aPE3XLFfbYwqdE8tghQa+ZETVbLJSJgvX20bpRNV69ThWhXdSxiTXzWrvGVwgFhxQO0TlsPI4FZtmwJasgc6csMUJgDjuET3n5S5xJcDHU2g8rMtBZXU0knDiNUflyNOU4miWpxGeseZCunE1XK493y8zmVf//lbY4PabHaYxvSxWaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2SJg8qFQHtCK0RzMPRlVPNFfskVWXkAANXaebBiCuY=;
 b=PXuPC5n2RIWVc1ZkDW/osYNCcFFCwwtrjPpXlTITIZNbIQRcvc+jTK7RnMfcC9gTAPD0NfVU2mYSPoZFt/gj4hE9kC+x2XrjpLDBEb3X+QWQNtaDdQhnUnzzogWhvgRU4OH2vdMI124AaXH9d/voR7PovQ7ZAZ7Mlc+Lyq9Rfd8=
Received: from AS8PR07CA0044.eurprd07.prod.outlook.com (2603:10a6:20b:459::17)
 by AM9PR08MB6850.eurprd08.prod.outlook.com (2603:10a6:20b:2fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Sat, 13 Nov
 2021 16:29:52 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::ba) by AS8PR07CA0044.outlook.office365.com
 (2603:10a6:20b:459::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:52 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:51 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Sat, 13
 Nov 2021 16:29:51 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:51 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 1/9] pinctrl: apple: fix some formatting issues
Date:   Sat, 13 Nov 2021 16:29:36 +0000
Message-ID: <20211113162944.22412-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 964c6b2a-b60f-42c9-b60d-08d9a6c2d747
X-MS-TrafficTypeDiagnostic: AM9PR08MB6850:|AM0PR08MB3634:
X-Microsoft-Antispam-PRVS: <AM0PR08MB36342BDCDCA566EBD680DDC094969@AM0PR08MB3634.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:854;OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BEmptz7cumxgWRZX1XR0yr7RIMZYCwTrt9NreE1l/XRzpld5uHlwaP+0HIPAwvGpJWLJM2nN7KTji50ouno+AFtMCbXbe3ZgSAjKEUQ8e24XCKhz97NBNAFZ0KQeuGnb2L/scu/d5Fb07F6OhBqQHyw7aHH4JPM/Dza5sTJJOOz/Mp/MEKIKdguHNRCh9cE5nLId1F4uSKVvvRCa687f9lupVKxvSx+9XKEQrXdbfXnaqgj29iyBsgRUo3IvKOYskedEK5U6pDwoxLqnmf5niaEfl3ujxf+iJz6NiUULlzjQ19VigxtAYdgv61VJEaWmj3GzTEDRPI97Gp5zTb50XJL8Hj1lo2uoJbfkRUl2Eemu7kRYqUSGByJmGtS2j/XVCDcXcEiNMEY8JugjIkROg/UwEO7hg5+TxMKEU4ljvRvHfOOFFYhWT8y/OfG2QhLLGDxeaBfRqLKZfs+WNxk1JbetTLseX58KIWB8B4SoJqtiEC7kqINeKc525WuX65dLfRE8POdqhbKr6xKeBLHgUA6y93ZqyfT229U110V3GBMLwnq+dL5dOgY9k8PKu9k84wbmgMEzF445koQLILF1Wvuto+Kgmo44tleD2S3VSK/wOnwlOqVB74+K5aveSTjf943ETiXEgYjOqxzTOQXMDcthAd+6kLaIZFuNWtlRm+uTf2ZQQOpDvEITFeALPnpHj0nqq5Kw9BFui2bx/v3/2uACIVxxzU6zxp2QvnucnOWQ8RlNTuNVrNbd+LfsCcWG74J1v1qvpKxMSduR3muy7A==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(86362001)(70206006)(426003)(186003)(6916009)(508600001)(82310400003)(70586007)(1076003)(54906003)(6666004)(44832011)(8936002)(316002)(83380400001)(4326008)(36756003)(26005)(47076005)(8676002)(36860700001)(81166007)(2906002)(336012)(5660300002)(7696005)(2616005)(356005)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6850
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c6630709-10d9-48e8-3fcb-08d9a6c2d209
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rv9Xa+ZJG3GQ7/ibDypoa+3UOi8uD2ztGuG3Fb9I1K7sQqzlBjNMLCjJKwsubjcE+WE6QfoVvX+pKzN4EQOcds9AJldKjKZHcls6QgVkeTPJGMokSbskSFocppNI9jip8XP9H8lb8PhL/Iwohr/MsVg+2+LHS7TRApIfV9zdyNZ+ScmQItSJzAMDuN87gruyTQWH4PJL1ZBoUU6r8PczvM0yj27uehm6QHEKQQjDDWBdaMi9DdXMXOwdHnlsjlMpZB+McNU3V+npkc/78omyxYQ6e1ZJd288J+XBVF7fGP/Jymew2s//dfYLELFucOmFbLKviVybBKMRmuhXOBbAfjt5CJQb2Rnx2Iv8rg/AK0VvhARAxBx4OuOQWzQTmo4U3kPRWk0NRkE3/F4+pAqslLieabdwNf/oh6YLjMG8pcCpWc8Ou/ehLedjVdn3qBQIiAkO/cqFp9V3ZjmHUNqqrFhYMCDLQFDAlk/TGI2QV+vu2ij/Aj3hs0X9tjkC3DKzRT6IojR2Y3AhWQVWXThlnBnTp4a7DdnP5P+9PpOEwFy1KTK2ZtT+ELPzixeRPkSviWLlCC6dolMx72vzPK8fU3qglmQ/BxUJeIEzG22pBKiafIJfR/K2D2Ejaj3SnN/3Ym9VS72R2qFw93whum1K0lOtygZvxIDP1JduuJqvf0HlS1wKAYbJSdYCsx2GIccwaPYkcYEAgGRf+rTnMBiyCbTRUj81lH22cPxmUSjp6Z8=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(47076005)(54906003)(8676002)(70586007)(7696005)(6666004)(70206006)(4326008)(36860700001)(508600001)(1076003)(36756003)(26005)(44832011)(186003)(426003)(82310400003)(83380400001)(336012)(6916009)(8936002)(2906002)(2616005)(86362001)(81166007)(5660300002)(316002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:01.4543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 964c6b2a-b60f-42c9-b60d-08d9a6c2d747
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3634
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reflow some of the code now that the extra '_gpio' was removed.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 75 ++++++++++++----------------
 1 file changed, 31 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index a7861079a650..23466ee59d79 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -70,18 +70,18 @@ struct regmap_config regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 	.max_register = 512 * sizeof(u32),
 	.num_reg_defaults_raw = 512,
-	.use_relaxed_mmio = true
+	.use_relaxed_mmio = true,
 };
 
-// No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.
+/* No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register. */
 static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
-			       unsigned int pin, u32 mask, u32 value)
+                               unsigned int pin, u32 mask, u32 value)
 {
 	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
 }
 
-static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
-				   unsigned int pin)
+static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
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

