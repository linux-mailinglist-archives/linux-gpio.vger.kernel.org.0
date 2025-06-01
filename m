Return-Path: <linux-gpio+bounces-20865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9783ACA612
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 02:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B9A0172AA2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 00:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEEC314F3C;
	Sun,  1 Jun 2025 23:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKYn+hhS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DE5314F30;
	Sun,  1 Jun 2025 23:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821185; cv=none; b=Sh8YaHTrZ8Mko1HUP3TiLfV5TNeyBzKODQV1WEzjlg6T1jqR0eEiCFdGPzf0ZAez0h/6yZ4yZUOuWsyODfd0HDRCf1IRjh1NvuOQXFjfZmiCAx68lL30ac9CB5dAl1c3xWe1WAfkaTmnM8GlKlx62vVwaJuc3CJrU8ifoL1eaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821185; c=relaxed/simple;
	bh=BO1+3C+R+/M+WlBSSbc4hL+5/qbHIUg7GDCTmTQa0io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7fN+ahQwyvLtmffG7Xi2U/UY5I4DXtthcTtykWlAKeRYk+ItCWXi/7fr+9ZYVZiCUmXEqwkVlQjTSqIJcKOtlOgmjcGtJdBNnxVun2PWZ/7YTCK/mAJ2x/HnbMjT9nzFgRButBm4Nd4W1wypIWnxqz5oGLPoLx+gvlxw6F0kqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKYn+hhS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6654C4CEE7;
	Sun,  1 Jun 2025 23:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821184;
	bh=BO1+3C+R+/M+WlBSSbc4hL+5/qbHIUg7GDCTmTQa0io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKYn+hhSxkzp9+RvQtnDO7kdxRc5d0SAMHzSMuMTXfUO27LotfmntW1Og1z1CjH9b
	 7JPLIJpbEpPxWVATWNFBT6H8bymcZ/UGH/jLH3uyECAKaqzxtYeb0SCzkDUeo4zw9v
	 rheiu+z2ycQ0Q+JI2TWMnm/DRfadx6Ox5BBmPfwLyOrAoL6JgzPW+3adKS0DazL0JA
	 V4MBQtcmrkAjv2WtlSmXpduHl37aXGfFX4OcJMj83TD5BAUUuaxugAy0+hC4VtXejr
	 jmTOBoinhVWhDcQl0rXxJcqXCv2HyImzKPcUGcBRmDCknZDJTBMkHZUWqVn/N7iGN1
	 /qDivn94Box/g==
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
Subject: [PATCH AUTOSEL 6.6 53/66] gpio: xgene-sb: Make irq_chip immutable
Date: Sun,  1 Jun 2025 19:37:30 -0400
Message-Id: <20250601233744.3514795-53-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

[ Upstream commit 580b3264cb252cae00fa62d58443af09c25f7d61 ]

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify xgene_gpio_sb_irq_chip, flag the irq_chip as IRQCHIP_IMMUTABLE,
add the new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20250509-gpio-v1-7-639377c98288@nxp.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the kernel context, here is my
determination: **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: ## Analysis of the Commit ### 1.
**Purpose and Nature of the Change** The commit addresses a kernel
warning about mutable irq_chips by converting the
`xgene_gpio_sb_irq_chip` to be immutable. This is a **bug fix** that
eliminates runtime warnings, not a new feature or architectural change.
### 2. **Code Changes Analysis** The changes are minimal and follow an
established pattern: **Key Changes:** - **Made struct const**: `static
struct irq_chip` → `static const struct irq_chip` - **Added
IRQCHIP_IMMUTABLE flag**: Prevents runtime modification of the irq_chip
- **Added resource helpers**: `GPIOCHIP_IRQ_RESOURCE_HELPERS` macro -
**Replaced direct parent calls with wrapper functions**: -
`irq_chip_mask_parent` → `xgene_gpio_sb_irq_mask` (which calls
`gpiochip_disable_irq` then `irq_chip_mask_parent`) -
`irq_chip_unmask_parent` → `xgene_gpio_sb_irq_unmask` (which calls
`gpiochip_enable_irq` then `irq_chip_unmask_parent`) ### 3. **Comparison
with Similar Commits** This commit follows **exactly the same pattern**
as the similar commits marked "YES" for backporting: - **gpio: vf610:
make irq_chip immutable** (Status: YES) - **gpio: 104-idio-16: Make
irq_chip immutable** (Status: YES) The changes are nearly identical in
structure and purpose to these approved backports. ### 4. **Risk
Assessment** **Very Low Risk:** - **Contained change**: Only affects the
xgene-sb GPIO driver - **Follows established pattern**: The
IRQCHIP_IMMUTABLE pattern has been widely adopted across GPIO drivers
since kernel v5.19 - **No functional behavior change**: The GPIO
operations work exactly the same way - **Well-tested pattern**: Multiple
GPIO drivers have successfully adopted this pattern ### 5. **Backport
Criteria Evaluation** ✅ **Fixes a bug**: Eliminates kernel warning about
mutable irq_chips ✅ **Small and contained**: Only 20 lines changed in a
single driver ✅ **No side effects**: Change is purely about chip
mutability, not functionality ✅ **No architectural changes**: Uses
existing infrastructure introduced in v5.19 ✅ **Follows stable rules**:
Important bugfix with minimal regression risk ✅ **Critical subsystem
consideration**: GPIO is used widely, but change is driver-specific ###
6. **Historical Context** The IRQCHIP_IMMUTABLE pattern and supporting
infrastructure were introduced in linux-kernel v5.19** (commit
36b78aae4bfe). This commit uses the same established APIs
(`gpiochip_enable_irq`, `gpiochip_disable_irq`,
`GPIOCHIP_IRQ_RESOURCE_HELPERS`) that have been stable since then. ###
7. **Warning Elimination** The commit specifically addresses the kernel
warning "not an immutable chip, please consider fixing!" which can be
disruptive in production environments. Eliminating such warnings
improves system stability and reduces noise in kernel logs. ###
Conclusion This is a straightforward bugfix that follows a well-
established, low-risk pattern adopted by numerous GPIO drivers. It
eliminates kernel warnings without changing functional behavior, making
it an ideal candidate for stable tree backporting.

 drivers/gpio/gpio-xgene-sb.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index a809609ee9570..6b799c17902c9 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -102,12 +102,32 @@ static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)
 		return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
-static struct irq_chip xgene_gpio_sb_irq_chip = {
+static void xgene_gpio_sb_irq_mask(struct irq_data *d)
+{
+	struct xgene_gpio_sb *priv = irq_data_get_irq_chip_data(d);
+
+	irq_chip_mask_parent(d);
+
+	gpiochip_disable_irq(&priv->gc, d->hwirq);
+}
+
+static void xgene_gpio_sb_irq_unmask(struct irq_data *d)
+{
+	struct xgene_gpio_sb *priv = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(&priv->gc, d->hwirq);
+
+	irq_chip_unmask_parent(d);
+}
+
+static const struct irq_chip xgene_gpio_sb_irq_chip = {
 	.name           = "sbgpio",
 	.irq_eoi	= irq_chip_eoi_parent,
-	.irq_mask       = irq_chip_mask_parent,
-	.irq_unmask     = irq_chip_unmask_parent,
+	.irq_mask       = xgene_gpio_sb_irq_mask,
+	.irq_unmask     = xgene_gpio_sb_irq_unmask,
 	.irq_set_type   = xgene_gpio_sb_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int xgene_gpio_sb_to_irq(struct gpio_chip *gc, u32 gpio)
-- 
2.39.5


