Return-Path: <linux-gpio+bounces-20856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D23FACA455
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 02:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05346176884
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 00:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0F02980DC;
	Sun,  1 Jun 2025 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1vZBRru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898C2980CB;
	Sun,  1 Jun 2025 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820802; cv=none; b=KJaDhDqdn1nj/vkc9EWMNM/8UGD1JOSNVay2C+tbwOIHAPztlQ4rBdYFBWWTq7WxuO0fa4cIbFPvpZGmKfbLKKUnw6uHBVB+3rlm51xbP3zha292Uj1b3E7/RFbk5BGEzqUP4x7E8fEOJ0k2BD0+Ht9bs44f2tcyUfFSga7nM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820802; c=relaxed/simple;
	bh=I3eJm8Fm35AY8MVLcJc0nL8Z6dapbowRudX+5kMryGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCTFdPsf5yYzduvl8gPgqaLLbVGUuGIlVIpaZ4h0q5tW98d6m7hlSFy435HfVyW5dIhtKW9vcRpDkk/BNI1mhYFKLbJ5Afzbxbb2w/lyeicLmYct9NcgNrC1Ak3j/Jnnbt1SCDC8RerreSZ2WF9MPPLYon+iv9wgMfhaEp2XaaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1vZBRru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEABC4CEEE;
	Sun,  1 Jun 2025 23:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820802;
	bh=I3eJm8Fm35AY8MVLcJc0nL8Z6dapbowRudX+5kMryGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1vZBRruklCjTTYaehRov5+wmkNaNXPe9ijJSzj5Gczp+mMPRT6xytC0G11Uxzi02
	 E8Fny3wqDSitO+HtXsshGo0W4wzcgTEOpwr4RaTRG+o/P2k/hUsuD07f1vHGBFVw66
	 5H91gAReUCtgVzdhQcmhoxqh07+XkxHgVBbXrQUyYSZECkx8lOZo+odSoUrfklovMY
	 F0lI8MOvZERRb9GT4zcdo6J4Cy3+/G/+VDsQ+TBGjxaHlHdouORsBIyTYvx+avDbdY
	 eH0QZ6yfDmXSfnnXu7ufxnKeOY4yvG+tXpm61IfZ7uALbObnjXzIxAvrgHAv+cMk6G
	 Tyj7Ij0mifh0w==
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
Subject: [PATCH AUTOSEL 6.14 084/102] gpio: xgene-sb: Make irq_chip immutable
Date: Sun,  1 Jun 2025 19:29:16 -0400
Message-Id: <20250601232937.3510379-84-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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
index 48b829733b150..b51b1fa726bb5 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -103,12 +103,32 @@ static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)
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


