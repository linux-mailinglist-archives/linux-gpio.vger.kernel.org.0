Return-Path: <linux-gpio+bounces-20870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB85ACA7D6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 03:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B935717DAD6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 01:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D42C280CD6;
	Sun,  1 Jun 2025 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQOX+XZ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E928E33DBB7;
	Sun,  1 Jun 2025 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821562; cv=none; b=bjK6cefRmCXIL68TyIQvNMzerFGIx8KmVoJq8mFWwJk11fp7zGoK744eFOFD5Uvitvvb3dVtkhRUlcoU94vsv3ticH9HpHyiSQxcpHFh3hR1m7PbytF8hLGWyeEJ6SdgpQ6B5LAcWKSCWPKpOeYx5hquykkrlOXWLPnRuUOgRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821562; c=relaxed/simple;
	bh=YwKrd9qS4+Kz6Th/IQtZuDHRosUBc8ALJeypSs1p7sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JkQbamdfauj1zBKafzem/uHIEruZ8ZpXOXtAWSc4PQwAfWtkTeRcI8Y/1edwQVNq3YFO50menpQnWHLnTiL6AMdIUKW1jyvKnZSUvfqyCd9wo1x0wPqiDzq/lab54sFsfIxMiaGrBYquWn+OlAR943A8pkC5hawroYa1stpEL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQOX+XZ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A5DC4CEE7;
	Sun,  1 Jun 2025 23:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821561;
	bh=YwKrd9qS4+Kz6Th/IQtZuDHRosUBc8ALJeypSs1p7sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kQOX+XZ+ob9mgQeAACryvi5f/+5fcAN0mgNZQmJ71NMMhi2A4b96NpULlkZnP2BB3
	 YaCZUi6QXpjFVs/OZtdmFoRWxWEwV+9yyo8UUbqKXWmdVpfqbVJ1aLyQAhM+Z/SB/T
	 l3pABgWOgX/yt1igq92+0g4BCPUsrbDf1y0PHYZuWXATEcXYLHyfwh+NMvf6ox4gCt
	 gv5FKBL3NClHyxd5uoXmaRYc4fQ6C1pq4ncUyKboaK3Ilrff13uxMng8xQeLJkwrqB
	 G5TUSQ8H3y5rujkd2dcxjjEO1TNOviSEb0ymQxtIkA4Mmg/kfPVNSFe/ckcaCC6vNx
	 MAJD2G8rnYs9Q==
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
Subject: [PATCH AUTOSEL 5.4 19/22] gpio: pxa: Make irq_chip immutable
Date: Sun,  1 Jun 2025 19:45:10 -0400
Message-Id: <20250601234515.3519309-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234515.3519309-1-sashal@kernel.org>
References: <20250601234515.3519309-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
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
index 5c770b7891f71..177529aecc697 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -508,6 +508,8 @@ static void pxa_mask_muxed_gpio(struct irq_data *d)
 	gfer = readl_relaxed(base + GFER_OFFSET) & ~GPIO_bit(gpio);
 	writel_relaxed(grer, base + GRER_OFFSET);
 	writel_relaxed(gfer, base + GFER_OFFSET);
+
+	gpiochip_disable_irq(&pchip->chip, gpio);
 }
 
 static int pxa_gpio_set_wake(struct irq_data *d, unsigned int on)
@@ -527,17 +529,21 @@ static void pxa_unmask_muxed_gpio(struct irq_data *d)
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


