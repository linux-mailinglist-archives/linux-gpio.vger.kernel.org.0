Return-Path: <linux-gpio+bounces-25785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B970B4A7BE
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BD533A35EF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB532DCF6D;
	Tue,  9 Sep 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G6aAFNBh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECA2D8774
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409352; cv=none; b=TVUJy1McM8oWT2u04IzmlGU39n21qV2W4f8x4VEJphjTPS10E0VX441mJXhnnYmo20CDtDaEVRux2CO+hFPn4FXGfTk2ukFN9+fj5Io0nb7CtIU1qEDXbNyhUuYzWF1TXg7bR381jdyf2WmchXi3Ty97WO0VMb3hu9mGETXF5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409352; c=relaxed/simple;
	bh=STVkcjbGQD0bnhkXi0awJ4N/O75AAoIkAEKNoy3xklM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aljxfXzx3SqRthrFKY7sEEqrMpC+lu4gSRwaBsEu829APAdbmUi/MtzjPjICrOiUVmJiks8DD6JE7wubt5GppBVIUBTOsl++ekdemhOKvmRVY2SYoHqgdVNKQqEsM302LEL2/wAYZxibIIrMqILtsTt7PjBHeXBusbdsyzCq33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G6aAFNBh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so3492212f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409348; x=1758014148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIZTqFFdI7c5GSdgApLwsnSgJwJyJjuHVWKySxCM3/s=;
        b=G6aAFNBhBZ/5OnaxmMXKOThXOuj3RmcdhVd3W8WPQROB7FZxd1Jdkf6nNA0SjJekfX
         tbgdp8W/wjlNAMMSDQGa2YCObRGezU5oxX5PuivtYLH5NUHyhhLFZ1oxVemSQQC/9APG
         Bqe/aBLGZW839+/bkmYjculhDrPJEkQC1mwxHMCuERdzncR4puVT5k/hZon4My+sIerR
         9vf/UhtG4gdsIgkM3AJOmR8n5++4xFIviEy5eQPtAiC2+bTJLPOL1OGcGxWVlGeymOdK
         iC5sZDJddFtcbL1hNJIs7SsEurzCrCetMo09oGyrmaFot8vJ5WZ/+bHsdgjnnrRWuHgP
         qRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409348; x=1758014148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIZTqFFdI7c5GSdgApLwsnSgJwJyJjuHVWKySxCM3/s=;
        b=G54IIzCD/8C6cCjI9xK7gqF2VrhcZ7YUxPtryF6LQuA7ypgaT+wS7EGNxZBlx3b2gk
         hN3IgggoCZokyLJUHSdYbSCY6rBpvEeIWdtCiPkXorKxf08RX9a6TckbC+f7vbuMwKsd
         P19KP9pycOB4lRXFcLQJNvJOKaESn1qlnCMBtp/C5x8MhkdTVn63nAtJ28IEeMDlQO1i
         z5aQmCnyX1wqRjJDUD4deE5PUv011dXmkYYG+CAEdYAFWOu+G8MMCGnCjaipCJLxjDUe
         jctlQaGrzIXNLwAQGtPbp6lbaAPswhNnbABelfBAoqGT44ZBi2DEZYlnLfz7YZUK2Jg2
         wgaA==
X-Gm-Message-State: AOJu0YzOeYqjywF2tvsRzIQNbDneAgRvPubnzN8u+58cdkHxvflFdokp
	O/E8IOxYXaGfDgxQulmDt0DOqEICl4d+fmUX0XEKcC5HAjGukzvz9ah8go3dDWWzzSw=
X-Gm-Gg: ASbGncvfROH2noC5CPwFYu3Q2Yw691qcUOFs75/U3K/KOSneezlNpo0u8cLrQ3e9pp2
	cpuugBGHI/8zFOLRMigSpo/kktMJxWBjx2mv9bUQ9LGkSS/0C5Yj/VJ0npzjm0wmPfbA3nONvQc
	qNgud0TBIQz8GaiE12rRZSNB2CCSxhWLWLpf/mIoxYRGoWJMfYihNnRwNvt8yRER6zTnVeIgmqY
	PZGqEwOyi/XzN1+4srPC8wXSby+PSUka02UZ4hOhYiGZ3mxcpe2jy+wA4HhISj/sU0z/Ibuy01U
	jwpxfhLqGELa8ATGeIMy7IihL+JMPyQzDtxCTG9Vfx6f8jGuE6espQmBSsqHz3RhEN9Kyj/zmPO
	9qGNlecYz1q+Oo2TQCA==
