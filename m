Return-Path: <linux-gpio+bounces-13138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEC9D3325
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 06:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EFD6B22974
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 05:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABE4156669;
	Wed, 20 Nov 2024 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZYW1h/X5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362311547FD;
	Wed, 20 Nov 2024 05:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732080740; cv=none; b=LeRQplP5DKcHnqDBr3/EPHxcZR/g0CLcxAUfKbGBSPANJcKMTJlOBHnsYqQogfQbyCAWrISJYtVlYwNEcB8rRksejjbdH+wwph1U3ZHAAErLI56F8gkY3V5UbZzjck3HMpXF+a0VZB44vn4vO/l00PJNnxC1fRtGWRacvD1z3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732080740; c=relaxed/simple;
	bh=on1JqXs+xT53FoA5EEsRdl5uR5qOedDssO0Qxj0FFkg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gVkKOjayi1QCTxD3p7HXY5nIZ3zNrrivc7oKPN758bA8IW2xod1wxX1kN1n3kbudcx1SahILHzTvQaQxcqezToXGsJsP1HenS0NjWuHyK6vrvLptywQPh7uqJmfBQySlVga8qsNqpYEzgZTV8nML4fqCEmxoMnWd8/lPclfTKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZYW1h/X5; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FJ5Os
	ulEQIfoCCiNk0mUQLbw1J904F1XyOhy2DLo6y8=; b=ZYW1h/X51nNDKnr7jdbw7
	xWYK4SM9q18JDi9lbj5gDsHsdpolgLBdIlyKV+TrO1Wel2cZi/opDmfglf3NS3Gt
	Zl/0S4XajKw+mli0B4ykN3KOZumJ/CTxO3zBPf7wuI40GVUmk+jP+OiEPbquf/e/
	kbfgyUa5BVke0cluE7+6DI=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXDP0QdD1ngyaPCQ--.49125S4;
	Wed, 20 Nov 2024 13:31:11 +0800 (CST)
From: David Wang <00107082@163.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	geert@linux-m68k.org,
	David Wang <00107082@163.com>
Subject: [PATCH] Fix a potential abuse of seq_printf() format string in drivers
Date: Wed, 20 Nov 2024 13:30:55 +0800
Message-Id: <20241120053055.225195-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXDP0QdD1ngyaPCQ--.49125S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3CF4fArWrtFy8CF15KFyDWrg_yoW8Jw4rAo
	WfZr13J3W8Xr1xX343JFn2yF9xZanrZ3WrAwsruws8uFy7Xw4Fya17Aw1fCFyIq345Gry8
	Za48J3y3Jr47GFn7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTR7l1kUUUUU
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMxedqmc9Zvj+0QAAs4

Using device name as format string of seq_printf() is proned to
"Format string attack", opens possibility for exploitation.
Seq_puts() is safer and more efficient.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c            | 2 +-
 drivers/gpio/gpio-aspeed.c                  | 2 +-
 drivers/gpio/gpio-ep93xx.c                  | 2 +-
 drivers/gpio/gpio-hlwd.c                    | 2 +-
 drivers/gpio/gpio-mlxbf2.c                  | 2 +-
 drivers/gpio/gpio-omap.c                    | 2 +-
 drivers/gpio/gpio-pca953x.c                 | 2 +-
 drivers/gpio/gpio-pl061.c                   | 2 +-
 drivers/gpio/gpio-tegra.c                   | 2 +-
 drivers/gpio/gpio-tegra186.c                | 2 +-
 drivers/gpio/gpio-tqmx86.c                  | 2 +-
 drivers/gpio/gpio-visconti.c                | 2 +-
 drivers/gpio/gpio-xgs-iproc.c               | 2 +-
 drivers/irqchip/irq-gic.c                   | 2 +-
 drivers/irqchip/irq-mvebu-pic.c             | 2 +-
 drivers/irqchip/irq-versatile-fpga.c        | 2 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c          | 2 +-
 drivers/pinctrl/pinctrl-stmfx.c             | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c            | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 72755fee6478..34eb26298e32 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -420,7 +420,7 @@ static void aspeed_sgpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	int offset;
 
 	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
-	seq_printf(p, dev_name(gpio->dev));
+	seq_puts(p, dev_name(gpio->dev));
 }
 
 static const struct irq_chip aspeed_sgpio_irq_chip = {
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index ea40ad43a79b..7f3292d9f016 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1102,7 +1102,7 @@ static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	if (rc)
 		return;
 
-	seq_printf(p, dev_name(gpio->dev));
+	seq_puts(p, dev_name(gpio->dev));
 }
 
 static const struct irq_chip aspeed_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index ab798c848215..58d2464c07bc 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -249,7 +249,7 @@ static void ep93xx_irq_print_chip(struct irq_data *data, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, dev_name(gc->parent));
+	seq_puts(p, dev_name(gc->parent));
 }
 
 static const struct irq_chip gpio_eic_irq_chip = {
diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 1bcfc1835dae..0580f6712bea 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -210,7 +210,7 @@ static void hlwd_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
 
-	seq_printf(p, dev_name(hlwd->dev));
+	seq_puts(p, dev_name(hlwd->dev));
 }
 
 static const struct irq_chip hlwd_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 6abe01bc39c3..6f3dda6b635f 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -331,7 +331,7 @@ static void mlxbf2_gpio_irq_print_chip(struct irq_data *irqd,
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf2_gpio_context *gs = gpiochip_get_data(gc);
 
-	seq_printf(p, dev_name(gs->dev));
+	seq_puts(p, dev_name(gs->dev));
 }
 
 static const struct irq_chip mlxbf2_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 76d5d87e9681..279524b640ae 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -715,7 +715,7 @@ static void omap_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 
