Return-Path: <linux-gpio+bounces-20962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F93ACD482
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 03:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C179B16D349
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 01:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB8A2797A4;
	Wed,  4 Jun 2025 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fN6Y4frj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754741B0420;
	Wed,  4 Jun 2025 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748999207; cv=none; b=UrAfb9U7I+pLaALSyGGE7qTWiYspT9ym1US9j+OEy5wNwJLM6FBo3ZSS790GBepxI/LbjWqk6eXQrmQy+JH+wIFtL4xBpeCgI2BUUjT8lIsojz9dNCoLNkKzIbM/TyKfApxzmfkxyNAh6HL1deoBHAvmte0nijVrv8N50rPGcDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748999207; c=relaxed/simple;
	bh=DQDdxzOsLylR1llDmUfe8CkdSglGtFIgnG+jpBRKRmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lcv9rfmjCR15q6XeIKyRjoqG2SqrYFMb6hjO522Wy+MGxPq03KKqQvLtSzwo/yN7Q7xlpYwiajNXLgHhp8RJbowHa2JDpveRcbLAvfpSvRjs9IqkYaTGwnTswspO4nGYwnCvrMhOy+MHhDLqlHNNlEKPaw7HEiLYhvimSvJy57g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fN6Y4frj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057E7C4CEEF;
	Wed,  4 Jun 2025 01:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999207;
	bh=DQDdxzOsLylR1llDmUfe8CkdSglGtFIgnG+jpBRKRmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fN6Y4frjEt3VZuwGECcmVli2rtR+SmXlB548HMWCURwTjjlJOl66PvVKySRAZ2kXb
	 Sxzx/JQ1300USlXkmDENETHJZVkuFyBb/y9G6qSExaHM64+4XRBsmQ1BkgqJXa6suZ
	 o6RgVCdtvrNqgL8ETbRCCvCFZolLQmvPxSgweEjlDPz61Za/nEUpoMa6KPwgjG7WEl
	 bMQgm7aAQME0/C73boQb4mDADMoml9c+F8OaAK9yMjHBpvsF0v+1d5qKS3EWRdOqaC
	 19qD+7euTUUYEpBAy57lMDCAMRDd3uzm2pZmfPmQUXO7zOwqCHOYUJeevJVaNJt+EE
	 /kMkS6Ak7f7QQ==
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
Subject: [PATCH AUTOSEL 5.10 15/27] pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
Date: Tue,  3 Jun 2025 21:06:08 -0400
Message-Id: <20250604010620.6819-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010620.6819-1-sashal@kernel.org>
References: <20250604010620.6819-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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
index da83f188351d3..4153ede3358d0 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -396,10 +396,13 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
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
 
 	if (val & mask)
 		return GPIO_LINE_DIRECTION_OUT;
-- 
2.39.5


