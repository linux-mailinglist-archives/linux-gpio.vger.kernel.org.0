Return-Path: <linux-gpio+bounces-13151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB99D369D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 10:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 295AE283BB6
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB5B156F20;
	Wed, 20 Nov 2024 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JMQAfQU2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5141918A956;
	Wed, 20 Nov 2024 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094133; cv=none; b=BhbWRBA3HNcY2Fub4rbSRdwm+fiqPrTm7yn5A3LaW/No0QDyKRtN6cf1QUI4Dp+kvRNrc1KY997AAV/xiE/gCpOsEYATtS5Vxk5t9LVeIqEtWVB8zMeOLs4UBAkyKGnuct8sVIVtIZUHqJ6nOR5VQ4KuHenfp5uZvNj5wDwRnBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094133; c=relaxed/simple;
	bh=wSe5QddiVgQxNOaD6oGwRFNMnEIo8FZcNh+SbeJBrug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XLjVJUI7CeiorZZLYncdD3uS72JDKw+/sDCdvpYd9Njv+WDlTFoKNDAQbk8/y4LalwGY+GkE9X0osSt4L9VcSq7L4MmTq6hfW7vwVaW+35Oc9X8jGXHI5YQiDJdGizoFaxsT4CDW8p+0FKWq6cI+2eUhFg8MlsgTdGVPYVoF3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JMQAfQU2; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ioayO
	sAWaQXmu+VuhRxkOmZDwOakxhPl3mb+f0DnSqY=; b=JMQAfQU2Kkhazo58QUg5V
	Bp5NuLGcBxS0EC4UocZZcNL6PGLfzJYtrRRWmiVAXH9s0OCsIb+v3qyA0dKOXqn6
	8YNO6icsZdSEOu1glFndytI0MZO2YWvdUR1pne2BOMntcHdf+kjmz8vPPXu/b8St
	hed//LedJ18c2huz7eOOTw=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn1tSNqD1nifurIg--.60055S4;
	Wed, 20 Nov 2024 17:15:10 +0800 (CST)
From: David Wang <00107082@163.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: kees@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	David Wang <00107082@163.com>
Subject: [PATCH 1/3] gpio: Fix a potential abuse of seq_printf() format string
Date: Wed, 20 Nov 2024 17:14:51 +0800
Message-Id: <505e5950dd2d76e6c3a8af57bc0cd1e0fbf2b637.1732093745.git.00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn1tSNqD1nifurIg--.60055S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFy8XF1UuF1DXw1UXrWUArb_yoW3Xr1UpF
	yYvFy8Ar4DJF1YqFyUAan7Za4Yk3WayFW2gF1Sk34fZr1UtrZrKFW7tFWxZFs0qry8Zr4a
	vr4qgFyUGF18Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p__-BDUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hKdqmc9pPVwvgAAsy

Using device name as format string of seq_printf() is prone to
"Format string attack", opens possibility for exploitation.
Seq_puts() is safer and more efficient.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
 drivers/gpio/gpio-aspeed.c       | 2 +-
 drivers/gpio/gpio-ep93xx.c       | 2 +-
 drivers/gpio/gpio-hlwd.c         | 2 +-
 drivers/gpio/gpio-mlxbf2.c       | 2 +-
 drivers/gpio/gpio-omap.c         | 2 +-
 drivers/gpio/gpio-pca953x.c      | 2 +-
 drivers/gpio/gpio-pl061.c        | 2 +-
 drivers/gpio/gpio-tegra.c        | 2 +-
 drivers/gpio/gpio-tegra186.c     | 2 +-
 drivers/gpio/gpio-tqmx86.c       | 2 +-
 drivers/gpio/gpio-visconti.c     | 2 +-
 drivers/gpio/gpio-xgs-iproc.c    | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

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
-- 
2.39.2


