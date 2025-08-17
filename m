Return-Path: <linux-gpio+bounces-24468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF447B29379
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 16:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2584E7075
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 14:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697132E5B38;
	Sun, 17 Aug 2025 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhrH20vN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95F29E0FE;
	Sun, 17 Aug 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755441031; cv=none; b=BdnBf1UwhW6e6b8s7jR4TuKEanrLFw04lGWxPCaYvRObblRDTmTmnlA2FMRMb7WcLvcQrUBcgncaRHnY5QINhLd1/WPpsQ+L23nZMobRlg612aOT4MVGUudJcZYwJ/vACC8iE1qMkBPtEHbj70yLZk5Th2noE1WrfiAdH6xXfO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755441031; c=relaxed/simple;
	bh=sHYEf9+L/0fiSQ0yIvgRuzehttBTJtC4fTkZQ2wPlWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fG9D+AmCig1FCLAe6pgSeMoax8yvTL95DDnAWR7K18AW6i+i1C7jhshpuMMsP/qKUa+WjYP0RfrHq3h/drxp/lavtEob/8Tqyi9pYiQg9/GVohTCmhDd2teFOol8iOCbjFDlbJPjl3DhA/K5YLpbAvYIZbltQJohsN5FH1Las+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhrH20vN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so15937385e9.3;
        Sun, 17 Aug 2025 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755441028; x=1756045828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2AchCFFujkFvtPf4J++dVJW0h1QkuBrvnh7xdFNqak=;
        b=DhrH20vN2ri6rzNIriVsRGNHCCCj9NZJLNO0+AmkycZVQ9fuiPUAQ3fH75HTb1XOvT
         N52MRwb8eww4yPNN2Vxsjyy5QV1a9EMz315E63banV/3ObEUllgWoF4yfyoJ3ASDWPxU
         X50u+sKiE31iul8+/keQUwc6iiiTF9Fw8E9kqaPGkOkegPzFuTuJ2VubkNn70DWQ0WSd
         LN64FTz0FemxRfLpXsklVbr3Q6WXZdQKgzJjlWj73ZsCK9KxvICk8v3GPIKsm2X2n1eH
         low+6huVqpby4Lu3QXtORNPqlt72aRcVIoL96itW8RGo8t0LNqCDxoVxymcTL56amhia
         c/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755441028; x=1756045828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2AchCFFujkFvtPf4J++dVJW0h1QkuBrvnh7xdFNqak=;
        b=sl+I3MpSQBEDOWIF37sOkFrsmdDuzcYmIRPPSk2K4GdVurHHWZvqN2eI+822vFuPaa
         3NASfbPgpZbIQALZgxjrYKkyUOTOHADEZiFNXuWlgWumHUo8lvmjf/PsoLIErZqejdCR
         gWoXAcyj+03rFmBI7BDVpUr97d2pdYhQBjaG9OOhTfjnKH1cM/1MA1P5zJKQWLs6Qa4h
         +bnO7W4sbSyenhWQBRtY5MP3pcHlEGZ2yHIFC1I4REhMIDVviB0DU/cuaSH+5xinXG4/
         DdRzlryJWtO9mrJSJ6j6mUWH6Atwq4aWaE8RbMSIitW4vCVif3O4HgIV2oEGqGe65DXg
         YPig==
X-Forwarded-Encrypted: i=1; AJvYcCU5J3CBsDtHn5r4bJwpF+LF357zUj7d8S6tafPLR3ewfNozdaj79Pnu4HSV/v9mfGJeNKJfMrpPQ7Ai@vger.kernel.org, AJvYcCVjByljX21m1Bx0WZn1gFWxHMzw5zeyY2605XSGwDdQYllAYVzEX0Vfqzu20ashhXMegTGchwWffweYih9p@vger.kernel.org, AJvYcCVq3RUUk7LW7G13Pw2kT+4IO74UnwRU6jg+v0JdyFJzuPnyCanj4EDVpjrbxGyM1G1I7gT/wzPEAIEypBhT9C23JL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLlbQfuYgWgzKjaH8VzVh91QBpEb+jW3vjxvH5e93jbc4PEsWo
	o7HJS7l4OWTmbBSNJfP0y+PLtQTBw3nwzPzolKPjcd3AXbAS2wOtws76
