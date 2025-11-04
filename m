Return-Path: <linux-gpio+bounces-28037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77072C322FA
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 18:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15A7C18C4229
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 17:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC14B338587;
	Tue,  4 Nov 2025 16:59:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3DB333754;
	Tue,  4 Nov 2025 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275596; cv=none; b=hulY1Qrq6pTGlat0KYq2PyLZ1ibqAdvTH4b0G60yPdjSxgR2FjoFE3ZVZduVEdCVymGe8VcZ6ITmtqUFV+Ms4hoos2VPUIbVuKysE/i6iorLFp4dSuHeWvzY+f65ROxpUTvhjhxvb9jL1O2St+zl0uRR6nfIxVMSLZ8xIe+IG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275596; c=relaxed/simple;
	bh=t3312T1mVbcXHs/zGqv80VaL2jePrxBxmwOAdx8Zno4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZwA1zD0O57f21AgX86hZlhdKNB6culwP4E0tbuCs3UfbKpr0khH29xBC+DTvypeYLt4olabmNy2HNZAZv7EM7xm+547TQlbYB9VTT9F/SbTN/qstCH17ZyhQMS+EjHSdsFtQCzIEufpMcfTxuFNaOzP10J1+PTCzDS3Rfis6ldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC59C4CEF8;
	Tue,  4 Nov 2025 16:59:54 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] pinctrl: renesas: r8a779g0: Remove AVB[01]_MII
Date: Tue,  4 Nov 2025 17:59:43 +0100
Message-ID: <58662f50136280532bcc8bbe94741d82425bd118.1762274384.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762274384.git.geert+renesas@glider.be>
References: <cover.1762274384.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thanh Quan <thanh.quan.xn@renesas.com>