-	seq_printf(p, dev_name(bank->dev));
+	seq_puts(p, dev_name(bank->dev));
 }
 
 static const struct irq_chip omap_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 3f2d33ee20cc..272febc3230e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -815,7 +815,7 @@ static void pca953x_irq_print_chip(struct irq_data *data, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, dev_name(gc->parent));
+	seq_puts(p, dev_name(gc->parent));
 }
 
 static const struct irq_chip pca953x_irq_chip = {
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index a211a02d4b4a..1c273727ffa3 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -291,7 +291,7 @@ static void pl061_irq_print_chip(struct irq_data *data, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, dev_name(gc->parent));
+	seq_puts(p, dev_name(gc->parent));
 }
 
 static const struct irq_chip pl061_irq_chip = {
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 6d3a39a03f58..9ad286adf263 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -600,7 +600,7 @@ static void tegra_gpio_irq_print_chip(struct irq_data *d, struct seq_file *s)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
-	seq_printf(s, dev_name(chip->parent));
+	seq_puts(s, dev_name(chip->parent));
 }
 
 static const struct irq_chip tegra_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1ecb733a5e88..6895b65c86af 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -610,7 +610,7 @@ static void tegra186_irq_print_chip(struct irq_data *data, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, dev_name(gc->parent));
+	seq_puts(p, dev_name(gc->parent));
 }
 
 static const struct irq_chip tegra186_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index f2e7e8754d95..5e26eb3adabb 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -275,7 +275,7 @@ static void tqmx86_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	seq_printf(p, gc->label);
+	seq_puts(p, gc->label);
 }
 
 static const struct irq_chip tqmx86_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index ebc71ecdb6cf..5bd965c18a46 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -142,7 +142,7 @@ static void visconti_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct visconti_gpio *priv = gpiochip_get_data(gc);
 
-	seq_printf(p, dev_name(priv->dev));
+	seq_puts(p, dev_name(priv->dev));
 }
 
 static const struct irq_chip visconti_gpio_irq_chip = {
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index d445eea03687..e9390f136b3c 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -198,7 +198,7 @@ static void iproc_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
 
-	seq_printf(p, dev_name(chip->dev));
+	seq_puts(p, dev_name(chip->dev));
 }
 
 static const struct irq_chip iproc_gpio_irq_chip = {
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 3be7bd8cd8cd..8fae6dc01024 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -400,7 +400,7 @@ static void gic_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gic_chip_data *gic = irq_data_get_irq_chip_data(d);
 
 	if (gic->domain->pm_dev)
-		seq_printf(p, gic->domain->pm_dev->of_node->name);
+		seq_puts(p, gic->domain->pm_dev->of_node->name);
 	else
 		seq_printf(p, "GIC-%d", (int)(gic - &gic_data[0]));
 }
diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
index 08b0cc862adf..b815a60f930c 100644
--- a/drivers/irqchip/irq-mvebu-pic.c
+++ b/drivers/irqchip/irq-mvebu-pic.c
@@ -71,7 +71,7 @@ static void mvebu_pic_print_chip(struct irq_data *d, struct seq_file *p)
 {
 	struct mvebu_pic *pic = irq_data_get_irq_chip_data(d);
 
-	seq_printf(p, dev_name(&pic->pdev->dev));
+	seq_puts(p, dev_name(&pic->pdev->dev));
 }
 
 static const struct irq_chip mvebu_pic_chip = {
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index ca471c6fee99..0abc8934c2ee 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -69,7 +69,7 @@ static void fpga_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
 	struct fpga_irq_data *f = irq_data_get_irq_chip_data(d);
 
-	seq_printf(p, irq_domain_get_of_node(f->domain)->name);
+	seq_puts(p, irq_domain_get_of_node(f->domain)->name);
 }
 
 static const struct irq_chip fpga_chip = {
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index fd5ce52d05b1..c9a3d3aa8c10 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -309,7 +309,7 @@ static void iproc_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
 
-	seq_printf(p, dev_name(chip->dev));
+	seq_puts(p, dev_name(chip->dev));
 }
 
 static const struct irq_chip iproc_gpio_irq_chip = {
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 4c4ada06423d..335744ac8310 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -734,7 +734,7 @@ static void armada_37xx_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 
-	seq_printf(p, info->data->name);
+	seq_puts(p, info->data->name);
 }
 
 static const struct irq_chip armada_37xx_irqchip = {
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 737d0ae3d0b6..d66c3a3e8429 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -569,7 +569,7 @@ static void mcp23s08_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
-	seq_printf(p, dev_name(mcp->dev));
+	seq_puts(p, dev_name(mcp->dev));
 }
 
 static const struct irq_chip mcp23s08_irq_chip = {
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index d2c5321dd025..31d68183b743 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -599,7 +599,7 @@ static void stmfx_pinctrl_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(d);
 	struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
 
-	seq_printf(p, dev_name(pctl->dev));
+	seq_puts(p, dev_name(pctl->dev));
 }
 
 static const struct irq_chip stmfx_pinctrl_irq_chip = {
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index fd0331a87cda..dbe14566e1f3 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -584,7 +584,7 @@ static void sx150x_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 
-	seq_printf(p, pctl->client->name);
+	seq_puts(p, pctl->client->name);
 }
 
 static const struct irq_chip sx150x_irq_chip = {
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5a403915fed2..8742b440339e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2290,7 +2290,7 @@ static void rzg2l_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, dev_name(gc->parent));
+	seq_puts(p, dev_name(gc->parent));
 }
 
 static int rzg2l_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
-- 
2.39.2


