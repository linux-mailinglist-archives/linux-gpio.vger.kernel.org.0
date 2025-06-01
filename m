Return-Path: <linux-gpio+bounces-20851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6941ACA346
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 01:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6451D188A131
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 23:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778EE27E7EF;
	Sun,  1 Jun 2025 23:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ao17wwSL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE7C27E7D8;
	Sun,  1 Jun 2025 23:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820532; cv=none; b=gNxv5ivzWiciS2UEt/86N9dNghJm6HvtaFDVPDX8jiiyll/kjqX2GykjCot/oEa0/ZxOjgnTfhpdtbIrmxdhHq8sqdH/b37eW7+oFJUpJKbQJAMekT3T7ADDNrlqwF21XQDh3ahT1mXfHYv4CDyLFhoiNkAZmD/un474+4Frz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820532; c=relaxed/simple;
	bh=h38rPSHv9NrOPJgcJVStv0JO2Bs0iDHmgXZ8nMZC1jU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cE6Vub+kxXjHqLqgCXiySZDEBmWZdqNHb94tRzeYwNizSxFmPfMIkD2x++7a5NI6pyqK7nHrc5Oy1aEtC0Hnvi9iNOdB6A5ZKBGJjTczAS7+7coSnyff913AEHW8UOz3FlkiSLlbcKlz767vlxZa0JYAx/Sxc+6JcMI3N53eEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ao17wwSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBAFC4CEE7;
	Sun,  1 Jun 2025 23:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820532;
	bh=h38rPSHv9NrOPJgcJVStv0JO2Bs0iDHmgXZ8nMZC1jU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ao17wwSLjKMGccS7x1UbQc0qp9hTEtHYFFs3ZE59B9xEKTxMETKsi0bsM1AU3Zq3T
	 ZGReuIsH8T7HjraGscI/JBMwKjLhxnSRDRjR6z/0ErGYOskUdmVaCU09ViL5aa4rDA
	 xWSzbeLmkJ9eu0Zo9rXq3a5vsOzkx7mDPntFkWuGua6yKBbVDn/WU2IIClxG24Uc8G
	 td3UR/VubWJIV8xAn3tkkRH3t5CwkRo8i4EVxwz/zxurNpAd+C3OlcDyJwGE+dMipC
	 oMPvbs4nQe9vB4LPGJIJMXhm59yuYa0h+KbhpAshk+fYE8jXivwHvGqLQtylHMl5zp
	 mSwEfTnno+5NA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	robert.jarzmik@free.fr,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 089/110] gpio: pxa: Make irq_chip immutable
Date: Sun,  1 Jun 2025 19:24:11 -0400
Message-Id: <20250601232435.3507697-89-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

