Return-Path: <linux-gpio+bounces-24497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F79B2A224
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 14:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E935E620845
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 12:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B583F31CA55;
	Mon, 18 Aug 2025 12:50:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94BB30E83F;
	Mon, 18 Aug 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521447; cv=none; b=gA1a3uTzZLSss0wlu7n6KgKhfTcdRwMgOzDlYhANetghehCbqvngswwaSPGKwmNRQuc/TotXSKqGcHXHppgzwkyL24zbjvoReQ+LLV4DT4Xu7Care2ODGmPkChqCVVbrggOdr//MuHaoH3vwib3mBvp8ur8r67f41fEtu1lbPSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521447; c=relaxed/simple;
	bh=8RKYPBgcb30PVBpGEIRd0OTuJmNgZfajD3OtFlexfHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s26Dk9yRlRTu1rRh1KN4ECOvUb1JusG+i0OZrdm73K2i5H5Bi8uF/VCMwpGUtVtN8XBpVH6pECJNazvEzBRcdxhwnA74jR7rjxwD8kcarO76pXSV5ReYtSPmiQ6o9MOxZ9ktFZ6Aa+pWfJjKsUpmC7Atc0IgJUtxohdP/DQWO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5BVG53JJz9sV1;
	Mon, 18 Aug 2025 14:14:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ts7rHCiLYxVq; Mon, 18 Aug 2025 14:14:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5BVG3hg9z9sTn;
	Mon, 18 Aug 2025 14:14:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 689778B764;
	Mon, 18 Aug 2025 14:14:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v5SaTmB0tJsW; Mon, 18 Aug 2025 14:14:46 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 38B258B763;
	Mon, 18 Aug 2025 14:14:46 +0200 (CEST)
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
Subject: [PATCH] powerpc/cpm2: Drop legacy-of-mm-gpiochip.h header
Date: Mon, 18 Aug 2025 14:14:36 +0200
Message-ID: <2662f24c539db393f11b27f0feae2dc14bb2f08f.1755518891.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755519277; l=7042; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=8RKYPBgcb30PVBpGEIRd0OTuJmNgZfajD3OtFlexfHU=; b=oOokUcmjwNZdcWy7b9jBwmz8uDBVVsYb17+K9YIYEqRQ/tfkozSrMR/zQWauwjNc4KoOTkrEo ITurVnxbWMWCwbbqG0Q9Sp+slmTw0vaf0jZ++qyPYlLuBG7qPM4B33e
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

