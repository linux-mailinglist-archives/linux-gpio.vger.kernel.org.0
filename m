Return-Path: <linux-gpio+bounces-28999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D0C7EB92
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A80EA4E11EF
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE8435898;
	Mon, 24 Nov 2025 00:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmLdC8ad"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79096DDAB;
	Mon, 24 Nov 2025 00:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763945398; cv=none; b=SKweXxWOXFM/DBlCOSdil7yuh7/8p0C9j9xOq+aZekS/h3nrlsfjBSIP0G1PAkd4PrccHx1oJZuv//pjweHQILqGd4jO9lxjOi/UuBn8RfKQ1bSmVQLTZUa16xPdf/zsXXgoakuiDaeUw7tvDa3e2VfWKDHASf+xOiku7pkKHyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763945398; c=relaxed/simple;
	bh=bUo6ak1zTCbJEyjFXZF8zQG8L5QXu94ygdsiABIZMis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5yzXL65AFqIYu+BlxErthPmenW6gmNxCayZMRTTniPRwAZwZu5+V8TFR23EbfPSBMB3L1c6cISpKJB87n+4hedL0h+Agc+BwlhgINaKCr+Y+2l7c/oCV2PgHbGUr2c1YfEqFjzEtDE1B6PziROP7/013E4qRO53Ns9fmGJ7FXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmLdC8ad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70071C113D0;
	Mon, 24 Nov 2025 00:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763945398;
	bh=bUo6ak1zTCbJEyjFXZF8zQG8L5QXu94ygdsiABIZMis=;
	h=From:To:Cc:Subject:Date:From;
	b=kmLdC8adeRS9sgUr3rfggh04Rj+4FZS96P5oNR/eYzKD7hJ9kQiZYEOPRfjSufRqJ
	 qoJh+eQEOSIooOE+RgUq6gZagAq1ZaMTZyzK/kx9UmQZHhWLinWb0Qm6Ov1rRaSrg9
	 sKIk3JCl+IoQolxMIPo4quMDZnR34PH45kUgaLyIeWAdZMJsPnSWkRJElw6hZfy2nL
	 hLh1xDuTt8RAX2PKjkjWwiF+Ziiz8fNLUkxV23HC3yWb3MZURj4sGuFOwxqR7scpmM
	 mJx6eL88v2gx2Xyc5+cKzCsQ9be6lJGc4lxX/ExL5e7ediSEu//b3mWsP1nJDcnuIS
	 AgOykpGC6Splg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Michael=20B=C3=BCsch?= <mb@bues.ch>
Subject: [PATCH v2] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Date: Mon, 24 Nov 2025 08:32:06 +0800
Message-ID: <20251124003206.25618-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fold dwapb_context into struct dwapb_gpio_port to further simplify
the code. Sure this brings a tiny 36 bytes data overhead for
!PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
GPIO port number is 6(the berlin2q soc family), so this means we will
waste 216 bytes memory in total which is trivial compared to the
system memory.

From another side, as Michael mentioned:
"The driver currently allocates the struct with kzalloc and stores a
pointer to it in case of PM=y.
So this probably has an overhead in the same order of magnitude
(pointer + malloc overhead/alignment/fragmentation) in case of PM=y
now."

So let's Fold dwapb_context into struct dwapb_gpio_port.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

since v1:
 - collect Reviewed-by tag
 - fix commmit msg
 - add a link to lore.kernel.org for the series which this patch is
   against.

NOTE: this patch is applied against the following series:
https://lore.kernel.org/linux-gpio/20251124002105.25429-1-jszhang@kernel.org/T/#t

 drivers/gpio/gpio-dwapb.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 4986c465c9a8..a431bea959ed 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -101,7 +101,7 @@ struct dwapb_gpio_port {
 	struct gpio_generic_chip chip;
 	struct dwapb_gpio_port_irqchip *pirq;
 	struct dwapb_gpio	*gpio;
-	struct dwapb_context	*ctx;
+	struct dwapb_context	ctx;
 	unsigned int		idx;
 };
 
@@ -363,7 +363,7 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
-	struct dwapb_context *ctx = gpio->ports[0].ctx;
+	struct dwapb_context *ctx = &gpio->ports[0].ctx;
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 
 	if (enable)
@@ -507,12 +507,6 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	port->gpio = gpio;
 	port->idx = pp->idx;
 
-#ifdef CONFIG_PM_SLEEP
-	port->ctx = devm_kzalloc(gpio->dev, sizeof(*port->ctx), GFP_KERNEL);
-	if (!port->ctx)
-		return -ENOMEM;
-#endif
-
 	dat = gpio->regs + GPIO_EXT_PORTA + pp->idx * GPIO_EXT_PORT_STRIDE;
 	set = gpio->regs + GPIO_SWPORTA_DR + pp->idx * GPIO_SWPORT_DR_STRIDE;
 	dirout = gpio->regs + GPIO_SWPORTA_DDR + pp->idx * GPIO_SWPORT_DDR_STRIDE;
@@ -761,7 +755,7 @@ static int dwapb_gpio_suspend(struct device *dev)
 		for (i = 0; i < gpio->nr_ports; i++) {
 			unsigned int offset;
 			unsigned int idx = gpio->ports[i].idx;
-			struct dwapb_context *ctx = gpio->ports[i].ctx;
+			struct dwapb_context *ctx = &gpio->ports[i].ctx;
 
 			offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
 			ctx->dir = dwapb_read(gpio, offset);
@@ -809,7 +803,7 @@ static int dwapb_gpio_resume(struct device *dev)
 	for (i = 0; i < gpio->nr_ports; i++) {
 		unsigned int offset;
 		unsigned int idx = gpio->ports[i].idx;
-		struct dwapb_context *ctx = gpio->ports[i].ctx;
+		struct dwapb_context *ctx = &gpio->ports[i].ctx;
 
 		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
 		dwapb_write(gpio, offset, ctx->data);
-- 
2.51.0


