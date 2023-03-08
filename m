Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94C256B0860
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbjCHNTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjCHNSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:44 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1C6D161A
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:30 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by baptiste.telenet-ops.be with bizsmtp
        id VpFM2900S3mNwr401pFMCG; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd1-00BF1W-1W;
        Wed, 08 Mar 2023 14:15:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUf8-3a;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O voltage levels
Date:   Wed,  8 Mar 2023 11:42:39 +0100
Message-Id: <0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678271030.git.geert+renesas@glider.be>
References: <cover.1678271030.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, the Renesas pin control driver supports pins that can switch
their I/O voltage levels between either 1.8V and 3.3V, or between 2.5V
and 3.3V.  However, some SoCs have pins that can switch between 1.8V and
2.5V.

Add support for this by replacing the separate SH_PFC_PIN_CFG_IO_VOLTAGE
capability and voltage level flags by a 2-bit field, to cover three
possible I/O voltage switching options.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c    |  4 ++--
 drivers/pinctrl/renesas/pinctrl.c | 22 ++++++++++++----------
 drivers/pinctrl/renesas/sh_pfc.h  | 13 +++++--------
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index ed092ca314dd17d6..336cfae756b0f12b 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1114,9 +1114,9 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 			}
 		}
 
-		if (pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE) {
+		if (pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE_MASK) {
 			if (!info->ops || !info->ops->pin_to_pocctrl)
-				sh_pfc_err_once(power, "SH_PFC_PIN_CFG_IO_VOLTAGE flag set but .pin_to_pocctrl() not implemented\n");
+				sh_pfc_err_once(power, "SH_PFC_PIN_CFG_IO_VOLTAGE set but .pin_to_pocctrl() not implemented\n");
 			else if (info->ops->pin_to_pocctrl(pin->pin, &x) < 0)
 				sh_pfc_err("pin %s: SH_PFC_PIN_CFG_IO_VOLTAGE set but invalid pin_to_pocctrl()\n",
 					   pin->name);
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index b7414780031990e2..f6ef658fb2276bb0 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -580,7 +580,7 @@ static bool sh_pfc_pinconf_validate(struct sh_pfc *pfc, unsigned int _pin,
 		return pin->configs & SH_PFC_PIN_CFG_DRIVE_STRENGTH;
 
 	case PIN_CONFIG_POWER_SOURCE:
-		return pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE;
+		return pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE_MASK;
 
 	default:
 		return false;
@@ -633,7 +633,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 	case PIN_CONFIG_POWER_SOURCE: {
 		int idx = sh_pfc_get_pin_index(pfc, _pin);
 		const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
-		unsigned int lower_voltage;
+		unsigned int mode, lo, hi;
 		u32 pocctrl, val;
 		int bit;
 
@@ -646,10 +646,11 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 
 		val = sh_pfc_read(pfc, pocctrl);
 
-		lower_voltage = (pin->configs & SH_PFC_PIN_VOLTAGE_25_33) ?
-			2500 : 1800;
+		mode = pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE_MASK;
+		lo = mode <= SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 ? 1800 : 2500;
+		hi = mode >= SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 ? 3300 : 2500;
 
-		arg = (val & BIT(bit)) ? 3300 : lower_voltage;
+		arg = (val & BIT(bit)) ? hi : lo;
 		break;
 	}
 
@@ -705,7 +706,7 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 			unsigned int mV = pinconf_to_config_argument(configs[i]);
 			int idx = sh_pfc_get_pin_index(pfc, _pin);
 			const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
-			unsigned int lower_voltage;
+			unsigned int mode, lo, hi;
 			u32 pocctrl, val;
 			int bit;
 
@@ -716,15 +717,16 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 			if (WARN(bit < 0, "invalid pin %#x", _pin))
 				return bit;
 
-			lower_voltage = (pin->configs & SH_PFC_PIN_VOLTAGE_25_33) ?
-				2500 : 1800;
+			mode = pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE_MASK;
+			lo = mode <= SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 ? 1800 : 2500;
+			hi = mode >= SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 ? 3300 : 2500;
 
-			if (mV != lower_voltage && mV != 3300)
+			if (mV != lo && mV != hi)
 				return -EINVAL;
 
 			spin_lock_irqsave(&pfc->lock, flags);
 			val = sh_pfc_read(pfc, pocctrl);
-			if (mV == 3300)
+			if (mV == hi)
 				val |= BIT(bit);
 			else
 				val &= ~BIT(bit);
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 83312fac14e5ddce..8dc7a66009ad842c 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -29,16 +29,13 @@ enum {
 #define SH_PFC_PIN_CFG_PULL_DOWN	(1 << 3)
 #define SH_PFC_PIN_CFG_PULL_UP_DOWN	(SH_PFC_PIN_CFG_PULL_UP | \
 					 SH_PFC_PIN_CFG_PULL_DOWN)
-#define SH_PFC_PIN_CFG_IO_VOLTAGE	(1 << 4)
-#define SH_PFC_PIN_CFG_DRIVE_STRENGTH	(1 << 5)
 
-#define SH_PFC_PIN_VOLTAGE_18_33	(0 << 6)
-#define SH_PFC_PIN_VOLTAGE_25_33	(1 << 6)
+#define SH_PFC_PIN_CFG_IO_VOLTAGE_MASK	GENMASK(5, 4)
+#define SH_PFC_PIN_CFG_IO_VOLTAGE_18_25	(1 << 4)
+#define SH_PFC_PIN_CFG_IO_VOLTAGE_18_33	(2 << 4)
+#define SH_PFC_PIN_CFG_IO_VOLTAGE_25_33	(3 << 4)
 
-#define SH_PFC_PIN_CFG_IO_VOLTAGE_18_33	(SH_PFC_PIN_CFG_IO_VOLTAGE | \
-					 SH_PFC_PIN_VOLTAGE_18_33)
-#define SH_PFC_PIN_CFG_IO_VOLTAGE_25_33	(SH_PFC_PIN_CFG_IO_VOLTAGE | \
-					 SH_PFC_PIN_VOLTAGE_25_33)
+#define SH_PFC_PIN_CFG_DRIVE_STRENGTH	(1 << 6)
 
 #define SH_PFC_PIN_CFG_NO_GPIO		(1 << 31)
 
-- 
2.34.1

