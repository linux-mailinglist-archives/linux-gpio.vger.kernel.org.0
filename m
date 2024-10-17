Return-Path: <linux-gpio+bounces-11526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEBF9A2135
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6943B1F27A7E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A9F1DDC04;
	Thu, 17 Oct 2024 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0dQPFoe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C41DC1A2;
	Thu, 17 Oct 2024 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165200; cv=none; b=HxOZDJoPUG7Jl9AWMSP5OZLejvPGOEt106KHKUa/EhPzMM36Jn6y8J8eBiDZumGxYBsmIJ4S/R23Tl/9xQFilpqoLD18rmMHSwdu8fgAelOoZS+6TmLViYkaUTo+Ni/cdTQJt1rWijSA99+Lx1tAps5fD7elLlOn9w6w/kh54LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165200; c=relaxed/simple;
	bh=l8zBuaB3iP6r1+/vODxsYAUq/Cbeqrqhm5x2Jvm1g5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmTx3wEAAqV6kS/yqqGRRAhslvEdBJe9NZ4HF10uE4E/+9wFByezToilz+Zpa4HE/jr1PrqDmGi+aBcBg2TxoOph26vDJMFroTpTGX1y7PlRKh8whSC37QbSeddk9p02+LNKURlLyW8mK1bhIFh9/7gLxZBP67eQCih1anwge+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0dQPFoe; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so620783f8f.1;
        Thu, 17 Oct 2024 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165195; x=1729769995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASFyGnkkTGjNQGUn/jSlCeO1xHaO+0l5SSQi7bckPc4=;
        b=C0dQPFoe0CTFMvKlLYh6/KLYFj76HNzlDLv2N4tHAcsi/SPhJqrXSlKt/Lvvi1bGeF
         A/g/INdk2XM5vTv1ZgLkTD2dE3/rr8kZr+6YPbY1WxLGzCykf/gXL4hSIv1+rAyXLHDL
         oJ9eIds4YOjnKDa+M1psRurDDKPof71fRCHa5X+pBgc/Ut6r1VeJQY0h/Xr/jg11+FWu
         eN3FzoxCXtLmv1F0Lb9wRQD/Xm6RF8ZcKajrG45M4Hn3Vo06Oam6+GaO+AH2YpCwTxPn
         M1BRcJqHvBQZZayVpJfY1ZaKSUMeoUDTfjUW8M0Rl+vyMAxJza7f8X0OQ6SnexV1/dMm
         suSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165195; x=1729769995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASFyGnkkTGjNQGUn/jSlCeO1xHaO+0l5SSQi7bckPc4=;
        b=oWnaXCtrZZo7bMjIvXqPQHmTs4Kr+c/E/oXaaHFCrzQ71l0DYTakKvzJp2Uz/6yS8q
         M/PTX0CAyL7m2VdNSFEDpg60Vuw32aHk5qLNzflyWXf9kMSZ//wdNTcuPRzo8+uqTg3B
         CelT8X5DDaVsmLYuqDIB+87f4OHuLJqB2QdJY6Tv74kb+xcgSPEsIj/kinPh0uGO1+Ju
         j2KsJ35chcfQP8lZWnvupbLmW174hliYqOq4QTqWVu6lx34RScOjMQHedZG7QkSVKDBQ
         LUcFHleIWu51q9ZonQkx8QQ69aDjWq7Mcl3Pr9isqkNUIuhXBvx/sSRD2Rw+EsoglYR/
         tyRw==
X-Forwarded-Encrypted: i=1; AJvYcCURSOGaU7Gf45kAF4BNenFJcDvOnOS+n5dDAsb7HcQL63+M18r6Zt3K+m0oAwSZgebee1YbBwlnFAHxVtDBbiF05R8=@vger.kernel.org, AJvYcCXQS5o3IIPhZnNisEzCBvJld+y4fgx5w2QY0CAp0HdgYDJ53mfTX9ereSla0f0LeR5Gq8ohutDhg2ZoDg==@vger.kernel.org, AJvYcCXrmtJVdw095GgwIyx2Gh8SIQGAPf4H9kC3AOHiqv54GRslSTrlevlwL7wzfm2M6x3e4UXbYakIE5ES@vger.kernel.org
X-Gm-Message-State: AOJu0YzjlE/nAw+pmncY1C8tkTAzF7HA+6lA0JUhXqrUOu1M8tlNFFVj
	L2H1ny9Z+IEu0c4vNE/s0XvAGh8Mh/nZ74mzGmfMbG3keaKqY+Op
