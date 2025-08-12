Return-Path: <linux-gpio+bounces-24295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B93FB22684
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD351B64D72
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E962F49FA;
	Tue, 12 Aug 2025 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2ZuIUVfj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552F52F3C24
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000785; cv=none; b=avC86MZ2zAhgIl7/+2zmcNyADpzoYI0gLObAD1oMEjjsHLESQK8zK87wk51uyXLYRBUaM8zOb/Uy90c2LfHpz2anFAuz/SNvTSv07QW+sEZs5rb42qJWXmu+qq9CJJpHwEQirjbVufybk0eiff501oOnca9iECKag69L+CO74uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000785; c=relaxed/simple;
	bh=Lbx82MpdObcs8DWdhpfUiOwmKXRpNixx0jGeIxOjyxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbAw8oCNbRGPIG3Y8n6DJi4412UMzfsQVTBrzNls2EiNCwqu/xbh8qoephstEUBYsZ/c/d0kzgU9F5vo295meJimsBXZSCw0La8eYSFgKYUtMvkzZF/jocad88+0rJK5zjCCp63qMw6sK8u54WI882fOseVZVKQjrm/CcOlnCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2ZuIUVfj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b78bca0890so2671897f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000781; x=1755605581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8AGdT/nih1iqZ1qXrp+c0t2R6GBFKDYWuJsRpdsd7o=;
        b=2ZuIUVfjSaORBzqtsjPZYdK0c2xqicSsdEma0M7STda2BZhvQneCeJSrXQwITF4bE0
         RWIITKkuaWGBWwi90LT19GJXdcvzmdBaOOllw3PGWQjeWxydpS8TZdXDOXhYubk1UBNh
         NoXo4fBvKs/FS4OTLOgu0kTBzETSh02DvEGd/3Wgj2yhqrJi5t7Eyd4xs1OU8FO2Bayi
         qnQ68P//OLr3Iog/Xs1esXdqZLWj7aQq1nEmowgAf5vCoSoQCvfbfRurfJMmuKjJAgyh
         tQv3TcBJnkKUVJu5ATj4nXVrLallOfnRvbN6IETzXMcsSOtNigKsuwFLcKJWlXjEcrfp
         uebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000781; x=1755605581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8AGdT/nih1iqZ1qXrp+c0t2R6GBFKDYWuJsRpdsd7o=;
        b=PRADkuxhrRLyFJK/VWfN8SktmLvPfn7JVk+rX+QAq+TQGa5zLt894cSaKz66Bnql1V
         +vNM6ekkd+5sYG7YU/9DbTzdTd+r9GMJeIqOfKj+4JIdmM1eFJTCSMTjh5YkgONlzSQa
         U8wco2Q9Vdvbrgk3NJhue7BQFesjQlt0melw4yDGaO/f2CS4KBlZgauUsRisVUYDBogM
         cT5TyO5eAzdHe0Jw9KrC1VnVCkxEjPB1FFwmf5TS0MCzhSHaot3Z6+3StcSt6HDUHyK3
         /LkEgCU1vW5mPSQeTvA9On8lmtDTwrm8flZ5ZOjqdj99a0coPKM2VFyhIjj/ls8pSl2H
         t5pg==
X-Gm-Message-State: AOJu0Ywho8cVgj9IXEdVfbmNQClYzoYQL9/beeFGSopDa+jxzEvBZ5e2
	k8DDm8zVaaCkjQT69ogIWX94O1wDCZvDsUmLO5bIT5W8xBE/X9QwxksHzfHhONlljzs=
X-Gm-Gg: ASbGncvPNrMFcX39cc9toxqOMOzMKuVshM5ZpfPF5+S0n4cHmOYSqCLkPbSxxSG9BrW
	fiCnhkJmmd8mUoXUH92IrUbelVTorCuwDItefmn34h4eUW1TSDq6lncDkUqmBXX1l7W9O3i0rm7
	nMK5m/ihJf9DvUJDcxil380OVyncSb++pUKKz7whnF1v52dBFvfSp/BYqZc9FKxq4ZERT2EUIRV
	nbuuu4LF2LsUK78bBDf32PWMWEI/8OGEa2nr3LmrNYPG7sg/Vs7pazqEshvTM7KsxhRkaMyhXUS
	/BG4tkejTqlA9zOIS2jf+L+wTtqiXTIZHd4IaakoXGWiFfLsh8ie8nWCWKyBsqhCBXeecK9pSNW
	xG6/chNnBpCIJYIA=
