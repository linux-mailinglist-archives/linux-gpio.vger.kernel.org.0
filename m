Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFDB50B187
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 09:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444840AbiDVHdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 03:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444860AbiDVHcb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 03:32:31 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13E551589
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 00:29:37 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by baptiste.telenet-ops.be with bizsmtp
        id MjVa2700B2Ah9RF01jVaKh; Fri, 22 Apr 2022 09:29:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhnjR-001acE-SW; Fri, 22 Apr 2022 09:29:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhnjR-00CIuW-5n; Fri, 22 Apr 2022 09:29:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: renesas: r8a779a0: Fix GPIO function on I2C-capable pins
Date:   Fri, 22 Apr 2022 09:29:30 +0200
Message-Id: <4611e29e7b105513883084c1d6dc39c3ac8b525c.1650610471.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650610471.git.geert+renesas@glider.be>
References: <cover.1650610471.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Unlike on R-Car Gen3 SoCs, setting a bit to zero in a GPIO / Peripheral
Function Select Register (GPSRn) on R-Car V3U is not always sufficient
to configure a pin for GPIO.  For I2C-capable pins, the I2C function
must also be explicitly disabled in the corresponding Module Select
Register (MODSELn).

Add the missing FN_SEL_I2Ci_0 function enums to the pinmux_data[] array
by temporarily overriding the GP_2_j_FN function enum to expand to two
enums: the original GP_2_j_FN enum to configure the GSPR register bits,
and the missing FN_SEL_I2Ci_0 enum to configure the MODSEL register
bits.

Fixes: 741a7370fc3b8b54 ("pinctrl: renesas: Initial R8A779A0 (V3U) PFC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 70551ba8b524656d..d79228d6d3c6097c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -615,7 +615,36 @@ enum {
 };
 
 static const u16 pinmux_data[] = {
+/* Using GP_2_[9-0] requires disabling I2C in MOD_SEL2 */
+#define GP_2_2_FN	GP_2_2_FN,	FN_SEL_I2C0_0
+#define GP_2_3_FN	GP_2_3_FN,	FN_SEL_I2C0_0
+#define GP_2_4_FN	GP_2_4_FN,	FN_SEL_I2C1_0
+#define GP_2_5_FN	GP_2_5_FN,	FN_SEL_I2C1_0
+#define GP_2_6_FN	GP_2_6_FN,	FN_SEL_I2C2_0
+#define GP_2_7_FN	GP_2_7_FN,	FN_SEL_I2C2_0
+#define GP_2_8_FN	GP_2_8_FN,	FN_SEL_I2C3_0
+#define GP_2_9_FN	GP_2_9_FN,	FN_SEL_I2C3_0
+#define GP_2_10_FN	GP_2_10_FN,	FN_SEL_I2C4_0
+#define GP_2_11_FN	GP_2_11_FN,	FN_SEL_I2C4_0
+#define GP_2_12_FN	GP_2_12_FN,	FN_SEL_I2C5_0
+#define GP_2_13_FN	GP_2_13_FN,	FN_SEL_I2C5_0
+#define GP_2_14_FN	GP_2_14_FN,	FN_SEL_I2C6_0
+#define GP_2_15_FN	GP_2_15_FN,	FN_SEL_I2C6_0
 	PINMUX_DATA_GP_ALL(),
+#undef GP_2_2_FN
+#undef GP_2_3_FN
+#undef GP_2_4_FN
+#undef GP_2_5_FN
+#undef GP_2_6_FN
+#undef GP_2_7_FN
+#undef GP_2_8_FN
+#undef GP_2_9_FN
+#undef GP_2_10_FN
+#undef GP_2_11_FN
+#undef GP_2_12_FN
+#undef GP_2_13_FN
+#undef GP_2_14_FN
+#undef GP_2_15_FN
 
 	PINMUX_SINGLE(MMC_D7),
 	PINMUX_SINGLE(MMC_D6),
-- 
2.25.1

