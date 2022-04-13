Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD154FFC61
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiDMR0w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237300AbiDMR0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:45 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17D6DAB
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQF2700w2t8Arn01HQFXM; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqG-CH; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfWg-7s; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 36/50] pinctrl: renesas: r8a779a0: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:58 +0200
Message-Id: <7db3751ecf96fcc469bd14eeb02d69e565956151.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 556 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 203 +++++++++----------------
 1 file changed, 72 insertions(+), 131 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 081a14fbe5a4af87..70551ba8b524656d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -389,7 +389,6 @@
 #define IP3SR1_19_16	FM(GP1_28)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)		FM(D0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_23_20	FM(GP1_29)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)		FM(D1)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_27_24	FM(GP1_30)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)		FM(D2)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_31_28	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3 */		/* 4 */		/* 5 */		/* 6 - F */
 #define IP0SR2_3_0	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	F_(0, 0)	FM(DU_DOTCLKIN)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -420,11 +419,8 @@
 #define IP2SR2_31_28	FM(TCLK1_A)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	FM(EX_WAIT0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP0SR3 */		/* 0 */		/* 1 */			/* 2 */		/* 3 */			/* 4 */		/* 5 */		/* 6 - F */
-#define IP0SR3_3_0	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR3_7_4	FM(CANFD0_TX)	FM(FXR_TXDA_B)		FM(TX1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR3_11_8	FM(CANFD0_RX)	FM(RXDA_EXTFXR_B)	FM(RX1_B)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR3_15_12	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR3_19_16	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR3_23_20	FM(CANFD2_TX)	FM(TPU0TO2)		FM(PWM0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR3_27_24	FM(CANFD2_RX)	FM(TPU0TO3)		FM(PWM1)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR3_31_28	FM(CANFD3_TX)	F_(0, 0)		FM(PWM2)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -435,8 +431,6 @@
 #define IP1SR3_15_12	FM(CANFD5_TX)	F_(0, 0)		F_(0, 0)	FM(FXR_TXENA_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_19_16	FM(CANFD5_RX)	F_(0, 0)		F_(0, 0)	FM(FXR_TXENB_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_23_20	FM(CANFD6_TX)	F_(0, 0)		F_(0, 0)	FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_27_24	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_31_28	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP0SR4 */		/* 0 */		/* 1 */			/* 2 */		/* 3 */		/* 4 */		/* 5 */		/* 6 - F */
 #define IP0SR4_3_0	FM(AVB0_RX_CTL)	FM(AVB0_MII_RX_DV)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -457,14 +451,10 @@
 #define IP1SR4_27_24	FM(AVB0_MDC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR4_31_28	FM(AVB0_MAGIC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 /* IP2SR4 */		/* 0 */			/* 1 */			/* 2 */		/* 3 */		/* 4 */		/* 5 */		/* 6 - F */
-#define IP2SR4_3_0	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR4_7_4	FM(AVB0_LINK)		FM(AVB0_MII_TX_ER)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR4_11_8	FM(AVB0_AVTP_MATCH)	FM(AVB0_MII_RX_ER)	FM(CC5_OSCOUT)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR4_15_12	FM(AVB0_AVTP_CAPTURE)	FM(AVB0_MII_CRS)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR4_19_16	FM(AVB0_AVTP_PPS)	FM(AVB0_MII_COL)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR4_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR4_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR4_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP0SR5 */		/* 0 */			/* 1 */			/* 2 */		/* 3 */		/* 4 */		/* 5 */		/* 6 - F */
 #define IP0SR5_3_0	FM(AVB1_RX_CTL)		FM(AVB1_MII_RX_DV)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -485,14 +475,10 @@
 #define IP1SR5_27_24	FM(AVB1_MDC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR5_31_28	FM(AVB1_MAGIC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 /* IP2SR5 */		/* 0 */			/* 1 */			/* 2 */		/* 3 */		/* 4 */		/* 5 */		/* 6 - F */
