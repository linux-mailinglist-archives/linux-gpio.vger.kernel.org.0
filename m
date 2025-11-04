Return-Path: <linux-gpio+bounces-28041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F7C32347
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 18:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55EF463368
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 17:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAEE338F24;
	Tue,  4 Nov 2025 17:00:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD633891F;
	Tue,  4 Nov 2025 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275603; cv=none; b=Z9dcAo3zP5UTMyFMyOvwppber1b9HmQEpKd9bgf5wMhZTVtNxyyHOjL1JcVS/PaPSDR3MHx5BT/tnRqNQfdrCplEL5QyjX2A7i53PsEg1bSmDXfGrDoaE6ef39YvI/VRBc7SR8v8B+6HW3bJwaX3N7SRR8TsGdrmnC1AZp1JNxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275603; c=relaxed/simple;
	bh=Pabog7KdqA7byp4M5x1bKxFW7zggLBrS2Eu/aLmYtKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ucfv9FBcYfiqaGhhbgE3rPJ1z+0dY5tr1UdnP31R7Muw1UJ01RcxyzzphzE/KMIy4c7LovQ+TYz0r4XQ2E5fo195IjhfULEmy7npCpXc9E5PNgWdeVFZpli1BuPtj9aMcRFCVQGICSYsBK7lLAg7ld/14GQHYZouhbLh9MJhWdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D758C16AAE;
	Tue,  4 Nov 2025 17:00:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] pinctrl: renesas: r8a779h0: Remove STPWT_EXTFXR
Date: Tue,  4 Nov 2025 17:59:47 +0100
Message-ID: <f849fa3b9b516e9dd04b45462b69f52225259480.1762274384.git.geert+renesas@glider.be>
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

Rev.0.81 of the R-Car V4M Series Hardware User’s Manual removed the
"STPWT_EXTFXR" signal from the pin control register tables.  As this is
further unused in the pin control driver, it can be removed safely.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index cee7690ea19d0db8..ec0fc1bf7a9056d2 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -339,7 +339,7 @@
 #define IP1SR2_3_0	FM(TPU0TO0_A)		F_(0, 0)		F_(0, 0)	FM(TCLK1_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_7_4	FM(CAN_CLK)		FM(FXR_TXENA_N_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_11_8	FM(CANFD0_TX)		FM(FXR_TXENB_N_B)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_15_12	FM(CANFD0_RX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2_A)		F_(0, 0)	FM(TCLK3_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3_A)		FM(PWM1_B)	FM(TCLK4_C)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -865,7 +865,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR2_11_8,	FXR_TXENB_N_B),
 
 	PINMUX_IPSR_GPSR(IP1SR2_15_12,	CANFD0_RX),
-	PINMUX_IPSR_GPSR(IP1SR2_15_12,	STPWT_EXTFXR),
 
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	CANFD2_TX),
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TPU0TO2_A),
-- 
2.43.0


