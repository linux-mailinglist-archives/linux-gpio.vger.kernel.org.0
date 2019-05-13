Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4473A1BA0E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731348AbfEMP3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:08 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:55976 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731333AbfEMP3I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:08 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id BrV32000F3XaVaC01rV3xy; Mon, 13 May 2019 17:29:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001dB-50; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003Qe-3N; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/11] pinctrl: sh-pfc: Add new non-GPIO helper macros
Date:   Mon, 13 May 2019 17:28:47 +0200
Message-Id: <20190513152857.13122-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add new macros for describing pins without GPIO functionality:
  - NOGP_ALL() expands to a list of PIN_id values, to be used for
    generating symbolic enum values,
  - PINMUX_NOGP_ALL() expands to a list of sh_pfc_pin entries, to
    list all pins and their capabilities.
Both macros depend on an SoC-specific CPU_ALL_NOGP() macro, to be
provided by each individual SoC pin control driver.

The new macros offer two advantages over the existing SH_PFC_PIN_NAMED()
and SH_PFC_PIN_NAMED_CFG() macros:
  1. They do not rely on PIN_NUMBER() macros and physical pin numbering,
     hence do not suffer from pin numbering confusion among different
     SoC/SiP packages.
  2. They are similar in spirit to the existing scheme for handling pins
     with GPIO functionality.

Note that internal to the driver, non-GPIO pins use a sequential
numbering scheme which starts after the highest GPIO pin number in use.
This value is calculated automatically, using two new helper macros, for
systems with either 32-port bank (GP port style) or linear (PORT style)
pin space.  Sample expansion:

    GP_LAST = sizeof(union {
	char dummy[0] __attribute__((deprecated, deprecated));
	char GP_0_0[(0 * 32) + 0] __attribute__((deprecated, deprecated));
	char GP_0_1[(0 * 32) + 1] __attribute__((deprecated, deprecated));
	...
	char GP_7_3[(7 * 32) + 3] __attribute__((deprecated, deprecated));
    })

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 305a8db70ca86334..a379698c97410202 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -608,6 +608,24 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 #define _GP_DATA(bank, pin, name, sfx, cfg)	PINMUX_DATA(name##_DATA, name##_FN)
 #define PINMUX_DATA_GP_ALL()		CPU_ALL_GP(_GP_DATA, unused)
 
+/*
+ * GP_ASSIGN_LAST() - Expand to an enum definition for the last GP pin
+ *
+ * The largest GP pin index is obtained by taking the size of a union,
+ * containing one array per GP pin, sized by the corresponding pin index.
+ * As the fields in the CPU_ALL_GP() macro definition are separated by commas,
+ * while the members of a union must be terminated by semicolons, the commas
+ * are absorbed by wrapping them inside dummy attributes.
+ */
+#define _GP_ENTRY(bank, pin, name, sfx, cfg)				\
+	deprecated)); char name[(bank * 32) + pin] __attribute__((deprecated
+#define GP_ASSIGN_LAST()						\
+	GP_LAST = sizeof(union {					\
+		char dummy[0] __attribute__((deprecated,		\
+		CPU_ALL_GP(_GP_ENTRY, unused),				\
+		deprecated));						\
+	})
+
 /*
  * PORT style (linear pin space)
  */
@@ -673,6 +691,24 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 		    PORT##pfx##_OUT, PORT##pfx##_IN)
 #define PINMUX_DATA_ALL()		CPU_ALL_PORT(_PORT_DATA, , unused)
 
+/*
+ * PORT_ASSIGN_LAST() - Expand to an enum definition for the last PORT pin
+ *
+ * The largest PORT pin index is obtained by taking the size of a union,
+ * containing one array per PORT pin, sized by the corresponding pin index.
+ * As the fields in the CPU_ALL_PORT() macro definition are separated by
+ * commas, while the members of a union must be terminated by semicolons, the
+ * commas are absorbed by wrapping them inside dummy attributes.
+ */
+#define _PORT_ENTRY(pn, pfx, sfx)					\
+	deprecated)); char pfx[pn] __attribute__((deprecated
+#define PORT_ASSIGN_LAST()						\
+	PORT_LAST = sizeof(union {					\
+		char dummy[0] __attribute__((deprecated,		\
+		CPU_ALL_PORT(_PORT_ENTRY, PORT, unused),		\
+		deprecated));						\
+	})
+
 /* GPIO_FN(name) - Expand to a sh_pfc_pin entry for a function GPIO */
 #define PINMUX_GPIO_FN(gpio, base, data_or_mark)			\
 	[gpio - (base)] = {						\
@@ -682,6 +718,26 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 #define GPIO_FN(str)							\
 	PINMUX_GPIO_FN(GPIO_FN_##str, PINMUX_FN_BASE, str##_MARK)
 
+/*
+ * Pins not associated with a GPIO port
+ */
+
+#define PIN_NOGP_CFG(pin, name, fn, cfg)	fn(pin, name, cfg)
+#define PIN_NOGP(pin, name, fn)			fn(pin, name, 0)
+
+/* NOGP_ALL - Expand to a list of PIN_id */
+#define _NOGP_ALL(pin, name, cfg)		PIN_##pin
+#define NOGP_ALL()				CPU_ALL_NOGP(_NOGP_ALL)
+
+/* PINMUX_NOGP_ALL - Expand to a list of sh_pfc_pin entries */
+#define _NOGP_PINMUX(_pin, _name, cfg)					\
+	{								\
+		.pin = PIN_##_pin,					\
+		.name = "PIN_" _name,					\
+		.configs = SH_PFC_PIN_CFG_NO_GPIO | cfg,		\
+	}
+#define PINMUX_NOGP_ALL()		CPU_ALL_NOGP(_NOGP_PINMUX)
+
 /*
  * PORTnCR helper macro for SH-Mobile/R-Mobile
  */
-- 
2.17.1

