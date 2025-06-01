Return-Path: <linux-gpio+bounces-20860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE33ACA557
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 02:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A62F7AB7F1
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 00:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B91F3044A3;
	Sun,  1 Jun 2025 23:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uemEzjV+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE13032B6;
	Sun,  1 Jun 2025 23:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821028; cv=none; b=BikdnmiJjEi6QH4TA4tbq+ZxES6eR/yjJldjYJDqUNFiTWqNNl8GtaPfGgWbdSyPcMTokRjB4FSmbgP3SIjEk8v88M41AzsrIo6s/Yi3X41OayDyuAel8B80uFleRQyIU1R9IKvi4mTWwcz1KreKJqemJxc2d7LWZShZouT3Ccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821028; c=relaxed/simple;
	bh=CGjW7nUqr1wXCD5rLuqCseMP9T2tps4we9wrhYfB2fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PExaVTx0Ayfrf9y/GPfjmrFsDjp68ncbuZCTze7KyLiKlwPbu3Xr/HqWj2M0SZavcVUM+djekto/wyZvQaFeXkbm8rN+fYQ86qIABT5o6uGXaYU4zrarnbj2+dN6ZNwgztLuLucOveNv2N26E7bUZxAkZQypUd58CMir9rtDks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uemEzjV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C9AC4CEF1;
	Sun,  1 Jun 2025 23:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821028;
	bh=CGjW7nUqr1wXCD5rLuqCseMP9T2tps4we9wrhYfB2fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uemEzjV+R+L+3yHKU20BKdLyjPyrhnCNyGKZPp7LNtvJmWmkcC8FmsSrTSN1rn1ks
	 5q60q97Mqn4w9aVWvGtknd9uhVb4U1xZ0fv0wmvF+xQHSi208vLtufpa6NBmHb0/91
	 8jh4uDiQacSpBMa72xrY6/NMdvwr8sA8wj91U4zv55fj38Ambc4R+AwcWi3Ojtm+E6
	 AS1REDA4fviAjL9Yerj1BW23qPG0ETqaR+XPD1WSb/7jnaByanTjLfljp0ZGaxdvXl
	 h9hWU2a4erQP4ZFluogiPZogsB9OvlO8sl+f88kOrfH2FPi1wGq+IAvsKZcru+mWjv
	 bf92BHwIM5Y3g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 76/93] gpio: grgpio: Make irq_chip immutable
Date: Sun,  1 Jun 2025 19:33:43 -0400
Message-Id: <20250601233402.3512823-76-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

[ Upstream commit a30be40bf1d4437646b6885e7e4e71530e6f82c1 ]

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify grgpio_irq_chip, flag the irq_chip as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20250509-gpio-v1-2-639377c98288@nxp.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now let me analyze this commit against stable backporting criteria:
**YES** ## Analysis: ### 1. Bug Fix Nature This commit fixes a kernel
warning about mutable irq_chips with the message "not an immutable chip,
please consider fixing!" This is clearly a bug fix that addresses a
runtime warning that affects users. ### 2. Code Changes Analysis The
changes are minimal and well-contained within the grgpio driver: -
**Line 173**: Added `gpiochip_disable_irq(&priv->gc, d->hwirq);` call in
`grgpio_irq_mask()` function - **Line 183**: Added
`gpiochip_enable_irq(&priv->gc, d->hwirq);` call in
`grgpio_irq_unmask()` function - **Line 191**: Made `grgpio_irq_chip`
struct `const` (immutable) - **Lines 196-197**: Added
`IRQCHIP_IMMUTABLE` flag and `GPIOCHIP_IRQ_RESOURCE_HELPERS` macro ###
3. Pattern Consistency with Similar Commits This commit follows the
exact same pattern as the approved backport commits in the reference
examples: - **Similar to gpio-104-idio-16** (Status: YES): Same pattern
of making irq_chip const, adding IRQCHIP_IMMUTABLE flag, and adding
gpiochip_enable/disable_irq calls - **Similar to gpio-vf610** (Status:
YES): Identical changes - const irq_chip, IRQCHIP_IMMUTABLE, and proper
helper function calls - **Similar to gpio-104-dio-48e** (Status: YES):
Same transformation pattern ### 4. Risk Assessment - **Low Risk**:
Changes are mechanical transformations following established GPIO
subsystem patterns - **No Architectural Changes**: The commit doesn't
modify core logic, just adapts to new GPIO framework requirements -
**Well-Tested Pattern**: This exact change pattern has been applied
across multiple GPIO drivers successfully ### 5. Stable Tree Compliance
- **Important Bug Fix**: Eliminates kernel warnings that users encounter
- **Minimal Risk**: The changes follow well-established patterns already
proven in other GPIO drivers - **Contained Changes**: All modifications
are within a single driver file with no cross-subsystem impact - **No
New Features**: This is purely a compliance fix for the GPIO framework
requirements ### 6. Framework Compliance The commit brings the grgpio
driver into compliance with the modern GPIO framework's requirements for
immutable irq_chips, which is a necessary change to prevent kernel
warnings and ensure proper resource management. The changes are
essential for maintaining driver functionality in current kernels and
preventing user-visible warnings, making this an ideal candidate for
stable tree backporting.

 drivers/gpio/gpio-grgpio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 620793740c668..00c9a09e9ab97 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -169,6 +169,8 @@ static void grgpio_irq_mask(struct irq_data *d)
 	grgpio_set_imask(priv, offset, 0);
 
 	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+
+	gpiochip_disable_irq(&priv->gc, d->hwirq);
 }
 
 static void grgpio_irq_unmask(struct irq_data *d)
@@ -177,6 +179,7 @@ static void grgpio_irq_unmask(struct irq_data *d)
 	int offset = d->hwirq;
 	unsigned long flags;
 
+	gpiochip_enable_irq(&priv->gc, d->hwirq);
 	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
 
 	grgpio_set_imask(priv, offset, 1);
@@ -184,11 +187,13 @@ static void grgpio_irq_unmask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 }
 
-static struct irq_chip grgpio_irq_chip = {
+static const struct irq_chip grgpio_irq_chip = {
 	.name			= "grgpio",
 	.irq_mask		= grgpio_irq_mask,
 	.irq_unmask		= grgpio_irq_unmask,
 	.irq_set_type		= grgpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t grgpio_irq_handler(int irq, void *dev)
-- 
2.39.5


