Return-Path: <linux-gpio+bounces-24496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F50B2A269
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 14:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87B89177094
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 12:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587D6310640;
	Mon, 18 Aug 2025 12:50:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC0830E83F;
	Mon, 18 Aug 2025 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521442; cv=none; b=BNIRl8/h7lW0XtXG6QNC4bEImOqCXSovylR1mcCL9pvCw43TdlR6O+sIZe32jBtHs/LOxCXdIqkpGsTBEacn2IEgCov8y7Z9RAQ3IZWPCHtXvrHC4VtRTh5xEsOF6t2WfAQJAQRjXHS+Alt25bhW/03qkFp5HOUWUN/9eFeRlYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521442; c=relaxed/simple;
	bh=WIwD/aV2APN6RKkjI1zciy6jWLCpZwtUH96xPLDt4PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sTKZgWGDkFjtv5gHk1FC2W/HNYlMNqtSTLZqsAPrA8YeZH3sw6ga7iuJJ+XklVQJfZNbmRhKYJ/GjGvZm1fqo9/Ird+f4obo5pvTZvbKf0HVJMSfYNqgwa4FFxSlycdlw078rbz0elxzf0v7LIu9OD89iQbk1eJRDBCd4ys7IYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5C6R02grz9sSn;
	Mon, 18 Aug 2025 14:42:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsAukN0ObK6o; Mon, 18 Aug 2025 14:42:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5C6Q68YSz9sSm;
	Mon, 18 Aug 2025 14:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BE5318B764;
	Mon, 18 Aug 2025 14:42:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sE7NHJzNPKm3; Mon, 18 Aug 2025 14:42:38 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 912DD8B763;
	Mon, 18 Aug 2025 14:42:38 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anatolij Gustschin <agust@denx.de>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
Date: Mon, 18 Aug 2025 14:42:24 +0200
Message-ID: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755520944; l=9508; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=WIwD/aV2APN6RKkjI1zciy6jWLCpZwtUH96xPLDt4PU=; b=v6uxfxPYngNij24z+iG6/2f7mq8NGHCHim/IJGuC0KkKPlZlogsEZmUUfLDt/gDm8dOqC18Z7 8weUTGAVd1oAgeq2r/bpTNj9q436vvsvFUNE3y+3SX7PvMqmkebvhvO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Remove legacy-of-mm-gpiochip.h header file. The above mentioned
file provides an OF API that's deprecated. There is no agnostic
alternatives to it and we have to open code the logic which was
hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
drivers are using their own labeling schemas and resource retrieval
that only a few may gain of the code deduplication, so whenever
alternative is appear we can move drivers again to use that one.

