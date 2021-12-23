Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F5347E49C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348867AbhLWOmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbhLWOmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:15 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6697BC061759
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:14 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by albert.telenet-ops.be with bizsmtp
        id ZqiC2600R1rdBcm06qiCq2; Thu, 23 Dec 2021 15:42:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a8w-Bs; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rYY-Qa; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/60] pinctrl: renesas: Reformat macros defining struct initializers
Date:   Thu, 23 Dec 2021 15:41:13 +0100
Message-Id: <03a1eed3c4f57d7b14ef53ab49e04de10d0e383c.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reformat all macros that define structure initializers, to visually
resemble structure definitions:
  - Move the opening curly brace to the previous line,
  - Move the closing curly brace to the first position,
  - Reduce indentation of the block to a single TAB, decreasing the need
    for line breaks,
  - Align backslashes for line continuation to the last TAB block where
    possible,

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/sh_pfc.h | 115 +++++++++++++++----------------
 1 file changed, 54 insertions(+), 61 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 2479b4fb9cf957ff..d355e60244c6e5a8 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -49,14 +49,13 @@ struct sh_pfc_pin {
 	u16 enum_id;
 };
 
-#define SH_PFC_PIN_GROUP_ALIAS(alias, n)		\
-	{						\
-		.name = #alias,				\
-		.pins = n##_pins,			\
-		.mux = n##_mux,				\
-		.nr_pins = ARRAY_SIZE(n##_pins) +	\
-		BUILD_BUG_ON_ZERO(sizeof(n##_pins) != sizeof(n##_mux)), \
-	}
+#define SH_PFC_PIN_GROUP_ALIAS(alias, n) {				\
+	.name = #alias,							\
+	.pins = n##_pins,						\
+	.mux = n##_mux,							\
+	.nr_pins = ARRAY_SIZE(n##_pins) +				\
+	BUILD_BUG_ON_ZERO(sizeof(n##_pins) != sizeof(n##_mux)),		\
+}
 #define SH_PFC_PIN_GROUP(n)	SH_PFC_PIN_GROUP_ALIAS(n, n)
 
 struct sh_pfc_pin_group {
@@ -72,13 +71,12 @@ struct sh_pfc_pin_group {
  * in this case. It accepts an optional 'version' argument used when the
  * same group can appear on a different set of pins.
  */
-#define VIN_DATA_PIN_GROUP(n, s, ...)					\
-	{								\
-		.name = #n#s#__VA_ARGS__,				\
-		.pins = n##__VA_ARGS__##_pins.data##s,			\
-		.mux = n##__VA_ARGS__##_mux.data##s,			\
-		.nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),	\
-	}
+#define VIN_DATA_PIN_GROUP(n, s, ...) {					\
+	.name = #n#s#__VA_ARGS__,					\
+	.pins = n##__VA_ARGS__##_pins.data##s,				\
+	.mux = n##__VA_ARGS__##_mux.data##s,				\
+	.nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),		\
+}
 
 union vin_data12 {
 	unsigned int data12[12];
@@ -103,12 +101,11 @@ union vin_data {
 	unsigned int data4[4];
 };
 
-#define SH_PFC_FUNCTION(n)				\
-	{						\
-		.name = #n,				\
-		.groups = n##_groups,			\
-		.nr_groups = ARRAY_SIZE(n##_groups),	\
-	}
+#define SH_PFC_FUNCTION(n) {						\
+	.name = #n,							\
+	.groups = n##_groups,						\
+	.nr_groups = ARRAY_SIZE(n##_groups),				\
+}
 
 struct sh_pfc_function {
 	const char *name;
@@ -231,8 +228,9 @@ struct pinmux_irq {
  * Describe the mapping from GPIOs to a single IRQ
  *   - ids...: List of GPIOs that are mapped to the same IRQ
  */
-#define PINMUX_IRQ(ids...)			   \
-	{ .gpios = (const short []) { ids, -1 } }
+#define PINMUX_IRQ(ids...) {						\
+	.gpios = (const short []) { ids, -1 }				\
+}
 
 struct pinmux_range {
 	u16 begin;
@@ -624,13 +622,12 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 #define GP_ALL(str)			CPU_ALL_GP(_GP_ALL, str)
 
 /* PINMUX_GPIO_GP_ALL - Expand to a list of sh_pfc_pin entries */
-#define _GP_GPIO(bank, _pin, _name, sfx, cfg)				\
-	{								\
-		.pin = (bank * 32) + _pin,				\
-		.name = __stringify(_name),				\
-		.enum_id = _name##_DATA,				\
-		.configs = cfg,						\
-	}
+#define _GP_GPIO(bank, _pin, _name, sfx, cfg) {				\
+	.pin = (bank * 32) + _pin,					\
+	.name = __stringify(_name),					\
+	.enum_id = _name##_DATA,					\
+	.configs = cfg,							\
+}
 #define PINMUX_GPIO_GP_ALL()		CPU_ALL_GP(_GP_GPIO, unused)
 
 /* PINMUX_DATA_GP_ALL -  Expand to a list of name_DATA, name_FN marks */
@@ -688,13 +685,12 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	}
 
 /* SH_PFC_PIN_CFG - Expand to a sh_pfc_pin entry (named PORT#) with config */
-#define SH_PFC_PIN_CFG(_pin, cfgs)					\
-	{								\
-		.pin = _pin,						\
-		.name = __stringify(PORT##_pin),			\
-		.enum_id = PORT##_pin##_DATA,				\
-		.configs = cfgs,					\
-	}
+#define SH_PFC_PIN_CFG(_pin, cfgs) {					\
+	.pin = _pin,							\
+	.name = __stringify(PORT##_pin),				\
+	.enum_id = PORT##_pin##_DATA,					\
+	.configs = cfgs,						\
+}
 
 /* PINMUX_DATA_ALL - Expand to a list of PORT_name_DATA, PORT_name_FN0,
  *		     PORT_name_OUT, PORT_name_IN marks
@@ -743,35 +739,32 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 #define NOGP_ALL()				CPU_ALL_NOGP(_NOGP_ALL)
 
 /* PINMUX_NOGP_ALL - Expand to a list of sh_pfc_pin entries */
-#define _NOGP_PINMUX(_pin, _name, cfg)					\
-	{								\
-		.pin = PIN_##_pin,					\
-		.name = "PIN_" _name,					\
-		.configs = SH_PFC_PIN_CFG_NO_GPIO | cfg,		\
-	}
+#define _NOGP_PINMUX(_pin, _name, cfg) {				\
+	.pin = PIN_##_pin,						\
+	.name = "PIN_" _name,						\
+	.configs = SH_PFC_PIN_CFG_NO_GPIO | cfg,			\
+}
 #define PINMUX_NOGP_ALL()		CPU_ALL_NOGP(_NOGP_PINMUX)
 
 /*
  * PORTnCR helper macro for SH-Mobile/R-Mobile
  */
-#define PORTCR(nr, reg)							\
-	{								\
-		PINMUX_CFG_REG_VAR("PORT" nr "CR", reg, 8,		\
-				   GROUP(2, 2, 1, 3),			\
-				   GROUP(				\
-			/* PULMD[1:0], handled by .set_bias() */	\
-			0, 0, 0, 0,					\
-			/* IE and OE */					\
-			0, PORT##nr##_OUT, PORT##nr##_IN, 0,		\
-			/* SEC, not supported */			\
-			0, 0,						\
-			/* PTMD[2:0] */					\
-			PORT##nr##_FN0, PORT##nr##_FN1,			\
-			PORT##nr##_FN2, PORT##nr##_FN3,			\
-			PORT##nr##_FN4, PORT##nr##_FN5,			\
-			PORT##nr##_FN6, PORT##nr##_FN7			\
-		))							\
-	}
+#define PORTCR(nr, reg) {						\
+	PINMUX_CFG_REG_VAR("PORT" nr "CR", reg, 8, GROUP(2, 2, 1, 3),	\
+			   GROUP(					\
+		/* PULMD[1:0], handled by .set_bias() */		\
+		0, 0, 0, 0,						\
+		/* IE and OE */						\
+		0, PORT##nr##_OUT, PORT##nr##_IN, 0,			\
+		/* SEC, not supported */				\
+		0, 0,							\
+		/* PTMD[2:0] */						\
+		PORT##nr##_FN0, PORT##nr##_FN1,				\
+		PORT##nr##_FN2, PORT##nr##_FN3,				\
+		PORT##nr##_FN4, PORT##nr##_FN5,				\
+		PORT##nr##_FN6, PORT##nr##_FN7				\
+	))								\
+}
 
 /*
  * GPIO number helper macro for R-Car
-- 
2.25.1