X-Google-Smtp-Source: AGHT+IGKXMVe8ED85nr8gguZ+S58Gt5wrvp1FGbm7GS7OIO7c11ZJjtzjRw4RqkPYl5JgNIdLSBZdQ==
X-Received: by 2002:a05:6000:4013:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3b910fde4bemr2758385f8f.25.1755000781481;
        Tue, 12 Aug 2025 05:13:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:13:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:51 +0200
Subject: [PATCH RESEND 09/14] gpio: dwapb: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-9-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13939;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJtZHBh+83sX2WnxophXL3lqiaxB1fbZNtH20byx7Cc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/AnYJuWsz30v00nAH6s4/F4QP10/gYP0EYB
 zrDitfavHKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwAAKCRARpy6gFHHX
 cm2mEADEOVIS0r6KZZMd5jgCGz/UwMrPxOtdaBj09eROp2VUSveAatNTq4F9tmimo1FgMnWXc7l
 YmcDtqdZjolxNxYAcqUbzhHSqsKlmwMAh+QLnzUMelPwm3C6qQLHDmw8RsGb+h1N5+QVlQH4Q3b
 WCq+bAZui/KqF2sbuZRlZEINAZifcntIK1jak25iiGwuDivCxvOwTUfMrTQypPMdjwto3i+5tg+
 MLypRjs8EzzqbyFCdpFqzW38Y8w3whbj29gQsOaQqh1Lc+igg6CEwk7T23WT2jZf53xuayicM4q
 +/LpYfO6qgQNIZsXPkBcFSzY8dr9Le3EKHz3Yfr3XSo8GcnITcu0pp29nCq6GV4Zwkg/7acrNVj
 JpMT2UCJ+G/pHVOTXsfFMs0LfSpL3JRuQbLEYJzhHhHLFDAIV/HjXuCYG+Va4uncRRfnlnuId+n
 bew4Rrvz6Hhthajd+NsP/+Lw06OY3Rj9a4Wm63bxGTlvW5yViqYZ0JiTJha8XVCX9ru1l0V8h5c
 JTMegxb96K1N0L6BaU5SdBcKOjJ4HEKCegWmzA1z+kjV8hLW4Sm6mWb0u3KwLRXaLnh11Yhfc8Y
 n+s3Uy35NKBPN3RBe+PiCcW2qvxG/N7USNRXuz3XdhAAOqlPy9WZzSMIQImETrQGQWLFY8RzH1D
 4E/46U9kOn4Zy/A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 160 +++++++++++++++++++++++++---------------------
 1 file changed, 86 insertions(+), 74 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 43b667b41f5dce4a1a971af4506146e4ffb59b25..0fb781ca9da29545dce23ddbdf3bd5927c714b4c 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -99,7 +100,7 @@ struct dwapb_gpio_port_irqchip {
 };
 
 struct dwapb_gpio_port {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	struct dwapb_gpio_port_irqchip *pirq;
 	struct dwapb_gpio	*gpio;
 #ifdef CONFIG_PM_SLEEP
@@ -107,8 +108,12 @@ struct dwapb_gpio_port {
 #endif
 	unsigned int		idx;
 };
-#define to_dwapb_gpio(_gc) \
-	(container_of(_gc, struct dwapb_gpio_port, gc)->gpio)
+
+static inline struct dwapb_gpio *to_dwapb_gpio(struct gpio_chip *gc)
+{
+	return container_of(to_gpio_generic_chip(gc),
+			    struct dwapb_gpio_port, chip)->gpio;
+}
 
 struct dwapb_gpio {
 	struct	device		*dev;
@@ -148,19 +153,19 @@ static inline u32 gpio_reg_convert(struct dwapb_gpio *gpio, unsigned int offset)
 
 static inline u32 dwapb_read(struct dwapb_gpio *gpio, unsigned int offset)
 {
-	struct gpio_chip *gc	= &gpio->ports[0].gc;
-	void __iomem *reg_base	= gpio->regs;
+	struct gpio_generic_chip *chip = &gpio->ports[0].chip;
+	void __iomem *reg_base = gpio->regs;
 
-	return gc->read_reg(reg_base + gpio_reg_convert(gpio, offset));
+	return gpio_generic_read_reg(chip, reg_base + gpio_reg_convert(gpio, offset));
 }
 
 static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
 			       u32 val)
 {
-	struct gpio_chip *gc	= &gpio->ports[0].gc;
-	void __iomem *reg_base	= gpio->regs;
+	struct gpio_generic_chip *chip = &gpio->ports[0].chip;
+	void __iomem *reg_base = gpio->regs;
 
-	gc->write_reg(reg_base + gpio_reg_convert(gpio, offset), val);
+	gpio_generic_write_reg(chip, reg_base + gpio_reg_convert(gpio, offset), val);
 }
 
 static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsigned int offs)