-#define IP2SR5_3_0	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR5_7_4	FM(AVB1_LINK)		FM(AVB1_MII_TX_ER)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR5_11_8	FM(AVB1_AVTP_MATCH)	FM(AVB1_MII_RX_ER)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR5_15_12	FM(AVB1_AVTP_CAPTURE)	FM(AVB1_MII_CRS)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR5_19_16	FM(AVB1_AVTP_PPS)	FM(AVB1_MII_COL)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR5_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR5_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR5_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 #define PINMUX_GPSR		\
 				\
@@ -537,7 +523,7 @@ FM(IP0SR1_15_12)	IP0SR1_15_12	FM(IP1SR1_15_12)	IP1SR1_15_12	FM(IP2SR1_15_12)	IP2
 FM(IP0SR1_19_16)	IP0SR1_19_16	FM(IP1SR1_19_16)	IP1SR1_19_16	FM(IP2SR1_19_16)	IP2SR1_19_16	FM(IP3SR1_19_16)	IP3SR1_19_16 \
 FM(IP0SR1_23_20)	IP0SR1_23_20	FM(IP1SR1_23_20)	IP1SR1_23_20	FM(IP2SR1_23_20)	IP2SR1_23_20	FM(IP3SR1_23_20)	IP3SR1_23_20 \
 FM(IP0SR1_27_24)	IP0SR1_27_24	FM(IP1SR1_27_24)	IP1SR1_27_24	FM(IP2SR1_27_24)	IP2SR1_27_24	FM(IP3SR1_27_24)	IP3SR1_27_24 \
-FM(IP0SR1_31_28)	IP0SR1_31_28	FM(IP1SR1_31_28)	IP1SR1_31_28	FM(IP2SR1_31_28)	IP2SR1_31_28	FM(IP3SR1_31_28)	IP3SR1_31_28 \
+FM(IP0SR1_31_28)	IP0SR1_31_28	FM(IP1SR1_31_28)	IP1SR1_31_28	FM(IP2SR1_31_28)	IP2SR1_31_28 \
 \
 FM(IP0SR2_3_0)		IP0SR2_3_0	FM(IP1SR2_3_0)		IP1SR2_3_0	FM(IP2SR2_3_0)		IP2SR2_3_0 \
 FM(IP0SR2_7_4)		IP0SR2_7_4	FM(IP1SR2_7_4)		IP1SR2_7_4	FM(IP2SR2_7_4)		IP2SR2_7_4 \
@@ -548,32 +534,32 @@ FM(IP0SR2_23_20)	IP0SR2_23_20	FM(IP1SR2_23_20)	IP1SR2_23_20	FM(IP2SR2_23_20)	IP2
 FM(IP0SR2_27_24)	IP0SR2_27_24	FM(IP1SR2_27_24)	IP1SR2_27_24	FM(IP2SR2_27_24)	IP2SR2_27_24 \
 FM(IP0SR2_31_28)	IP0SR2_31_28	FM(IP1SR2_31_28)	IP1SR2_31_28	FM(IP2SR2_31_28)	IP2SR2_31_28 \
 \
-FM(IP0SR3_3_0)		IP0SR3_3_0	FM(IP1SR3_3_0)		IP1SR3_3_0	\
+					FM(IP1SR3_3_0)		IP1SR3_3_0	\
 FM(IP0SR3_7_4)		IP0SR3_7_4	FM(IP1SR3_7_4)		IP1SR3_7_4	\
 FM(IP0SR3_11_8)		IP0SR3_11_8	FM(IP1SR3_11_8)		IP1SR3_11_8	\
-FM(IP0SR3_15_12)	IP0SR3_15_12	FM(IP1SR3_15_12)	IP1SR3_15_12	\
-FM(IP0SR3_19_16)	IP0SR3_19_16	FM(IP1SR3_19_16)	IP1SR3_19_16	\
+					FM(IP1SR3_15_12)	IP1SR3_15_12	\
+					FM(IP1SR3_19_16)	IP1SR3_19_16	\
 FM(IP0SR3_23_20)	IP0SR3_23_20	FM(IP1SR3_23_20)	IP1SR3_23_20	\
