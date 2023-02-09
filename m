Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3CC690D79
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Feb 2023 16:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjBIPrG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Feb 2023 10:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbjBIPrF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2023 10:47:05 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7F264650;
        Thu,  9 Feb 2023 07:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675957597; x=1707493597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y31IcLg+PPKjxAHTBA7gQ6gNWlc/zLybYAacTecv50Y=;
  b=KYwhQGoko9wId5FoE1MwCuAIEzZywop9TpExrqJo9ERE2l4fk4dUiOhg
   +ifEUjW9oaztSO6p6QoN2Dj1K/XNbBfVn4AJg3UHuSODP4+0RN8d1gIGy
   o41y844PifAfVgi7PNfKXg/eiJpmqw0ze2uuBqTO5hRCxXLXBQecrM+ks
   vVpgazL7bZOcESoUyucSbUw7H/E+FurXxJWx5OCsTOIfFCcfHUqEqbwo3
   8ptV5xPAdu3dJNjXUcqUwNTUIOrOdncic1BmnDxiwZWO2k53gelXbOIVu
   oOAL+TYFzv8Z/rFiPAIKYt8dQ4wTcGhSIclpEFVmHE+xETjsUlly0NAm7
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,284,1669100400"; 
   d="scan'208";a="211286111"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 08:45:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 08:45:35 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 08:45:35 -0700
From:   <Ryan.Wanner@microchip.com>
To:     <ludovic.desroches@microchip.com>, <linus.walleij@linaro.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <claudiu.beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manikandan.M@microchip.com>,
        Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 1/2] pinctrl: at91-pio4: Implement the correct drive values for sama7g5
Date:   Thu, 9 Feb 2023 08:45:43 -0700
Message-ID: <20230209154544.535136-2-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230209154544.535136-1-Ryan.Wanner@microchip.com>
References: <20230209154544.535136-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Sama7g5 drive strength options have been updated from previous pio4
products. Now values will correctly align with sama7g5 drive strength
options highlighted in the sama7g5 data sheet.

Add xlate to separate the sama7g5 drive values and the sama5d27
drive values.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 82b921fd630d..5f0cf1426f7e 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -72,17 +72,32 @@
 /* Custom pinconf parameters */
 #define ATMEL_PIN_CONFIG_DRIVE_STRENGTH	(PIN_CONFIG_END + 1)
 
+static const u32 drive_strength_xlate_sama7g5[4] = {
+	ATMEL_PIO_DRVSTR_LO_D,
+	ATMEL_PIO_DRVSTR_HI_A,
+	ATMEL_PIO_DRVSTR_LO_C,
+	ATMEL_PIO_DRVSTR_LO_B
+};
+
+static const u32 drive_strength_xlate_sama5d2[4] = {
+	ATMEL_PIO_DRVSTR_LO,
+	ATMEL_PIO_DRVSTR_LO,
+	ATMEL_PIO_DRVSTR_ME,
+	ATMEL_PIO_DRVSTR_HI
+};
 /**
  * struct atmel_pioctrl_data - Atmel PIO controller (pinmux + gpio) data struct
  * @nbanks: number of PIO banks
  * @last_bank_count: number of lines in the last bank (can be less than
  *	the rest of the banks).
  * @slew_rate_support: slew rate support
+ * @drv_stre_xlate: xlate for different drive values
  */
 struct atmel_pioctrl_data {
 	unsigned int nbanks;
 	unsigned int last_bank_count;
 	unsigned int slew_rate_support;
+	const unsigned int *drv_stre_xlate;
 };
 
 struct atmel_group {
@@ -121,6 +136,7 @@ struct atmel_pin {
  * @dev: device entry for the Atmel PIO controller.
  * @node: node of the Atmel PIO controller.
  * @slew_rate_support: slew rate support
+ * @drv_stre_xlate: xlate for different drive values
  */
 struct atmel_pioctrl {
 	void __iomem		*reg_base;
@@ -143,6 +159,7 @@ struct atmel_pioctrl {
 	struct device		*dev;
 	struct device_node	*node;
 	unsigned int		slew_rate_support;
+	const unsigned int	*drv_stre_xlate;
 };
 
 static const char * const atmel_functions[] = {
@@ -872,12 +889,17 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 				conf &= ~ATMEL_PIO_SR_MASK;
 			break;
 		case ATMEL_PIN_CONFIG_DRIVE_STRENGTH:
+			if (arg > ATMEL_PIO_DRVSTR_HI || arg < ATMEL_PIO_DRVSTR_LO_0) {
+				dev_warn(pctldev->dev, "drive strength not updated (incorrect value)\n");
+				break;
+			}
 			switch (arg) {
-			case ATMEL_PIO_DRVSTR_LO:
+			case ATMEL_PIO_DRVSTR_LO_0
+			case ATMEL_PIO_DRVSTR_LO_1:
 			case ATMEL_PIO_DRVSTR_ME:
 			case ATMEL_PIO_DRVSTR_HI:
 				conf &= (~ATMEL_PIO_DRVSTR_MASK);
-				conf |= arg << ATMEL_PIO_DRVSTR_OFFSET;
+				conf |= atmel_pioctrl->drv_stre_xlate[arg] << ATMEL_PIO_DRVSTR_OFFSET;
 				break;
 			default:
 				dev_warn(pctldev->dev, "drive strength not updated (incorrect value)\n");
@@ -1013,12 +1035,14 @@ static const struct dev_pm_ops atmel_pctrl_pm_ops = {
 static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
 	.nbanks			= 4,
 	.last_bank_count	= ATMEL_PIO_NPINS_PER_BANK,
+	.drv_stre_xlate		= drive_strength_xlate_sama5d2,
 };
 
 static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
 	.nbanks			= 5,
 	.last_bank_count	= 8, /* sama7g5 has only PE0 to PE7 */
 	.slew_rate_support	= 1,
+	.drv_stre_xlate		= drive_strength_xlate_sama7g5,
 };
 
 static const struct of_device_id atmel_pctrl_of_match[] = {
@@ -1064,6 +1088,7 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 		atmel_pioctrl->npins += atmel_pioctrl_data->last_bank_count;
 	}
 	atmel_pioctrl->slew_rate_support = atmel_pioctrl_data->slew_rate_support;
+	atmel_pioctrl->drv_stre_xlate = atmel_pioctrl_data->drv_stre_xlate;
 
 	atmel_pioctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(atmel_pioctrl->reg_base))
-- 
2.37.2