@@ -186,7 +191,7 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 	if (!port)
 		return;
-	gc = &port->gc;
+	gc = &port->chip.gc;
 
 	pol = dwapb_read(gpio, GPIO_INT_POLARITY);
 	/* Just read the current value right out of the data register */
@@ -201,13 +206,13 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 {
-	struct gpio_chip *gc = &gpio->ports[0].gc;
+	struct gpio_generic_chip *gen_gc = &gpio->ports[0].chip;
 	unsigned long irq_status;
 	irq_hw_number_t hwirq;
 
 	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
 	for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
-		int gpio_irq = irq_find_mapping(gc->irq.domain, hwirq);
+		int gpio_irq = irq_find_mapping(gen_gc->gc.irq.domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
 
 		generic_handle_irq(gpio_irq);
@@ -237,27 +242,27 @@ static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
 static void dwapb_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	u32 val = BIT(irqd_to_hwirq(d));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
+
 	dwapb_write(gpio, GPIO_PORTA_EOI, val);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static void dwapb_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
-	dwapb_write(gpio, GPIO_INTMASK, val);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, gen_gc) {
+		val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
+		dwapb_write(gpio, GPIO_INTMASK, val);
+	}
 
 	gpiochip_disable_irq(gc, hwirq);
 }
@@ -265,59 +270,61 @@ static void dwapb_irq_mask(struct irq_data *d)
 static void dwapb_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	unsigned long flags;
 	u32 val;
 
 	gpiochip_enable_irq(gc, hwirq);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
+
 	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTMASK, val);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static void dwapb_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
+
 	val = dwapb_read(gpio, GPIO_INTEN) | BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTEN, val);
 	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTMASK, val);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static void dwapb_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
+
 	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTMASK, val);
 	val = dwapb_read(gpio, GPIO_INTEN) & ~BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTEN, val);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t bit = irqd_to_hwirq(d);
-	unsigned long level, polarity, flags;
+	unsigned long level, polarity;
+
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 	level = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
 	polarity = dwapb_read(gpio, GPIO_INT_POLARITY);
 
@@ -352,7 +359,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	dwapb_write(gpio, GPIO_INTTYPE_LEVEL, level);
 	if (type != IRQ_TYPE_EDGE_BOTH)
 		dwapb_write(gpio, GPIO_INT_POLARITY, polarity);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	return 0;
 }
@@ -393,11 +399,12 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 				   unsigned offset, unsigned debounce)
 {
 	struct dwapb_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = port->gpio;
-	unsigned long flags, val_deb;
+	unsigned long val_deb;
 	unsigned long mask = BIT(offset);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	val_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 	if (debounce)
@@ -406,8 +413,6 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 		val_deb &= ~mask;
 	dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
 	return 0;
 }
 
@@ -445,7 +450,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 				 struct dwapb_port_property *pp)
 {
 	struct dwapb_gpio_port_irqchip *pirq;
-	struct gpio_chip *gc = &port->gc;
+	struct gpio_chip *gc = &port->chip.gc;
 	struct gpio_irq_chip *girq;
 	int err;
 
@@ -501,6 +506,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 			       struct dwapb_port_property *pp,
 			       unsigned int offs)
 {
+	struct gpio_generic_chip_config config;
 	struct dwapb_gpio_port *port;
 	void __iomem *dat, *set, *dirout;
 	int err;
@@ -519,32 +525,39 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	set = gpio->regs + GPIO_SWPORTA_DR + pp->idx * GPIO_SWPORT_DR_STRIDE;
 	dirout = gpio->regs + GPIO_SWPORTA_DDR + pp->idx * GPIO_SWPORT_DDR_STRIDE;
 
+	config = (typeof(config)){
+		.dev = gpio->dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.dirout = dirout,
+	};
+
 	/* This registers 32 GPIO lines per port */
-	err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
-			 NULL, 0);
+	err = gpio_generic_chip_init(&port->chip, &config);
 	if (err) {
 		dev_err(gpio->dev, "failed to init gpio chip for port%d\n",
 			port->idx);
 		return err;
 	}
 
