Return-Path: <linux-gpio+bounces-13152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9369D36EE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 10:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E879A1F2708A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 09:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DBB19DF40;
	Wed, 20 Nov 2024 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L1MODHOP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275BE19D8A9;
	Wed, 20 Nov 2024 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094331; cv=none; b=cGopDrPGhE0Fat+78gGA3BckgLpkl49QSePhzasi8l4Eq6cCG7fwxmxDDjv7wEne1dKXZGOoWE3OIX4IHq+SwRtKpvbVhD3CMmt1HZfBnFLvf97Qm0w+jghxD3nKnhnvixHs8CorE+FvflOjNXZD0yitpcJx8vLbcAGRJVtAq2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094331; c=relaxed/simple;
	bh=+1lp7Gs+nbopp5+xlmTPAa3SjIQYCBnmzEDpeD//iTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XeUnxl06YkmDLDOQ0E7bhkksew/aAjv8j+/KuuLDElfjHoVOFy/js8EBY+UqHzu+d9qI7CPoodDDRQqPpaxv0IXxTdqXG4Nh+eLgKMZ9fKU/4+9AqlrDm0HLtboJAnGojlWCpHAA2Ba9SZSymWx5V4GSqBi/gFHFuqeFA2AkRcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L1MODHOP; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=X7NmX
	eNMZrpE4xxuV4Osc9gaedHkw4Y2+Jp+z5tu668=; b=L1MODHOPY1MqT9rvyh4Wv
	BAI/+jhog45+Y/5nDYf1/OH97QLECFoTQzhOLmsrS4RzEuUhm/orm8FIYVKgHF6p
	MCXawG4VHnjB3aQWfWVEnBrt/RJQDBI3cTWdtbvZdTE1U5G/NB9Hp7ZrdzBpe0Xq
	y2OjrVoOuc+IjU1lkQ8blY=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCn275jqT1n6zt8EA--.52105S4;
	Wed, 20 Nov 2024 17:18:35 +0800 (CST)
From: David Wang <00107082@163.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	David Wang <00107082@163.com>
Subject: [PATCH 3/3] pinctrl: Fix a potential abuse of seq_printf() format string
Date: Wed, 20 Nov 2024 17:18:25 +0800
Message-Id: <24caaeb7ef27daf12e32cbb914858a029f0da117.1732093745.git.00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <505e5950dd2d76e6c3a8af57bc0cd1e0fbf2b637.1732093745.git.00107082@163.com>
References: <505e5950dd2d76e6c3a8af57bc0cd1e0fbf2b637.1732093745.git.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCn275jqT1n6zt8EA--.52105S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4rKr17AFW7Wr17urW5GFg_yoWrAw1UpF
	W3GF1Yyr45Jw4DWry5AwsruFy3G3WIyrWjgw1Sg343ZF45Ar4kt3W3KFWxZFs09rWkJr13
	Zr45XFyDWF18J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEfHU7UUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqRGdqmc9oqUyfQAGsb

Using device name as format string of seq_printf() is prone to
"Format string attack", opens possibility for exploitation.
Seq_puts() is safer and more efficient.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c          | 2 +-
 drivers/pinctrl/pinctrl-stmfx.c             | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c            | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

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


