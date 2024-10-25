Return-Path: <linux-gpio+bounces-12087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18D9B01B1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD2A2828D7
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B55205157;
	Fri, 25 Oct 2024 11:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUTYcpVL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C65204095;
	Fri, 25 Oct 2024 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856976; cv=none; b=LYQ9Y6wI0sfKR39jMN+P7o6HnWn//0V+pin3FHQVuxcil6UoGSB5xBIr2GxdBc8DZjwyi2vm+p0IGJpFvyDtMcvMZHC3dwoCM8ObWVQjDoWLLkjBODxwrxaLZ3zc8tumk1NvayHjgz+Uh4EBktwnklnICfvO1yS26JmqxweGGWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856976; c=relaxed/simple;
	bh=2zpW30oJJ0gzFLA0Df0Xi9Xx6SwsPHwfQ29ZKgha3VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxx87dwy8//p2HTy+Nei+LRrgI8TKsCazP5yZI9O1rIBV0lkI2w+3bn+4MAMLHZvkYfaiP6zNw3RpHVgFfOl5ySv+SiJfl/MMTMcDXnvGdGvyzIol6rLAmLMvrVJTBKwkwbrzcbn5tBP6BqmaBLfo/GK/ueDuw70Hu2GVuuwLHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUTYcpVL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43163667f0eso19344135e9.0;
        Fri, 25 Oct 2024 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856972; x=1730461772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CElfZLNsSgILS/BsLAAu+iVhhIWO8y3BRkrHAx+d6KM=;
        b=ZUTYcpVLE1+XQQy/h2kZn5lBpAo47yKPwLuokZhTvrIOACcpTic8hOnx+VBnXHzo1c
         0BRp03NcAaFhMJ3YHCzgFQqEI1BwoLEWzb1qyXr3uxtWowHyDyiYpa7eA3ibpWFtQndb
         RsmA47GGEAU+vUF5/Xx9RgCMWi0SBuqBb0lyXka70eQdbhwXvxvGwKPn2bFZkcYphbtZ
         jZCior2GgP1NSuJQZRNsWGnitTbu8/fY5iEp72sqKgIw8P64IZS5tpcCFNuBUFEO4Fe0
         3n1sUnHsfGcnXYFAMDiVRvwOfNWD/A5A9fkHs/h1mjyJn7AycZHOwkq1yCdqiirwiVGI
         LDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856972; x=1730461772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CElfZLNsSgILS/BsLAAu+iVhhIWO8y3BRkrHAx+d6KM=;
        b=Ej9NeWD+euylyz0/MmRzQpOWVhw5XpBxkEs7QmRQekc73ZQe/3MSMObO5eD1ucV6GL
         MqCROo0KYQUg+V1FVnwJRdcmRA2GFF1o79bBKbHeIKPZ1BoP15Sv7l2bwRGdn6DqAq7I
         T44XY3rc/oonluJUpDpV8xyze89PNUrP+W+xYM9Pf+hjH224KlkoEWIHteJe9cYszPUk
         plpyzpTz7NnLESB57cADVpM9GQRw3qoRU+otkuPJ28MUsZWdQrk7cN8e9Y2uEayZ+AYU
         v9NcAPKVP6VCxhRNtxJjlEcPPvVlHfWdHQZEIXtFhzv1o+FJ/l5VYtPLu2ZO/a6/h/Xl
         bW/g==
X-Forwarded-Encrypted: i=1; AJvYcCUOgm5+zQNi2dAaAM+PzSk3OEokVzksbiwMb2arl8Qha9XlIRKh/u8gomFjlNc1I5hfmaCV06l6gs3blkkx@vger.kernel.org, AJvYcCXDL3lnYM8XHhbT21SCHDBehyBuZKzHMf33XjtOYMsI91I0oGzvY099twNYJ9qCSZe7UQwGoFdnsAC0TA==@vger.kernel.org, AJvYcCXxiLYDms/rP1XIAp8lUg3RPXzWwF2wyTirHSygkje0lcDGuujJWSty2lotKGA5k0N9gV/fD7fqXWTC@vger.kernel.org
X-Gm-Message-State: AOJu0YxY022OgUc1cQ5w9+kKNDUTIMRq9EeYxEjqFmK3awgK79zHz2oi
	nZBG3C9qpE8rXbpHlrYPFNL8mpdCvT7HB230YEsKMyGSwKPNofvXu4xlEQ==
