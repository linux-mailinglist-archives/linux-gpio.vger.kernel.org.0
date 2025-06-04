Return-Path: <linux-gpio+bounces-20966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E75ACD4BB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 03:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BBF47A1D98
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 01:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E508F27C869;
	Wed,  4 Jun 2025 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+HfRgVP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81919E971;
	Wed,  4 Jun 2025 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748999245; cv=none; b=CmkJkRZ4mUmiDK0peZ2X2ZCMvuXBNr9gIqGwmcDU0buzw+XxZWCbAr+gMMHW2q1WGUF4iBP82gDuMCwljs3KvywmJsUDVRvfZ5GTHotVDHH5iz1pE0w/YzdkUTZIcsHD4sBAt/6Lq2tYrwfE2OSjX+/wfENWaD8QYuDP4GtOEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748999245; c=relaxed/simple;
	bh=sumlTL/h3xD4KDx0ObRgmGMgrD4aAsfWi3wYlfuvRxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GF0JT1ungz0UjnZ0r+/2YBOmdHwOQVVRY8ieD8quYNlbDHpOzPljFjVYwW06a0vGUfikI8MKTEANTD9L1kQDdxfOKykic0G8qCZ4VxWNTGLx0+FYuCuQNfxvO0Xgt1UH+GT6Aw77z5agokg0uWSSRf1VCU0KW/7piKbv9vah83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+HfRgVP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3117DC4CEF1;
	Wed,  4 Jun 2025 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999245;
	bh=sumlTL/h3xD4KDx0ObRgmGMgrD4aAsfWi3wYlfuvRxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B+HfRgVPECB2mys9VPZ3cVs+oytPzQH82hmPFSFIFhXrf/o4+A1/voxwdmYkDV0cg
	 sn6y8/p2/+DEWpHDECVBFZLu0kmSw0UtNGzZSZu32FEhC3wjP1z2pUK8Q0z6dSxxMt
	 LhGkz4c7j9XX6O8t1MowWYQ7GquuU4/qYJ9jJKOErFmP39CotIzLSS7maS9XwoXTZZ
	 ARyYNYbyROR9Gow6tBV7CBz5CSZ5hjhQI84la4W5eVjqmRxFVIXPr8x79q2VB6nxJc
	 JLD8fQBJNyTZRXJgoOVCm9LKmYm9iUcpj4TqcDeXfl7lsd9HTu5TAj+OIUXJ7wAY0x
	 v0PQENJSLwsdg==
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
Subject: [PATCH AUTOSEL 5.4 11/20] pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
Date: Tue,  3 Jun 2025 21:06:57 -0400
Message-Id: <20250604010706.7395-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010706.7395-1-sashal@kernel.org>
References: <20250604010706.7395-1-sashal@kernel.org>
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

From: Gabor Juhos <j4g8y7@gmail.com>

[ Upstream commit 6481c0a83367b0672951ccc876fbae7ee37b594b ]

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Link: https://lore.kernel.org/20250514-pinctrl-a37xx-fixes-v2-6-07e9ac1ab737@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, let me provide my assessment: **YES** This commit
should be backported to stable kernel trees. **Detailed Analysis:** 1.
**Bug Fix Nature**: This commit addresses a real bug where
`regmap_read()` errors are silently ignored in
`armada_37xx_gpio_get_direction()`. The function signature shows it
returns `int`, indicating it can fail and return error codes. 2. **Error
Propagation Pattern**: Looking at similar drivers (e.g.,
`/home/sasha/linux/drivers/pinctrl/meson/pinctrl-amlogic-a4.c`), the
standard pattern is: ```c ret = regmap_read(bank->reg_gpio, reg, &val);
if (ret) return ret; ``` This commit follows the exact same pattern,
which is the correct approach. 3. **Critical Function**: The
`armada_37xx_gpio_get_direction()` function is part of the GPIO
subsystem API that userspace and kernel code rely on. If `regmap_read()`
fails (due to hardware issues, power management states, etc.), the
function currently returns a potentially garbage direction value, which
could lead to: - Incorrect GPIO configuration - Silent hardware access
failures - Potential system instability 4. **Small and Contained
Change**: The fix is minimal: - Adds error checking for `regmap_read()`
- Propagates the error up the stack - No architectural changes - No new
features introduced 5. **Low Risk**: This change has minimal regression
risk because: - It only affects error paths that were previously ignored
- Normal operation (when regmap_read succeeds) is unchanged - It follows
established patterns in the same subsystem 6. **Similar Historical
Commits**: Looking at the provided examples, this aligns with commits
marked as "Backport Status: YES": - Similar Commit #2 fixed
direction_output callback behavior with error handling - The pattern of
adding proper error propagation is common in stable backports 7.
**Hardware Impact**: The Armada 37xx pinctrl driver is used in real
hardware (Marvell Armada 3700 SoCs), so fixing silent error conditions
improves reliability for users. 8. **Stable Criteria Compliance**: This
commit meets stable tree criteria: - Fixes a real bug (silent error
handling) - Small, contained change - No feature additions - Improves
system reliability The commit properly addresses a silent failure mode
in a hardware interface, making it a good candidate for stable
backporting to ensure system reliability across kernel versions.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 1ae1a944f35e0..45127d1237766 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -395,10 +395,13 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_EN;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	return !(val & mask);
 }
-- 
2.39.5


