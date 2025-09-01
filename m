Return-Path: <linux-gpio+bounces-25314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59924B3E28C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD3F18927F8
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D271C3277BB;
	Mon,  1 Sep 2025 12:20:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1496731355E;
	Mon,  1 Sep 2025 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729246; cv=none; b=ox7hcdqy4RIAcbSWQdeaVtSmDItwwaXOwEpvorXji4doFn52oK5un1/neIdq5OkGwVZHYplhr/J1iqbD76coVV6LShyk2nHAEwIIy4H5yjeJP7EJxxHn+R2OWa/IbA3cKTfzSrTzp2GkVchfeZamAEpItkBuvLjGg//0yIAQBx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729246; c=relaxed/simple;
	bh=2f7yMXfZqmnt4TnAL1vLrmJcXWLAvkgUDWqAJg/zucU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUwvV0h56pxhN0Q5Pu8cuNpSSbFPaCSsbuBqaHNaAtVFzQVI1EswZTDQsFPy+zyIxm3FyRaJT/tPkls3kTAMx9qbsp6AefsKcX1J45oXgcMhlzDfFuzIRqNtPSB0w9IOU5Q5w5l7vSYxPzBn8ppRjpCoUhYmitcEoPSs1GmqqbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndF2tsgz9sSy;
	Mon,  1 Sep 2025 14:05:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87dt3CIn6EIv; Mon,  1 Sep 2025 14:05:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC2vXJz9sSj;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D1248B78C;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zQI-rZ0Nw15p; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 229D28B77B;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
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
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 2/7] soc: fsl: qe: Change GPIO driver to a proper platform driver
Date: Mon,  1 Sep 2025 14:05:09 +0200
Message-ID: <12fefcd1c190b37b85e604f7e8e286f445a4564a.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756727747.git.christophe.leroy@csgroup.eu>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=4836; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2f7yMXfZqmnt4TnAL1vLrmJcXWLAvkgUDWqAJg/zucU=; b=yaX9PZ/esSZhQqPq3cYQLnzsBXR56oVU06ZFDZX6TmOxmumNzoUCXILiJ6k7QKCzwJyO7HzCs 0YOYg6EZM5MBhCokhLUj8GnDQtXu0oN3hRujQTx9SCIaEnOonvNUasf
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In order to be able to add interrupts to the GPIOs, first change the
QE GPIO driver to the proper platform driver in order to allow
initialisation to be done in the right order, otherwise the GPIOs
get added before the interrupts are registered.

Remove linux/of.h and linux/property.h which are unused.

And to improve readability and reduce risk of errors, add a macro to
transform a pin number into the mask that matches the associated bit
in registers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v5: Added the PIN_MASK() macro
---
 drivers/soc/fsl/qe/gpio.c | 98 +++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 45 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8df1e8fa86a5..04b44fc2bb58 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,16 +12,17 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/of.h>
 #include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/export.h>
-#include <linux/property.h>
+#include <linux/platform_device.h>
 
 #include <soc/fsl/qe/qe.h>
 
+#define PIN_MASK(gpio) (1UL << (QE_PIO_PINS - 1 - (gpio)))
+
 struct qe_gpio_chip {
 	struct of_mm_gpio_chip mm_gc;
 	spinlock_t lock;
@@ -52,7 +53,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
-	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
+	u32 pin_mask = PIN_MASK(gpio);
 
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
 }
@@ -63,7 +64,7 @@ static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 	unsigned long flags;
-	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
+	u32 pin_mask = PIN_MASK(gpio);
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
@@ -95,9 +96,9 @@ static int qe_gpio_set_multiple(struct gpio_chip *gc,
 			break;
 		if (__test_and_clear_bit(i, mask)) {
 			if (test_bit(i, bits))
-				qe_gc->cpdata |= (1U << (QE_PIO_PINS - 1 - i));
+				qe_gc->cpdata |= PIN_MASK(i);
 			else
-				qe_gc->cpdata &= ~(1U << (QE_PIO_PINS - 1 - i));
+				qe_gc->cpdata &= ~PIN_MASK(i);
 		}
 	}
 
@@ -295,45 +296,52 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
 }
 EXPORT_SYMBOL(qe_pin_set_gpio);
 
-static int __init qe_add_gpiochips(void)
+static int qe_gpio_probe(struct platform_device *ofdev)
 {
-	struct device_node *np;
-
-	for_each_compatible_node(np, NULL, "fsl,mpc8323-qe-pario-bank") {
-		int ret;
-		struct qe_gpio_chip *qe_gc;
-		struct of_mm_gpio_chip *mm_gc;
-		struct gpio_chip *gc;
-
-		qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
-		if (!qe_gc) {
-			ret = -ENOMEM;
-			goto err;
-		}
+	struct device *dev = &ofdev->dev;
+	struct device_node *np = dev->of_node;
+	struct qe_gpio_chip *qe_gc;
+	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc;
 
-		spin_lock_init(&qe_gc->lock);
-
-		mm_gc = &qe_gc->mm_gc;
-		gc = &mm_gc->gc;
-
-		mm_gc->save_regs = qe_gpio_save_regs;
-		gc->ngpio = QE_PIO_PINS;
-		gc->direction_input = qe_gpio_dir_in;
-		gc->direction_output = qe_gpio_dir_out;
-		gc->get = qe_gpio_get;
-		gc->set = qe_gpio_set;
-		gc->set_multiple = qe_gpio_set_multiple;
-
-		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
-		if (ret)
-			goto err;
-		continue;
-err:
-		pr_err("%pOF: registration failed with status %d\n",
-		       np, ret);
-		kfree(qe_gc);
-		/* try others anyway */
-	}
-	return 0;
+	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
+	if (!qe_gc)
+		return -ENOMEM;
+
+	spin_lock_init(&qe_gc->lock);
+
+	mm_gc = &qe_gc->mm_gc;
+	gc = &mm_gc->gc;
+
+	mm_gc->save_regs = qe_gpio_save_regs;
+	gc->ngpio = QE_PIO_PINS;
+	gc->direction_input = qe_gpio_dir_in;
+	gc->direction_output = qe_gpio_dir_out;
+	gc->get = qe_gpio_get;
+	gc->set = qe_gpio_set;
+	gc->set_multiple = qe_gpio_set_multiple;
+
+	return of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
+}
+
+static const struct of_device_id qe_gpio_match[] = {
+	{
+		.compatible = "fsl,mpc8323-qe-pario-bank",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, qe_gpio_match);
+
+static struct platform_driver qe_gpio_driver = {
+	.probe		= qe_gpio_probe,
+	.driver		= {
+		.name	= "qe-gpio",
+		.of_match_table	= qe_gpio_match,
+	},
+};
+
+static int __init qe_gpio_init(void)
+{
+	return platform_driver_register(&qe_gpio_driver);
 }
-arch_initcall(qe_add_gpiochips);
+arch_initcall(qe_gpio_init);
-- 
2.49.0


