Return-Path: <linux-gpio+bounces-24638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F2B2E1A2
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D637F1897DFA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F13F322A27;
	Wed, 20 Aug 2025 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlWwG/6+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C92D3231;
	Wed, 20 Aug 2025 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705492; cv=none; b=ttzlBSTOWtSccItFAdySu88kqgv6PVXp+M7ESyEnsm8japJFsjVSrm6EGYtCae8SN3Ro/jq5IPXBfJ/yScjHgv+aaB1EFgDk0jqrM8eZLvl41fWp3i4+6+OSFZLbwByAPPIvmeejsKYwPDS2AeN+i1XfY/aKqYMJwhqyhAXtmIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705492; c=relaxed/simple;
	bh=2Y6pXY5C3fzYpd9lxWJ0ZagqNozVP0PkFBHNE3P4K2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIXmSGkYS4QlumTClusZihVb9/lUdSyd/pjhKpjrOsMVXIMzZK3cZ6yOwLEy5nnhsnI5yh4kPbeuFX5gWPD+V6I1oGLMRWORf7+02ooWDJnt0KTk8w0XKQx2MjrOZ4bUE6yYDumQCC7iYA5HWb4qTMalck40aK7FckiRdj+q1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlWwG/6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FFEC4CEEB;
	Wed, 20 Aug 2025 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705492;
	bh=2Y6pXY5C3fzYpd9lxWJ0ZagqNozVP0PkFBHNE3P4K2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FlWwG/6+6E1DT25N7XcMNcfSJZkErGpZxNGhz97Dkv1SYq9n3s+mPI6kH9RGSaftL
	 a7RbelbN65r34/f4YunyhYa90/w/doU+dKQf3fCQH7uAX6B2GTu9nGa+ewGno1Qo28
	 nK+OIuQf9yS+YxHVRakyMtYk1jQj1h6+j5mg8nptG7CbI+TFBgSXmc0wVC3QhqVhmM
	 eS7tfTx/O7R8CoLN/6V5TkBd5GE0GA9wAQ5ByYk9ZO/PsKmp8KMU37kHvKWFhNMK8i
	 4UJ2qtuAF3fJGjjMxGTVOAXXgJJOz24Q1xXCja9lnFCU38V3xDatum4KmBnOMF5QNR
	 s/ScKIGQmFjJA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Buesch <m@bues.ch>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 01/16] gpio: dwapb: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:22 +0800
Message-ID: <20250820154037.22228-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

The dwapb_context structure is always embedded into struct
dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
data overhead for !CONFIG_PM_SLEP.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-dwapb.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 43b667b41f5d..d831e6c61566 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -78,7 +78,6 @@ struct dwapb_platform_data {
 	unsigned int nports;
 };
 
-#ifdef CONFIG_PM_SLEEP
 /* Store GPIO context across system-wide suspend/resume transitions */
 struct dwapb_context {
 	u32 data;
@@ -91,7 +90,6 @@ struct dwapb_context {
 	u32 int_deb;
 	u32 wake_en;
 };
-#endif
 
 struct dwapb_gpio_port_irqchip {
 	unsigned int		nr_irqs;
@@ -102,9 +100,7 @@ struct dwapb_gpio_port {
 	struct gpio_chip	gc;
 	struct dwapb_gpio_port_irqchip *pirq;
 	struct dwapb_gpio	*gpio;
-#ifdef CONFIG_PM_SLEEP
-	struct dwapb_context	*ctx;
-#endif
+	struct dwapb_context	ctx;
 	unsigned int		idx;
 };
 #define to_dwapb_gpio(_gc) \
@@ -357,12 +353,11 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
-	struct dwapb_context *ctx = gpio->ports[0].ctx;
+	struct dwapb_context *ctx = &gpio->ports[0].ctx;
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 
 	if (enable)
@@ -372,9 +367,6 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 	return 0;
 }
-#else
-#define dwapb_irq_set_wake	NULL
-#endif
 
 static const struct irq_chip dwapb_irq_chip = {
 	.name		= DWAPB_DRIVER_NAME,
@@ -384,7 +376,7 @@ static const struct irq_chip dwapb_irq_chip = {
 	.irq_set_type	= dwapb_irq_set_type,
 	.irq_enable	= dwapb_irq_enable,
 	.irq_disable	= dwapb_irq_disable,
-	.irq_set_wake	= dwapb_irq_set_wake,
+	.irq_set_wake	= pm_sleep_ptr(dwapb_irq_set_wake),
 	.flags		= IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
@@ -509,12 +501,6 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
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
@@ -746,7 +732,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_gpio_suspend(struct device *dev)
 {
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
@@ -758,7 +743,7 @@ static int dwapb_gpio_suspend(struct device *dev)
 	for (i = 0; i < gpio->nr_ports; i++) {
 		unsigned int offset;
 		unsigned int idx = gpio->ports[i].idx;
-		struct dwapb_context *ctx = gpio->ports[i].ctx;
+		struct dwapb_context *ctx = &gpio->ports[i].ctx;
 
 		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
 		ctx->dir = dwapb_read(gpio, offset);
@@ -805,7 +790,7 @@ static int dwapb_gpio_resume(struct device *dev)
 	for (i = 0; i < gpio->nr_ports; i++) {
 		unsigned int offset;
 		unsigned int idx = gpio->ports[i].idx;
-		struct dwapb_context *ctx = gpio->ports[i].ctx;
+		struct dwapb_context *ctx = &gpio->ports[i].ctx;
 
 		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
 		dwapb_write(gpio, offset, ctx->data);
@@ -832,15 +817,13 @@ static int dwapb_gpio_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
-			 dwapb_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend, dwapb_gpio_resume);
 
 static struct platform_driver dwapb_gpio_driver = {
 	.driver		= {
 		.name	= DWAPB_DRIVER_NAME,
-		.pm	= &dwapb_gpio_pm_ops,
+		.pm	= pm_sleep_ptr(&dwapb_gpio_pm_ops),
 		.of_match_table = dwapb_of_match,
 		.acpi_match_table = dwapb_acpi_match,
 	},
-- 
2.50.1