[ Upstream commit 20117cf426b677e7aced4e7a1b2b37f6080a46dc ]

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify pxa_muxed_gpio_chip, flag the irq_chip as IRQCHIP_IMMUTABLE,
add the new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20250509-gpio-v1-9-639377c98288@nxp.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Backport Analysis: gpio: pxa: Make irq_chip
immutable ### Code Changes Analysis The commit makes three key changes
to `drivers/gpio/gpio-pxa.c`: 1. **Makes irq_chip structure const**:
Changes `static struct irq_chip pxa_muxed_gpio_chip` to `static const
struct irq_chip pxa_muxed_gpio_chip` 2. **Adds IRQCHIP_IMMUTABLE flag**:
Includes `.flags = IRQCHIP_IMMUTABLE` in the irq_chip structure 3.
**Adds resource helper macros**: Includes
`GPIOCHIP_IRQ_RESOURCE_HELPERS` macro 4. **Updates mask/unmask
functions**: Adds proper `gpiochip_disable_irq()` and
`gpiochip_enable_irq()` calls in the mask and unmask functions
respectively ### Why This Should Be Backported **1. Follows Established
Pattern** This commit follows the exact same pattern as the reference
commits marked "YES" for backporting: - Similar to gpio-vf610 (commit
e6ef4f8ede09) which was backported - Identical to gpio-104-idio-16
(commit 410a5041aa60) which was backported - Same transformation pattern
as dozens of other GPIO drivers **2. Fixes Kernel Warning** The commit
explicitly addresses a kernel warning: "not an immutable chip, please
consider fixing!" This is the same warning addressed in all the
reference "YES" commits. **3. Small, Contained Changes** - Only modifies
one file (`drivers/gpio/gpio-pxa.c`) - Changes are minimal and
mechanical - No architectural changes or new features - Low risk of
introducing regressions **4. Important Bug Fix for Users** - Eliminates
annoying kernel warnings that users encounter - Brings driver in
compliance with modern kernel IRQ subsystem requirements - Improves
system reliability by preventing dynamic modification of irq_chip
callbacks **5. No Side Effects** - The changes are purely structural
improvements - Maintains identical functionality - Does not change the
driver's external behavior - Only makes the irq_chip structure immutable
for safety **6. Critical Subsystem Compliance** - GPIO subsystem
actively enforces immutable irq_chips - This is part of a kernel-wide
migration to improve memory safety - Prevents potential security issues
from dynamic irq_chip modification **7. Hardware Support Impact** The
PXA GPIO driver supports widely-used ARM processors: - Intel PXA25x,
PXA26x, PXA27x, PXA3xx series - Marvell PXA93x, MMP, MMP2, PXA1928
series - These are found in many embedded systems and IoT devices ###
Comparison with Current Tree The analysis shows that in the current
kernel tree (`/home/sasha/linux/`), the gpio-pxa.c driver still has the
old mutable irq_chip structure (line 523: `static struct irq_chip
pxa_muxed_gpio_chip`), while the target directory shows it has already
been converted. This confirms this is a legitimate conversion commit
that needs backporting. ### Risk Assessment **Very Low Risk:** -
Mechanical transformation following established pattern - No functional
changes to GPIO operations - Extensive precedent from similar successful
backports - Changes are compile-time enforced (const keyword) This
commit represents a straightforward compliance fix that eliminates user-
visible warnings while improving code safety, making it an ideal
candidate for stable tree backporting.

 drivers/gpio/gpio-pxa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 91cea97255fa6..530ddeaba2f19 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -497,6 +497,8 @@ static void pxa_mask_muxed_gpio(struct irq_data *d)
 	gfer = readl_relaxed(base + GFER_OFFSET) & ~GPIO_bit(gpio);
 	writel_relaxed(grer, base + GRER_OFFSET);
 	writel_relaxed(gfer, base + GFER_OFFSET);
+
+	gpiochip_disable_irq(&pchip->chip, gpio);
 }
 
 static int pxa_gpio_set_wake(struct irq_data *d, unsigned int on)
@@ -516,17 +518,21 @@ static void pxa_unmask_muxed_gpio(struct irq_data *d)
 	unsigned int gpio = irqd_to_hwirq(d);
 	struct pxa_gpio_bank *c = gpio_to_pxabank(&pchip->chip, gpio);
 
+	gpiochip_enable_irq(&pchip->chip, gpio);
+
 	c->irq_mask |= GPIO_bit(gpio);
 	update_edge_detect(c);
 }
 
-static struct irq_chip pxa_muxed_gpio_chip = {
+static const struct irq_chip pxa_muxed_gpio_chip = {
 	.name		= "GPIO",
 	.irq_ack	= pxa_ack_muxed_gpio,
 	.irq_mask	= pxa_mask_muxed_gpio,
 	.irq_unmask	= pxa_unmask_muxed_gpio,
 	.irq_set_type	= pxa_gpio_irq_type,
 	.irq_set_wake	= pxa_gpio_set_wake,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int pxa_gpio_nums(struct platform_device *pdev)
-- 
2.39.5


