Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CFC6B086B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjCHNTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbjCHNSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:44 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4877CDA1C
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:30 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by baptiste.telenet-ops.be with bizsmtp
        id VpFM2900T3mNwr401pFMCH; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd1-00BF1a-4F;
        Wed, 08 Mar 2023 14:15:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUf1-2x;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/8] pinctrl: renesas: rcar: Phase out old SH_PFC_PIN_CFG_IO_VOLTAGE flag
Date:   Wed,  8 Mar 2023 11:42:38 +0100
Message-Id: <ae5f879c093f3e3cd50ba1495975bccfad81237b.1678271030.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678271030.git.geert+renesas@glider.be>
References: <cover.1678271030.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 537db25ca330dce0 ("pinctrl: renesas: Add I/O voltage level
flag") introduced new flags to support pins that can switch their
voltage levels between either 1.8V and 3.3V, or between 2.5V and 3.3V.
The old SH_PFC_PIN_CFG_IO_VOLTAGE flag was retained to avoid having to
change existing drivers.

Replace SH_PFC_PIN_CFG_IO_VOLTAGE by SH_PFC_PIN_CFG_IO_VOLTAGE_18_33, to
make the voltage configuration explicit, and to prepare for the advent
of support for more voltage levels.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 44 +++++++++++------------
 drivers/pinctrl/renesas/pfc-r8a7790.c  |  2 +-
 drivers/pinctrl/renesas/pfc-r8a7791.c  |  2 +-
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 48 +++++++++++++-------------
 drivers/pinctrl/renesas/pfc-r8a77951.c |  4 +--
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  4 +--
 drivers/pinctrl/renesas/pfc-r8a77965.c |  4 +--
 drivers/pinctrl/renesas/pfc-r8a77970.c |  6 ++--
 drivers/pinctrl/renesas/pfc-r8a77980.c |  6 ++--
 drivers/pinctrl/renesas/pfc-r8a77990.c |  4 +--
 drivers/pinctrl/renesas/pfc-r8a77995.c |  2 +-
 11 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index b5725c3ed2b60e88..4ba710610255e580 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -13,24 +13,24 @@
 #define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_4(0,  fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(0,  4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
-	PORT_GP_CFG_1(0,  5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0,  6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0,  7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0,  8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0,  9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
 	PORT_GP_CFG_1(0, 11, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(0, 12, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
-	PORT_GP_CFG_1(0, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(0, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
 	PORT_GP_CFG_23(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
@@ -38,12 +38,12 @@
 	PORT_GP_CFG_1(3, 28, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(3, 29, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_14(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
-	PORT_GP_CFG_1(4, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(4, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(4, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(4, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(4, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(4, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
 	PORT_GP_CFG_1(4, 20, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(4, 21, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(4, 22, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index ee21d650991bcec3..149700ee1d104ffd 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -24,7 +24,7 @@
 	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_30(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
-	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
 	PORT_GP_CFG_32(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index d57458504117daa3..c83e21c4c3955814 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -22,7 +22,7 @@
 	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
-	PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
 	PORT_GP_CFG_1(6, 24, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(6, 25, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(6, 26, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index 668643553a70a71a..6e801ae90d25a404 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -42,30 +42,30 @@
 	PORT_GP_1(5, 25, fn, sfx),					\
 	PORT_GP_1(5, 26, fn, sfx),					\
 	PORT_GP_1(5, 27, fn, sfx),					\
-	PORT_GP_CFG_1(6, 0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(6, 1, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 4, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(6, 9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 11, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 12, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(6, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
-	PORT_GP_CFG_1(6, 23, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
+	PORT_GP_CFG_1(6, 1, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 4, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
+	PORT_GP_CFG_1(6, 9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 11, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 12, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
+	PORT_GP_CFG_1(6, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 23, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP),	\
 	PORT_GP_CFG_1(6, 24, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_1(6, 25, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index d4d271dff055462d..321014c8bc16f86d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -17,12 +17,12 @@
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_29(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
-	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
 	PORT_GP_CFG_1(3, 12, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 13, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 14, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 15, fn, sfx, CFG_FLAGS),	\
-	PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
 	PORT_GP_CFG_26(5, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_32(6, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_4(7, fn, sfx, CFG_FLAGS)
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index a0096ef5e68dc6d6..5db8429c54fecb02 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -22,12 +22,12 @@
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_29(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
-	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
 	PORT_GP_CFG_1(3, 12, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 13, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 14, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 15, fn, sfx, CFG_FLAGS),	\
-	PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
 	PORT_GP_CFG_26(5, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_32(6, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_4(7, fn, sfx, CFG_FLAGS)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index acd0bdf1301844ef..2b8b49b18b10b822 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -23,12 +23,12 @@
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_29(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
-	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
 	PORT_GP_CFG_1(3, 12, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 13, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 14, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_1(3, 15, fn, sfx, CFG_FLAGS),	\
-	PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
 	PORT_GP_CFG_26(5, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_32(6, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_4(7, fn, sfx, CFG_FLAGS)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 4a7803eaafaa8abf..578c1d6fc2e0fcd9 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -19,10 +19,10 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)						\
-	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_6(4,  fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_15(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index ac03309c5c0c9756..b632ea1b29c73e3a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -19,10 +19,10 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)	\
-	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN), \
+	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP_DOWN), \
 	PORT_GP_CFG_25(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_15(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index b0936962fad709f1..57de0580a4408d4c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -22,12 +22,12 @@
 	PORT_GP_CFG_18(0, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_23(1, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_26(2, fn, sfx, CFG_FLAGS), \
-	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_DRIVE_STRENGTH), \
+	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_DRIVE_STRENGTH), \
 	PORT_GP_CFG_1(3, 12, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(3, 13, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(3, 14, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(3, 15, fn, sfx, CFG_FLAGS), \
-	PORT_GP_CFG_11(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_DRIVE_STRENGTH), \
+	PORT_GP_CFG_11(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_DRIVE_STRENGTH), \
 	PORT_GP_CFG_20(5, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_9(6, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(6, 9, fn, sfx, SH_PFC_PIN_CFG_PULL_UP), \
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 8e4ba9c61234bc7d..5a42213c680cf7b4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -21,7 +21,7 @@
 	PORT_GP_CFG_9(0,  fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_32(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PORT_GP_CFG_10(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_10(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE_18_33 | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_32(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_21(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PORT_GP_CFG_14(6, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN)
-- 
2.34.1

