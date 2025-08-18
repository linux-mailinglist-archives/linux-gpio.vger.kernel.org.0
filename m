Return-Path: <linux-gpio+bounces-24498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E5B2A281
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 14:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A78F31783D5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 12:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B544A31B102;
	Mon, 18 Aug 2025 12:50:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F41B30E83F;
	Mon, 18 Aug 2025 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521452; cv=none; b=c6WCqaO4wMMeznN2kA2XU9jiz6mp4T4gdChvNeRIcKssG2kSiMeooLNCfxtD/nGyFmk01dC2DeqcSXGTNHFxZgDt6qfn0J30StsaimC4+8hflqH89CnR6BFXpMqBktgsFn6+NNweu1wOukk6Tt0cxg/qGDgtDx8KHOu3SV08rwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521452; c=relaxed/simple;
	bh=PLM/65JvqNc3NilFjJ1vKDYuZPfhd7TFnkWsRNB/R5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7dSiGGcsiMJUyfMnHfgt5L/M/SJAcflalplAKk7n5uKnSFw2kS+nP0UFs78loYhSUKK0kCtd9VbdlhUK/FIL/Dgnk21uC63jj+mkpPwbFqH2KEayxjiwN8BJVMecVayYLp82DPxf5KkwFS7NiomwXqtBOxhSOR+NNJX1XoVpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5BYd0rhsz9sV3;
	Mon, 18 Aug 2025 14:17:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUzjzR3pCnxq; Mon, 18 Aug 2025 14:17:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5BYc0gBfz9sV0;
	Mon, 18 Aug 2025 14:17:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2A748B763;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Ump101Aa9xV9; Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C3BEB8B764;
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
Subject: [PATCH 2/2] powerpc/44x: Drop legacy-of-mm-gpiochip.h header
Date: Mon, 18 Aug 2025 14:17:35 +0200
Message-ID: <2f8f16eac72b9ec202b6e593939b44308891a661.1755519343.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
References: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755519455; l=4820; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=PLM/65JvqNc3NilFjJ1vKDYuZPfhd7TFnkWsRNB/R5A=; b=Zjq/6FK9sXzyA80Ffb9ZnhDUHevV7VYAjbbUcFcnIkEAr3H0LvJ9wrxocZC5UcGLVp3Oh7hrV 3XC/VOwClHACT50kbShSMq0VXZqNlEjXjdKEW/gab6AUUSk0gOtmVyK
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/44x/Kconfig |  1 -
 arch/powerpc/platforms/44x/gpio.c  | 33 +++++++++++++++++-------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 35a1f4b9f827..fc79f8466933 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -231,7 +231,6 @@ config PPC4xx_GPIO
 	bool "PPC4xx GPIO support"
 	depends on 44x
 	select GPIOLIB
-	select OF_GPIO_MM_GPIOCHIP
 	help
 	  Enable gpiolib support for ppc440 based boards
 
diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index a025b3248342..aea0d913b59d 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -14,7 +14,6 @@
 #include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/driver.h>
 #include <linux/types.h>
 #include <linux/slab.h>
@@ -46,7 +45,8 @@ struct ppc4xx_gpio {
 };
 
 struct ppc4xx_gpio_chip {
-	struct of_mm_gpio_chip mm_gc;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	spinlock_t lock;
 };
 
@@ -58,8 +58,8 @@ struct ppc4xx_gpio_chip {
 
 static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 
 	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
 }
@@ -67,8 +67,8 @@ static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static inline void
 __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 
 	if (val)
 		setbits32(&regs->or, GPIO_MASK(gpio));
@@ -94,9 +94,8 @@ static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -124,9 +123,8 @@ static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int
 ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -161,7 +159,6 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
 	struct ppc4xx_gpio_chip *chip;
-	struct of_mm_gpio_chip *mm_gc;
 	struct gpio_chip *gc;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -170,16 +167,24 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&chip->lock);
 
-	mm_gc = &chip->mm_gc;
-	gc = &mm_gc->gc;
+	gc = &chip->gc;
 
+	gc->base = -1;
 	gc->ngpio = 32;
 	gc->direction_input = ppc4xx_gpio_dir_in;
 	gc->direction_output = ppc4xx_gpio_dir_out;
 	gc->get = ppc4xx_gpio_get;
 	gc->set = ppc4xx_gpio_set;
 
-	return of_mm_gpiochip_add_data(np, mm_gc, chip);
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	chip->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
+
+	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
 static const struct of_device_id ppc4xx_gpio_match[] = {
-- 
2.49.0


