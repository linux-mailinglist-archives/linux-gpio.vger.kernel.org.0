Return-Path: <linux-gpio+bounces-20949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B32ACD405
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 03:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75E00189A4EC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 01:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AEC266F0A;
	Wed,  4 Jun 2025 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvzDNfaD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624571DF742;
	Wed,  4 Jun 2025 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998986; cv=none; b=ayalIBuarBmbTc+jKzYQKvI37Bz4VN4DRMyAId0pjppYnQSqPoU7UsUlt2btDf5dFHz7qrBNdbg0ghAtxf5ceOQDJEPjn4P2ZGHkI+usI8em5zEpS8QnI+CfXO0BqKIsmlh5Sw3WUuE9m1cImKU5/gHvFrcdGc7oljEDxtzKBvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998986; c=relaxed/simple;
	bh=6XD+rf7iQEJVv9z3F6G/lWhtYc3u1W2AgZnc2aPTEkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7w8KmPwACVB2qi82iKo7yROhKvirzqdBdNCe78fHA3T5Oo2MTm7traW9lJizhyzQ4az+3ibI8b9ELH5AqPQBPEwrHSCSz3h7bUFuo7CEot94Ts54mGeV4ONDbyCkw0H1rdTcBj8+tCcA7x2cpVnIcJgSeHpEwf23gh2ac3ZSbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvzDNfaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02F3C4CEF1;
	Wed,  4 Jun 2025 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998986;
	bh=6XD+rf7iQEJVv9z3F6G/lWhtYc3u1W2AgZnc2aPTEkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GvzDNfaDq9mihytVGKH/Ns+t4YwP8x0AXL1QE8t4BQYMaMySIVuiPZGGy6fPsldvT
	 yFT4fsZrRhwbJNAU7LPEJaFfsmtPTnBTJXl0ONilpA3jiuAUKZZeko3QNUIAC3d/EI
	 i2BOSxr/jsUZIywHy/eFuL6Llv4Nl7WIUmM+KO2+gYb2G+nLvTvN7qd2hdLR+XAsrh
	 PC3bYEzqCv6Fisp98rrp/yaTrk4bXmkwallRem9Q6J/iaKaQ49sQxWzoz3ki8P+FIy
	 lD6i2NQQEnebqX9tgdkdlYVtuOy3PLG1my8B0N0UGZzspawcqHfmNlWieAI+QcQVHA
	 R5Nv5VF79arjA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Gabor Juhos <j4g8y7@gmail.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	brgl@bgdev.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 29/62] pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
Date: Tue,  3 Jun 2025 21:01:40 -0400
Message-Id: <20250604010213.3462-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010213.3462-1-sashal@kernel.org>
References: <20250604010213.3462-1-sashal@kernel.org>
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

From: Gabor Juhos <j4g8y7@gmail.com>

[ Upstream commit 57273ff8bb16f3842c2597b5bbcd49e7fa12edf7 ]

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Link: https://lore.kernel.org/20250514-pinctrl-a37xx-fixes-v2-4-07e9ac1ab737@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my comprehensive analysis, here is my determination: **YES**
This commit should be backported to stable kernel trees. Here's my
detailed analysis: ## Analysis of the Code Change The commit fixes a
clear bug in the `armada_37xx_gpio_get()` function in
`drivers/pinctrl/mvebu/pinctrl-armada-37xx.c`. The specific changes are:
1. **Before**: `regmap_read(info->regmap, reg, &val);` - ignores return
value 2. **After**: `ret = regmap_read(info->regmap, reg, &val); if
(ret) return ret;` - properly handles errors ## Backport Suitability
Assessment ### ✅ **Meets Stable Tree Criteria:** 1. **Bug Fix**: This
clearly fixes a real bug where regmap read failures are silently
ignored, potentially returning garbage data to userspace. 2. **Small and
Contained**: The change is minimal (3 lines added) and extremely
focused, affecting only error handling in a single function. 3. **Low
Regression Risk**: The change only adds error checking where none
existed before. It cannot introduce new bugs - it can only prevent
incorrect behavior. 4. **No Architectural Changes**: This is purely
error handling improvement with no changes to the driver's architecture
or interfaces. 5. **Important Subsystem**: GPIO operations are
fundamental and used by many kernel subsystems and userspace
applications. ### ✅ **Follows Established Kernel Patterns:** My analysis
of other GPIO drivers shows this error handling pattern is **universal**
across the kernel: - `gpio-arizona.c`, `gpio-bd71828.c`, `gpio-
madera.c`, `gpio-max77620.c`, `pinctrl-axp209.c`, and many others -
**Every examined driver** checks `regmap_read` return values in GPIO get
functions - The armada-37xx driver was an outlier in ignoring these
errors ### ✅ **Real-World Impact:** This fix addresses scenarios where:
- **Hardware communication failures** (I2C/SPI bus errors, device power
issues) - **Device disconnect events** (hot-plug scenarios, power
management) - **Timing/electrical issues** causing intermittent regmap
failures Without this fix, `gpio_get()` would return potentially garbage
values (using uninitialized `val`) when hardware communication fails,
leading to incorrect GPIO state reporting to userspace. ### ✅
**Reference Similar Commits:** Looking at the provided examples, this
commit closely resembles: - **Similar Commit #3 (Status: YES)**: "Fix
irq_of_parse_and_map() return value" - fixes incorrect error handling -
**Similar Commit #1 (Status: YES)**: "Convert to use dev_err_probe()" -
improves error handling patterns Both are small, focused error handling
improvements that were deemed suitable for backporting. ## Conclusion
This is a textbook example of a stable tree candidate: it's a small,
safe bug fix that brings the driver in line with kernel-wide error
handling standards, addresses real hardware failure scenarios, and has
zero risk of regression while providing tangible benefits for system
reliability.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 4623b5e44ba6a..029db538752db 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -441,11 +441,14 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = INPUT_VAL;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
 
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	return (val & mask) != 0;
 }
-- 
2.39.5