-FM(IP0SR3_27_24)	IP0SR3_27_24	FM(IP1SR3_27_24)	IP1SR3_27_24	\
-FM(IP0SR3_31_28)	IP0SR3_31_28	FM(IP1SR3_31_28)	IP1SR3_31_28	\
+FM(IP0SR3_27_24)	IP0SR3_27_24	\
+FM(IP0SR3_31_28)	IP0SR3_31_28	\
 \
-FM(IP0SR4_3_0)		IP0SR4_3_0	FM(IP1SR4_3_0)		IP1SR4_3_0	FM(IP2SR4_3_0)		IP2SR4_3_0 \
+FM(IP0SR4_3_0)		IP0SR4_3_0	FM(IP1SR4_3_0)		IP1SR4_3_0	\
 FM(IP0SR4_7_4)		IP0SR4_7_4	FM(IP1SR4_7_4)		IP1SR4_7_4	FM(IP2SR4_7_4)		IP2SR4_7_4 \
 FM(IP0SR4_11_8)		IP0SR4_11_8	FM(IP1SR4_11_8)		IP1SR4_11_8	FM(IP2SR4_11_8)		IP2SR4_11_8 \
 FM(IP0SR4_15_12)	IP0SR4_15_12	FM(IP1SR4_15_12)	IP1SR4_15_12	FM(IP2SR4_15_12)	IP2SR4_15_12 \
 FM(IP0SR4_19_16)	IP0SR4_19_16	FM(IP1SR4_19_16)	IP1SR4_19_16	FM(IP2SR4_19_16)	IP2SR4_19_16 \
-FM(IP0SR4_23_20)	IP0SR4_23_20	FM(IP1SR4_23_20)	IP1SR4_23_20	FM(IP2SR4_23_20)	IP2SR4_23_20 \
-FM(IP0SR4_27_24)	IP0SR4_27_24	FM(IP1SR4_27_24)	IP1SR4_27_24	FM(IP2SR4_27_24)	IP2SR4_27_24 \
-FM(IP0SR4_31_28)	IP0SR4_31_28	FM(IP1SR4_31_28)	IP1SR4_31_28	FM(IP2SR4_31_28)	IP2SR4_31_28 \
+FM(IP0SR4_23_20)	IP0SR4_23_20	FM(IP1SR4_23_20)	IP1SR4_23_20	\
+FM(IP0SR4_27_24)	IP0SR4_27_24	FM(IP1SR4_27_24)	IP1SR4_27_24	\
+FM(IP0SR4_31_28)	IP0SR4_31_28	FM(IP1SR4_31_28)	IP1SR4_31_28	\
 \
-FM(IP0SR5_3_0)		IP0SR5_3_0	FM(IP1SR5_3_0)		IP1SR5_3_0	FM(IP2SR5_3_0)		IP2SR5_3_0 \
+FM(IP0SR5_3_0)		IP0SR5_3_0	FM(IP1SR5_3_0)		IP1SR5_3_0	\
 FM(IP0SR5_7_4)		IP0SR5_7_4	FM(IP1SR5_7_4)		IP1SR5_7_4	FM(IP2SR5_7_4)		IP2SR5_7_4 \
 FM(IP0SR5_11_8)		IP0SR5_11_8	FM(IP1SR5_11_8)		IP1SR5_11_8	FM(IP2SR5_11_8)		IP2SR5_11_8 \
 FM(IP0SR5_15_12)	IP0SR5_15_12	FM(IP1SR5_15_12)	IP1SR5_15_12	FM(IP2SR5_15_12)	IP2SR5_15_12 \
 FM(IP0SR5_19_16)	IP0SR5_19_16	FM(IP1SR5_19_16)	IP1SR5_19_16	FM(IP2SR5_19_16)	IP2SR5_19_16 \
