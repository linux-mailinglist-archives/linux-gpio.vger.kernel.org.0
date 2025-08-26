Return-Path: <linux-gpio+bounces-24962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777CB3579D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 10:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E93217C0AF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 08:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB06D2FF17A;
	Tue, 26 Aug 2025 08:50:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85863D984;
	Tue, 26 Aug 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756198241; cv=none; b=Oahg9/wf7lNuYa7Vg/Vmw/8NpVQ25pp3i5n9yfhy6sZ2l1PS+3VO9YfrlJY1RETsnt0LmckLLf3qtfZZt/X4HJjgCUtHSM7LsdZdYtofxFkMuP8tewCn/GFQr1sx9sSfuE2qkpQIgq6ElN2ADbewvlUHE2vqN9mzrZchu2t2koo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756198241; c=relaxed/simple;
	bh=5s3yYeYRZ3QkohcSQgNTeYUyQ5TvPkMMh0AM/N4girU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcF4aA3a+A9wDkQLtaOH9xbYtxE5C1GXI0yA8PELjRNzy7h6zxx5YGgm8MYtDqiEt6UmjpFFaywivpmOgjKpOQHoi68q3GZ+OorTIW6IVV1Wunba1vPQlSRg/8JCNmdDrpdJ3CE5UgnXHWN9o1IkkTMlxCOpnkSEFX98PFcgUtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cB1N06r90z9sSZ;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95Os1xD7Erc8; Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cB1N05t26z9sSY;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B24528B764;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5Sr4FVgPNX2m; Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1576D8B763;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
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
Subject: [PATCH v4] soc: fsl: qe: Change GPIO driver to a proper platform driver
Date: Tue, 26 Aug 2025 10:40:33 +0200
Message-ID: <2df36ab4e1ec2af1d383281ed5005a09d28f40e2.1756197491.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
References: <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756197653; l=3483; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5s3yYeYRZ3QkohcSQgNTeYUyQ5TvPkMMh0AM/N4girU=; b=I/hgGETiK8FWJI3XxVV6HRRuu9Mq+Y4KxbL8S7c07bgSnbYBq9ioSj3ZZS9Z+O/kSPSSY1Pci nxWqwwiIed3BLFJhGbGLoSuUgPAxoRcWC4vibP61MV8LRTnJhqLSaxk
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In order to be able to add interrupts to the GPIOs, first change the
QE GPIO driver to the proper platform driver in order to allow
initialisation to be done in the right order, otherwise the GPIOs
get added before the interrupts are registered.

Removing linux/of.h and linux/property.h which are unused.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v4: Removed unused headers
---
 drivers/soc/fsl/qe/gpio.c | 88 +++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8df1e8fa86a5..fece644ce914 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,13 +12,12 @@
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
 
@@ -295,45 +294,52 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
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