Rev.1.30 of the R-Car V4H Series Hardware User’s Manual removed the
"AVB[01]_MII_*" signals from the pin control register tables.  As these
are further unused in the pin control driver, they can be removed
safely.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 96 +++++++++-----------------
 1 file changed, 32 insertions(+), 64 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 218c5eff9b67feab..bf34e206f6f6357e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -471,55 +471,55 @@
 #define IP0SR6_7_4	FM(AVB1_MAGIC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR6_11_8	FM(AVB1_MDC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR6_15_12	FM(AVB1_PHY_INT)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR6_19_16	FM(AVB1_LINK)		FM(AVB1_MII_TX_ER)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR6_23_20	FM(AVB1_AVTP_MATCH)	FM(AVB1_MII_RX_ER)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR6_27_24	FM(AVB1_TXC)		FM(AVB1_MII_TXC)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR6_31_28	FM(AVB1_TX_CTL)		FM(AVB1_MII_TX_EN)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR6_19_16	FM(AVB1_LINK)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR6_23_20	FM(AVB1_AVTP_MATCH)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR6_27_24	FM(AVB1_TXC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR6_31_28	FM(AVB1_TX_CTL)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR6 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR6_3_0	FM(AVB1_RXC)		FM(AVB1_MII_RXC)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR6_7_4	FM(AVB1_RX_CTL)		FM(AVB1_MII_RX_DV)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR6_11_8	FM(AVB1_AVTP_PPS)	FM(AVB1_MII_COL)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR6_15_12	FM(AVB1_AVTP_CAPTURE)	FM(AVB1_MII_CRS)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR6_19_16	FM(AVB1_TD1)		FM(AVB1_MII_TD1)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR6_23_20	FM(AVB1_TD0)		FM(AVB1_MII_TD0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR6_27_24	FM(AVB1_RD1)		FM(AVB1_MII_RD1)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR6_31_28	FM(AVB1_RD0)		FM(AVB1_MII_RD0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_3_0	FM(AVB1_RXC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_7_4	FM(AVB1_RX_CTL)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_11_8	FM(AVB1_AVTP_PPS)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_15_12	FM(AVB1_AVTP_CAPTURE)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_19_16	FM(AVB1_TD1)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_23_20	FM(AVB1_TD0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_27_24	FM(AVB1_RD1)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR6_31_28	FM(AVB1_RD0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR6 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP2SR6_3_0	FM(AVB1_TD2)		FM(AVB1_MII_TD2)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR6_7_4	FM(AVB1_RD2)		FM(AVB1_MII_RD2)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR6_11_8	FM(AVB1_TD3)		FM(AVB1_MII_TD3)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR6_15_12	FM(AVB1_RD3)		FM(AVB1_MII_RD3)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR6_3_0	FM(AVB1_TD2)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR6_7_4	FM(AVB1_RD2)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR6_11_8	FM(AVB1_TD3)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR6_15_12	FM(AVB1_RD3)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR6_19_16	FM(AVB1_TXCREFCLK)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR7 */
 /* IP0SR7 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR7_3_0	FM(AVB0_AVTP_PPS)	FM(AVB0_MII_COL)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR7_7_4	FM(AVB0_AVTP_CAPTURE)	FM(AVB0_MII_CRS)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR7_11_8	FM(AVB0_AVTP_MATCH)	FM(AVB0_MII_RX_ER)	FM(CC5_OSCOUT)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR7_15_12	FM(AVB0_TD3)		FM(AVB0_MII_TD3)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR7_19_16	FM(AVB0_LINK)		FM(AVB0_MII_TX_ER)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_3_0	FM(AVB0_AVTP_PPS)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_7_4	FM(AVB0_AVTP_CAPTURE)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_11_8	FM(AVB0_AVTP_MATCH)	F_(0, 0)		FM(CC5_OSCOUT)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_15_12	FM(AVB0_TD3)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_19_16	FM(AVB0_LINK)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR7_23_20	FM(AVB0_PHY_INT)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR7_27_24	FM(AVB0_TD2)		FM(AVB0_MII_TD2)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR7_31_28	FM(AVB0_TD1)		FM(AVB0_MII_TD1)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_27_24	FM(AVB0_TD2)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_31_28	FM(AVB0_TD1)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR7 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR7_3_0	FM(AVB0_RD3)		FM(AVB0_MII_RD3)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR7_3_0	FM(AVB0_RD3)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR7_7_4	FM(AVB0_TXCREFCLK)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR7_11_8	FM(AVB0_MAGIC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR7_15_12	FM(AVB0_TD0)		FM(AVB0_MII_TD0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR7_19_16	FM(AVB0_RD2)		FM(AVB0_MII_RD2)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR7_15_12	FM(AVB0_TD0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR7_19_16	FM(AVB0_RD2)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR7_23_20	FM(AVB0_MDC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR7_27_24	FM(AVB0_MDIO)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR7_31_28	FM(AVB0_TXC)		FM(AVB0_MII_TXC)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR7_31_28	FM(AVB0_TXC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR7 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP2SR7_3_0	FM(AVB0_TX_CTL)		FM(AVB0_MII_TX_EN)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR7_7_4	FM(AVB0_RD1)		FM(AVB0_MII_RD1)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR7_11_8	FM(AVB0_RD0)		FM(AVB0_MII_RD0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR7_15_12	FM(AVB0_RXC)		FM(AVB0_MII_RXC)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR7_19_16	FM(AVB0_RX_CTL)		FM(AVB0_MII_RX_DV)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR7_3_0	FM(AVB0_TX_CTL)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR7_7_4	FM(AVB0_RD1)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR7_11_8	FM(AVB0_RD0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR7_15_12	FM(AVB0_RXC)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR7_19_16	FM(AVB0_RX_CTL)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR8 */
 /* IP0SR8 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -1076,118 +1076,86 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP0SR6_15_12,	AVB1_PHY_INT),
 
 	PINMUX_IPSR_GPSR(IP0SR6_19_16,	AVB1_LINK),
-	PINMUX_IPSR_GPSR(IP0SR6_19_16,	AVB1_MII_TX_ER),
 
 	PINMUX_IPSR_GPSR(IP0SR6_23_20,	AVB1_AVTP_MATCH),
-	PINMUX_IPSR_GPSR(IP0SR6_23_20,	AVB1_MII_RX_ER),
 
 	PINMUX_IPSR_GPSR(IP0SR6_27_24,	AVB1_TXC),
-	PINMUX_IPSR_GPSR(IP0SR6_27_24,	AVB1_MII_TXC),
 
 	PINMUX_IPSR_GPSR(IP0SR6_31_28,	AVB1_TX_CTL),
-	PINMUX_IPSR_GPSR(IP0SR6_31_28,	AVB1_MII_TX_EN),
 
 	/* IP1SR6 */
 	PINMUX_IPSR_GPSR(IP1SR6_3_0,	AVB1_RXC),
