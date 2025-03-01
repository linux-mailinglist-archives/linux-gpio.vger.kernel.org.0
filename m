Return-Path: <linux-gpio+bounces-16875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA511A4AE4F
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 00:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699291894D67
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 23:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D5D1E9B06;
	Sat,  1 Mar 2025 23:16:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55041E98F3;
	Sat,  1 Mar 2025 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740870967; cv=none; b=OpMkN5mlV8CVIrdhhtMEppfZ8krzgjfROM0rf0MB993CDxNo6Rs6sNC/HQNvuSA1Q0BhEh9m+ImN9DmC/hh89pBykuoJsbkbpTM1v7wim8yPzCw8r+zHSmWrLKygGIHJh6egNM9YluEghd27MI4W9p9DRplZZ+V/+MsJ+Gue2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740870967; c=relaxed/simple;
	bh=hyZqVR03EhL39rF1NmzjFOxT29nNBXH9JZ/Nl44J5dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpE0AzusOopHWQHEjdeak1HVct9r3MBsKw4ja8VD8KipLnWQQkt67EdWvy26D1hI3G0agEk2pFbFl7MB/Hq4tKEiRIRQpBxNRGSvwdGFUx2xrsa5Ssqk2rfCTbwpEW4opN7/wkSnIW2MORamUQ51/uaNW1+hm8hXqQvq8NM+mzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C1FB5342FE4;
	Sat, 01 Mar 2025 23:16:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 02 Mar 2025 07:15:33 +0800
Subject: [PATCH v2 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3986; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=hyZqVR03EhL39rF1NmzjFOxT29nNBXH9JZ/Nl44J5dw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnw5UoVznx9yFnmZyWsDdwM23YTeLoSM+HCHRLH
 aCSZ0EAzPmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8OVKF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Vh6D/9xRzzWCqG8JpGYAy
 2gMH3Q7ngDnqrpP94VNrrDdpnt3L5R4rhZNqlBMB1dYBaWJGOIEkcPs6Ir1k3/gL8QW31FIEqJ5
 BsHHyd2WA6QSWrIJEfcSCwDaWSsoA8dze2ZxB6Zf590wmqB7M8cCSFqfSW83pTlWxuwpcQrinq7
 geY5osBXav0wsfHBlIHVtk2qVRhE7gZShF6xfyrjSpSCylAKz41ogpgUdyUpk21SMlhGiSqy4Pd
 gaIlasnEh3N6f2tBZnM9r/Djtq8ll/iNA4bLnF0g5ePX2+NSmz8QrAXHdBpekyqePKiezLxQRq1
 r9ASGYDj0PWX20lLupaEFCr08HCgNQWZ4ssuyhDyTOazJjqUNH/PgNrp5pxdXqBki+GktRZw2aY
 AWRTq8MC/nvWoO357TfIRqjy+pDp8veDR/etuppG25uQcWnpWCzZPCtCMsgTrWiM9NMNPFPqJTc
 09s/vd5TY/BgQKoEt11JeoDNbvfH6NehyfHOUjCinPlS0BJRnzxbFtoHJYo3Lkh9VUmXwh23JSf
 bndbvh1MSR8Ol/ZxTs/IIhtVleIrQWrhGanXjr2aVrjVrNzXCGTnX6jegzC2i/RoeTFAOWoneKb
 nnsKOgy1+9BVBF9Z8d9JDEYWhMDTKkZoeAt0pAmd74oy01quE3Z3qzFgz4KZt646qsGg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

gpio irq which using three-cell scheme should always call
instance_match() function to find the correct irqdomain.

The select() function will be called with !DOMAIN_BUS_ANY,
so for specific gpio irq driver, it need to set bus token
explicitly, something like:
  irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/gpiolib-of.c |  8 ++++++++
 drivers/gpio/gpiolib-of.h |  6 ++++++
 drivers/gpio/gpiolib.c    | 23 +++++++++++++++++++----
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..e19904569fb1b71c1fff237132d17050ef02b074 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1187,3 +1187,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
 {
 	of_node_put(dev_of_node(&chip->gpiodev->dev));
 }
+
+bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)
+{
+	if (gc->of_node_instance_match)
+		return gc->of_node_instance_match(gc, index);
+
+	return false;
+}
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 16d6ac8cb156c02232ea868b755bbdc46c78e3c7..3eebfac290c571e3b90e4437295db8eaacb021a3 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -22,6 +22,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np,
 			       unsigned long *lookupflags);
 int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
+bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
 int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
 #else
 static inline struct gpio_desc *of_find_gpio(struct device_node *np,
@@ -33,6 +34,11 @@ static inline struct gpio_desc *of_find_gpio(struct device_node *np,
 }
 static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
 static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
+static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
+					      unsigned int index)
+{
+	return false;
+}
 static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 				const char *con_id)
 {
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb143c4b3357106de1570e8d38441372..266be465b9103c17861a0d76f2dfbf1f1de3a073 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1449,10 +1449,9 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
 						   unsigned long *hwirq,
 						   unsigned int *type)
 {
-	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
-		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
-	}
+	/* We support standard DT translation up to three cells */
+	if (is_of_node(fwspec->fwnode))
+		return irq_domain_translate_cells(d, fwspec, hwirq, type);
 
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
+	if (fwspec->param_count == 3 && is_of_node(fwnode))
+		return of_gpiochip_instance_match(gc, index);
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