X-Gm-Gg: ASbGncuj6jPqMoci07/CVkyOs4yHlM0YdriiICuWaD4pL+ie5kL7uAw6HFDfBVPL3VP
	TZwk/r/oHB3/8B1rUFG09LEA3eK8Gi1d4Chaot5dU6LjOLvAWnl2wOKl22AQwi3C4917Nh0PkO5
	tZBhSGcIc1h3vMOXx49HROvEnSCyO8YuTRHT0qFnNjHYcHaa/2/MG8mjBasAKScV9SQyQy0uCO8
	liW5rhpmSZIU9IbPrZmkvZH/6GQmNPAvoaHsExpQHAcsiR2yKA8BI7lAmsi77n8ZlwnLvVThoTE
	mA/ImjPaJWe1V1FXVM0EStKNFI0dfRKlxB61iqcY7aKQTIbd3t4pEAMRvKVVcBXMulPPmXhqVaC
	URkWzWo+xQQ56xEx2F++1vDQOx/UpSOqgME0pKWJqW1PMo+IGbJZQhLfWfqMwrulSNgRmPyVpGL
	N6aE7zXebE
X-Google-Smtp-Source: AGHT+IFHaXaCVMz7YnephCSPWk7bQOtBTx4hGc6Ogo4TqrBlzp3QHh9P879gBSmBF/rFZXSte14JJA==
X-Received: by 2002:a05:600c:190e:b0:458:bc3f:6a7b with SMTP id 5b1f17b1804b1-45a21859692mr63531225e9.18.1755441027453;
        Sun, 17 Aug 2025 07:30:27 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cfed5sm129938485e9.7.2025.08.17.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:30:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
Date: Sun, 17 Aug 2025 15:30:20 +0100
Message-ID: <20250817143024.165471-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817143024.165471-1-biju.das.jz@bp.renesas.com>
References: <20250817143024.165471-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

There is no need to reconfigure the pin if the pin's configuration values
are same as the reset values. E.g.: PS0 pin configuration for NMI function
is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
code is first setting it to GPIO HI-Z state and then again reconfiguring
to NMI function leading to spurious IRQ. Drop the unnecessary pin
configurations from the driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
 * Added check in rzg2l_pinctrl_set_pfc_mode() to avoid unnecessary
   configuration
 * Updated rzg2l_pinctrl_pm_setup_pfc() to make changes minimal.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2b5d16594bb7..8422a5429ca3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -539,7 +539,11 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
 	unsigned long flags;
-	u32 reg;
+	u32 reg, pfc;
+
+	pfc = readl(pctrl->base + PFC(off));
+	if (((pfc >> (pin * 4)) & PFC_MASK)  == func)
+		return;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 
@@ -555,9 +559,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
 
 	/* Select Pin function mode with PFC register */
-	reg = readl(pctrl->base + PFC(off));
-	reg &= ~(PFC_MASK << (pin * 4));
-	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
+	pfc &= ~(PFC_MASK << (pin * 4));
+	writel(pfc | (func << (pin * 4)), pctrl->base + PFC(off));
 
 	/* Switch to Peripheral pin function with PMC register */
 	reg = readb(pctrl->base + PMC(off));
@@ -3103,11 +3106,18 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 		pm = readw(pctrl->base + PM(off));
 		for_each_set_bit(pin, &pinmap, max_pin) {
 			struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+			u32 pfc_val, pfc_mask;
 
 			/* Nothing to do if PFC was not configured before. */
 			if (!(cache->pmc[port] & BIT(pin)))
 				continue;
 
+			pfc_val = readl(pctrl->base + PFC(off));
+			pfc_mask = PFC_MASK << (pin * 4);
+			/* Nothing to do if reset value of the pin is same as cached value */
+			if ((cache->pfc[port] & pfc_mask) == (pfc_val & pfc_mask))
+				continue;
+
 			/* Set pin to 'Non-use (Hi-Z input protection)' */
 			pm &= ~(PM_MASK << (pin * 2));
 			writew(pm, pctrl->base + PM(off));
@@ -3117,8 +3127,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 			writeb(pmc, pctrl->base + PMC(off));
 
 			/* Select Pin function mode. */
-			pfc &= ~(PFC_MASK << (pin * 4));
-			pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
+			pfc &= ~pfc_mask;
+			pfc |= (cache->pfc[port] & pfc_mask);
 			writel(pfc, pctrl->base + PFC(off));
 
 			/* Switch to Peripheral pin function. */
-- 
2.43.0


