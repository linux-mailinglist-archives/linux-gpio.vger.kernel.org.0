Return-Path: <linux-gpio+bounces-25317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B2B3E293
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDED16531E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2D333436F;
	Mon,  1 Sep 2025 12:21:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ABF31DD9A;
	Mon,  1 Sep 2025 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729260; cv=none; b=ItzrnqmUp7hWRls6HfjlHYEciVui9T24RZ4bVUiIHXB8ZkiYvaqLt220XKoV3Rex+lFdeXGSxRm/zMrqzvmQ7w7uRuCtjqm70blAPY4p9xc3RuESp+wVLOqpdImAxFSNB0B4+Dq+rw+sYj/Y+1twUPhXF18fCljRLqm2SEzj3Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729260; c=relaxed/simple;
	bh=s8KjGqMF8kQALqNMwLbzLGaJh7U5Yszt7n4kjPjPFPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4FJPPmFDZTgdfTNEGF67RTXCpw5Hyzvr2cTt9ozk5kmmJErt3gEq6hk3a53EwQP7KcFzrWYCPTvyQjUL0mex6fJ7nNWC1PxVcHbEVvK/dkjA3HcKKLkO5hRvNlDAd2hi9dIsvWeJy9fYRXo8yBsosd6gN96ypcH9F6t/k3SHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndH59YJz9sT1;
	Mon,  1 Sep 2025 14:05:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7IsBlKEXMdn; Mon,  1 Sep 2025 14:05:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC4hv4z9sSp;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E5B78B796;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id edUMA0anltQY; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A3228B77B;
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
Subject: [PATCH v5 4/7] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon,  1 Sep 2025 14:05:11 +0200
Message-ID: <1234b2b7105443654c5f2bb97d25cf16408d6003.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756727747.git.christophe.leroy@csgroup.eu>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=6021; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=s8KjGqMF8kQALqNMwLbzLGaJh7U5Yszt7n4kjPjPFPY=; b=5Q0lKuhrQBfag3F7DCmjgG6MlKlaxMv0YyRWMF8h3A82sy9PbLmMLb+o/21C9Bt418k4hJ5m/ 6sPuEoVkJz7D1rfCaQRi8Vuo7IC6FUSSLs9q+m8UgwIgu9cYetjKS/I
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v5: Provide the mask via the compatible data instead of adding a property in device tree
---
 drivers/soc/fsl/qe/gpio.c | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index c54154b404df..8632b0d37255 100644
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
+	u32 mask;
 
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc)
@@ -302,6 +313,15 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
+	mask = (u32)of_device_get_match_data(dev);
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


