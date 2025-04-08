Return-Path: <linux-gpio+bounces-18509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD00A80F8E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 17:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BCB61888C07
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1964321CC55;
	Tue,  8 Apr 2025 15:11:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC821CCEE2;
	Tue,  8 Apr 2025 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125103; cv=none; b=V8Sz6yw+23HkWXPB3P0KscHB02CZN7aDxO5dGHN3I6yLe4j/7mSlHcUOyJIgGNSCDdi3W6jwmQ8odqMY8/mfSUUm3evlWApNeUfE9uiaV7saSoVMT8y0EstSWPfVDNNXM595gQcgMQ+fz4iUCoSHpl3Rz2Dz83kVikp5G5Q0tOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125103; c=relaxed/simple;
	bh=kJqo/8IGdQrE3R8digcDbm08uHIaoAS8anwz06A50Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hLDTBPOLPrdZYXIvnd/WPybIt6lDs75m/uLBprL1UP7rsq/EWQFNvGedGGf4QuLa43TINlwy2YdUGIrystH1xHeD8EXwznIpUFZ+uo6wtRrh2N9myUZTsOKGfK4zvUR0Jr6w/OtFDS6tLwkO0c055Y5x2+j/zJ1S/mcjmf3NR3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 69853343026;
	Tue, 08 Apr 2025 15:11:38 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 08 Apr 2025 23:11:20 +0800
Subject: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts
 scheme
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAJc89WcC/4XOTWrDMBAF4KsYrasy+rHsZJV7lCxG0tgWJFYiq
 SYl+O5VnUVbSuhm4M0wH+/OMqVAme2bO0u0hBziXIN+aZibcB6JB18zkyBbkLLjoPl4CZGHdOV
 lSkSOTiduDAmCTrkeDKu/l0RDuG3u2/GRE13fK18eS2YxE3fxfA5l3+zId9oPCL2UFtue0CE5I
 wYrjPV6IKs0tmjYlzWFXGL62CovYsP+abcIDlwjab8TFtG7w0hzifE1pnEjF/nNKJDPmHrgSg9
 CoVcdof7DqB+MNM8YVRlEC2DqIIBfzLqun64ZJ0yVAQAA
X-Change-ID: 20250227-04-gpio-irq-threecell-66e1e073c806
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5570; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=kJqo/8IGdQrE3R8digcDbm08uHIaoAS8anwz06A50Qs=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn9TymmoKaxPjndUkTL/uONIdEU8latJ+8KRdoF
 eUmS9ZwlFmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/U8pl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277U5RD/9IuD5VKbjaRZvD8L
 fMjaoKhPQ4VuBlrYfEi25ZTVhsYkwpbpNTyGHKCVcdjnOf5lk4/hQL2GwFX1QfgTbLiAbmxrPrA
 qcNFmtYbQefEYGg265P+dFhxTYVca1lJJsMrE5slJSvZMAnD4O7GnipUyVG68sppsrKbk7pqsoX
 P6aMk0TweiCBJWtQq3I37UKoDsciw6c+54xsceNiD1KkTi4JX8KtXGIi7Ws2I2WP/Kscbl/ta3P
 k49t544lwEOzhT/OCE9YOxmmA8JXThzj+1355bJSHTnZhLiFxH9nSA4P5yNzlpzwPaDKgvAv5NI
 vDQzSM2Ec2bcFFc8NRSQ6QpIwRddx02oCAeuklfPcDROutKBc3K5OopQV94gWpVxqCTxPacTaVh
 YAHd+/YkXGlOuuE8w9fyX3NxhalhLUj6VR6QY5n9twZOLDpxr6ufdp8jN0RNzzmhvNCjI23dsC1
 SCwtprvXEhfeSoddRCr0DrrgvZucV/Rk9IZ9hfzSbzOAPkfPFPt7feBB95KDwkj4exIQYhjvDQ0
 Y5r+flQO4bIhraJpxCVDwiFaxIZhB4eGvXYiZ86iKwEbBK6JTPTNdQ/J1zzz45AXV9/+se7Ij56
 jQz3GpXEnWSMF9cTx853fEFMqfeAFtpxumtPsqJ8DgNTHJzGrgwwpGl+JA9KUyuTcl2w==
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
In this patch [1], the GPIO controller add support for describing
hardware with a three-cell scheme:

    gpios = <&gpio instance offset flags>;

It also result describing interrupts in three-cell as this in DT:

    node {
            interrupt-parent = <&gpio>;
            interrupts = <instance hwirq irqflag>;
    }

This series try to extend describing interrupts with three-cell scheme.

The first patch will add capability for parsing irq number and flag
from last two cells which eventually will support the three-cells
interrupt, the second patch support finding irqdomain according to
interrupt instance index.

Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
---
Changes in v4:
- rebase patch [2/2] to gpio's for-next branch, no changes
- drop [1/2] of patch v3 which merged into irq tree
- Link to v3: https://lore.kernel.org/r/20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org

Changes in v3:
- explicitly introduce *_twothreecell() to support 3 cell interrupt
- Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org

Changes in v2:
- introduce generic irq_domain_translate_cells(), other inline cells function 
- hide the OF-specific things into gpiolib-of.c|h
- Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org
---
 drivers/gpio/gpiolib-of.c |  8 ++++++++
 drivers/gpio/gpiolib-of.h |  6 ++++++
 drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f29143c71e9db61a6ad6d45d64e88a3f3f2d4fa7..3651c4178b81a1346809ec43b91a532e9f48af2b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1285,3 +1285,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
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
index 8252a671d7208105a315bdc914acb092d5f95e79..ed8397a88dea1d92c3d4cb3cc9a6b30be29d31f6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1507,9 +1507,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
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
@@ -1811,11 +1810,26 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
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

---
base-commit: 9ed74dfa0822ba58eacaec61fb16bd4feb34a5a6
change-id: 20250227-04-gpio-irq-threecell-66e1e073c806

Best regards,
-- 
Yixun Lan


