Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999FC492B93
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jan 2022 17:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbiARQwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jan 2022 11:52:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346366AbiARQwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jan 2022 11:52:12 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1D5C06161C
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 08:52:12 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by baptiste.telenet-ops.be with bizsmtp
        id kGsA260030kcUhD01GsAW7; Tue, 18 Jan 2022 17:52:10 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9riL-00AGwn-RZ; Tue, 18 Jan 2022 17:52:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9riL-001BFH-Bp; Tue, 18 Jan 2022 17:52:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779a0: Rename MOD_SEL2_* definitions
Date:   Tue, 18 Jan 2022 17:52:08 +0100
Message-Id: <4880e4cbc112ee26569bf29a21c070125461e58d.1642524603.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename the MOD_SEL2_* definitions, to match the bitfield order in
IPxSRy_* definitions and in MOD_SEL* definitions in other drivers.

No changes in generated code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.18.

 drivers/pinctrl/renesas/pfc-r8a779a0.c | 42 +++++++++++++-------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 155294d0dd5abfb4..4a668a04b7ca6820 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -576,23 +576,23 @@ FM(IP0SR5_27_24)	IP0SR5_27_24	FM(IP1SR5_27_24)	IP1SR5_27_24	FM(IP2SR5_27_24)	IP2
 FM(IP0SR5_31_28)	IP0SR5_31_28	FM(IP1SR5_31_28)	IP1SR5_31_28	FM(IP2SR5_31_28)	IP2SR5_31_28
 
 /* MOD_SEL2 */			/* 0 */		/* 1 */		/* 2 */		/* 3 */
-#define MOD_SEL2_14_15		FM(SEL_I2C6_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C6_3)
-#define MOD_SEL2_12_13		FM(SEL_I2C5_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C5_3)
-#define MOD_SEL2_10_11		FM(SEL_I2C4_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C4_3)
-#define MOD_SEL2_8_9		FM(SEL_I2C3_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C3_3)
-#define MOD_SEL2_6_7		FM(SEL_I2C2_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C2_3)
-#define MOD_SEL2_4_5		FM(SEL_I2C1_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C1_3)
-#define MOD_SEL2_2_3		FM(SEL_I2C0_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C0_3)
+#define MOD_SEL2_15_14		FM(SEL_I2C6_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C6_3)
+#define MOD_SEL2_13_12		FM(SEL_I2C5_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C5_3)
+#define MOD_SEL2_11_10		FM(SEL_I2C4_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C4_3)
+#define MOD_SEL2_9_8		FM(SEL_I2C3_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C3_3)
+#define MOD_SEL2_7_6		FM(SEL_I2C2_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C2_3)
+#define MOD_SEL2_5_4		FM(SEL_I2C1_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C1_3)
+#define MOD_SEL2_3_2		FM(SEL_I2C0_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C0_3)
 
 #define PINMUX_MOD_SELS \
 \
-MOD_SEL2_14_15 \
-MOD_SEL2_12_13 \
-MOD_SEL2_10_11 \
-MOD_SEL2_8_9 \
-MOD_SEL2_6_7 \
-MOD_SEL2_4_5 \
-MOD_SEL2_2_3
+MOD_SEL2_15_14 \
+MOD_SEL2_13_12 \
+MOD_SEL2_11_10 \
+MOD_SEL2_9_8 \
+MOD_SEL2_7_6 \
+MOD_SEL2_5_4 \
+MOD_SEL2_3_2
 
 #define PINMUX_PHYS \
 	FM(SCL0) FM(SDA0) FM(SCL1) FM(SDA1) FM(SCL2) FM(SDA2) FM(SCL3) FM(SDA3) \
@@ -3666,13 +3666,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
 		/* RESERVED 19, 18, 17, 16 */
 		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
-		MOD_SEL2_14_15
-		MOD_SEL2_12_13
-		MOD_SEL2_10_11
-		MOD_SEL2_8_9
-		MOD_SEL2_6_7
-		MOD_SEL2_4_5
-		MOD_SEL2_2_3
+		MOD_SEL2_15_14
+		MOD_SEL2_13_12
+		MOD_SEL2_11_10
+		MOD_SEL2_9_8
+		MOD_SEL2_7_6
+		MOD_SEL2_5_4
+		MOD_SEL2_3_2
 		0, 0,
 		0, 0, ))
 	},
-- 
2.25.1

