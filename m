Return-Path: <linux-gpio+bounces-24495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C6B2A25D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 14:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D66F176815
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADB4318126;
	Mon, 18 Aug 2025 12:50:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4187E26F2AF;
	Mon, 18 Aug 2025 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521437; cv=none; b=L1CfAlKdGDBPkATm1oLKQVJqNYk55X1vzCTO02MJgYCHv05NSUJB1E60EFvBsz4p/5YyIPBMZW1gCnir9EqxQZVBxwYadmqQkb/x4UmrPvfGBKiKKgpmR5VGL/cWADd5KjzKWftsr412RCH3+KVoCRusxYYKhQ3bq6y+2XwknIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521437; c=relaxed/simple;
	bh=cL3azlX2WcUbptT06I7EQvmQRQpz1mAubjk1mSKGiHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zyf7rSIQvSDTAt68KMSMOST6PQgFnruBTyhSWsCJVhZ0+6Tp69/K4mtDonzOA5W/vGXZ3I2SrMwfBzzGA0YwsdnEIHWgMXXOBw8nklx3YtshjMV7BKh2EnIbLfs/JNsee3DBuGuzJUSspddWthHEkC/ZC+7rgu33mFvTHFka30I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5BYc10C8z9sV2;
	Mon, 18 Aug 2025 14:17:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfh_z7hGOAcT; Mon, 18 Aug 2025 14:17:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5BYb6wb1z9sTs;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D7CAA8B765;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FTlnGI7M_tX7; Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A96458B763;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] powerpc/44x: Change GPIO driver to a proper platform driver
Date: Mon, 18 Aug 2025 14:17:34 +0200
Message-ID: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755519455; l=2973; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=cL3azlX2WcUbptT06I7EQvmQRQpz1mAubjk1mSKGiHQ=; b=oV6fRiM5cvSD8PBNYa0SCOuMFiBdwEjJTKMdrwCBL393tvhEaYJhzzYqFZtkGCBXqtkifauUH Wiy2icUwLcPCMHogvqGSuG33hJ4UPXw+9FZUV2+JiCKUwqX2mKN/3Pn
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In order to drop legacy-of-mm-gpiochip dependency, first change the
44x GPIO driver to a proper platform driver.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/44x/gpio.c | 83 +++++++++++++++++--------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index 08ab76582568..a025b3248342 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -18,6 +18,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/types.h>
 #include <linux/slab.h>
+#include <linux/platform_device.h>
 
 #define GPIO_MASK(gpio)		(0x80000000 >> (gpio))
 #define GPIO_MASK2(gpio)	(0xc0000000 >> ((gpio) * 2))
@@ -155,42 +156,50 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int __init ppc4xx_add_gpiochips(void)
+static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 {
-	struct device_node *np;
-
-	for_each_compatible_node(np, NULL, "ibm,ppc4xx-gpio") {
-		int ret;
-		struct ppc4xx_gpio_chip *ppc4xx_gc;
-		struct of_mm_gpio_chip *mm_gc;
-		struct gpio_chip *gc;
-
-		ppc4xx_gc = kzalloc(sizeof(*ppc4xx_gc), GFP_KERNEL);
-		if (!ppc4xx_gc) {
-			ret = -ENOMEM;
-			goto err;
-		}
-
-		spin_lock_init(&ppc4xx_gc->lock);
-
-		mm_gc = &ppc4xx_gc->mm_gc;
-		gc = &mm_gc->gc;
-
-		gc->ngpio = 32;
-		gc->direction_input = ppc4xx_gpio_dir_in;
-		gc->direction_output = ppc4xx_gpio_dir_out;
-		gc->get = ppc4xx_gpio_get;
-		gc->set = ppc4xx_gpio_set;
-
-		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
-		if (ret)
-			goto err;
-		continue;
-err:
-		pr_err("%pOF: registration failed with status %d\n", np, ret);
-		kfree(ppc4xx_gc);
-		/* try others anyway */
-	}
-	return 0;
+	struct device *dev = &ofdev->dev;
+	struct device_node *np = dev->of_node;
+	struct ppc4xx_gpio_chip *chip;
+	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	spin_lock_init(&chip->lock);
+
+	mm_gc = &chip->mm_gc;
+	gc = &mm_gc->gc;
+
+	gc->ngpio = 32;
+	gc->direction_input = ppc4xx_gpio_dir_in;
+	gc->direction_output = ppc4xx_gpio_dir_out;
+	gc->get = ppc4xx_gpio_get;
+	gc->set = ppc4xx_gpio_set;
+
+	return of_mm_gpiochip_add_data(np, mm_gc, chip);
+}
+
+static const struct of_device_id ppc4xx_gpio_match[] = {
+	{
+		.compatible = "ibm,ppc4xx-gpio",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, ppc4xx_gpio_match);
+
+static struct platform_driver ppc4xx_gpio_driver = {
+	.probe		= ppc4xx_gpio_probe,
+	.driver		= {
+		.name	= "ppc4xx-gpio",
+		.of_match_table	= ppc4xx_gpio_match,
+	},
+};
+
+static int __init ppc4xx_gpio_init(void)
+{
+	return platform_driver_register(&ppc4xx_gpio_driver);
 }
-arch_initcall(ppc4xx_add_gpiochips);
+arch_initcall(ppc4xx_gpio_init);
-- 
2.49.0


