Return-Path: <linux-gpio+bounces-12085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D469B01A9
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B1DA284929
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60693204920;
	Fri, 25 Oct 2024 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjBRUCno"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA498202656;
	Fri, 25 Oct 2024 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856974; cv=none; b=bwr2YsFKlUql7yPGNIqfNNtoaNL7uVXnszH/NenVjpOKylVPjDCda6av0i0Lo4ohSH4EDQ9wKYnVylmtf6tBSnQRoZQNjGAc3yFsI3guVKw3Tfl8igV3nMcxZewxC7jVix4LgZVmzftCZ1JhER0LPqcNE7D3biGFdDxZbWhMr1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856974; c=relaxed/simple;
	bh=aspKmrgS7DI6+o3FPUtlY+vECrso8UKZIs+nvvoHLyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NH0hSCrjb1guFXqiTbHmCSrmlHP8sbGXDJU40tdDfVoz1sVf3Kkjq85xYXXoP18FSZ6zBUpgfn0/wZXGzYn+gJgOD2I6EJXH2E4QTyJod0h2ZNCmqxg0aJJ7KEBvQ10xddycc8fNNGWtjv53iwI+H0+wBpzx4j5OE48HX90jSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjBRUCno; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb599aac99so19641331fa.1;
        Fri, 25 Oct 2024 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856970; x=1730461770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQCNfwaBzrVCghcxLAoBZ2ERMZxjDuEt6bNvg8b+FBg=;
        b=FjBRUCnoKWD1PRSFsscyoJXn1+ycq3m9lcIiXt+SluyDeRwCW2/ytGgTicJBkHZBVo
         ORb3XcAozzrx2abEN3sZc7zdmPttOKfZEIuVzZ3hN9/K0U0oYsr2xjzB7IhYi9Eq45Ht
         uDDO/8lRAMo0V+RMJlI9Jzt36J4EGgg6jg68PDAwPA8MW74Cm2qKKUTga3IraCa4kgRR
         nlFTUcWVDk34UEnoUb5+NyDhK/Zz8zdCdW2kzFKzEq4RO8TUVI8U/T+LE3CuTg7ur/WD
         IxkJSP6DrJle6zHr3OizsJm3UARd+ff9Kks1jxVEdHeJa3ljyryvZNRUgTLm9mODDCYX
         aLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856970; x=1730461770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQCNfwaBzrVCghcxLAoBZ2ERMZxjDuEt6bNvg8b+FBg=;
        b=D7WpmvHUD4RA/b5BUEk0r7z4qV/2Bg8dLYMArAXvrLiJ3XgWvWZH4y8kThGWKqsRC4
         TrMNomH1aSrxdYwNvvp5Ru2zLqNO96O4QPmLj9/mm6J5wTWgveWEqKlZgocGmjhKSdvY
         jrJDKY2UfYDV+J91fAbAe42ivP/aklqwxjaUN7QS/6+y2y80uGLgsFuvl2ZT/60sRhwd
         HPbuEJuBIBYZVcCGiLvHvBaoGxAWlaj9CtOo/zvMQo79MJDcW65/ESwQSPzHk6lNg1k8
         OpWutPLshMN8vMHmRBfc0Y3FD/zgq/YmErNYLBtjnJcklL8jXkFtb0Uu+d9WonyVwM1w
         8Uqg==
X-Forwarded-Encrypted: i=1; AJvYcCVn5SEBUARzHrtHvJVEjzQbrwr4kOPWAM6VyA6e1oQ0mSuf7wRo2N9cVbUQM+WvHwRDg7IWxXszifTltlAA@vger.kernel.org, AJvYcCW0X50gGugbkZuGnCmW7nUkiNgnNFnFeDZNjKSUlGvtIFBZuibzGzPbej2P1AmaPWeWiGgmdJtn/cI2@vger.kernel.org, AJvYcCX1MFqF0nZ48/N9Wh4O9g2lTHGQRB/cdz35GxN1EevelqiZV02uyRmtcTH2pPcRHpuvjB15b2aTyBtSbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOyJpqpSLX+m9LLRkFYf4S1+0cbIoj4oYDD8sTc26Wd8rQDUYx
	PsP+aUVb+fmojEXX5FbXN9IIqB7d1wXDMb/EHUv+iUjNJT4ZB2uH
X-Google-Smtp-Source: AGHT+IHSlgkWSxFVF7akBafw+6JwTnPk7YZvSdZYN+3jqEsaPy48+WOM8E8zQhqNVbpyg7q0awInng==
X-Received: by 2002:a05:651c:1256:b0:2fb:5da7:47a7 with SMTP id 38308e7fff4ca-2fc9d375d15mr42867061fa.25.1729856969531;
        Fri, 25 Oct 2024 04:49:29 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56741fsm45109785e9.22.2024.10.25.04.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:49:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/6] pinctrl: renesas: rzg2l: Drop calling rzg2l_gpio_request()
Date: Fri, 25 Oct 2024 12:49:12 +0100
Message-ID: <20241025114914.714597-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- No change
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


