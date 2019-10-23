Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07863E1A23
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 14:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391329AbfJWM37 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 08:29:59 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:35644 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391334AbfJWM37 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 08:29:59 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id H0Vy2100K05gfCL010Vy4o; Wed, 23 Oct 2019 14:29:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0000p7-Jb; Wed, 23 Oct 2019 14:29:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0003FB-IQ; Wed, 23 Oct 2019 14:29:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] pinctrl: sh-pfc: Rename PINCTRL_PFC_R8A7796 to PINCTRL_PFC_R8A77960
Date:   Wed, 23 Oct 2019 14:29:54 +0200
Message-Id: <20191023122955.12420-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122955.12420-1-geert+renesas@glider.be>
References: <20191023122955.12420-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename CONFIG_PINCTRL_PFC_R8A7796 for R-Car M3-W (R8A77960) to
CONFIG_PINCTRL_PFC_R8A77960, to avoid confusion with R-Car M3-W+
(R8A77961), which will use CONFIG_PINCTRL_PFC_R8A77961.

Extend the dependency of CONFIG_PINCTRL_PFC_R8A77960 from
CONFIG_ARCH_R8A7796 to CONFIG_ARCH_R8A77960, to relax dependencies for a
future rename of the SoC configuration symbol.

Rename r8a7796_pinmux_info to r8a77960_pinmux_info, as it contains an
r8a77960-based name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/pinctrl/sh-pfc/Kconfig       | 4 ++--
 drivers/pinctrl/sh-pfc/Makefile      | 2 +-
 drivers/pinctrl/sh-pfc/core.c        | 4 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 4 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h      | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index de2a33ab945bf1c2..93d6034be4ff63f2 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -27,7 +27,7 @@ config PINCTRL_SH_PFC
 	select PINCTRL_PFC_R8A7793 if ARCH_R8A7793
 	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
 	select PINCTRL_PFC_R8A7795 if ARCH_R8A7795
-	select PINCTRL_PFC_R8A7796 if ARCH_R8A7796
+	select PINCTRL_PFC_R8A77960 if ARCH_R8A77960 || ARCH_R8A7796
 	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
 	select PINCTRL_PFC_R8A77970 if ARCH_R8A77970
 	select PINCTRL_PFC_R8A77980 if ARCH_R8A77980
@@ -117,7 +117,7 @@ config PINCTRL_PFC_R8A7794
 config PINCTRL_PFC_R8A7795
 	bool "R-Car H3 pin control support" if COMPILE_TEST
 
-config PINCTRL_PFC_R8A7796
+config PINCTRL_PFC_R8A77960
 	bool "R-Car M3-W pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A77965
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 00b12af651ebe744..e3594cd2620386af 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -20,7 +20,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7793)	+= pfc-r8a7791.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7794)	+= pfc-r8a7794.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795-es1.o
-obj-$(CONFIG_PINCTRL_PFC_R8A7796)	+= pfc-r8a7796.o
+obj-$(CONFIG_PINCTRL_PFC_R8A77960)	+= pfc-r8a7796.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77965)	+= pfc-r8a77965.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77970)	+= pfc-r8a77970.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77980)	+= pfc-r8a77980.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f8cbd33b4511be69..e3292abd6c9456f8 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -585,10 +585,10 @@ static const struct of_device_id sh_pfc_of_table[] = {
 	},
 #endif /* DEBUG */
 #endif
-#ifdef CONFIG_PINCTRL_PFC_R8A7796
+#ifdef CONFIG_PINCTRL_PFC_R8A77960
 	{
 		.compatible = "renesas,pfc-r8a7796",
-		.data = &r8a7796_pinmux_info,
+		.data = &r8a77960_pinmux_info,
 	},
 #endif
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 3689f769f2eadf93..9de2909c7ad9dff0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -6210,8 +6210,8 @@ const struct sh_pfc_soc_info r8a774a1_pinmux_info = {
 };
 #endif
 
-#ifdef CONFIG_PINCTRL_PFC_R8A7796
-const struct sh_pfc_soc_info r8a7796_pinmux_info = {
+#ifdef CONFIG_PINCTRL_PFC_R8A77960
+const struct sh_pfc_soc_info r8a77960_pinmux_info = {
 	.name = "r8a77960_pfc",
 	.ops = &r8a7796_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 12d15b646da4cd1d..a7eb527fdc60ae25 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -320,7 +320,7 @@ extern const struct sh_pfc_soc_info r8a7793_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7794_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7795_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7795es1_pinmux_info;
-extern const struct sh_pfc_soc_info r8a7796_pinmux_info;
+extern const struct sh_pfc_soc_info r8a77960_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77965_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77970_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77980_pinmux_info;
-- 
2.17.1