-	PINMUX_IPSR_GPSR(IP1SR6_3_0,	AVB1_MII_RXC),
 
 	PINMUX_IPSR_GPSR(IP1SR6_7_4,	AVB1_RX_CTL),
-	PINMUX_IPSR_GPSR(IP1SR6_7_4,	AVB1_MII_RX_DV),
 
 	PINMUX_IPSR_GPSR(IP1SR6_11_8,	AVB1_AVTP_PPS),
-	PINMUX_IPSR_GPSR(IP1SR6_11_8,	AVB1_MII_COL),
 
 	PINMUX_IPSR_GPSR(IP1SR6_15_12,	AVB1_AVTP_CAPTURE),
-	PINMUX_IPSR_GPSR(IP1SR6_15_12,	AVB1_MII_CRS),
 
 	PINMUX_IPSR_GPSR(IP1SR6_19_16,	AVB1_TD1),
-	PINMUX_IPSR_GPSR(IP1SR6_19_16,	AVB1_MII_TD1),
 
 	PINMUX_IPSR_GPSR(IP1SR6_23_20,	AVB1_TD0),
-	PINMUX_IPSR_GPSR(IP1SR6_23_20,	AVB1_MII_TD0),
 
 	PINMUX_IPSR_GPSR(IP1SR6_27_24,	AVB1_RD1),
-	PINMUX_IPSR_GPSR(IP1SR6_27_24,	AVB1_MII_RD1),
 
 	PINMUX_IPSR_GPSR(IP1SR6_31_28,	AVB1_RD0),
-	PINMUX_IPSR_GPSR(IP1SR6_31_28,	AVB1_MII_RD0),
 
 	/* IP2SR6 */
 	PINMUX_IPSR_GPSR(IP2SR6_3_0,	AVB1_TD2),
-	PINMUX_IPSR_GPSR(IP2SR6_3_0,	AVB1_MII_TD2),
 
 	PINMUX_IPSR_GPSR(IP2SR6_7_4,	AVB1_RD2),
-	PINMUX_IPSR_GPSR(IP2SR6_7_4,	AVB1_MII_RD2),
 
 	PINMUX_IPSR_GPSR(IP2SR6_11_8,	AVB1_TD3),
-	PINMUX_IPSR_GPSR(IP2SR6_11_8,	AVB1_MII_TD3),
 
 	PINMUX_IPSR_GPSR(IP2SR6_15_12,	AVB1_RD3),
-	PINMUX_IPSR_GPSR(IP2SR6_15_12,	AVB1_MII_RD3),
 
 	PINMUX_IPSR_GPSR(IP2SR6_19_16,	AVB1_TXCREFCLK),
 
 	/* IP0SR7 */
 	PINMUX_IPSR_GPSR(IP0SR7_3_0,	AVB0_AVTP_PPS),
-	PINMUX_IPSR_GPSR(IP0SR7_3_0,	AVB0_MII_COL),
 
 	PINMUX_IPSR_GPSR(IP0SR7_7_4,	AVB0_AVTP_CAPTURE),
-	PINMUX_IPSR_GPSR(IP0SR7_7_4,	AVB0_MII_CRS),
 
 	PINMUX_IPSR_GPSR(IP0SR7_11_8,	AVB0_AVTP_MATCH),
