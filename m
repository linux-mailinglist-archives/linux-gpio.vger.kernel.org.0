Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CC3305AA0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 13:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237437AbhA0MBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 07:01:30 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:12690 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbhA0Lrc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 06:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611748050; x=1643284050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EhIgu5gLZiAXawRRGArIhTweK48qfRysf3CbNLocpT8=;
  b=Gl0LMkbX2pTkQRxYdguMIR7nltyijNl7U1ZHseoPsJrH5qyvu7fpJMdI
   2ZsHBP1/umlyomXkP882L+Zf+Jm6cHhzMm6V7qQTkkwtItUmsz7SZ9jw+
   Qr4DJHikyUaJtt93n8x08Nss+kLe0QuiWq8J1FQ4k0042yTnIkL2dIyYc
   BAC9UXrze2/2To7XYu5vF088RUxJH8GDd2M8ntwSFQhf8XLd06j0e+hOY
   sMt0KQ43wRxShBYt0Bm12/PEeL7SiLJQOekEOjT4jGC5y6Dab/eA+laQV
   qGR8/D/MaOcztYb9xn0wH36ddi1HmtJTfEOWGGOF0jOFr5y7geRgyC6A3
   w==;
IronPort-SDR: LAMMIe1lO0BJRXMPEFvOFjZEG98//Rdyfnuh17ILgTn1XgR0VqrRsTG6kNTiQUkdPaA7mqMZBK
 YdpoZfrXzuAI1Buswkve0mU0d9DBMQ8BMfY/0L3uPNErLmgzk+54DMun0dIi8AJBs27rcYVQkO
 2iT2Czcj6G5bEeHuofEyXvrti4hu+2PYQ5dSsMppqddkUySrYF27z04ogyTjOUEQiGS1tAahq/
 pr/Br/AfPlO0dyGOGEKFzONEQCn13gRywZ391a9pEMZ3yxvj2Vfydm7738oE5b+krsG0K5mdkF
 IRU=
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="104411886"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2021 04:46:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 27 Jan 2021 04:46:03 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 27 Jan 2021 04:45:59 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 2/3] pinctrl: at91-pio4: add support for slew-rate
Date:   Wed, 27 Jan 2021 13:45:44 +0200
Message-ID: <1611747945-29960-3-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
References: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SAMA7G5 supports slew rate configuration. Adapt the driver for this.
For output switching frequencies lower than 50MHz the slew rate needs to
be enabled. Since most of the pins on SAMA7G5 fall into this category
enabled the slew rate by default.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index d267367d94b9..f202cdb6dc3c 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -36,6 +36,7 @@
 #define		ATMEL_PIO_DIR_MASK		BIT(8)
 #define		ATMEL_PIO_PUEN_MASK		BIT(9)
 #define		ATMEL_PIO_PDEN_MASK		BIT(10)
+#define		ATMEL_PIO_SR_MASK		BIT(11)
 #define		ATMEL_PIO_IFEN_MASK		BIT(12)
 #define		ATMEL_PIO_IFSCEN_MASK		BIT(13)
 #define		ATMEL_PIO_OPD_MASK		BIT(14)
@@ -76,10 +77,12 @@
  * @nbanks: number of PIO banks
  * @last_bank_count: number of lines in the last bank (can be less than
  *	the rest of the banks).
+ * @slew_rate_support: slew rate support
  */
 struct atmel_pioctrl_data {
 	unsigned nbanks;
 	unsigned last_bank_count;
+	unsigned int slew_rate_support;
 };
 
 struct atmel_group {
@@ -117,6 +120,7 @@ struct atmel_pin {
  * @pm_suspend_backup: backup/restore register values on suspend/resume
  * @dev: device entry for the Atmel PIO controller.
  * @node: node of the Atmel PIO controller.
+ * @slew_rate_support: slew rate support
  */
 struct atmel_pioctrl {
 	void __iomem		*reg_base;
@@ -138,6 +142,7 @@ struct atmel_pioctrl {
 	} *pm_suspend_backup;
 	struct device		*dev;
 	struct device_node	*node;
+	unsigned int		slew_rate_support;
 };
 
 static const char * const atmel_functions[] = {
@@ -760,6 +765,13 @@ static int atmel_conf_pin_config_group_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		arg = 1;
 		break;
+	case PIN_CONFIG_SLEW_RATE:
+		if (!atmel_pioctrl->slew_rate_support)
+			return -EOPNOTSUPP;
+		if (!(res & ATMEL_PIO_SR_MASK))
+			return -EINVAL;
+		arg = 1;
+		break;
 	case ATMEL_PIN_CONFIG_DRIVE_STRENGTH:
 		if (!(res & ATMEL_PIO_DRVSTR_MASK))
 			return -EINVAL;
@@ -793,6 +805,10 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 		dev_dbg(pctldev->dev, "%s: pin=%u, config=0x%lx\n",
 			__func__, pin_id, configs[i]);
 
+		/* Keep slew rate enabled by default. */
+		if (atmel_pioctrl->slew_rate_support)
+			conf |= ATMEL_PIO_SR_MASK;
+
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			conf &= (~ATMEL_PIO_PUEN_MASK);
@@ -850,6 +866,13 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 					ATMEL_PIO_SODR);
 			}
 			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (!atmel_pioctrl->slew_rate_support)
+				break;
+			/* And remove it if explicitly requested. */
+			if (arg == 0)
+				conf &= ~ATMEL_PIO_SR_MASK;
+			break;
 		case ATMEL_PIN_CONFIG_DRIVE_STRENGTH:
 			switch (arg) {
 			case ATMEL_PIO_DRVSTR_LO:
@@ -901,6 +924,8 @@ static void atmel_conf_pin_config_dbg_show(struct pinctrl_dev *pctldev,
 		seq_printf(s, "%s ", "open-drain");
 	if (conf & ATMEL_PIO_SCHMITT_MASK)
 		seq_printf(s, "%s ", "schmitt");
+	if (atmel_pioctrl->slew_rate_support && (conf & ATMEL_PIO_SR_MASK))
+		seq_printf(s, "%s ", "slew-rate");
 	if (conf & ATMEL_PIO_DRVSTR_MASK) {
 		switch ((conf & ATMEL_PIO_DRVSTR_MASK) >> ATMEL_PIO_DRVSTR_OFFSET) {
 		case ATMEL_PIO_DRVSTR_ME:
@@ -994,6 +1019,7 @@ static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
 static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
 	.nbanks			= 5,
 	.last_bank_count	= 8, /* sama7g5 has only PE0 to PE7 */
+	.slew_rate_support	= 1,
 };
 
 static const struct of_device_id atmel_pctrl_of_match[] = {
@@ -1039,6 +1065,7 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 		atmel_pioctrl->npins -= ATMEL_PIO_NPINS_PER_BANK;
 		atmel_pioctrl->npins += atmel_pioctrl_data->last_bank_count;
 	}
+	atmel_pioctrl->slew_rate_support = atmel_pioctrl_data->slew_rate_support;
 
 	atmel_pioctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(atmel_pioctrl->reg_base))
-- 
2.7.4

