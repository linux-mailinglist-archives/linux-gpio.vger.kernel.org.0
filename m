Return-Path: <linux-gpio+bounces-23251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE84B04BB8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 01:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8341AA1C7E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 23:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A09A28F92E;
	Mon, 14 Jul 2025 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itztdLOL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9E28F51A;
	Mon, 14 Jul 2025 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534427; cv=none; b=aOXZ4ZD/1/G2DCSVvQjpxwdbj/zJGGYgz4G+rP4JEz7efg1u7EbACgqu/YBrW2SZfrexZyFl3tmKunAFdqbd59/frRbXR9NtQH6L9vD7UQqZh6ZfrXFPLrzT1USsOuR8q9Hn4YuRgmxFUddaBLEtZBqiogpC7Oa0NUhk2PO3TvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534427; c=relaxed/simple;
	bh=uRL3ttv24FxB9LrX86pQCOcTaY+XvWK+JYdoIk7yEu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SkGp4GFqi90KgIgCMzHyoYOyx4zeiNfRA+Ef2Cmn+OvjaoM7ckPDwXwd/l/47Mhhtr5MrGnY7N7uPv3Y/E16pdMCSac4UZBaEEzLcXuSeUwCsT9Ulr6J1btUFLMpguQUp3Er2WG1knm3qUyHTBYV7/JTRw+neBxOymzDi7oSspE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itztdLOL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E504C4CEED;
	Mon, 14 Jul 2025 23:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752534426;
	bh=uRL3ttv24FxB9LrX86pQCOcTaY+XvWK+JYdoIk7yEu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=itztdLOL9qUkVPuv2TdMpcpaDQRoRffbHSyoqQx1O8bfBH2y3FW2J/mpmHEu2rJCH
	 OK62c+kJPlSoqtytSmNUmkGRsMSKepWS5jUVna5ils9ldmvP0PONrIa3/wFk+1TPoO
	 3owXzE2ClMIoFgJfh04HFWAZf0OIHP1uWr7DmOH9LORcfHVz61zXddLA+o96ttSGhV
	 T+OtetOR2HEkG3yFGOXX9YESLuf3OZr5IaIubWELEMpWmPwX5fjevYMvkt0T3I7nHV
	 MeOJ7pdos3t4vj4dSRY0zSZ61tYFWAIve4Lr51ra3No29Id+MxHJT6ZK/0sC2dVrcy
	 smDjO4e2/q14w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Milan Krstic <milan.krstic@gmail.com>,
	David Bauer <mail@david-bauer.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 13/15] pinctrl: aw9523: fix can_sleep flag for GPIO chip
Date: Mon, 14 Jul 2025 19:06:14 -0400
Message-Id: <20250714230616.3709521-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714230616.3709521-1-sashal@kernel.org>
References: <20250714230616.3709521-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.6
Content-Transfer-Encoding: 8bit

From: Milan Krstic <milan.krstic@gmail.com>

[ Upstream commit 5285b5ed04ab6ad40f7b654eefbccd6ae8cbf415 ]

The GPIO expander is connected via I2C, thus the can_sleep flag has to
be set to true. This fixes spurious "scheduling while atomic" bugs
in the kernel ringbuffer.

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Milan Krstic <milan.krstic@gmail.com>
Link: https://lore.kernel.org/20250703143039.5809-1-milan.krstic@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**YES**

This commit should be backported to stable kernel trees.

## Extensive Explanation:

This is a critical bug fix that addresses a **sleep-in-atomic-context**
issue in the aw9523 GPIO expander driver. Here's why this is an
excellent candidate for stable backporting:

### 1. **Clear Bug Fix**
The commit fixes a concrete bug where the driver incorrectly sets
`can_sleep = false` for a GPIO chip that communicates over I2C. As
evidenced in the code:
- The GPIO operations (`aw9523_gpio_get`, `aw9523_gpio_set`, etc.) all
  use `mutex_lock(&awi->i2c_lock)` and `regmap` operations
- All GPIO operations involve I2C transactions through
  `regmap_read/write`
- I2C operations can sleep and cannot be called from atomic contexts

### 2. **Causes Real User-Visible Issues**
The commit message explicitly states this causes "spurious 'scheduling
while atomic' bugs in the kernel ringbuffer". These are serious kernel
warnings that indicate the system is attempting to sleep in contexts
where sleeping is not allowed, which can lead to:
- System instability
- Kernel warnings flooding the log
- Potential deadlocks or system hangs

### 3. **Simple, Low-Risk Fix**
The fix is a one-line change from `gc->can_sleep = false;` to
`gc->can_sleep = true;`. This is:
- Minimal in scope
- Only affects the metadata about the GPIO chip
- Doesn't change any actual functionality
- Just correctly declares the chip's sleeping requirements

### 4. **Similar to Previously Backported Commits**
Looking at the similar commits:
- Commit #1 (gpio-adp5588): Fixed sleep-in-atomic bugs - **BACKPORTED**
- Commit #3 (ltc2992): Fixed the same `can_sleep` flag issue for another
  I2C GPIO chip - **BACKPORTED**

Both of these commits addressed the exact same class of bug and were
deemed suitable for stable backporting.

### 5. **Long-standing Bug**
The bug has existed since the driver was initially introduced (commit
576623d70661), meaning all kernel versions with this driver are
affected. The original implementation incorrectly set `gc->can_sleep =
false`.

### 6. **Meets Stable Kernel Criteria**
According to stable kernel rules, this fix:
- Fixes a real bug that users can hit
- Is already in Linus's tree (merged)
- Is small and self-contained
- Doesn't add new features
- Has minimal risk of regression

The commit is essential for proper operation of systems using the AW9523
GPIO expander, preventing kernel warnings and potential system
instability when GPIOs are accessed from non-sleeping contexts.

 drivers/pinctrl/pinctrl-aw9523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 9bf53de20be87..04afb344e9e58 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -784,7 +784,7 @@ static int aw9523_init_gpiochip(struct aw9523 *awi, unsigned int npins)
 	gc->set_config = gpiochip_generic_config;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
-	gc->can_sleep = false;
+	gc->can_sleep = true;
 
 	return 0;
 }
-- 
2.39.5


