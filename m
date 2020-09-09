Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0B5263210
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 18:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbgIIQem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 12:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731096AbgIIQ12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 12:27:28 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8A1C061799
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 09:26:57 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id RsSr230024C55Sk01sSrm1; Wed, 09 Sep 2020 18:26:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kG2vq-0000Qv-TS; Wed, 09 Sep 2020 18:26:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kFzwm-0003Mw-NY; Wed, 09 Sep 2020 15:15:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] pinctrl: renesas: Reintroduce SH_PFC for common sh-pfc code
Date:   Wed,  9 Sep 2020 15:15:34 +0200
Message-Id: <20200909131534.12897-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909131534.12897-1-geert+renesas@glider.be>
References: <20200909131534.12897-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Most, but not all, Renesas pin control drivers use the "sh-pfc" pin
control framework.  As of commit 8449bfa9e6a9f7ec ("pinctrl: sh-pfc:
Collect Renesas related CONFIGs in one place"), the code for this
framework is always built when Renesas SoC pin control support is
enabled, regardless of whether the enabled pin control drivers need it
or not.

Fix this by reintroducing the CONFIG_SH_PFC symbol to control inclusion
of the "sh-pfc" framework and its dependencies, and selecting it when
needed.

This reduces kernel size of a typical RZ/A1 or RZ/A2 kernel by more than
6 resp. 11 KiB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/Kconfig  | 50 ++++++++++++++++++++++++++------
 drivers/pinctrl/renesas/Makefile |  2 +-
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index fc1f2611063b0cd6..e941b8440dbc8361 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -8,9 +8,6 @@ menu "Renesas pinctrl drivers"
 config PINCTRL_RENESAS
 	bool "Renesas SoC pin control support" if COMPILE_TEST && !(ARCH_RENESAS || SUPERH)
 	default y if ARCH_RENESAS || SUPERH
-	select PINMUX
-	select PINCONF
-	select GENERIC_PINCONF
 	select PINCTRL_PFC_EMEV2 if ARCH_EMEV2
 	select PINCTRL_PFC_R8A73A4 if ARCH_R8A73A4
 	select PINCTRL_PFC_R8A7740 if ARCH_R8A7740
@@ -55,68 +52,95 @@ config PINCTRL_RENESAS
 	help
 	  This enables pin control drivers for Renesas SuperH and ARM platforms
 
+config PINCTRL_SH_PFC
+	bool
+	select GENERIC_PINCONF
+	select PINMUX
+	select PINCONF
+	help
+	  This enables common pin control functionality for EMMA Mobile, R-Car,
+	  R-Mobile, RZ/G, SH, and SH-Mobile platforms.
+
 config PINCTRL_SH_PFC_GPIO
-	select GPIOLIB
 	bool
+	select GPIOLIB
+	select PINCTRL_SH_PFC
 	help
 	  This enables pin control and GPIO drivers for SH/SH Mobile platforms
 
 config PINCTRL_SH_FUNC_GPIO
-	select PINCTRL_SH_PFC_GPIO
 	bool
+	select PINCTRL_SH_PFC_GPIO
 	help
 	  This enables legacy function GPIOs for SH platforms
 
 config PINCTRL_PFC_EMEV2
 	bool "pin control support for Emma Mobile EV2" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77995
 	bool "pin control support for R-Car D3" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7794
 	bool "pin control support for R-Car E2" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77990
 	bool "pin control support for R-Car E3" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7779
 	bool "pin control support for R-Car H1" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7790
 	bool "pin control support for R-Car H2" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77950
 	bool "pin control support for R-Car H3 ES1.x" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77951
 	bool "pin control support for R-Car H3 ES2.0+" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7778
 	bool "pin control support for R-Car M1A" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7793
 	bool "pin control support for R-Car M2-N" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7791
 	bool "pin control support for R-Car M2-W" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77965
 	bool "pin control support for R-Car M3-N" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77960
 	bool "pin control support for R-Car M3-W" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77961
 	bool "pin control support for R-Car M3-W+" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7792
 	bool "pin control support for R-Car V2H" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77980
 	bool "pin control support for R-Car V3H" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77970
 	bool "pin control support for R-Car V3M" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7740
 	bool "pin control support for R-Mobile A1" if COMPILE_TEST
@@ -130,10 +154,10 @@ config PINCTRL_RZA1
 	bool "pin control support for RZ/A1"
 	depends on OF
 	depends on ARCH_R7S72100 || COMPILE_TEST
-	select GPIOLIB
+	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select GENERIC_PINCONF
+	select GPIOLIB
 	help
 	  This selects pinctrl driver for Renesas RZ/A1 platforms.
 
@@ -141,39 +165,47 @@ config PINCTRL_RZA2
 	bool "pin control support for RZ/A2"
 	depends on OF
 	depends on ARCH_R7S9210 || COMPILE_TEST
-	select GPIOLIB
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select GENERIC_PINCONF
+	select GPIOLIB
 	help
 	  This selects GPIO and pinctrl driver for Renesas RZ/A2 platforms.
 
 config PINCTRL_PFC_R8A77470
 	bool "pin control support for RZ/G1C" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7745
 	bool "pin control support for RZ/G1E" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7742
 	bool "pin control support for RZ/G1H" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7743
 	bool "pin control support for RZ/G1M" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7744
 	bool "pin control support for RZ/G1N" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774C0
 	bool "pin control support for RZ/G2E" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774E1
 	bool "pin control support for RZ/G2H" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774A1
 	bool "pin control support for RZ/G2M" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774B1
 	bool "pin control support for RZ/G2N" if COMPILE_TEST
+	select PINCTRL_SH_PFC
 
 config PINCTRL_RZN1
 	bool "pin control support for RZ/N1"
diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
index c96008c9ab59c175..1f6d7dd019d8e76f 100644
--- a/drivers/pinctrl/renesas/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_PINCTRL_RENESAS)		+= core.o pinctrl.o
+obj-$(CONFIG_PINCTRL_SH_PFC)		+= core.o pinctrl.o
 obj-$(CONFIG_PINCTRL_SH_PFC_GPIO)	+= gpio.o
 obj-$(CONFIG_PINCTRL_PFC_EMEV2)		+= pfc-emev2.o
 obj-$(CONFIG_PINCTRL_PFC_R8A73A4)	+= pfc-r8a73a4.o
-- 
2.17.1

