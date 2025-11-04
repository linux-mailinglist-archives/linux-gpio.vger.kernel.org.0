Return-Path: <linux-gpio+bounces-28038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F27C3233C
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 18:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D036463272
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 17:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B997D33468F;
	Tue,  4 Nov 2025 16:59:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40755333754;
	Tue,  4 Nov 2025 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275598; cv=none; b=AoW1EbtNWMl2z5FOKu/tEzivl/sogwX6p3Zs/ErXfJ7PuW9Xm6W772OnXlDQeseLx89Tw6DCw8ooCIrxElBsntFgfqaT5qFKUWi1JoMWfTDxFeHQz6BF6F3tP5cD8mEpVtHG29J1nYQT0mh5rxcQSU2rYSVLeQBIjLQ/P/OtLpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275598; c=relaxed/simple;
	bh=X6bzn5w7yIyDuI7jmC93GP9kynTIPH/LsbOnkss5Aiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTEyc6V3vFseORZ6obcS/SSILVlT2qiwICy/AKmrb7QmTDAVlYNuvXnEZMg0FJ3i8yk5jSTtFn7IErNOGYSrSUArMPCGbJFFtabTjf1BhhnQkE/dBfoaKmyb1jTpDC1Hok9ccl/aTd+QcvcP03dc5Ogc1srhHPnTXbUwmZeZMW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B176C4CEF7;
	Tue,  4 Nov 2025 16:59:56 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	huybui2 <huy.bui.wm@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] pinctrl: renesas: r8a779g0: Remove CC5_OSCOUT
Date: Tue,  4 Nov 2025 17:59:44 +0100
Message-ID: <77f9efe5388f2801ace945b7793d4823618eeec8.1762274384.git.geert+renesas@glider.be>
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

From: huybui2 <huy.bui.wm@renesas.com>

Rev.1.30 of the R-Car V4H Series Hardware User’s Manual removed the
"CC5_OSCOUT" signal from the pin control register tables.  As this is
further unused in the pin control driver, it can be removed safely.

Signed-off-by: huybui2 <huy.bui.wm@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index bf34e206f6f6357e..945e4f87806db11b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -497,7 +497,7 @@
 /* IP0SR7 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP0SR7_3_0	FM(AVB0_AVTP_PPS)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR7_7_4	FM(AVB0_AVTP_CAPTURE)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR7_11_8	FM(AVB0_AVTP_MATCH)	F_(0, 0)		FM(CC5_OSCOUT)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR7_11_8	FM(AVB0_AVTP_MATCH)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR7_15_12	FM(AVB0_TD3)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR7_19_16	FM(AVB0_LINK)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR7_23_20	FM(AVB0_PHY_INT)	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -1117,7 +1117,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP0SR7_7_4,	AVB0_AVTP_CAPTURE),
 
 	PINMUX_IPSR_GPSR(IP0SR7_11_8,	AVB0_AVTP_MATCH),
-	PINMUX_IPSR_GPSR(IP0SR7_11_8,	CC5_OSCOUT),
 
 	PINMUX_IPSR_GPSR(IP0SR7_15_12,	AVB0_TD3),
 
-- 
2.43.0


