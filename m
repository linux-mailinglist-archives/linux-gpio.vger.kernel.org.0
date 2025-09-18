Return-Path: <linux-gpio+bounces-26342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181DB861D1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 18:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48FEE4E0188
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 16:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B297025A359;
	Thu, 18 Sep 2025 16:50:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26CF259C9A;
	Thu, 18 Sep 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758214254; cv=none; b=a2xhKZffolOwjHM31p4mlJhj/qA1uhkXf4K0uAVIKsrMSUG65o6T+LSRwV5fLx1jHM793nFICu8P1pHrh8Z45LA5ZLXZEGPfEQsSNIpgSoQ1uOt5oXnzgUESgsT26AUMQNh+HADIQ3IwWcCeYTRkciWSRvoFjf5RwBTJ37NZG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758214254; c=relaxed/simple;
	bh=ECnVefXmhNl1JmdZzgG8I7sGGtwU4E9wPX7lONyQWKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXOQI9NDbyRvawc/iljAbTVL5iDa0q0Px4/nP68in7qrisFvWQR0/oiRD9Gwf8AsApaHz3rOPZqQvbNrRuhTWh76urA/7oTzf9ABD7+oBtp2bB5ER5S3t6n/4+r94ZhIHujuCmrlS+qj+ahYUX6NXTQZQRXy8EGoxeOdPSI18kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY550rVz9sfy;
	Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8HCMn0Ik6Ho; Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY40Gyqz9sft;
	Thu, 18 Sep 2025 18:23:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC8AC8B778;
	Thu, 18 Sep 2025 18:23:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4GRJcVK8mL3E; Thu, 18 Sep 2025 18:23:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A2A18B767;
	Thu, 18 Sep 2025 18:23:35 +0200 (CEST)
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
Subject: [PATCH v6 4/7] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Thu, 18 Sep 2025 18:23:24 +0200
Message-ID: <9a4d8bc1145f708a5ee6dde24fe2bd85cff006e2.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212605; l=6045; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ECnVefXmhNl1JmdZzgG8I7sGGtwU4E9wPX7lONyQWKg=; b=BCYsDj1HWoo7ACd1jnIWD1gvVC+4kIJPnu4mQAebHTYtdnONQI8aBWW2ByUbOLumzvmOVOvo5 7M0NqjAB6jlCtOfaAQF5rhWMlJ2Q2LShqj9FcaDbvVkQV0AVwpz/yil
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In the QE, a few GPIOs have an associated IRQ to notify changes.
Add IRQ support to QE GPIO.

As not all GPIOs have an associated IRQ, the driver needs to know
to which GPIO corresponds each provided IRQ. This is provided via
multiple compatible properties:

	compatible = "fsl,mpc8323-qe-pario-bank-a"
	compatible = "fsl,mpc8323-qe-pario-bank-b"
	compatible = "fsl,mpc8323-qe-pario-bank-c"

	compatible = "fsl,mpc8360-qe-pario-bank-a"
	compatible = "fsl,mpc8360-qe-pario-bank-b"
	compatible = "fsl,mpc8360-qe-pario-bank-c"
	compatible = "fsl,mpc8360-qe-pario-bank-d"
	compatible = "fsl,mpc8360-qe-pario-bank-e"
	compatible = "fsl,mpc8360-qe-pario-bank-f"
	compatible = "fsl,mpc8360-qe-pario-bank-g"

	compatible = "fsl,mpc8568-qe-pario-bank-a"
	compatible = "fsl,mpc8568-qe-pario-bank-b"
	compatible = "fsl,mpc8568-qe-pario-bank-c"
	compatible = "fsl,mpc8568-qe-pario-bank-d"
	compatible = "fsl,mpc8568-qe-pario-bank-e"
	compatible = "fsl,mpc8568-qe-pario-bank-f"

When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
the origin compatible = "fsl,mpc8323-qe-pario-bank" is sufficient.

