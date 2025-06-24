Return-Path: <linux-gpio+bounces-22064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FDAE6681
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80AD14A4466
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AF22C17B6;
	Tue, 24 Jun 2025 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="incjsScR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302FE2C159A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771668; cv=none; b=HdBlEhvvJ/93Cdd4njOXGX5WwRerTB/CtGELrG2v+Y+EpJWdGAYKitmNxpl9BGe6XNPwqIz1CITdnYHAwqk4PMGRdJ/WK7zEd56oCAYiYX4Rm8DXdg+ZEzp+EorJLLaJF8rPIicO4/UQpmWV1x0Isllgdd7mlvTRtlz+OBH1owk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771668; c=relaxed/simple;
	bh=HmodalnC2cc37/f99i9xU93F6NQ40xsebYW/vO/TJkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jmr4zB2oJmga4K+sKzWXbIhfW4MoIuY973lVA4meRRxA9x/trbRqJNoG2AZWlCpRS39MiRcEL6k2beKdHh4W3nLA67v9XI17D9uhVK9nkas+pNBQOpmomvrd2kSUeYem3XcL4Rwcvps7mFyZSlEqY2Jea31FRrXqRcwm45lkcUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=incjsScR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2835073f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771665; x=1751376465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=incjsScR1E1YPAV4yz5BTpm8UajXhlY7PDjQh7558H3+bEQ4CICarIJfxUPEf+Uu+r
         W8RFKBhxWXw0BusA2BGzrabfd6PBn7dnGoZ1NamZwYE4TYrd6hebTPGD4KqXCkyVxmoF
         Y94uhV/veFYx4ZXug7d02zc3SgQo7KBvHVD80rphe3viYmPhh4JeELrLesjx2WR7JBlz
         D0qVo2e8LfWtUBjAU7pRbiuZS8VR1vQtmSts7GPzBiPWOx3zUy1L5RPlIOCS7cc1wfWH
         8k7ut3sbVUqUpfMxcBd0SeWfyIP31A/KDc2IgxqvXH8pzAzg3b/lzpiM2SsniPvOxazo
         uSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771665; x=1751376465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=J3kiEBX/gFGxgrC/1zvsL7W80NrDRv6nC/AtGsM2xeqCjsZwyP1TJmhyNn21Jjo7MC
         LDK9B2q8N8AHmCNAbymAoIAqZwIMUDag2Pw/zxN4OyE+Bz8mihJPJxfq/7xLS/+j+N+8
         vCt2Z9jbUCr1cBxJtDttCOjtjad3dQQ62+m2gXx4xG3OFXeES+3iJacsYofOtqC223be
         X+ATtfvNQze4qrO9m9AxdqtUVuUloLOTVCDZOr/dcUHaYdkYFQgGG8EofgVMrAniI/Q7
         IxqHn/tpsd69V1/yBWagM3P5XZpohb+OzhdR2CJ/tcbiFOV0UjFCHNRPPOf1b4YrQXWD
         2uuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKiLZbL3Mgb3iJQBioH5Bhj4Q6nBT/uWwW/FA4x2gagN7s5biEq0qyp8/tOw56I6PaMHjyNrfkKnF9@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxPMi8seSPLBURH8VjfqQ2D1wVl+vipuOUqyQjol4OttnW4hT
	sBosZH4Rut5b9dnwW/d6LOtriDgiknm1/dpRLHzjyz7LopnLPLHPk52bWbMaVW6hfw4=
X-Gm-Gg: ASbGncsQfZvydt8AD+qelzGo+ZUOOpO3h9xzf0R4HdbQ6luu7KScqSk2ha9vtgHIxBA
	e6lpVp3VaWoVj/CBzahbemN/xR7VhpmmbO9Hv1zbjEkwLEGA+nyPJkcXW88PbdwfZUaUbDA42ub
	txNU3whWMScjylj+B/3InRoYIfTJFAJSB52v93Dd/oCHu5q415zK34IFakH27vySbcx8ITB2Q7Q
	/ykSVeexcfKp7WdCjCmRw+CFRWv2UUdPTMFa4KdjV5H0PChTg07TyD5DHXupo2CnN4EgJJmuHBs
	UJdGpKpj8zoQIB1PBa+Na01tWJ5cChm191Ijty3nk4YKLuUnjrDDYBw=