X-Google-Smtp-Source: AGHT+IEebt0pWOlSircy048VueTsw1+cXr5WEVoP9l1+AiT3ryRkfTg5u9QKZqm+iQAcvnX+nKkItg==
X-Received: by 2002:a05:6000:22c2:b0:3c7:308e:4dff with SMTP id ffacd0b85a97d-3e643c1b67emr7845415f8f.57.1757409347611;
        Tue, 09 Sep 2025 02:15:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:30 +0200
Subject: [PATCH 03/15] gpio: hlwd: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-3-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8081;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iTmYTpIN0EhHVtpfw10p3x+EmvoqbGnXwIDBsyAwgI8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2XiwccfT2vsbmpFgNl+2ytz7arhOWgEJQo
 yZ2y+hedzaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 ctMBEADWw+EV0P2U4YY57HCZxBhGQI8Jymslio2V/cvuO7G36gSw4j9IooHJ1Lc/vZ66kpeHZq+
 pv2Ei149dPUSiYnWM6RIDDlaQJfih8gGzscjFniHf9M71UP/5vESKeRd+JhBlB3Jc8uyHlbvFQl
 IsmTm5rbCEaBM5linFdBWjOsG+hyCRyP/iuwVSY1VBqLKGzFoWMgp770F9spm54j2mO+zZe/1yG
 hcitMkrtFA7XeupJ/p596xXbKa/hJHNebFnEEjnlTVc2MbDpvVVahnX8u7LSjkrEQU36bpgUSCX
 njBVdcuJuy0rCoyqo80IIwDG86/Gt6JgoCf+qQaVrlXGfYFIznFPxU+9+1RYZSJ+zmaGaWaht1L
 SbTDoRM2tGNx+6rBPsoP2YVQYE6R8yoFg9uwit4N6/KvVqlb/9Acz7jvKAJKtZ/mNVogv3ShZO9
 zOwWuxR4zqF/2XzqTITWS1a1dwsO492OSJGaClj5MdNoSXRWXwQoIhVdMv9wbwxFTOaM7gSad0o
 H4kV94dTKnLPgRv2ClfdScpzlc6NEy6GOsfbDN8queDSIIr7zE02+z30G7CAGRcO9gqEu935HlC
 htTpMhq504bjQ/p/Di904UnZkQO0Fb4V4FaSN65J5EvaXIa0w3rYMlcImbKbK3DnwyXM2KkUnGY
 TH/8sEVjgkhInSA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hlwd.c | 105 ++++++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 0580f6712bea9a4d510bd332645982adbc5c6a32..137f17c9ff221d524a4281fdbf91d8f27ee24182 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -6,6 +6,7 @@
 // Nintendo Wii (Hollywood) GPIO driver
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -48,7 +49,7 @@
 #define HW_GPIO_OWNER		0x3c
 
 struct hlwd_gpio {
-	struct gpio_chip gpioc;
+	struct gpio_generic_chip gpioc;
 	struct device *dev;
 	void __iomem *regs;
 	int irq;
@@ -61,45 +62,44 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned long flags;
 	unsigned long pending;
 	int hwirq;
 	u32 emulated_pending;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
-	pending = ioread32be(hlwd->regs + HW_GPIOB_INTFLAG);
-	pending &= ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
+	scoped_guard(gpio_generic_lock_irqsave, &hlwd->gpioc) {
+		pending = ioread32be(hlwd->regs + HW_GPIOB_INTFLAG);
+		pending &= ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
 
-	/* Treat interrupts due to edge trigger emulation separately */
-	emulated_pending = hlwd->edge_emulation & pending;
-	pending &= ~emulated_pending;
-	if (emulated_pending) {
-		u32 level, rising, falling;
+		/* Treat interrupts due to edge trigger emulation separately */
+		emulated_pending = hlwd->edge_emulation & pending;
+		pending &= ~emulated_pending;
+		if (emulated_pending) {
+			u32 level, rising, falling;
 
-		level = ioread32be(hlwd->regs + HW_GPIOB_INTLVL);
-		rising = level & emulated_pending;
-		falling = ~level & emulated_pending;
+			level = ioread32be(hlwd->regs + HW_GPIOB_INTLVL);
+			rising = level & emulated_pending;
+			falling = ~level & emulated_pending;
 
-		/* Invert the levels */
-		iowrite32be(level ^ emulated_pending,
-			    hlwd->regs + HW_GPIOB_INTLVL);
+			/* Invert the levels */
+			iowrite32be(level ^ emulated_pending,
+				    hlwd->regs + HW_GPIOB_INTLVL);
 
-		/* Ack all emulated-edge interrupts */
-		iowrite32be(emulated_pending, hlwd->regs + HW_GPIOB_INTFLAG);
+			/* Ack all emulated-edge interrupts */
+			iowrite32be(emulated_pending, hlwd->regs + HW_GPIOB_INTFLAG);
 
-		/* Signal interrupts only on the correct edge */
-		rising &= hlwd->rising_edge;
-		falling &= hlwd->falling_edge;
+			/* Signal interrupts only on the correct edge */
+			rising &= hlwd->rising_edge;
+			falling &= hlwd->falling_edge;
 
-		/* Mark emulated interrupts as pending */
-		pending |= rising | falling;
+			/* Mark emulated interrupts as pending */
+			pending |= rising | falling;
+		}
 	}
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 
 	chained_irq_enter(chip, desc);
 
 	for_each_set_bit(hwirq, &pending, 32)
-		generic_handle_domain_irq(hlwd->gpioc.irq.domain, hwirq);
+		generic_handle_domain_irq(hlwd->gpioc.gc.irq.domain, hwirq);
 
 	chained_irq_exit(chip, desc);
 }
@@ -116,30 +116,29 @@ static void hlwd_gpio_irq_mask(struct irq_data *data)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 mask;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
-	mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
-	mask &= ~BIT(data->hwirq);
-	iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
-	gpiochip_disable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
+	scoped_guard(gpio_generic_lock_irqsave, &hlwd->gpioc) {
+		mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
+		mask &= ~BIT(data->hwirq);
+		iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
+	}
+	gpiochip_disable_irq(&hlwd->gpioc.gc, irqd_to_hwirq(data));
 }
 
 static void hlwd_gpio_irq_unmask(struct irq_data *data)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 mask;
 
