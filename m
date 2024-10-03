Return-Path: <linux-gpio+bounces-10790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1598F02A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 15:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49BDAB236A2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 13:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD325199945;
	Thu,  3 Oct 2024 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMqPod3G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA1199397;
	Thu,  3 Oct 2024 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961414; cv=none; b=ciV0vjwlMG+2yPr028cgeehIjTyy+1NxZ0aRAob3bxJpXGCQI6hidtw42znmnh0dccEJy0QHgRnOrDn4dJJ4pHi6o8ur7vhh36hEabSlofmrcAZYAUpylwWgcOI/xFBTvbyJWRZBIn4mzDSzHcn2ce31rxgfBKgA2PdEAzw3xOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961414; c=relaxed/simple;
	bh=ZM6UoRrdhVPrt1Uqs9Ijry1MYrLqUcanHMHjqeKR+6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eH5DF95lVZDdKyZM7bvmrebkQINl+l2HL5q/pZa5op4itCrghRugOb5in0yIvMfsD78ozAoN3zyVed7DLyfmlECjpoDv71lZDy9XJT9OZOrZNJV5k7QkyXEcrrijtlJq7eJCf6ryFFfFNHBEBmQQszBMPkLP56+M6yd52+BlnfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMqPod3G; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d3cde1103so122912066b.2;
        Thu, 03 Oct 2024 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727961411; x=1728566211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIXGcHqwjFFz7GCKYE2DGIelohaO+FNzZWMfMipwb4Q=;
        b=QMqPod3GutMGusFUpFWe9U8wPyxk+A5BSvpuFKCDL/2Obc7zecK504HkMcTi8oA/TR
         +SgWbMUuO1TfH7+hO4X7iSv0ZFFwGXmAzkqU9vz5Mixb8kcsjWjDZmLmqw7kNsahwcQ5
         ec0vaOWzYZzaDQozKdYKCiN/OEE1NtC3fICYrEyg43apsK4pfMphgNs3gV+M4qtRLdqv
         02d1Kw+XJd9JWCFisk2CWaMelyx0MlTCokzTSNP+OIlkuA7vQNeaTqPs5uS4VabSZT3U
         XuDbloR+zX64yuIcFvPA/aJ8A3uWAYxScJ8g88zBTV8rAloxZrV/Cv31XfWdk11M32BL
         MpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727961411; x=1728566211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIXGcHqwjFFz7GCKYE2DGIelohaO+FNzZWMfMipwb4Q=;
        b=TKD7EWb0Nox1RNIlIcu4pNPuQ6glt0GqOqXWBC5jmZ/nE3famoVegMBYl59HjDXdSd
         tIXoYN8k/OVioEgLxp902map4ATfvOouaxyfuYO1EXbU4ZjZq16g4kUxFcqzvPNtKJjl
         U+4DrRNCocjofonGkewNQnhV1WaPD3+dM+Wupw6Ri/uY0u7SDxCxxsGS/AleR2GLNQDV
         agfqqmsyikQsp6eBWwKnejqVA3YD5QSyftjXGrReWxxs59hIt4tqd1qjHak7es7MKqLT
         ++UI8XyD9VPAlMO9v8nD8m19SQLPClI1n0dWIHyNDNEr/lp6RCOvEdKIMJevZkDrO20+
         f14w==
X-Forwarded-Encrypted: i=1; AJvYcCUtW17+IWSedI5hilB7ExNaAss5hTw+gH4GJE7gn6dJxgV1jarvdjfGX1DnCqmzqEAATcTMJU6/hs2tqalQ+0c05a4=@vger.kernel.org, AJvYcCWCtv99TAKcksR2iI9m90ga2bYh9CeQsSAbsq5ULBAz7Mbqb8faW7ViUypY8MtR1OYWFagesPynBYwe7oY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMhpr7+AL7944Ril2TnxcttMFcjrLV8rp53luVQo9h26SwInVV
	lW7AUQWcRusEtkscg1kePnHQpkWAKLLnoUbcP+Si1PBGHVFblcaFtko5dg==
X-Google-Smtp-Source: AGHT+IFsNQzuTyEMnmgBK7daSWiK/sP+bIByvdMtKF9NLErKh9BwOm71OLuzJ016/C8RLgsGQqBcGg==
X-Received: by 2002:a17:907:86aa:b0:a8a:7b8e:fe52 with SMTP id a640c23a62f3a-a98f838b4b1mr685702066b.59.1727961411203;
        Thu, 03 Oct 2024 06:16:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99104ccd5asm84531666b.221.2024.10.03.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 06:16:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Always call rzg2l_gpio_request() for interrupt pins
Date: Thu,  3 Oct 2024 14:16:41 +0100
Message-ID: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ensure that rzg2l_gpio_request() is called for GPIO pins configured as
interrupts, regardless of whether they are muxed in u-boot. This
guarantees that the pinctrl core is aware of the GPIO pin usage via
pinctrl_gpio_request(), which is invoked through rzg2l_gpio_request().

Fixes: 2fd4fe19d0150 ("pinctrl: renesas: rzg2l: Configure interrupt input mode")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Output before this patch on G2L/SMARC:
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P2_1
pin 17 (P2_1): UNCLAIMED

Output after this patch G2L/SMARC:
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P2_1
pin 17 (P2_1): GPIO 11030000.pinctrl:529
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 60ef20ca3ccf..1dceaf8290ea 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2368,20 +2368,11 @@ static const struct irq_chip rzg2l_gpio_irqchip = {
 
 static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip, unsigned int offset)
 {
-	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
-	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
-	u64 *pin_data = pin_desc->drv_data;
-	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
-	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
-	u8 reg8;
 	int ret;
 
-	reg8 = readb(pctrl->base + PMC(off));
-	if (reg8 & BIT(bit)) {
-		ret = rzg2l_gpio_request(chip, offset);
-		if (ret)
-			return ret;
-	}
+	ret = rzg2l_gpio_request(chip, offset);
+	if (ret)
+		return ret;
 
 	return rzg2l_gpio_direction_input(chip, offset);
 }
-- 
2.43.0


