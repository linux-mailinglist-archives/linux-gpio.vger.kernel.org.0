Return-Path: <linux-gpio+bounces-24878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCFB337AE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC3A1B21535
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 07:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E223528C5D5;
	Mon, 25 Aug 2025 07:20:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2F2288C9D;
	Mon, 25 Aug 2025 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106453; cv=none; b=ojekTWaXGlfOd0Kd/7BatcXCjaoN82x8idjtI5lMp2L9Z3utqzGNaLMkf6H4ufpgapXGW+kDLLZDLDFho6XJX/TAyV7S3gNt/BT/JeNcDylhURERfzKYeidufkZRbFwyrvojxzR/85ce1nHACBlXDubZlsTfq+FVx9/EcdlrRBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106453; c=relaxed/simple;
	bh=uSpdgVDcr8sbNwBtzV5UsjpLGA0Vuy5iqJlziDMf2qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcA2xLpZACY0tYiccyBpWrtoU+SwTZX09m47ZdfLXm1q9F6HFkPDYegVBxI5C9Hi0Ixhtw38MuSpu8cDuOvNngGYG2tVPVaiIMvkCgErm8o8W3RMS25kSCY5m+7XMIDJwO/5ERseoyUfLpcyHlk2vkaxIKqxsrL2AI4LkUhqsVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M2C0ly6z9sSN;
	Mon, 25 Aug 2025 08:53:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id naGpTVgKY7N5; Mon, 25 Aug 2025 08:53:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M291j4rz9sSH;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 205568B775;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MMKRrkjN9_EK; Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DE6458B768;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/6] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
Date: Mon, 25 Aug 2025 08:53:18 +0200
Message-ID: <9d02ad9f1b4881939ee53cdb2eedd7f87dbb62ac.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756104334.git.christophe.leroy@csgroup.eu>
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=7329; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=uSpdgVDcr8sbNwBtzV5UsjpLGA0Vuy5iqJlziDMf2qo=; b=KpU4FOlhYDuIOYcxlxivamXLCc665FKRW15mIBArruBniduHbHmnYFQLF4A3cWeStpgMJM/KZ hLBVEm6WPiEDtb1BcLOl0P0FMkAuw4GGry2MBUdDjTt3FZeZNcqH2F1
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Remove legacy-of-mm-gpiochip.h header file. The above mentioned
file provides an OF API that's deprecated. There is no agnostic
alternatives to it and we have to open code the logic which was
hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
drivers are using their own labeling schemas and resource retrieval
that only a few may gain of the code deduplication, so whenever
alternative is appear we can move drivers again to use that one.

As a side effect this change fixes a potential memory leak on
an error path, if of_mm_gpiochip_add_data() fails.

[Text copied from commit 34064c8267a6 ("powerpc/8xx: Drop
legacy-of-mm-gpiochip.h header")]

Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/Kconfig |  1 -
 drivers/soc/fsl/qe/gpio.c      | 51 ++++++++++++++++++----------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index fea3766eac0f..5b689bd3ddf4 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -232,7 +232,6 @@ config QE_GPIO
 	bool "QE GPIO support"
 	depends on QUICC_ENGINE
 	select GPIOLIB
-	select OF_GPIO_MM_GPIOCHIP
 	help
 	  Say Y here if you're going to use hardware that connects to the
 	  QE GPIOs.
diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 93fcc6d85ac7..a338469cebe4 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,7 +13,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -24,7 +23,8 @@
 #include <soc/fsl/qe/qe.h>
 
 struct qe_gpio_chip {
-	struct of_mm_gpio_chip mm_gc;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	spinlock_t lock;
 
 	/* shadowed data register to clear/set bits safely */
@@ -34,11 +34,9 @@ struct qe_gpio_chip {
 	struct qe_pio_regs saved_regs;
 };
 
-static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
+static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
 {
-	struct qe_gpio_chip *qe_gc =
-		container_of(mm_gc, struct qe_gpio_chip, mm_gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 
 	qe_gc->cpdata = ioread32be(&regs->cpdata);
 	qe_gc->saved_regs.cpdata = qe_gc->cpdata;
@@ -51,8 +49,8 @@ static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 
 static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
 
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
@@ -60,9 +58,8 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 
 static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
 
@@ -83,9 +80,8 @@ static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static int qe_gpio_set_multiple(struct gpio_chip *gc,
 				unsigned long *mask, unsigned long *bits)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	unsigned long flags;
 	int i;
 
@@ -111,13 +107,12 @@ static int qe_gpio_set_multiple(struct gpio_chip *gc,
 
 static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
-	__par_io_config_pin(mm_gc->regs, gpio, QE_PIO_DIR_IN, 0, 0, 0);
+	__par_io_config_pin(qe_gc->regs, gpio, QE_PIO_DIR_IN, 0, 0, 0);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 
@@ -126,7 +121,6 @@ static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
@@ -134,7 +128,7 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
-	__par_io_config_pin(mm_gc->regs, gpio, QE_PIO_DIR_OUT, 0, 0, 0);
+	__par_io_config_pin(qe_gc->regs, gpio, QE_PIO_DIR_OUT, 0, 0, 0);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 
@@ -240,7 +234,7 @@ EXPORT_SYMBOL(qe_pin_free);
 void qe_pin_set_dedicated(struct qe_pin *qe_pin)
 {
 	struct qe_gpio_chip *qe_gc = qe_pin->controller;
-	struct qe_pio_regs __iomem *regs = qe_gc->mm_gc.regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	struct qe_pio_regs *sregs = &qe_gc->saved_regs;
 	int pin = qe_pin->num;
 	u32 mask1 = 1 << (QE_PIO_PINS - (pin + 1));
@@ -269,7 +263,6 @@ void qe_pin_set_dedicated(struct qe_pin *qe_pin)
 
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 	qe_clrsetbits_be32(&regs->cpodr, mask1, sregs->cpodr & mask1);
-
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 }
 EXPORT_SYMBOL(qe_pin_set_dedicated);
@@ -284,7 +277,7 @@ EXPORT_SYMBOL(qe_pin_set_dedicated);
 void qe_pin_set_gpio(struct qe_pin *qe_pin)
 {
 	struct qe_gpio_chip *qe_gc = qe_pin->controller;
-	struct qe_pio_regs __iomem *regs = qe_gc->mm_gc.regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
@@ -301,7 +294,6 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
 	struct qe_gpio_chip *qe_gc;
-	struct of_mm_gpio_chip *mm_gc;
 	struct gpio_chip *gc;
 
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
@@ -310,18 +302,29 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
-	mm_gc = &qe_gc->mm_gc;
-	gc = &mm_gc->gc;
+	gc = &qe_gc->gc;
 
-	mm_gc->save_regs = qe_gpio_save_regs;
+	gc->base = -1;
 	gc->ngpio = QE_PIO_PINS;
 	gc->direction_input = qe_gpio_dir_in;
 	gc->direction_output = qe_gpio_dir_out;
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	qe_gc->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(qe_gc->regs))
+		return PTR_ERR(qe_gc->regs);
+
+	qe_gpio_save_regs(qe_gc);
 
-	return of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
+	return devm_gpiochip_add_data(dev, gc, qe_gc);
 }
 
 static const struct of_device_id qe_gpio_match[] = {
-- 
2.49.0