Here is an exemple for port B of mpc8323 which has IRQs for
GPIOs PB7, PB9, PB25 and PB27.

	qe_pio_b: gpio-controller@1418 {
		compatible = "fsl,mpc8323-qe-pario-bank-b";
		reg = <0x1418 0x18>;
		interrupts = <4 5 6 7>;
		interrupt-parent = <&qepic>;
		gpio-controller;
		#gpio-cells = <2>;
	};

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v6: Changed mask local var to unsigned long instead of u32 to avoid build failure on 64 bits
---
 drivers/soc/fsl/qe/gpio.c | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index c54154b404df..7a23eb220217 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,6 +12,7 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/of_irq.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -32,6 +33,8 @@ struct qe_gpio_chip {
 
 	/* saved_regs used to restore dedicated functions */
 	struct qe_pio_regs saved_regs;
+
+	int irq[QE_PIO_PINS];
 };
 
 static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
@@ -135,6 +138,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+
+	return qe_gc->irq[gpio] ? : -ENXIO;
+}
+
 struct qe_pin {
 	/*
 	 * The qe_gpio_chip name is unfortunate, we should change that to
@@ -295,6 +305,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	struct device_node *np = dev->of_node;
 	struct qe_gpio_chip *qe_gc;
 	struct gpio_chip *gc;
+	unsigned long mask;
 
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc)
@@ -302,6 +313,15 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
+	mask = (unsigned long)of_device_get_match_data(dev);
+	if (mask) {
+		int i, j;
+
+		for (i = 0, j = 0; i < ARRAY_SIZE(qe_gc->irq); i++)
+			if (mask & PIN_MASK(i))
+				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
+	}
+
 	gc = &qe_gc->gc;
 
 	gc->base = -1;
@@ -311,6 +331,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
@@ -330,6 +351,57 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 static const struct of_device_id qe_gpio_match[] = {
 	{
 		.compatible = "fsl,mpc8323-qe-pario-bank",
+	}, {
+		.compatible = "fsl,mpc8323-qe-pario-bank-a",
+		.data = (void *)(PIN_MASK(8) | PIN_MASK(10) | PIN_MASK(26) | PIN_MASK(28)),
+	}, {
+		.compatible = "fsl,mpc8323-qe-pario-bank-b",
+		.data = (void *)(PIN_MASK(7) | PIN_MASK(9) | PIN_MASK(25) | PIN_MASK(27)),
+	}, {
+		.compatible = "fsl,mpc8323-qe-pario-bank-c",
+		.data = (void *)(PIN_MASK(24) | PIN_MASK(29)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-a",
+		.data = (void *)(PIN_MASK(15) | PIN_MASK(16) | PIN_MASK(29) | PIN_MASK(30)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-b",
+		.data = (void *)(PIN_MASK(3) | PIN_MASK(5) | PIN_MASK(12) | PIN_MASK(13) |
+				 PIN_MASK(26) | PIN_MASK(27)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-c",
+		.data = (void *)(PIN_MASK(27) | PIN_MASK(28) | PIN_MASK(29)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-d",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(13) | PIN_MASK(16) | PIN_MASK(17) |
+				 PIN_MASK(26) | PIN_MASK(27)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-e",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(13) | PIN_MASK(24) | PIN_MASK(25) |
+				 PIN_MASK(26) | PIN_MASK(27) | PIN_MASK(31)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-f",
+		.data = (void *)(PIN_MASK(20)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-g",
+		.data = (void *)(PIN_MASK(31)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-a",
+		.data = (void *)(PIN_MASK(22) | PIN_MASK(23)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-b",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(13) | PIN_MASK(28) | PIN_MASK(29)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-c",
+		.data = (void *)(PIN_MASK(16) | PIN_MASK(17) | PIN_MASK(25) | PIN_MASK(26)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-d",
+		.data = (void *)(PIN_MASK(18) | PIN_MASK(19)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-e",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(16) | PIN_MASK(30)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-f",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(16) | PIN_MASK(30)),
 	},
 	{},
 };
-- 
2.49.0


