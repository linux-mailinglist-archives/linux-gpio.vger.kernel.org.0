Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9240550B1A3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 09:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444846AbiDVHdC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 03:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444857AbiDVHcb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 03:32:31 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12225133F
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 00:29:37 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by albert.telenet-ops.be with bizsmtp
        id MjVa270052Ah9RF06jVaTK; Fri, 22 Apr 2022 09:29:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhnjR-001acF-LX; Fri, 22 Apr 2022 09:29:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhnjR-00CIuc-6m; Fri, 22 Apr 2022 09:29:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: renesas: r8a779f0: Fix GPIO function on I2C-capable pins
Date:   Fri, 22 Apr 2022 09:29:31 +0200
Message-Id: <c12c60ec1058140a37f03650043ab73f730f104f.1650610471.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650610471.git.geert+renesas@glider.be>
References: <cover.1650610471.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Unlike on R-Car Gen3 SoCs, setting a bit to zero in a GPIO / Peripheral
Function Select Register (GPSRn) on R-Car S4-8 is not always sufficient
to configure a pin for GPIO.  For I2C-capable pins, the I2C function
must also be explicitly disabled in the corresponding Module Select
Register (MODSELn).

Add the missing FN_SEL_I2Ci_0 function enums to the pinmux_data[] array
by temporarily overriding the GP_2_j_FN function enum to expand to two
enums: the original GP_2_j_FN enum to configure the GPSR register bits,
and the missing FN_SEL_I2Ci_0 enum to configure the MODSEL register
bits.

Fixes: 030ac6d7eeff81e3 ("pinctrl: renesas: Initial R8A779F0 PFC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index 69f3abca1e22b2b5..23676e509bba4fba 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -254,7 +254,28 @@ enum {
 };
 
 static const u16 pinmux_data[] = {
+/* Using GP_1_[9-0] requires disabling I2C in MOD_SEL1 */
+#define GP_1_0_FN	GP_1_0_FN,	FN_SEL_I2C0_0
+#define GP_1_1_FN	GP_1_1_FN,	FN_SEL_I2C0_0
+#define GP_1_2_FN	GP_1_2_FN,	FN_SEL_I2C1_0
+#define GP_1_3_FN	GP_1_3_FN,	FN_SEL_I2C1_0
+#define GP_1_4_FN	GP_1_4_FN,	FN_SEL_I2C2_0
+#define GP_1_5_FN	GP_1_5_FN,	FN_SEL_I2C2_0
+#define GP_1_6_FN	GP_1_6_FN,	FN_SEL_I2C3_0
+#define GP_1_7_FN	GP_1_7_FN,	FN_SEL_I2C3_0
+#define GP_1_8_FN	GP_1_8_FN,	FN_SEL_I2C4_0
+#define GP_1_9_FN	GP_1_9_FN,	FN_SEL_I2C4_0
 	PINMUX_DATA_GP_ALL(),
+#undef GP_1_0_FN
+#undef GP_1_1_FN
+#undef GP_1_2_FN
+#undef GP_1_3_FN
+#undef GP_1_4_FN
+#undef GP_1_5_FN
+#undef GP_1_6_FN
+#undef GP_1_7_FN
+#undef GP_1_8_FN
+#undef GP_1_9_FN
 
 	PINMUX_SINGLE(SD_WP),
 	PINMUX_SINGLE(SD_CD),
-- 
2.25.1

