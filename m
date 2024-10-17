Return-Path: <linux-gpio+bounces-11528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15089A213E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FFBF288D67
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416CF1DC734;
	Thu, 17 Oct 2024 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQw89USm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60971DD89A;
	Thu, 17 Oct 2024 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165203; cv=none; b=OIiUnkJSi8udQ74yUtcNqKOL+JRKl0VQpq3VlogKAu6IEs854oHu5u3OSy7D8nrtoTvCuWgB8Rw2+PYlJrmz4owpRisJ/Cuee8wutMlPIWRhM/BSGRDWJOrVct2M1Ei7saTvzhmmE8n8uN4Dwkc3zbqxQOsBLYsz7tC5xBCOWwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165203; c=relaxed/simple;
	bh=9njdWl4KiF2908asDzC3d88euVBuYFIlMgsO2B/Qb9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKwQeEoLCuT8Hw2htqgQB77JEzcpyPY4I6pkkDuvBMTdL4HV2IKZeGkicASAU7tN4cGFk7t5QohJtAnSYPSErPJsX3l5UcVAD3yAq8D8V6gTbwtxRSmW7Je44Pf2yxJxhKfaFpB2L2z80hCnC1IPA12Px8+cTXV6EuIlTNBV4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQw89USm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so619632f8f.2;
        Thu, 17 Oct 2024 04:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165197; x=1729769997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lmoNfsxcZwf01tMx6JvZqR05+RGQ7eUoqDoQfJoNOQ=;
        b=OQw89USmof/72znmGiTp+QyjjMR0m178j2dG0ZaFU5AxXIkrOhTDq3FF2bMJ2M6zpe
         HS9z0XNOJWCOzVByvc+zfKnMwBmMbL/xKTk2qIimqbVeXixoRZRnblMpK3oGLZoGzjBv
         TFYcj26i3oHvC7HzDhwUdKwpAEiLj71n9HLDngOTlSiCOlJzZVKwXXTPe/JeXR4xv/sV
         OghpSNOudaDfFCTVy14PjpJAsSp16oxi2stMZBr0mu3csUplpED43t8gg5L9WlUrN/0I
         rURRK1KCVYth/08mpl3KhBfKwFGpxoAIN9UM9NiZAGucoI6/LvIp/6LHfK59nfaQ7BuC
         UUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165197; x=1729769997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lmoNfsxcZwf01tMx6JvZqR05+RGQ7eUoqDoQfJoNOQ=;
        b=t5YztX/mFjfxS8xkI7g3AlmrllNBuGfFBCfoZJQWUeCA2sDoZz1bPa9MpGU7nVnPi4
         mN/DhV/qibSUCA8em3R4CYgW/rWOdLEEwQlr4Mcbd8lzQzyAUwjT6FgeG6d9wUbhdGrN
         vpE9p2sQW2mQj/E/xESbS8uppygCPup0tby6KQ1/IstGebQRvLQmeMPPxTQpZ/wKlzIo
         xItrSOb7qPDbD70Fp4ln6GD+Kgf3M9MjoJ8rBWOC+xzafFmyTZ0f5egqqzJW18DTHbk7
         d4BFWPGLgJSfJMkCsZ1RGcDuq+o62Lry4VSPyOTRr9MQIUwZ/VWA9lBE+uf01+Z7YChq
         Z7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCULBrLamKg84dcwE2zT+kpyak0vj9wymK4Mfyqq0K7Opc7KyiXIhx/pHi6wYPV4wnHB36CiiCoWTlSH@vger.kernel.org, AJvYcCVOUuXCwkY/myKYGxdJFEBa2QNt//PreVaFYld6sBJu1Q6TqQUnzmIltJqxjhaDbF8/055FtkkzWh1LEstQsP/XOJE=@vger.kernel.org, AJvYcCX4MXI4Yg/2RIBo2OQoWBQFT9CkaAz/u4GrN6NpeJvFaTI3F/crEdQvdsI3KiFeaCMkqItOyMj9W7L0Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwguJM89eH+gTyv3fexZzmiupcD/MvkctLuL2uJcP60WG7xsTD4
	iaZdXuhGgrJhG+rlNljAUWJ3ghHSHQnWVbpP/kRoWb2rl3SC5Jix
X-Google-Smtp-Source: AGHT+IH7+WIcxBN1TpQTtJy6P8oj3ID4uCpRAEVwBcvXJXugvSNuZGVbMUJcytLMV0YU4x2E4q9J+g==
X-Received: by 2002:adf:f803:0:b0:37d:43f1:57fc with SMTP id ffacd0b85a97d-37d86d84f81mr4052151f8f.58.1729165196951;
        Thu, 17 Oct 2024 04:39:56 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:56 -0700 (PDT)
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
Subject: [PATCH 7/7] pinctrl: renesas: pinctrl-rzg2l: Override irq_request/release_resources
Date: Thu, 17 Oct 2024 12:39:42 +0100
Message-ID: <20241017113942.139712-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


