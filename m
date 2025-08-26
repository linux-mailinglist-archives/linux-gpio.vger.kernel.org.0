Return-Path: <linux-gpio+bounces-24972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02820B3591F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723F21770BF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2773337685;
	Tue, 26 Aug 2025 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nCeDUi9Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C23277A2
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200925; cv=none; b=gCuaJAJMGxF0G/0PIxlIpX3t9RQzpKpSwYPzeU5sgvSI6sb9kdmWoDHk056TjmgJvS6J2oQQm39LqXXqI8rbIjyHioHibw6wJmmjLWCRHypi/Qv3PEZfcxmhdsVBUu5Dpei74h3//LiRJHABMulB32oXZsyEnklBudQvosudIt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200925; c=relaxed/simple;
	bh=64ij7NHMup3m85fN3cUrvJrQ9eDcvccikQ1EJPQx454=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baxRqmVj9iDi2NzVqjqKYGCSHnuthRIqX1I+nluFcfvh9ejFCQ4VCPEhXdiOlpB154+SFnQmmZWnNw38KnY5FOxXFN9LzUN+S6BUJvvf3voxCLT2IYPA36+atFuAetM2IrMxblZveuEqdpfoSgz+acGEGePyupoyXqwonvrjwJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nCeDUi9Z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b4d8921f2so39379295e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200922; x=1756805722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lRqOyCFh9XcXfURwOeKl6jFWARUqPe5zgwIJ8H3pYg=;
        b=nCeDUi9ZiFtT7IhZ8Bcd2n0FvUYxzweI6oQ8hkgcxzPjfrVnmB14AhWKoP2mXvwZr4
         B1bLJ/70GDniFNsqpuku6ljvMBSz5nMl42pG+JCI5uZrj87jUzYdmo47NxcrzxmLl9OD
         ebkkQeoSdmu0piFWojmADiNP5H1ecK+BpNpSBWno8otcqWCHf2/Xs6gPNHalxrqIEZP8
         Ql3MYciGkXUqB5IaYM5C6XbmJ+ivSM+xI84RWxw0mZ3HPMrMX2DszMGK3qF9l9Q3EIsa
         ixe1Eniw2DW7v3Glb9hWX7IJlwJqfuF1IH799wLRxbYJf2coJz+5mOnIaRrn33ETNKYH
         w5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200922; x=1756805722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lRqOyCFh9XcXfURwOeKl6jFWARUqPe5zgwIJ8H3pYg=;
        b=gpOsiaAYZa04YtDn5sUPyhf9c0MLK1Pq+tlgXDqzExmJYCL3/wiCRbMHHs9rqDFCsn
         Z31JU/BVnR/VuDG4Rj/q73b+56JpmrCxCPOVBJC3C+VHvsWJ35UBGw5oPCVx5lDZd2wu
         h6Cxc+GfaW80dV6d3qeiy6SoICr3Ia5800wXwkdadWWrNu96oA4eMzoxaJQ2W7Sj+mZK
         HApqxwRWtF+RMVIv9fiGCoinMzUzohboXA1FYf+ipNNX9YiD3DGYogn0Dw4/IoRUK2zC
         3Mza56ZSGRm8eRMFQjIxLCLF4wdNH/rRbIsVLvDfsAE+dVBRW1C/Qmai0Ehl0hLIkE/r
         UD4w==
X-Gm-Message-State: AOJu0Yyi/0r53Dmdup8vLVrL6BXf6p1enPACh/a+P/BjtQeVOFuPn04Y
	Xi9TijsDVBRT2+a9kObZfeaxNp2QEcTUOmnZpsLEuVNDH9UWKjIhKnJwEu09o5D6UIc=
X-Gm-Gg: ASbGncvlFamsjj1W6u2eLZt9TCXVEEZ4dB4P1mUJbMs0gPUrs38JcQVSBmKAF3bMOyq
	fHBIzsjdXoLdUd2GEeOTOy3aYJAbrnIoqWg9oMd/bvplJu4r1hYwzygWRbNv8AD8ICijt7qiHLL
	I1i5uqdqsjqE/114Appuhq2V4R8LF8LYQvXQfrxwyb4Zt/gWJ2WcSSaGtUQY1b1eqG9/vGvhDDB
	uytXr7H0heJ6pObhj5K+ZHy9l32NB4FBrjkFkIwZ1fKkVWjyYuxHLr2wMHlg0nMU3aj3Btkl3ee
	gETA0R24qhZuli9JWIlr3WWLWCRP7XzbqED+dnJyyG+q+48mWUU5Xrp+r28IVPmnWXxZpyAJtH4
	FQmD0oSVyd8mmgJ4dB6Eb4wxV40k=
X-Google-Smtp-Source: AGHT+IHp75RpiQJVQEKUSXBjLmDArj0vUimB8rn/x/G9gcfjiu1pYST95FYW5BPTLyI/A4pTeZ1FxQ==
X-Received: by 2002:a05:600c:a46:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-45b517ad840mr181139635e9.16.1756200921799;
        Tue, 26 Aug 2025 02:35:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:10 +0200