[text copied from commit 34064c8267a6 ("powerpc/8xx:
Drop legacy-of-mm-gpiochip.h header")]

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/8xx/Kconfig |  1 -
 arch/powerpc/platforms/Kconfig     |  1 -
 arch/powerpc/sysdev/cpm_common.c   | 56 +++++++++++++++---------------
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index 8623aebfac48..abb2b45b2789 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -101,7 +101,6 @@ comment "Generic MPC8xx Options"
 config 8xx_GPIO
 	bool "GPIO API Support"
 	select GPIOLIB
-	select OF_GPIO_MM_GPIOCHIP
 	help
 	  Saying Y here will cause the ports on an MPC8xx processor to be used
 	  with the GPIO API.  If you say N here, the kernel needs less memory.
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index fea3766eac0f..364eef32ddcc 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -243,7 +243,6 @@ config CPM2
 	select CPM
 	select HAVE_PCI
 	select GPIOLIB
-	select OF_GPIO_MM_GPIOCHIP
 	help
 	  The CPM2 (Communications Processor Module) is a coprocessor on
 	  embedded CPUs made by Freescale.  Selecting this option means that
diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index f469f6a9f6e0..07ea605ab0e6 100644
--- a/arch/powerpc/sysdev/cpm_common.c
+++ b/arch/powerpc/sysdev/cpm_common.c
@@ -28,10 +28,6 @@
 
 #include <mm/mmu_decl.h>
 
-#if defined(CONFIG_CPM2) || defined(CONFIG_8xx_GPIO)
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
-#endif
-
 static int __init cpm_init(void)
 {
 	struct device_node *np;
@@ -91,32 +87,33 @@ void __init udbg_init_cpm(void)
 
 #if defined(CONFIG_CPM2) || defined(CONFIG_8xx_GPIO)
 
+#include <linux/gpio/driver.h>
+
 struct cpm2_ioports {
 	u32 dir, par, sor, odr, dat;
 	u32 res[3];
 };
 
 struct cpm2_gpio32_chip {
-	struct of_mm_gpio_chip mm_gc;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	spinlock_t lock;
 
 	/* shadowed data register to clear/set bits safely */
 	u32 cpdata;
 };
 
-static void cpm2_gpio32_save_regs(struct of_mm_gpio_chip *mm_gc)
+static void cpm2_gpio32_save_regs(struct cpm2_gpio32_chip *cpm2_gc)
 {
-	struct cpm2_gpio32_chip *cpm2_gc =
-		container_of(mm_gc, struct cpm2_gpio32_chip, mm_gc);
-	struct cpm2_ioports __iomem *iop = mm_gc->regs;
+	struct cpm2_ioports __iomem *iop = cpm2_gc->regs;
 
 	cpm2_gc->cpdata = in_be32(&iop->dat);
 }
 
 static int cpm2_gpio32_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct cpm2_ioports __iomem *iop = mm_gc->regs;
+	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
+	struct cpm2_ioports __iomem *iop = cpm2_gc->regs;
 	u32 pin_mask;
 
 	pin_mask = 1 << (31 - gpio);
@@ -124,11 +121,9 @@ static int cpm2_gpio32_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(in_be32(&iop->dat) & pin_mask);
 }
 
-static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
-	int value)
+static void __cpm2_gpio32_set(struct cpm2_gpio32_chip *cpm2_gc, u32 pin_mask, int value)
 {
-	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(&mm_gc->gc);
-	struct cpm2_ioports __iomem *iop = mm_gc->regs;
+	struct cpm2_ioports __iomem *iop = cpm2_gc->regs;
 
 	if (value)
 		cpm2_gc->cpdata |= pin_mask;
@@ -140,14 +135,13 @@ static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
 
 static int cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
 
 	spin_lock_irqsave(&cpm2_gc->lock, flags);
 
-	__cpm2_gpio32_set(mm_gc, pin_mask, value);
+	__cpm2_gpio32_set(cpm2_gc, pin_mask, value);
 
 	spin_unlock_irqrestore(&cpm2_gc->lock, flags);
 
@@ -156,16 +150,15 @@ static int cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 
 static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
-	struct cpm2_ioports __iomem *iop = mm_gc->regs;
+	struct cpm2_ioports __iomem *iop = cpm2_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
 
 	spin_lock_irqsave(&cpm2_gc->lock, flags);
 
 	setbits32(&iop->dir, pin_mask);
-	__cpm2_gpio32_set(mm_gc, pin_mask, val);
+	__cpm2_gpio32_set(cpm2_gc, pin_mask, val);
 
 	spin_unlock_irqrestore(&cpm2_gc->lock, flags);
 
@@ -174,9 +167,8 @@ static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int cpm2_gpio32_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
-	struct cpm2_ioports __iomem *iop = mm_gc->regs;
+	struct cpm2_ioports __iomem *iop = cpm2_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (31 - gpio);
 
@@ -193,19 +185,17 @@ int cpm2_gpiochip_add32(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct cpm2_gpio32_chip *cpm2_gc;
-	struct of_mm_gpio_chip *mm_gc;
 	struct gpio_chip *gc;
 
-	cpm2_gc = kzalloc(sizeof(*cpm2_gc), GFP_KERNEL);
+	cpm2_gc = devm_kzalloc(dev, sizeof(*cpm2_gc), GFP_KERNEL);
 	if (!cpm2_gc)
 		return -ENOMEM;
 
 	spin_lock_init(&cpm2_gc->lock);
 
-	mm_gc = &cpm2_gc->mm_gc;
-	gc = &mm_gc->gc;
+	gc = &cpm2_gc->gc;
 
-	mm_gc->save_regs = cpm2_gpio32_save_regs;
+	gc->base = -1;
 	gc->ngpio = 32;
 	gc->direction_input = cpm2_gpio32_dir_in;
 	gc->direction_output = cpm2_gpio32_dir_out;
@@ -214,6 +204,16 @@ int cpm2_gpiochip_add32(struct device *dev)
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
-	return of_mm_gpiochip_add_data(np, mm_gc, cpm2_gc);
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	cpm2_gc->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(cpm2_gc->regs))
+		return PTR_ERR(cpm2_gc->regs);
+
+	cpm2_gpio32_save_regs(cpm2_gc);
+
+	return devm_gpiochip_add_data(dev, gc, cpm2_gc);
 }
 #endif /* CONFIG_CPM2 || CONFIG_8xx_GPIO */
-- 
2.49.0