-	port->gc.fwnode = pp->fwnode;
-	port->gc.ngpio = pp->ngpio;
-	port->gc.base = pp->gpio_base;
-	port->gc.request = gpiochip_generic_request;
-	port->gc.free = gpiochip_generic_free;
+	port->chip.gc.fwnode = pp->fwnode;
+	port->chip.gc.ngpio = pp->ngpio;
+	port->chip.gc.base = pp->gpio_base;
+	port->chip.gc.request = gpiochip_generic_request;
+	port->chip.gc.free = gpiochip_generic_free;
 
 	/* Only port A support debounce */
 	if (pp->idx == 0)
-		port->gc.set_config = dwapb_gpio_set_config;
+		port->chip.gc.set_config = dwapb_gpio_set_config;
 	else
-		port->gc.set_config = gpiochip_generic_config;
+		port->chip.gc.set_config = gpiochip_generic_config;
 
 	/* Only port A can provide interrupts in all configurations of the IP */
 	if (pp->idx == 0)
 		dwapb_configure_irqs(gpio, port, pp);
 
-	err = devm_gpiochip_add_data(gpio->dev, &port->gc, port);
+	err = devm_gpiochip_add_data(gpio->dev, &port->chip.gc, port);
 	if (err) {
 		dev_err(gpio->dev, "failed to register gpiochip for port%d\n",
 			port->idx);
@@ -750,38 +763,37 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 static int dwapb_gpio_suspend(struct device *dev)
 {
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
-	struct gpio_chip *gc	= &gpio->ports[0].gc;
-	unsigned long flags;
+	struct gpio_generic_chip *gen_gc = &gpio->ports[0].chip;
 	int i;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	for (i = 0; i < gpio->nr_ports; i++) {
-		unsigned int offset;
-		unsigned int idx = gpio->ports[i].idx;
-		struct dwapb_context *ctx = gpio->ports[i].ctx;
+	scoped_guard(gpio_generic_lock_irqsave, gen_gc) {
+		for (i = 0; i < gpio->nr_ports; i++) {
+			unsigned int offset;
+			unsigned int idx = gpio->ports[i].idx;
+			struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
-		ctx->dir = dwapb_read(gpio, offset);
+			offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
+			ctx->dir = dwapb_read(gpio, offset);
 
-		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
-		ctx->data = dwapb_read(gpio, offset);
+			offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
+			ctx->data = dwapb_read(gpio, offset);
 
-		offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_STRIDE;
-		ctx->ext = dwapb_read(gpio, offset);
+			offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_STRIDE;
+			ctx->ext = dwapb_read(gpio, offset);
 
-		/* Only port A can provide interrupts */
-		if (idx == 0) {
-			ctx->int_mask	= dwapb_read(gpio, GPIO_INTMASK);
-			ctx->int_en	= dwapb_read(gpio, GPIO_INTEN);
-			ctx->int_pol	= dwapb_read(gpio, GPIO_INT_POLARITY);
-			ctx->int_type	= dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
-			ctx->int_deb	= dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
+			/* Only port A can provide interrupts */
+			if (idx == 0) {
+				ctx->int_mask = dwapb_read(gpio, GPIO_INTMASK);
+				ctx->int_en = dwapb_read(gpio, GPIO_INTEN);
+				ctx->int_pol = dwapb_read(gpio, GPIO_INT_POLARITY);
+				ctx->int_type = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
+				ctx->int_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 
-			/* Mask out interrupts */
-			dwapb_write(gpio, GPIO_INTMASK, ~ctx->wake_en);
+				/* Mask out interrupts */
+				dwapb_write(gpio, GPIO_INTMASK, ~ctx->wake_en);
+			}
 		}
 	}
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
@@ -791,8 +803,8 @@ static int dwapb_gpio_suspend(struct device *dev)
 static int dwapb_gpio_resume(struct device *dev)
 {
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
-	struct gpio_chip *gc	= &gpio->ports[0].gc;
-	unsigned long flags;
+	struct gpio_chip *gc = &gpio->ports[0].chip.gc;
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	int i, err;
 
 	err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
@@ -801,7 +813,8 @@ static int dwapb_gpio_resume(struct device *dev)
 		return err;
 	}
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
+
 	for (i = 0; i < gpio->nr_ports; i++) {
 		unsigned int offset;
 		unsigned int idx = gpio->ports[i].idx;
@@ -828,7 +841,6 @@ static int dwapb_gpio_resume(struct device *dev)
 			dwapb_write(gpio, GPIO_PORTA_EOI, 0xffffffff);
 		}
 	}
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	return 0;
 }

-- 
2.48.1


