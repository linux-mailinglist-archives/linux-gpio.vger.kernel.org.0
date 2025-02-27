Return-Path: <linux-gpio+bounces-16699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DACA47C20
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A5416308B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E64722B588;
	Thu, 27 Feb 2025 11:25:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70B522A7FA;
	Thu, 27 Feb 2025 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655529; cv=none; b=jMu6ZCjSsmgeysxTamUWanxYNqPkieh80JCKUP9Mbb6gmPx7eg+KWOMkyW6yRVkSwSmFYKu0okOY55Ip9RS/U1XPt8IGBI8mXZqs9CJ4jzIduxMW4tJ6yBpy/FiBB4IInawsZnHxXjbXAPo7t2NWIdyITI7bi7IBSA4OfnKwJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655529; c=relaxed/simple;
	bh=j7nHUzto93z73Q7u7ZCwyv8zWNN+EcOL4GbzznozJ+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSFaL1zgWuhHVLZ4ZesaODXR/ZTpeoiG0jhj7jNt8IpE6HBlFLP/jzOdq3ii941GFeA88trwvM9qjpfDlJh84pc6VzkHUzMukJZkcQkb5kiKGOEfB+6ABvfCV/aYfAarhGFg+3CbmlLWf7cgzQoX5gQwPwCOU3u2oFnMOvGIk9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 81837342F9D;
	Thu, 27 Feb 2025 11:25:24 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Feb 2025 19:25:00 +0800
Subject: [PATCH 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=j7nHUzto93z73Q7u7ZCwyv8zWNN+EcOL4GbzznozJ+U=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGfAS5mjWqgeHWp74kYrpGfOkx1UWzxnhzUJ32O/8am22gACI
 IkCkwQAAQoAfRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJnwEuZXxSAAAAAAC4AKGlzc3Vlci1m
 cHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCNUJBQjhDOUMzMUI3MTE1Njc
 wMjIzREMzMUFBRUE0NzU5NERCQkVEAAoJEDGq6kdZTbvtAGMP/0yF9p4tvy3tTDxo8yhscZV6NF
 ei6syJ8xbHplIjOUpTHMujkO/FchhlK9QYfbOMbZosfd7GkhHfNRIU74r6PseRiC7c+B4fZ1jlR
 V52ZnrV/2jmwLfnXEEVCxvl+WHURlFvuzEzvQbSQ3zR/tXSI9qcz/i0r0OP4MX6ckce3gFRjWtS
 VfibLgzxmrl5kOgMa6Km+BUEdY5uLg/NzR12kd4F1IoMqsTUqmglsJbb45TvBNF0+o6jrILKe6q
 8QMFEQyyegzs2s4QDZQfQzlYqvHEiPiZ3H9lFjeU1HrpYIUc7p3i/LyMyeBMNxIh86pZiXibEUM
 JN8OsTacDNLY4+AK5PleMY5x4mnOFqVzROXP89qhU6qrWR1fbmE/95H3lZ9T83PdcoSVPRfATXf
 Pp5p2V8u6BPq8GlkIO83m1CRyzB+Q5YJH4Zthh1Qbfm+npG2BpnLR8Z0UpHsZ2dO4aLPcTfQ5XI
 dvxX9nEa0Yh7smVWkWJ8f/P60eSCOgmujNS7wEtkOQBKIR7PQ9moLXYdVRN3g5avbownOei5IQi
 ahu9EuA5XPZXlEBF1IQ9xjBz6xpi30pfSQb+V+3Wd7ML/iM8g4+0c4khZ0s/92TZcLTiATEf1W9
 vym3tOploadUasjB3tR6IFEW+Kk5GiEx+atnh3dvoSXTrgI+UJedv6cbZH
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

gpio irq which using three-cell scheme should always call
instance_match() function to find the correct irqdomain.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
The select() function will be called with !DOMAIN_BUS_ANY,
kernel/irq/irqdomain.c:556: if (h->ops->select && bus_token != DOMAIN_BUS_ANY)

so vendor gpio driver need to explicitly set bus_token, something like:

drivers/gpio/gpio-spacemit-k1.c
  irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);

I hope this is a feasible way..
---
 drivers/gpio/gpiolib.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb143c4b3357106de1570e8d38441372..7912ae1d049d7c2574400c6ff53405d130521773 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1450,9 +1450,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
 						   unsigned int *type)
 {
 	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
+	if (is_of_node(fwspec->fwnode) && fwspec->param_count <= 3)
 		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
-	}
 
 	/* This is for board files and others not using DT */
 	if (is_fwnode_irqchip(fwspec->fwnode)) {
@@ -1754,9 +1753,25 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_data(irq, NULL);
 }
 
+static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
+			enum irq_domain_bus_token bus_token)
+{
+	struct fwnode_handle *fwnode = fwspec->fwnode;
+	struct gpio_chip *gc = d->host_data;
+	unsigned int index = fwspec->param[0];
+
+	if ((gc->of_gpio_n_cells == 3) && gc->of_node_instance_match)
+		return gc->of_node_instance_match(gc, index);
+
+	/* Fallback for twocells */
+	return ((fwnode != NULL) && (d->fwnode == fwnode) &&
+		(d->bus_token == bus_token));
+}
+
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
 	.unmap	= gpiochip_irq_unmap,
+	.select	= gpiochip_irq_select,
 	/* Virtually all GPIO irqchips are twocell:ed */
 	.xlate	= irq_domain_xlate_twocell,
 };

-- 
2.48.1


