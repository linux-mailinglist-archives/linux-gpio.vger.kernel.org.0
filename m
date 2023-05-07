Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EF16F988F
	for <lists+linux-gpio@lfdr.de>; Sun,  7 May 2023 15:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjEGNJk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 May 2023 09:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjEGNJj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 May 2023 09:09:39 -0400
X-Greylist: delayed 481 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 07 May 2023 06:09:37 PDT
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050:0:465::103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364CB524D;
        Sun,  7 May 2023 06:09:37 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4QDl1937jnz9shW;
        Sun,  7 May 2023 15:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683464493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=OhXaUDHQVYmP3YSSaL76eq+RDeycq4GhWZ979jHgEiQ=;
        b=u880LaoHUKcQjQKSElLhnKEvyf85fgAStycJ2eA2JdW0V9AxcSdXAmnaQxTXvZGKrHdQ7o
        RNRvvKVhxd8XC9OaAFhgvyYTaZRmLc/tHVNK1FmtNc5pB1Pw+sYk6t2gF/9fdd5umpDtBX
        OAXkwhwK7nSMbu/L7a0lMAz+y3XxJMzRSLDy4rI3U1Jl9VgtqR5lnxsWCDBPDvAvqsY1sk
        W0J8kwZY1Imi4NkW7XRXGYKanvYSpGkWA8XK6VXMq4e26hMoO8Jh2owDS1XtVkA3ajhFwu
        C7gxgCkYvyXelhHJZY66RJW5DgWWntxx5AAc20Tpy9jvaOXzfyTrYVPyPoYW9g==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683464491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=OhXaUDHQVYmP3YSSaL76eq+RDeycq4GhWZ979jHgEiQ=;
        b=FDwQSwr/a5iumTmqEOiIgO6Gobik9u7x7AzURvJ0QO1SZQFGztRlg3MPvz6jbE07J70uQZ
        SuXVutddxgAQRL/6zqcVnFHU7enxUEZgflrWg4TfiUAMl9n+KDcVbCKns1pOwtTOVDWS1l
        YjQvmS2oiodhxWVfDUV1/HynEIHKZfTLwVay5HVC8zQf8YOQ1owu+CnHoQ0lkwBKGwTDDC
        D+SB+3NgMsvaCXyBAcz+v52X8oVfv5Xb3+7ElIOIAwB9u7HcE/ZCftA7iBDetrd2eSMsc7
        PpblQ8CYM0b/LmC9gGE9uQ3HljJI6KWvg9kqCGs26OtaDKXF8vc46tNKcDhJBw==
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: Fix spaces followed by tabs
Date:   Sun,  7 May 2023 15:01:20 +0200
Message-Id: <20230507130120.7587-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 166d7c83d22d6978f32
X-MBO-RS-META: kiy14mf179bj3s377pi47h1x7sn3un6f
X-Rspamd-Queue-Id: 4QDl1937jnz9shW
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Perform 's@ \t@\t\t@g' so we wouldn't have spaces followed by tabs.
No functional change.

Picked from U-Boot commit 0cf207ec01c ("WS cleanup: remove SPACE(s) followed by TAB")

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/renesas/pfc-r8a77970.c | 2 +-
 drivers/pinctrl/renesas/pfc-r8a77980.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 5b66d7b1af95..e1b3e3b38ec3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -171,7 +171,7 @@
 #define IP0_31_28	FM(DU_DG3)			FM(MSIOF3_SS2)		F_(0, 0)	FM(A7)		FM(PWMFSW0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_3_0		FM(DU_DG4)			F_(0, 0)		F_(0, 0)	FM(A8)		FM(FSO_CFE_0_N_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_7_4		FM(DU_DG5)			F_(0, 0)		F_(0, 0)	FM(A9)		FM(FSO_CFE_1_N_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1_11_8	FM(DU_DG6)			F_(0, 0)		F_(0, 0)	FM(A10)		FM(FSO_TOE_N_A) 	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1_11_8	FM(DU_DG6)			F_(0, 0)		F_(0, 0)	FM(A10)		FM(FSO_TOE_N_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_15_12	FM(DU_DG7)			F_(0, 0)		F_(0, 0)	FM(A11)		FM(IRQ1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_19_16	FM(DU_DB2)			F_(0, 0)		F_(0, 0)	FM(A12)		FM(IRQ2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1_23_20	FM(DU_DB3)			F_(0, 0)		F_(0, 0)	FM(A13)		FM(FXR_CLKOUT1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index 384faa0d6937..877134d78c7e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -99,7 +99,7 @@
 #define GPSR1_0		F_(IRQ0,		IP2_27_24)
 
 /* GPSR2 */
-#define GPSR2_29	F_(FSO_TOE_N,  		IP10_19_16)
+#define GPSR2_29	F_(FSO_TOE_N,		IP10_19_16)
 #define GPSR2_28	F_(FSO_CFE_1_N,		IP10_15_12)
 #define GPSR2_27	F_(FSO_CFE_0_N,		IP10_11_8)
 #define GPSR2_26	F_(SDA3,		IP10_7_4)
@@ -264,11 +264,11 @@
 #define IP8_11_8	FM(CANFD0_RX_A)			FM(RXDA_EXTFXR)		FM(PWM1_B)		FM(DU_CDE)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_15_12	FM(CANFD1_TX)			FM(FXR_TXDB)		FM(PWM2_B)		FM(TCLK1_B)	FM(TX1_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_19_16	FM(CANFD1_RX)			FM(RXDB_EXTFXR)		FM(PWM3_B)		FM(TCLK2_B)	FM(RX1_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_23_20	FM(CANFD_CLK_A) 		FM(CLK_EXTFXR)		FM(PWM4_B)		FM(SPEEDIN_B)	FM(SCIF_CLK_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP8_23_20	FM(CANFD_CLK_A)			FM(CLK_EXTFXR)		FM(PWM4_B)		FM(SPEEDIN_B)	FM(SCIF_CLK_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_27_24	FM(DIGRF_CLKIN)			FM(DIGRF_CLKEN_IN)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_31_28	FM(DIGRF_CLKOUT)		FM(DIGRF_CLKEN_OUT)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP9_3_0		FM(IRQ4)			F_(0, 0)		F_(0, 0)		FM(VI0_DATA12)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP9_7_4 	FM(IRQ5)			F_(0, 0)		F_(0, 0)		FM(VI0_DATA13)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP9_7_4		FM(IRQ5)			F_(0, 0)		F_(0, 0)		FM(VI0_DATA13)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP9_11_8	FM(MSIOF0_RXD)			FM(DU_DR0)		F_(0, 0)		FM(VI0_DATA14)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP9_15_12	FM(MSIOF0_TXD)			FM(DU_DR1)		F_(0, 0)		FM(VI0_DATA15)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP9_19_16	FM(MSIOF0_SCK)			FM(DU_DG0)		F_(0, 0)		FM(VI0_DATA16)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-- 
2.39.2

