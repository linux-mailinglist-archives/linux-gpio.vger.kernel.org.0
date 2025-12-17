Return-Path: <linux-gpio+bounces-29703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A73EBCC7EFD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 14:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84B65311F4AD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 13:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6039358D1F;
	Wed, 17 Dec 2025 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gFqGncF2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F88355813
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978590; cv=none; b=KnLDdLpS/AFXyZbALNMv3fNKV6TI3yqdmv7FZIhAfw6DcfsDK2YJoG1fi+3qiLhFdSQxMB5SYif48sB4WpVxiW/bJaH7Hv7nD2xM8EdMutf7qADF4KAyeqnvGYB8HHeG3TpusG3ThEd+W0nDmtqbDch6/iQ+2xMRD2QFfLHjpJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978590; c=relaxed/simple;
	bh=UrVZCW5lbAV7kJ6TBwnmGdMgCEBIQ8VniS4vRI8N5LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Taj4xS19eE3aTH5GCWK3ubrZeKUhrlJKe6doZJAfTyO7YMvdCAkbvCpVU40QBfgm1BLYgKM2NDzCcr9Aa1RYqITW+zMxeqpnAbgX6Z0WK5RWtVNbtgF2OrYYltRgqNjJvA3Z5/rhq20U/8F9cqUq6xoG9nJhd3EySHZUR6wGNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gFqGncF2; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D42B0C1A59D;
	Wed, 17 Dec 2025 13:36:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64D226072F;
	Wed, 17 Dec 2025 13:36:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1FD9102F0AD2;
	Wed, 17 Dec 2025 14:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LAlm/ECW4o7ColMRo13P/K3LTb6LJ/lSZfggJLOeA6M=;
	b=gFqGncF2wLvyyMPFk4X7yRi+dd3uuG2xCrQYe8laAWzlFjsHmwYm+oQgBRc6RK7LqzZwcq
	bhXjcgVZi3vga0aTtOyXaedjcR9SNex5J3yDAOmhAjN8p++phfC1xbBxmMovfU1xj9fSJz
	Ub6Jh47UrHGXL2gyc71tUxxaBuRBKdABgRDpgPNeyt8kJ/b7NRJJu0NujCAZ/8V01wV5YC
	1CaCjEVI0+CJKEAlLW/7fXEJrH9hJrijJgINeoNzH5Zxg0rZUWxdIUjs6c6NNZce72SICm
	CqKibbiBOBRf/ypga7o6nuVLepv+t8ivo3dqQ/q6tqk58mpHwunPZA8cszJj7w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:35:58 +0100
Subject: [PATCH 08/13] clk: eyeq: Adjust PLL accuracy computation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-8-e9cdbd3af4c2@bootlin.com>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The spread spectrum of the PLL found in eyeQ OLB is in 1/1024 parts of the
frequency, not in 1/1000, so adjust the computation of the accuracy. Also
correct the downspreading to match.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 182b408b6aa4..8fb32f365f3d 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -163,7 +163,7 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
 static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 				   unsigned long *div, unsigned long *acc)
 {
-	u32 spread;
+	unsigned long spread;
 
 	if (r0 & PCSR0_BYPASS) {
 		*mult = 1;
@@ -195,23 +195,23 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 	/*
 	 * Spread spectrum.
 	 *
-	 * Spread is 1/1000 parts of frequency, accuracy is half of
-	 * that. To get accuracy, convert to ppb (parts per billion).
+	 * Spread is in 1/1024 parts of frequency. Clock accuracy
+	 * is half the spread value expressed in parts per billion.
 	 *
-	 * acc = spread * 1e6 / 2
-	 *   with acc in parts per billion and,
-	 *        spread in parts per thousand.
+	 * accuracy = (spread * 1e9) / (1024 * 2)
+	 *
+	 * Care is taken to avoid overflowing or losing precision.
 	 */
 	spread = FIELD_GET(PCSR1_SPREAD, r1);
-	*acc = spread * 500000;
+	*acc = DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
 
 	if (r1 & PCSR1_DOWN_SPREAD) {
 		/*
 		 * Downspreading: the central frequency is half a
 		 * spread lower.
 		 */
-		*mult *= 2000 - spread;
-		*div *= 2000;
+		*mult *= 2048 - spread;
+		*div *= 2048;
 
 		/*
 		 * Previous operation might overflow 32 bits. If it

-- 
2.52.0