X-Google-Smtp-Source: AGHT+IG5KWF0KCkThs6nJ6gal57FkJx7NIEiZyyWqT8Kac/vBWN9gXYyILceeK2lSrSaeIISymjmOg==
X-Received: by 2002:a05:6000:2709:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a6d130710emr9619060f8f.31.1750771665372;
        Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:34 +0200
Subject: [PATCH 2/8] gpio: mxc: use lock guards for the generic GPIO chip
 lock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-2-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L9QElStGogw0fz3XtB/b3BDhicIIjajUB8CqB/jaGV4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMkiIjVTe0tH1WLgnWonfVy8AhQhRKYcJ31
 wTEBATW7SCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cldLD/40hHr9EmEoxhdje0Mr2R2lm8PEsqdf2M4DnyDRT6tAwlnsdqL9jxCd9LnltXjUv8YaQVZ
 XIrsv3kkjxA4P3TYFdyjv+So7dj53stDO4C5FpFtRRdZ3JObzEBRw8oROkRXVpWhupxOgEp3AiZ
 cEf2ROA83kJYU92OvfD6hVf0XmbiHxj8BBKBT6ad/d3S2PFKeR04f3Tafzx78NlSjT4nnpfQGCV
 cqMA/sOeaghF3Y6O0rgEk2gBZxicTADRpyAVp1kaWdFt+w91EcKCFgdREm8N2hAqKoEbuTlgaiN
 1TVhOv9ZDQoF1sssO0rRuAtXymrdk946TUI6VxZ/YKub3fyB3Ve24n927i/pMf6ON3HOXPElNUg
 QdKP8i9nZce8YeDffxblqGqU13hpLoxrBl9JT+XqzYJ5cFUx8ykf0eDd5UHHCmrNbJS6nBgswZG
 PQAdXxTFkOUkda25LTKJpq5zT+u34gTyBUGG+CyxGiy/nwF0H/ZfVnlisyJvfA+GhNe7zpYOlrU
 ptM+8UVlNhzz4mNdJK3vUAVa2Bfg2P5I3Y2HYKOyNgVrMtwoBm5Z/xrkkbOCUWl1VmjYp8AtnAB
 IBck4wL8fYgyCFaqfuhau5035FFG0WZ9xSwqAZQHFZV65uPj/pUKu1wWuklwJcboLvAsMUKMJ3B
 Cdq+ee1OlBEp3nA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4af5a2972d12f68909dd87d9396921c80445f87c..1c37168c8d0a657d7f93067d9ac95cfbd821f757 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -161,7 +162,6 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -200,41 +200,38 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+		if (GPIO_EDGE_SEL >= 0) {
+			val = readl(port->base + GPIO_EDGE_SEL);
+			if (edge == GPIO_INT_BOTH_EDGES)
+				writel(val | (1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+			else
+				writel(val & ~(1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+		}
 
-	if (GPIO_EDGE_SEL >= 0) {
-		val = readl(port->base + GPIO_EDGE_SEL);
-		if (edge == GPIO_INT_BOTH_EDGES)
-			writel(val | (1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
-		else
-			writel(val & ~(1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
+		if (edge != GPIO_INT_BOTH_EDGES) {
+			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
+			bit = gpio_idx & 0xf;
+			val = readl(reg) & ~(0x3 << (bit << 1));
+			writel(val | (edge << (bit << 1)), reg);
+		}
+
+		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		port->pad_type[gpio_idx] = type;
 	}
 
-	if (edge != GPIO_INT_BOTH_EDGES) {
-		reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-		bit = gpio_idx & 0xf;
-		val = readl(reg) & ~(0x3 << (bit << 1));
-		writel(val | (edge << (bit << 1)), reg);
-	}
-
-	writel(1 << gpio_idx, port->base + GPIO_ISR);
-	port->pad_type[gpio_idx] = type;
-
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
-
 	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -250,12 +247,9 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	} else {
 		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
 		       gpio, edge);
-		goto unlock;
+		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
-
-unlock:
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.48.1