X-Google-Smtp-Source: AGHT+IHvR8cjRlQraeVOLsO2IR4h8i4KWB13AVDra+R2EV+LjSCTCS/+FbWsmbtTC7LwJHE31x5Llg==
X-Received: by 2002:a05:600c:1e29:b0:431:51c0:c90f with SMTP id 5b1f17b1804b1-4318420a152mr82683295e9.21.1729856972511;
        Fri, 25 Oct 2024 04:49:32 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56741fsm45109785e9.22.2024.10.25.04.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:49:31 -0700 (PDT)
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
Subject: [PATCH v2 6/6] pinctrl: renesas: pinctrl-rzg2l: Override irq_request/release_resources
Date: Fri, 25 Oct 2024 12:49:14 +0100
Message-ID: <20241025114914.714597-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Override the default `irq_request_resources` and `irq_release_resources`
functions with `rzg2l_gpio_irq_request_resources` and
`rzg2l_gpio_irq_release_resources` in the RZ/G2L pinctrl driver.

The `rzg2l_gpio_irq_request_resources()` function now ensures that the pin
is requested by the pinctrl core before locking the GPIO as an IRQ. This
ensures that the `pinmux-pins` file in sysfs correctly reports the pin as
claimed. Additionally, the `rzg2l_gpio_direction_input()` call is moved
into the `rzg2l_gpio_irq_request_resources()` callback, as it makes sense
to configure the GPIO pin as an input after it has been requested.

The `rzg2l_gpio_irq_release_resources()` function unlocks the GPIO as an
IRQ and then frees the GPIO, ensuring proper cleanup when the IRQ is no
longer needed. This guarantees that the `pinmux-pins` file in sysfs
correctly reports the pin as unclaimed.

Also add a `pin_requested()` check in `rzg2l_gpio_free()` to return early
if the pin is already released.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 41 +++++++++++++++++++++----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b9a8bf43a92a..47b3e296d094 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1772,8 +1772,12 @@ static int rzg2l_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
+	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned int virq;
 
+	if (!pin_requested(pctrl->pctl, offset))
+		return;
+
 	virq = irq_find_mapping(chip->irq.domain, offset);
 	if (virq)
 		irq_dispose_mapping(virq);
@@ -2357,6 +2361,35 @@ static int rzg2l_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int rzg2l_gpio_irq_request_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
+	unsigned int child = irqd_to_hwirq(d);
+	int ret;
+
+	if (!pin_requested(pctrl->pctl, child)) {
+		ret = rzg2l_gpio_request(gc, child);
+		if (ret)
+			return ret;
+	}
+
+	ret = rzg2l_gpio_direction_input(gc, child);
+	if (ret)
+		return ret;
+
+	return gpiochip_irq_reqres(d);
+}
+
+static void rzg2l_gpio_irq_release_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int child = irqd_to_hwirq(d);
+
+	gpiochip_irq_relres(d);
+	rzg2l_gpio_free(gc, child);
+}
+
 static const struct irq_chip rzg2l_gpio_irqchip = {
 	.name = "rzg2l-gpio",
 	.irq_disable = rzg2l_gpio_irq_disable,
@@ -2368,8 +2401,9 @@ static const struct irq_chip rzg2l_gpio_irqchip = {
 	.irq_print_chip = rzg2l_gpio_irq_print_chip,
 	.irq_set_affinity = irq_chip_set_affinity_parent,
 	.irq_set_wake = rzg2l_gpio_irq_set_wake,
+	.irq_request_resources = rzg2l_gpio_irq_request_resources,
+	.irq_release_resources = rzg2l_gpio_irq_release_resources,
 	.flags = IRQCHIP_IMMUTABLE,
-	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -2381,16 +2415,11 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned long flags;
 	int gpioint, irq;
-	int ret;
 
 	gpioint = rzg2l_gpio_get_gpioint(child, pctrl);
 	if (gpioint < 0)
 		return gpioint;
 
-	ret = rzg2l_gpio_direction_input(gc, child);
-	if (ret)
-		return ret;
-
 	spin_lock_irqsave(&pctrl->bitmap_lock, flags);
 	irq = bitmap_find_free_region(pctrl->tint_slot, RZG2L_TINT_MAX_INTERRUPT, get_order(1));
 	spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
-- 
2.43.0