X-Google-Smtp-Source: AGHT+IHF3uHJVQSxTwd1vYN7/F7NMlJGf3tji3sMkD5x4WMambZBC1tgq4hWMiEv6G7gONyvJpD1nw==
X-Received: by 2002:adf:f98a:0:b0:37d:39aa:b9f4 with SMTP id ffacd0b85a97d-37d551d416emr14822235f8f.26.1729165194601;
        Thu, 17 Oct 2024 04:39:54 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/7] pinctrl: renesas: rzg2l: Drop calling rzg2l_gpio_request()
Date: Thu, 17 Oct 2024 12:39:40 +0100
Message-ID: <20241017113942.139712-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop calling rzg2l_gpio_request() in rzg2l_gpio_interrupt_input_mode()
this was added to handle special case of bootloader setting
the same gpio pin as function.

When GPIO pin is requested as interrupt through `gpios` DT property
the gpio_request() is called through the code path and when releasing
GPIO pin it goes through the gpio_free() path, so drop calling
gpio_request() in rzg2l_gpio_child_to_parent_hwirq() path and also
drop rzg2l_gpio_free() in rzg2l_gpio_irq_domain_free(). This fixes
case where rzg2l_gpio_free() was being called twice after the GPIO
interrupt pin is freed (after unbinding the module).

When GPIO pin is requested as interrupt through `interrupt` DT property
this doesn't go through gpio_request()/gpio_free() code path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 33 +++----------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index d8b942fbf537..b9a8bf43a92a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2372,26 +2372,6 @@ static const struct irq_chip rzg2l_gpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip, unsigned int offset)
-{
-	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
-	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
-	u64 *pin_data = pin_desc->drv_data;
-	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
-	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
-	u8 reg8;
-	int ret;
-
-	reg8 = readb(pctrl->base + PMC(off));
-	if (reg8 & BIT(bit)) {
-		ret = rzg2l_gpio_request(chip, offset);
-		if (ret)
-			return ret;
-	}
-
-	return rzg2l_gpio_direction_input(chip, offset);
-}
-
 static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 					    unsigned int child,
 					    unsigned int child_type,
@@ -2407,17 +2387,15 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	if (gpioint < 0)
 		return gpioint;
 
-	ret = rzg2l_gpio_interrupt_input_mode(gc, child);
+	ret = rzg2l_gpio_direction_input(gc, child);
 	if (ret)
 		return ret;
 
 	spin_lock_irqsave(&pctrl->bitmap_lock, flags);
 	irq = bitmap_find_free_region(pctrl->tint_slot, RZG2L_TINT_MAX_INTERRUPT, get_order(1));
 	spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
-	if (irq < 0) {
-		ret = -ENOSPC;
-		goto err;
-	}
+	if (irq < 0)
+		return -ENOSPC;
 
 	rzg2l_gpio_irq_endisable(pctrl, child, true);
 	pctrl->hwirq[irq] = child;
@@ -2427,10 +2405,6 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	*parent_type = IRQ_TYPE_LEVEL_HIGH;
 	*parent = RZG2L_PACK_HWIRQ(gpioint, irq);
 	return 0;
-
-err:
-	rzg2l_gpio_free(gc, child);
-	return ret;
 }
 
 static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
@@ -2494,7 +2468,6 @@ static void rzg2l_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
 			for (i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
 				if (pctrl->hwirq[i] == hwirq) {
 					rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
-					rzg2l_gpio_free(gc, hwirq);
 					spin_lock_irqsave(&pctrl->bitmap_lock, flags);
 					bitmap_release_region(pctrl->tint_slot, i, get_order(1));
 					spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
-- 
2.43.0


