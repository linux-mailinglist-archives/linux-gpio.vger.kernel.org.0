Return-Path: <linux-gpio+bounces-17987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD58A70C8B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 23:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1FEE166E70
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 22:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C29B269816;
	Tue, 25 Mar 2025 22:08:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651526980B;
	Tue, 25 Mar 2025 22:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742940483; cv=none; b=KY7xuDRRvu9wnIFfULxIW2ruYmEFQezmEPhUoBVJJG0vwbrhgjzgoL0Q5yyen9650Fnub0G+MXhQNTqf0jX5ExVNptsC7GGBPja1X5CFMpTyRYshyTy/z1Kei2iNAzbfzA6vc390ifRyJuSVPf5K/EJCuAJjm7BdBAA/w01KnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742940483; c=relaxed/simple;
	bh=6XcMNqeJ8eep/iU0w+JlcRRBRJJGw1Yh+Cs/jq0Nd2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9LGNaYGfnR71zMZ1iZub6+4k0a0VteVaAk0l3kDNzf4Sx72g16xAh68WXR5MRhms7QS/rUSVQIhEh4WBsbUM+YuB+V6KkZPewZSzFfddIoz9hQAYGWM7sE68uiwnuhUqEC0+E7Ymq/W9d4peopD1XNbOq6QM3JciG/HcXNl40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A41253433E3;
	Tue, 25 Mar 2025 22:07:58 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Mar 2025 06:06:20 +0800
Subject: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4016; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=6XcMNqeJ8eep/iU0w+JlcRRBRJJGw1Yh+Cs/jq0Nd2k=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn4yk0AgqmRiWboZyz7EYEDeW5RDk0cbVXsk323
 72PtEDHltOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ+MpNF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XQTD/4ubq2QKcTlkAFLx0
 3u5LxCupZ/f1nbBiUDxY3RQ0bbfrFfe4Zs/ygBp8Dsl29IS8BE6hP2gWMWKusC2ipw2h0kDKBtf
 AKRp130ztq6a8tLF5jQVW1+gDbmRRbk+VFHHgSn2k6NUKAYkESFDPDCJkv6xMtyAz9001uISB9+
 wVLbRK3uCkc8ln4tpuEK5bXP5R93GkiGxbcGkjERQiMYXMUI7KKadGFhtZJTdqCc3FWJR3Dr4au
 fcwOuXEeUdjtQn0o8Zevjfxl/DzgnhSFxtnIDTGTYgND6QkkqbZ2J4WF75wGYjVKguz5MIC6qLz
 pHo+gcKbmxNHnhFd13soI6MR8/JOMxiwL+6+x/8g/IcpMcVilT7PBhsvgwmVR2MLX2P2tV6Q2Vf
 w/x5s4qKfg1/PD/CPJyRPDrTaFcMDI78Ef6Z8HD8lDFp/SlQsa4wqFKm5RUdm+UWS5cDESz2Xwz
 qWTz2RM2AuZ/+DgMFWK6ceIehsoNEz8ZD1ZPGHG3l21AtvNUryNPLzzn51paDnMb6iNE7XvIdVI
 dgZ4E/Y5sFioAJh2usJHYToYT1nINBdnhhVRSKCGqIy2/i+FIxXpIuLGzhQXPaCPkNIqJXNC0kC
 jx4gJcwTHcx6k+S5VfaNnMFkS2joNzg6wPrvZBI9doeE5OrFy25wAJifRm7vGh6+wqKQ==
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
 drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)

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
index 679ed764cb143c4b3357106de1570e8d38441372..0729d951ef1fb8431f80f98d09cfbb383c7dffab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1450,9 +1450,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
 						   unsigned int *type)
 {
 	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
-		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
-	}
+	if (is_of_node(fwspec->fwnode))
+		return irq_domain_translate_twothreecell(d, fwspec, hwirq, type);
 
 	/* This is for board files and others not using DT */
 	if (is_fwnode_irqchip(fwspec->fwnode)) {
@@ -1754,11 +1753,26 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_data(irq, NULL);
 }
 
+static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
+			       enum irq_domain_bus_token bus_token)
+{
+	struct fwnode_handle *fwnode = fwspec->fwnode;
+	struct gpio_chip *gc = d->host_data;
+	unsigned int index = fwspec->param[0];
+
+	if (fwspec->param_count == 3 && is_of_node(fwnode))
+		return of_gpiochip_instance_match(gc, index);
+
+	/* Fallback for twocells */
+	return (fwnode && (d->fwnode == fwnode) && (d->bus_token == bus_token));
+}
+
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
 	.unmap	= gpiochip_irq_unmap,
+	.select	= gpiochip_irq_select,
 	/* Virtually all GPIO irqchips are twocell:ed */
-	.xlate	= irq_domain_xlate_twocell,
+	.xlate	= irq_domain_xlate_twothreecell,
 };
 
 static struct irq_domain *gpiochip_simple_create_domain(struct gpio_chip *gc)

-- 
2.48.1


