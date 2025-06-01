Return-Path: <linux-gpio+bounces-20857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1EBACA47A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 02:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1730A3A43C8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 00:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DA12980DB;
	Sun,  1 Jun 2025 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coQarwzR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59B2980CD;
	Sun,  1 Jun 2025 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820802; cv=none; b=U/3eF7mCv9SBgkFo2CbHmdNV7vsM7D/kehv1bSIfCmSpLrypwy8S5Z75ukwGBEFckeE09evj+PnDgzAaspTVXneqPfURfQwHzl/QpvNK/vX49hR34MhXkwx2S8zi/3d281tpNGS9wXXnR4nI/v6VkWaG+FQJ7KwMGPqv2W4lpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820802; c=relaxed/simple;
	bh=ABNSrmmqESmDEY94KRt/NQ5MxAgDV+sFmQUtnAD4F7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=slJzuMQie1lKa98W+XjizaZ3UYKCm/XVyy7vHr6efYqWPPWIeiOe/zz6tA0P/8F6RWkpqFzWxM49Jxs5ezkZ3EnhaxwAD07EbvF4JSzb1SDIr2CuFxkxAXPT2ylLt7FBDX4Vth2dZ1G9WuWEFElwkXQppjnMuc4PvQeM9TsFwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coQarwzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2A6C4CEF2;
	Sun,  1 Jun 2025 23:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820801;
	bh=ABNSrmmqESmDEY94KRt/NQ5MxAgDV+sFmQUtnAD4F7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=coQarwzRZjAwm18m9f+qcXUAFjtc+lZ0EV+VHIswzKx2dJgNoJO97m9a0geu9UmAq
	 dQqXiMF+hSuLdVIPKVBqA2LwexOKPq0B4dGQrefzjTvU2m+UXqmNsvhmB1ngTHSUCp
	 ao2U7fpw82iS98PdfEr+GW1vCy+UxHp7g3gXzRoNzTAIDCynfzpOl1lDnPOwyfcov4
	 0Uj2CsXVvzsmQZFK2Y0jY/kJAp5UiYT9oi8e6Pp4kD5t7SzPLSVjP0JscgboSCfmMo
	 SBWdjM7IztTAZS+i9UPC5ii27oTp0dmnU2yxgcMkVsBqcpGl7JlAhcAj3f/tBBuInA
	 QIzjgIZ5mu4lQ==
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
Subject: [PATCH AUTOSEL 6.14 083/102] gpio: grgpio: Make irq_chip immutable
Date: Sun,  1 Jun 2025 19:29:15 -0400
Message-Id: <20250601232937.3510379-83-sashal@kernel.org>
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
index 169f33c41c592..7902bd8786977 100644
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


