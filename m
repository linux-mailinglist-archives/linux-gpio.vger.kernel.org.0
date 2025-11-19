Return-Path: <linux-gpio+bounces-28787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC709C6F9DC
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A033E2EB94
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FDD3612E8;
	Wed, 19 Nov 2025 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5stpctk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C312FF154;
	Wed, 19 Nov 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565524; cv=none; b=sZsArymDR6FeILOFkThJot4hEf5hOxchosLlcsuwAi36ZKJF/2UxH61BLuHH/zfrNtC0fNx2nyei1gYpm+/5SA8bmT6NRGs8OCkWVVIPiprElYDyWZuTCZrrkpRLhz/cUyAFg731gmFw93+wgINdEt1QksIXVqoVhhMyVU8LVbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565524; c=relaxed/simple;
	bh=BV0+oJp55OaG73vSKM3QbI89e9sCDc8t5TtKjk1GcPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sPv/Kfc/LvgDwlVcyzS9slCPlyq9d02FD4rRHrRdabG/bUZH6hsIiTjcU2xn2irYI1yp/6j87h4bDuivcBUT01+fW0cFHtFy5S9ScZrIjJJeHgCfWOcoImgVy9Tca1/WAFh+dfkejslyAQSIzXxZSYoPUqjfxaKG98OjK9dz3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5stpctk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B3C16AAE;
	Wed, 19 Nov 2025 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763565524;
	bh=BV0+oJp55OaG73vSKM3QbI89e9sCDc8t5TtKjk1GcPI=;
	h=From:To:Cc:Subject:Date:From;
	b=p5stpctk3TGwUVCqj/L3a9gC2sP1jL6cO4XkDOSZG35WGh9sTK746Hs/h8QdOzO1+
	 g9m+xIyZBqv8Qz7zs1hgEd/2Joz1/5Cjrf5mBRZhrmUauMRgSrL84F2/ZI6L1YbAZc
	 F9P+gll2FPh17XWn7i70yLTypV2pNGzlC04Ynrgg4xoopuwpL7VPFsi9Ph47TMV2L/
	 57L1eero+Q9cM+zDREXRCTlEsXwPOHCxdFbz7DkbApqaALLh5KCmpetAjSRbV+g9ix
	 QGlZ2BtnXyt+ypFzULbSr300eUZhMJ6BhQ+M574iHikH23EVM+8xOf3bWckzcaUlVW
	 zK3Xabq3JGB+g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Michael=20B=C3=BCsch?= <mb@bues.ch>
Subject: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Date: Wed, 19 Nov 2025 23:00:49 +0800
Message-ID: <20251119150049.13537-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fold dwapb_context into struct dwapb_gpio_port to further simplify
the code. Sure this brings a tiny 36 bytes data overhead for
!PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
gpio port number is 6(the berlin2q soc family), so this means we will
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
CC: Michael Büsch <mb@bues.ch>
---
NOTE: this patch is applied against the following series:
[PATCH v3 00/15] gpio: Use modern PM macros

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