-	gpiochip_enable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	gpiochip_enable_irq(&hlwd->gpioc.gc, irqd_to_hwirq(data));
+
+	guard(gpio_generic_lock_irqsave)(&hlwd->gpioc);
+
 	mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
 	mask |= BIT(data->hwirq);
 	iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 }
 
 static void hlwd_gpio_irq_enable(struct irq_data *data)
@@ -173,10 +172,9 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 level;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&hlwd->gpioc);
 
 	hlwd->edge_emulation &= ~BIT(data->hwirq);
 
@@ -197,11 +195,9 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 		hlwd_gpio_irq_setup_emulation(hlwd, data->hwirq, flow_type);
 		break;
 	default:
-		raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 		return -EINVAL;
 	}
 
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 	return 0;
 }
 
@@ -225,6 +221,7 @@ static const struct irq_chip hlwd_gpio_irq_chip = {
 
 static int hlwd_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct hlwd_gpio *hlwd;
 	u32 ngpios;
 	int res;
@@ -244,25 +241,31 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 	 * systems where the AHBPROT memory firewall hasn't been configured to
 	 * permit PPC access to HW_GPIO_*.
 	 *
-	 * Note that this has to happen before bgpio_init reads the
-	 * HW_GPIOB_OUT and HW_GPIOB_DIR, because otherwise it reads the wrong
-	 * values.
+	 * Note that this has to happen before gpio_generic_chip_init() reads
+	 * the HW_GPIOB_OUT and HW_GPIOB_DIR, because otherwise it reads the
+	 * wrong values.
 	 */
 	iowrite32be(0xffffffff, hlwd->regs + HW_GPIO_OWNER);
 
-	res = bgpio_init(&hlwd->gpioc, &pdev->dev, 4,
-			hlwd->regs + HW_GPIOB_IN, hlwd->regs + HW_GPIOB_OUT,
-			NULL, hlwd->regs + HW_GPIOB_DIR, NULL,
-			BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = hlwd->regs + HW_GPIOB_IN,
+		.set = hlwd->regs + HW_GPIOB_OUT,
+		.dirout = hlwd->regs + HW_GPIOB_DIR,
+		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	res = gpio_generic_chip_init(&hlwd->gpioc, &config);
 	if (res < 0) {
-		dev_warn(&pdev->dev, "bgpio_init failed: %d\n", res);
+		dev_warn(&pdev->dev, "failed to initialize generic GPIO chip: %d\n", res);
 		return res;
 	}
 
 	res = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios);
 	if (res)
 		ngpios = 32;
-	hlwd->gpioc.ngpio = ngpios;
+	hlwd->gpioc.gc.ngpio = ngpios;
 
 	/* Mask and ack all interrupts */
 	iowrite32be(0, hlwd->regs + HW_GPIOB_INTMASK);
@@ -282,7 +285,7 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 			return hlwd->irq;
 		}
 
-		girq = &hlwd->gpioc.irq;
+		girq = &hlwd->gpioc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &hlwd_gpio_irq_chip);
 		girq->parent_handler = hlwd_gpio_irqhandler;
 		girq->num_parents = 1;
@@ -296,7 +299,7 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc, hlwd);
+	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc.gc, hlwd);
 }
 
 static const struct of_device_id hlwd_gpio_match[] = {

-- 
2.48.1


