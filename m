Return-Path: <linux-gpio+bounces-20864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E186ACA63C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 02:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 072F51886746
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 00:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43809314F24;
	Sun,  1 Jun 2025 23:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFDo4nzf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD81270ED4;
	Sun,  1 Jun 2025 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821184; cv=none; b=N7yVL4HvmqzW1b466spfzcj0Zy8O/EltXZHcdpSbelsTE5JoCG4wI09rgNUB/kVUP+iaqS2eOJwmq/xuxK1WP4tTMw4e9q8SQE50NyT3SoqFboloF8YfnyktFrCOye+HsEpvj50vMxcNXE9hWa0JoXxvjwhYZkm9MjJRFioiP+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821184; c=relaxed/simple;
	bh=RzsS+Ira+lZGYNkoM7HVLCzrbWYtQiuPa9VSBqR3/vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ufk4+ywTrLFGD2TmYOXDKcae3CGSXDcXBiDPl6KUJcGD41hzsPiOkNKwDP4WxVSmv3RSwjch5ZEef7uxcnz44wQLDeatrauL1sUuOggtz2+0aEk/g52Azg/x58qSEzqucjTl9V0xm8wGcYB/0Uu09Y/5okOpgmuFGN5v2kXZtO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFDo4nzf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719DDC4CEF1;
	Sun,  1 Jun 2025 23:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821183;
	bh=RzsS+Ira+lZGYNkoM7HVLCzrbWYtQiuPa9VSBqR3/vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fFDo4nzf1ahYQqYavxkp4DhW+ms9pei5iJYBwmedS29Ouas0YzOwFNe3jLuhwWJmf
	 jYguNchnzt5DBoOdUgYdIVmHcGZRf0tpr63JbJNGyj4gKij08ybDmBkO44k3QYyEqe
	 zE9kr5xUunE/28UaDSHYS8/KgIVISdg0TvsTs6eRyxZmks7u8MzMY1VXXHhHhrBT8O
	 qzawxp64XK13AGdHd0oidgZ3oP/EuqKfMNJ1Df4NQSo/bSzlQ3p/YQyXUaxVgtGkLy
	 m0g9K3yjpjLjvXg4yUMeB56eHOTZR4w6hP3KznwakqBWyJgoiNAY87R5nRaRkXAF7a
	 qME4biTTug2yQ==
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
Subject: [PATCH AUTOSEL 6.6 52/66] gpio: grgpio: Make irq_chip immutable
Date: Sun,  1 Jun 2025 19:37:29 -0400
Message-Id: <20250601233744.3514795-52-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
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
index 637a4d45f8c77..243a28cfbd990 100644
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