-	PINMUX_IPSR_GPSR(IP0SR7_11_8,	AVB0_MII_RX_ER),
 	PINMUX_IPSR_GPSR(IP0SR7_11_8,	CC5_OSCOUT),
 
 	PINMUX_IPSR_GPSR(IP0SR7_15_12,	AVB0_TD3),
-	PINMUX_IPSR_GPSR(IP0SR7_15_12,	AVB0_MII_TD3),
 
 	PINMUX_IPSR_GPSR(IP0SR7_19_16,	AVB0_LINK),
-	PINMUX_IPSR_GPSR(IP0SR7_19_16,	AVB0_MII_TX_ER),
 
 	PINMUX_IPSR_GPSR(IP0SR7_23_20,	AVB0_PHY_INT),
 
 	PINMUX_IPSR_GPSR(IP0SR7_27_24,	AVB0_TD2),
-	PINMUX_IPSR_GPSR(IP0SR7_27_24,	AVB0_MII_TD2),
 
 	PINMUX_IPSR_GPSR(IP0SR7_31_28,	AVB0_TD1),
-	PINMUX_IPSR_GPSR(IP0SR7_31_28,	AVB0_MII_TD1),
 
 	/* IP1SR7 */
 	PINMUX_IPSR_GPSR(IP1SR7_3_0,	AVB0_RD3),
-	PINMUX_IPSR_GPSR(IP1SR7_3_0,	AVB0_MII_RD3),
 
 	PINMUX_IPSR_GPSR(IP1SR7_7_4,	AVB0_TXCREFCLK),
 
 	PINMUX_IPSR_GPSR(IP1SR7_11_8,	AVB0_MAGIC),
 
 	PINMUX_IPSR_GPSR(IP1SR7_15_12,	AVB0_TD0),
-	PINMUX_IPSR_GPSR(IP1SR7_15_12,	AVB0_MII_TD0),
 
 	PINMUX_IPSR_GPSR(IP1SR7_19_16,	AVB0_RD2),
-	PINMUX_IPSR_GPSR(IP1SR7_19_16,	AVB0_MII_RD2),
 
 	PINMUX_IPSR_GPSR(IP1SR7_23_20,	AVB0_MDC),
 
 	PINMUX_IPSR_GPSR(IP1SR7_27_24,	AVB0_MDIO),
 
 	PINMUX_IPSR_GPSR(IP1SR7_31_28,	AVB0_TXC),
-	PINMUX_IPSR_GPSR(IP1SR7_31_28,	AVB0_MII_TXC),
 
 	/* IP2SR7 */
 	PINMUX_IPSR_GPSR(IP2SR7_3_0,	AVB0_TX_CTL),
-	PINMUX_IPSR_GPSR(IP2SR7_3_0,	AVB0_MII_TX_EN),
 
 	PINMUX_IPSR_GPSR(IP2SR7_7_4,	AVB0_RD1),
-	PINMUX_IPSR_GPSR(IP2SR7_7_4,	AVB0_MII_RD1),
 
 	PINMUX_IPSR_GPSR(IP2SR7_11_8,	AVB0_RD0),
-	PINMUX_IPSR_GPSR(IP2SR7_11_8,	AVB0_MII_RD0),
 
 	PINMUX_IPSR_GPSR(IP2SR7_15_12,	AVB0_RXC),
-	PINMUX_IPSR_GPSR(IP2SR7_15_12,	AVB0_MII_RXC),
 
 	PINMUX_IPSR_GPSR(IP2SR7_19_16,	AVB0_RX_CTL),
-	PINMUX_IPSR_GPSR(IP2SR7_19_16,	AVB0_MII_RX_DV),
 
 	/* IP0SR8 */
 	PINMUX_IPSR_MSEL(IP0SR8_3_0,	SCL0,			SEL_SCL0_0),
-- 
2.43.0