[text copied from commit 34064c8267a6 ("powerpc/8xx:
Drop legacy-of-mm-gpiochip.h header")]

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/gpio/Kconfig        |  1 -
 drivers/gpio/gpio-mpc5200.c | 78 ++++++++++++++++++++-----------------
 2 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e43abb322fa6..07be52f6db7a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -485,7 +485,6 @@ config GPIO_MM_LANTIQ
 config GPIO_MPC5200
 	def_bool y
 	depends on PPC_MPC52xx
-	select OF_GPIO_MM_GPIOCHIP
 
 config GPIO_MPC8XXX
 	bool "MPC512x/MPC8xxx/QorIQ GPIO support"
diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index dad0eca1ca2e..00f209157fd0 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -8,7 +8,7 @@
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
+#include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
@@ -19,7 +19,8 @@
 static DEFINE_SPINLOCK(gpio_lock);
 
 struct mpc52xx_gpiochip {
-	struct of_mm_gpio_chip mmchip;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	unsigned int shadow_dvo;
 	unsigned int shadow_gpioe;
 	unsigned int shadow_ddr;
@@ -43,8 +44,8 @@ struct mpc52xx_gpiochip {
  */
 static int mpc52xx_wkup_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpio_wkup __iomem *regs = mm_gc->regs;
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
+	struct mpc52xx_gpio_wkup __iomem *regs = chip->regs;
 	unsigned int ret;
 
 	ret = (in_8(&regs->wkup_ival) >> (7 - gpio)) & 1;
@@ -57,9 +58,8 @@ static int mpc52xx_wkup_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static inline void
 __mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
-	struct mpc52xx_gpio_wkup __iomem *regs = mm_gc->regs;
+	struct mpc52xx_gpio_wkup __iomem *regs = chip->regs;
 
 	if (val)
 		chip->shadow_dvo |= 1 << (7 - gpio);
@@ -87,9 +87,8 @@ mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int mpc52xx_wkup_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
-	struct mpc52xx_gpio_wkup __iomem *regs = mm_gc->regs;
+	struct mpc52xx_gpio_wkup __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -110,9 +109,8 @@ static int mpc52xx_wkup_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int
 mpc52xx_wkup_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpio_wkup __iomem *regs = mm_gc->regs;
 	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
+	struct mpc52xx_gpio_wkup __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -136,30 +134,41 @@ mpc52xx_wkup_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int mpc52xx_wkup_gpiochip_probe(struct platform_device *ofdev)
 {
+	struct device *dev = &ofdev->dev;
+	struct device_node *np = dev->of_node;
 	struct mpc52xx_gpiochip *chip;
 	struct mpc52xx_gpio_wkup __iomem *regs;
 	struct gpio_chip *gc;
 	int ret;
 
-	chip = devm_kzalloc(&ofdev->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
 	platform_set_drvdata(ofdev, chip);
 
-	gc = &chip->mmchip.gc;
+	gc = &chip->gc;
 
+	gc->base             = -1;
 	gc->ngpio            = 8;
 	gc->direction_input  = mpc52xx_wkup_gpio_dir_in;
 	gc->direction_output = mpc52xx_wkup_gpio_dir_out;
 	gc->get              = mpc52xx_wkup_gpio_get;
 	gc->set              = mpc52xx_wkup_gpio_set;
 
-	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	chip->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
+
+	ret = devm_gpiochip_add_data(dev, gc, chip);
 	if (ret)
 		return ret;
 
-	regs = chip->mmchip.regs;
+	regs = chip->regs;
 	chip->shadow_gpioe = in_8(&regs->wkup_gpioe);
 	chip->shadow_ddr = in_8(&regs->wkup_ddr);
 	chip->shadow_dvo = in_8(&regs->wkup_dvo);
@@ -167,13 +176,6 @@ static int mpc52xx_wkup_gpiochip_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-static void mpc52xx_gpiochip_remove(struct platform_device *ofdev)
-{
-	struct mpc52xx_gpiochip *chip = platform_get_drvdata(ofdev);
-
-	of_mm_gpiochip_remove(&chip->mmchip);
-}
-
 static const struct of_device_id mpc52xx_wkup_gpiochip_match[] = {
 	{ .compatible = "fsl,mpc5200-gpio-wkup", },
 	{}
@@ -185,7 +187,6 @@ static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
 		.of_match_table = mpc52xx_wkup_gpiochip_match,
 	},
 	.probe = mpc52xx_wkup_gpiochip_probe,
-	.remove = mpc52xx_gpiochip_remove,
 };
 
 /*
@@ -207,8 +208,8 @@ static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
  */
 static int mpc52xx_simple_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct mpc52xx_gpio __iomem *regs = mm_gc->regs;
+	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
+	struct mpc52xx_gpio __iomem *regs = chip->regs;
 	unsigned int ret;
 
 	ret = (in_be32(&regs->simple_ival) >> (31 - gpio)) & 1;
@@ -219,9 +220,8 @@ static int mpc52xx_simple_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static inline void
 __mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
-	struct mpc52xx_gpio __iomem *regs = mm_gc->regs;
+	struct mpc52xx_gpio __iomem *regs = chip->regs;
 
 	if (val)
 		chip->shadow_dvo |= 1 << (31 - gpio);
@@ -248,9 +248,8 @@ mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int mpc52xx_simple_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
-	struct mpc52xx_gpio __iomem *regs = mm_gc->regs;
+	struct mpc52xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -271,9 +270,8 @@ static int mpc52xx_simple_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int
 mpc52xx_simple_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct mpc52xx_gpiochip *chip = gpiochip_get_data(gc);
-	struct mpc52xx_gpio __iomem *regs = mm_gc->regs;
+	struct mpc52xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -298,30 +296,41 @@ mpc52xx_simple_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int mpc52xx_simple_gpiochip_probe(struct platform_device *ofdev)
 {
+	struct device *dev = &ofdev->dev;
+	struct device_node *np = dev->of_node;
 	struct mpc52xx_gpiochip *chip;
 	struct gpio_chip *gc;
 	struct mpc52xx_gpio __iomem *regs;
 	int ret;
 
-	chip = devm_kzalloc(&ofdev->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
 	platform_set_drvdata(ofdev, chip);
 
-	gc = &chip->mmchip.gc;
+	gc = &chip->gc;
 
+	gc->base             = -1;
 	gc->ngpio            = 32;
 	gc->direction_input  = mpc52xx_simple_gpio_dir_in;
 	gc->direction_output = mpc52xx_simple_gpio_dir_out;
 	gc->get              = mpc52xx_simple_gpio_get;
 	gc->set              = mpc52xx_simple_gpio_set;
 
-	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	chip->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
+
+	ret = devm_gpiochip_add_data(dev, gc, chip);
 	if (ret)
 		return ret;
 
-	regs = chip->mmchip.regs;
+	regs = chip->regs;
 	chip->shadow_gpioe = in_be32(&regs->simple_gpioe);
 	chip->shadow_ddr = in_be32(&regs->simple_ddr);
 	chip->shadow_dvo = in_be32(&regs->simple_dvo);
@@ -340,7 +349,6 @@ static struct platform_driver mpc52xx_simple_gpiochip_driver = {
 		.of_match_table = mpc52xx_simple_gpiochip_match,
 	},
 	.probe = mpc52xx_simple_gpiochip_probe,
-	.remove = mpc52xx_gpiochip_remove,
 };
 
 static struct platform_driver * const drivers[] = {
-- 
2.49.0