-FM(IP0SR5_23_20)	IP0SR5_23_20	FM(IP1SR5_23_20)	IP1SR5_23_20	FM(IP2SR5_23_20)	IP2SR5_23_20 \
-FM(IP0SR5_27_24)	IP0SR5_27_24	FM(IP1SR5_27_24)	IP1SR5_27_24	FM(IP2SR5_27_24)	IP2SR5_27_24 \
-FM(IP0SR5_31_28)	IP0SR5_31_28	FM(IP1SR5_31_28)	IP1SR5_31_28	FM(IP2SR5_31_28)	IP2SR5_31_28
+FM(IP0SR5_23_20)	IP0SR5_23_20	FM(IP1SR5_23_20)	IP1SR5_23_20	\
+FM(IP0SR5_27_24)	IP0SR5_27_24	FM(IP1SR5_27_24)	IP1SR5_27_24	\
+FM(IP0SR5_31_28)	IP0SR5_31_28	FM(IP1SR5_31_28)	IP1SR5_31_28
 
 /* MOD_SEL2 */			/* 0 */		/* 1 */		/* 2 */		/* 3 */
 #define MOD_SEL2_15_14		FM(SEL_I2C6_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C6_3)
@@ -3223,14 +3209,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_1_1_FN,	GPSR1_1,
 		GP_1_0_FN,	GPSR1_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR2", 0xe6050840, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR2", 0xe6050840, 32,