Subject: [PATCH 09/12] gpio: realtek-otto: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-9-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4690;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J7jwxRyvW9kXUpoOBwyWjbeaH/EDMDCA4owIhqbPBq8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/OhhNe0U5pJTYByzLv3ho1E9kgRU/h1J4YP
 5BUsTXb7cGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 cl6JEACSegRrM1NLbUUpgcmQKDFw1fmSphywCs9xXWP49K8Ek9QZSeh7ZyQ7uCSBGRJCIXcYDWE
 ynbuLs74G6uP8D8ykwPOPAREpPUfu6v3jYd0L/cRFNeqj0Ka/zEtcsVJRr6p5w9J1LTjEOF5N06
 vuBKxFL7RZxCp5OelGIZ6/T102b5ZsdSiiaRIXAUpyrZ1QbzJFSwMgJAyKDkUw3wl3xQf4akGa1
 isk/WN0030zXVtZnn8m48XcttAmP/vBBgbH2pJVU8Fm+Q4c8Tn+TWa5dlXw1ENsClOYbibpscKC
 gLFPhywMeCnCwIOzJllqmMhgjkjA5N2ujpmngo/oGh8Dj2Om1egwlTYlxcwQo5cIKMyHU4/0yTy
 a5+hh7Oj7oqeAYa8ZR5NdmSYzK6mQ+4/TOWu882QgHEgVXIu1npMPeis4upn5ZVUNFipDgkWDgy
 ifBrkoWzm9rIKlWRtNKY3Kjn4Iwf+/ZuhyPDtuky1G/RkFlm0R6yCkxHsNF1c4k87O1GIu86hm+
 SWZKPURRj1egCiGJwPW4fEkz5HajkAkBVdEm3L/6yB35SJToxxTMSrX+hXZLBPvI5O6MdnHCI0K
 uTeWvL/yXp2RroPXXl/gJVQp4g+TTgcSqX52xmAtlLjaTDV7fhAU2WeNHPp+TA+4q6m7EdKtmzm
 OzGGWV4j7S2gJIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-realtek-otto.c | 41 +++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index d6418f89d3f63d6029e127d4f774507c2ebbe0cb..ab711422254e9e8ff1a4e7c4016389e6d352f268 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/gpio/driver.h>
 #include <linux/cpumask.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/irq.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
@@ -41,7 +42,7 @@
 /**
  * realtek_gpio_ctrl - Realtek Otto GPIO driver data
  *
- * @gc: Associated gpio_chip instance
+ * @chip: Associated gpio_generic_chip instance
  * @base: Base address of the register block for a GPIO bank
  * @lock: Lock for accessing the IRQ registers and values
  * @intr_mask: Mask for interrupts lines
@@ -64,7 +65,7 @@
  * IMR on changes.
  */
 struct realtek_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	void __iomem *cpumask_base;
 	struct cpumask cpu_irq_maskable;
@@ -101,7 +102,7 @@ static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 
-	return container_of(gc, struct realtek_gpio_ctrl, gc);
+	return container_of(to_gpio_generic_chip(gc), struct realtek_gpio_ctrl, chip);
 }
 
 /*
@@ -194,7 +195,7 @@ static void realtek_gpio_irq_unmask(struct irq_data *data)
 	unsigned int line = irqd_to_hwirq(data);
 	unsigned long flags;
 
-	gpiochip_enable_irq(&ctrl->gc, line);
+	gpiochip_enable_irq(&ctrl->chip.gc, line);
 
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ctrl->intr_mask[line] = REALTEK_GPIO_IMR_LINE_MASK;
@@ -213,7 +214,7 @@ static void realtek_gpio_irq_mask(struct irq_data *data)
 	realtek_gpio_update_line_imr(ctrl, line);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 
-	gpiochip_disable_irq(&ctrl->gc, line);
+	gpiochip_disable_irq(&ctrl->chip.gc, line);
 }
 
 static int realtek_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
@@ -356,8 +357,9 @@ MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
 
 static int realtek_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
-	unsigned long bgpio_flags;
+	unsigned long gen_gc_flags;
 	unsigned int dev_flags;
 	struct gpio_irq_chip *girq;
 	struct realtek_gpio_ctrl *ctrl;
@@ -388,32 +390,37 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	raw_spin_lock_init(&ctrl->lock);
 
 	if (dev_flags & GPIO_PORTS_REVERSED) {
-		bgpio_flags = 0;
+		gen_gc_flags = 0;
 		ctrl->bank_read = realtek_gpio_bank_read;
 		ctrl->bank_write = realtek_gpio_bank_write;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
 	} else {
-		bgpio_flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+		gen_gc_flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
 		ctrl->bank_read = realtek_gpio_bank_read_swapped;
 		ctrl->bank_write = realtek_gpio_bank_write_swapped;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
 	}
 
-	err = bgpio_init(&ctrl->gc, dev, 4,
-		ctrl->base + REALTEK_GPIO_REG_DATA, NULL, NULL,
-		ctrl->base + REALTEK_GPIO_REG_DIR, NULL,
-		bgpio_flags);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = ctrl->base + REALTEK_GPIO_REG_DATA,
+		.dirout = ctrl->base + REALTEK_GPIO_REG_DIR,
+		.flags = gen_gc_flags,
+	};
+
+	err = gpio_generic_chip_init(&ctrl->chip, &config);
 	if (err) {
 		dev_err(dev, "unable to init generic GPIO");
 		return err;
 	}
 
-	ctrl->gc.ngpio = ngpios;
-	ctrl->gc.owner = THIS_MODULE;
+	ctrl->chip.gc.ngpio = ngpios;
+	ctrl->chip.gc.owner = THIS_MODULE;
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (!(dev_flags & GPIO_INTERRUPTS_DISABLED) && irq > 0) {
-		girq = &ctrl->gc.irq;
+		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &realtek_gpio_irq_chip);
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
@@ -442,7 +449,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 			cpumask_set_cpu(cpu, &ctrl->cpu_irq_maskable);
 	}
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->chip.gc, ctrl);
 }
 
 static struct platform_driver realtek_gpio_driver = {

-- 
2.48.1


