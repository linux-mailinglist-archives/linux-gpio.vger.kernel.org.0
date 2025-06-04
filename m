Return-Path: <linux-gpio+bounces-20956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA5ACD450
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 03:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 463253A587E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 01:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0503D271473;
	Wed,  4 Jun 2025 01:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faMxeYBB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EA23E342;
	Wed,  4 Jun 2025 01:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748999151; cv=none; b=hfypK2ENkEPSWkPVwhuDmRXxba7y99/QV5FpOEJwIyWQ9YAjMI09MVavnYCP8dMcXHxMTDPL5MEDko5KYz8k3xvRmLqYzeKf5JwMPNlNMZL/7KHr+8LXxbWWu3aCwzQd3jpSntcuMf/uL6YZCsQfxlFyhwh246kRoA3be+0DMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748999151; c=relaxed/simple;
	bh=1x2Kz34n6d5UI4p3BnJVey+mnCI47EjYOEBVOjr2VcY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErzX1PRNy7YIJgjVg5RLEg320mRlWCXzdo0ZCsLfbjGOlpkUNU47nLgRrbn39Patm5+vPWZhVNGeTIkiuC1eFbY+kvZrttGDsEjxivsmgRFaCZLoqbuhKTzb4hTjvianTedEu+Civ/jr0U0lRdIrYPf1tBbNt4l9kdCEVzlpIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faMxeYBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD08C4CEED;
	Wed,  4 Jun 2025 01:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999151;
	bh=1x2Kz34n6d5UI4p3BnJVey+mnCI47EjYOEBVOjr2VcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=faMxeYBB8h/LsvP4vffOkKkdC8XwPWqE98xbftgIlsM325f6g16By742KyG3j1WrD
	 9TmC+2GHLEr+6mOkaonliVOCSiKhK4FsI6GCTeNIdRrMiVVEngQITLKISwIV9LSM5u
	 sCF1C4qPP+twDdcWV9geusq34TYetSKOvNthxCjCSZC2gvbf3i683jl60uKeU8qXpw
	 QHkSAO+bhnQUyaCjlSj5atU8U/FxrH4CIjzF9o21Fz9ShCCC/oT47zBMbNYFr/dWG3
	 2lhAZrimrq/zVlWOIcVscqO1Me0yBQJc8zSv0WmQqCHq2W3l2hJ+jCKujTAt/9U6Mr
	 LoYlj1CSH9OaA==
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
Subject: [PATCH AUTOSEL 5.15 15/33] pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()
Date: Tue,  3 Jun 2025 21:05:06 -0400
Message-Id: <20250604010524.6091-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010524.6091-1-sashal@kernel.org>
References: <20250604010524.6091-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Gabor Juhos <j4g8y7@gmail.com>

[ Upstream commit 4229c28323db141eda69cb99427be75d3edba071 ]

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Link: https://lore.kernel.org/20250514-pinctrl-a37xx-fixes-v2-7-07e9ac1ab737@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the code context, here's my
assessment: **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: ## Code Analysis The commit changes
`armada_37xx_pmx_set_by_name()` function from: ```c
regmap_update_bits(info->regmap, reg, mask, val); return 0; ``` To: ```c
return regmap_update_bits(info->regmap, reg, mask, val); ``` ## Why This
Should Be Backported 1. **Bug Fix Nature**: This is a clear bug fix that
addresses silent error handling. The `regmap_update_bits()` function
returns an integer error code (0 on success, negative on failure), but
the original code was ignoring this return value and always returning
success (0). 2. **Error Propagation Impact**: The function
`armada_37xx_pmx_set_by_name()` is called from: -
`armada_37xx_pmx_set()` - the main pinmux set function -
`armada_37xx_gpio_request_enable()` - GPIO request handler that already
checks return values 3. **Consistency with Similar Fixes**: Looking at
the historical commits provided: - **Similar Commit #2** (Backport
Status: YES) shows the exact same pattern where
`armada_37xx_gpio_request_enable()` was updated to check return values
from `armada_37xx_pmx_set_by_name()` - This current commit completes
that fix by ensuring the function actually returns errors when they
occur 4. **Critical Subsystem**: This affects the pinctrl subsystem
which is fundamental to GPIO and pin configuration. Silent failures in
pin configuration can lead to: - Hardware not being configured correctly
- GPIO requests appearing to succeed when they actually failed -
Difficult-to-debug hardware issues 5. **Minimal Risk**: The change is
extremely small and contained: - No new functionality added - No
architectural changes - Simple error propagation fix - Maintains
existing API contract 6. **Stable Tree Criteria Compliance**: - ✅ Fixes
an important bug affecting users - ✅ Small, contained change - ✅ No new
features - ✅ Minimal regression risk - ✅ Affects critical kernel
subsystem 7. **Real-World Impact**: Without this fix, regmap failures
(which can occur due to hardware issues, power management problems, or
I2C/SPI communication errors) would be silently ignored, leading to
unpredictable system behavior where pin configurations appear successful
but are actually failed. The commit follows the pattern established in
the historical commit #2 which was marked for backporting, and
represents the completion of proper error handling in this driver's
critical path.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 7338bc353347e..46cccd72b4ddd 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -354,9 +354,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
 
 	val = grp->val[func];
 
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_set(struct pinctrl_dev *pctldev,
-- 
2.39.5