+			     GROUP(-7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP2_31_25 RESERVED */
 		GP_2_24_FN,	GPSR2_24,
 		GP_2_23_FN,	GPSR2_23,
 		GP_2_22_FN,	GPSR2_22,
@@ -3257,22 +3240,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_2_1_FN,	GPSR2_1,
 		GP_2_0_FN,	GPSR2_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR3", 0xe6058840, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR3", 0xe6058840, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP3_31_17 RESERVED */
 		GP_3_16_FN,	GPSR3_16,
 		GP_3_15_FN,	GPSR3_15,
 		GP_3_14_FN,	GPSR3_14,
@@ -3325,18 +3297,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_4_1_FN,	GPSR4_1,
 		GP_4_0_FN,	GPSR4_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR5", 0xe6060840, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR5", 0xe6060840, 32,
+			     GROUP(-11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP5_31_21 RESERVED */
 		GP_5_20_FN,	GPSR5_20,
 		GP_5_19_FN,	GPSR5_19,
 		GP_5_18_FN,	GPSR5_18,
@@ -3359,18 +3324,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_5_1_FN,	GPSR5_1,
 		GP_5_0_FN,	GPSR5_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR6", 0xe6068040, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR6", 0xe6068040, 32,
+			     GROUP(-11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP6_31_21 RESERVED */
 		GP_6_20_FN,	GPSR6_20,
 		GP_6_19_FN,	GPSR6_19,
 		GP_6_18_FN,	GPSR6_18,
@@ -3393,18 +3351,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_6_1_FN,	GPSR6_1,
 		GP_6_0_FN,	GPSR6_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR7", 0xe6068840, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR7", 0xe6068840, 32,
+			     GROUP(-11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP7_31_21 RESERVED */
 		GP_7_20_FN,	GPSR7_20,
 		GP_7_19_FN,	GPSR7_19,
 		GP_7_18_FN,	GPSR7_18,
@@ -3427,18 +3378,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_7_1_FN,	GPSR7_1,
 		GP_7_0_FN,	GPSR7_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR8", 0xe6069040, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR8", 0xe6069040, 32,
+			     GROUP(-11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP8_31_21 RESERVED */
 		GP_8_20_FN,	GPSR8_20,
 		GP_8_19_FN,	GPSR8_19,
 		GP_8_18_FN,	GPSR8_18,
@@ -3461,18 +3405,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_8_1_FN,	GPSR8_1,
 		GP_8_0_FN,	GPSR8_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR9", 0xe6069840, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR9", 0xe6069840, 32,
+			     GROUP(-11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP9_31_21 RESERVED */
 		GP_9_20_FN,	GPSR9_20,
 		GP_9_19_FN,	GPSR9_19,
 		GP_9_18_FN,	GPSR9_18,
@@ -3530,8 +3467,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP2SR1_7_4
 		IP2SR1_3_0))
 	},
-	{ PINMUX_CFG_REG("IP3SR1", 0xe605006c, 32, 4, GROUP(
-		IP3SR1_31_28
+	{ PINMUX_CFG_REG_VAR("IP3SR1", 0xe605006c, 32,
+			      GROUP(-4, 4, 4, 4, 4, 4, 4, 4),
+			      GROUP(
+		/* IP3SR1_31_28 RESERVED */
 		IP3SR1_27_24
 		IP3SR1_23_20
 		IP3SR1_19_16
@@ -3570,19 +3509,21 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP2SR2_7_4
 		IP2SR2_3_0))
 	},
-	{ PINMUX_CFG_REG("IP0SR3", 0xe6058860, 32, 4, GROUP(
+	{ PINMUX_CFG_REG_VAR("IP0SR3", 0xe6058860, 32,
+			     GROUP(4, 4, 4, -8, 4, 4, -4),
+			     GROUP(
 		IP0SR3_31_28
 		IP0SR3_27_24
 		IP0SR3_23_20
-		IP0SR3_19_16
-		IP0SR3_15_12
+		/* IP0SR3_19_12 RESERVED */
 		IP0SR3_11_8
 		IP0SR3_7_4
-		IP0SR3_3_0))
+		/* IP0SR3_3_0 RESERVED */ ))
 	},
-	{ PINMUX_CFG_REG("IP1SR3", 0xe6058864, 32, 4, GROUP(
-		IP1SR3_31_28
-		IP1SR3_27_24
+	{ PINMUX_CFG_REG_VAR("IP1SR3", 0xe6058864, 32,
+			     GROUP(-8, 4, 4, 4, 4, 4, 4),
+			     GROUP(
+		/* IP1SR3_31_24 RESERVED */
 		IP1SR3_23_20
 		IP1SR3_19_16
 		IP1SR3_15_12
@@ -3610,15 +3551,15 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP1SR4_7_4
 		IP1SR4_3_0))
 	},
-	{ PINMUX_CFG_REG("IP2SR4", 0xe6060068, 32, 4, GROUP(
-		IP2SR4_31_28
-		IP2SR4_27_24
-		IP2SR4_23_20
+	{ PINMUX_CFG_REG_VAR("IP2SR4", 0xe6060068, 32,
+			     GROUP(-12, 4, 4, 4, 4, -4),
+			     GROUP(
+		/* IP2SR4_31_20 RESERVED */
 		IP2SR4_19_16
 		IP2SR4_15_12
 		IP2SR4_11_8
 		IP2SR4_7_4
-		IP2SR4_3_0))
+		/* IP2SR4_3_0 RESERVED */ ))
 	},
 	{ PINMUX_CFG_REG("IP0SR5", 0xe6060860, 32, 4, GROUP(
 		IP0SR5_31_28
@@ -3640,15 +3581,15 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP1SR5_7_4
 		IP1SR5_3_0))
 	},
-	{ PINMUX_CFG_REG("IP2SR5", 0xe6060868, 32, 4, GROUP(
-		IP2SR5_31_28
-		IP2SR5_27_24
-		IP2SR5_23_20
+	{ PINMUX_CFG_REG_VAR("IP2SR5", 0xe6060868, 32,
+			     GROUP(-12, 4, 4, 4, 4, -4),
+			     GROUP(
+		/* IP2SR5_31_20 RESERVED */
 		IP2SR5_19_16
 		IP2SR5_15_12
 		IP2SR5_11_8
 		IP2SR5_7_4
-		IP2SR5_3_0))
+		/* IP2SR5_3_0 RESERVED */ ))
 	},
 #undef F_
 #undef FM
-- 
2.25.1

