Return-Path: <linux-gpio+bounces-20965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CA7ACD4FB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 03:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48FD1BA26AD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 01:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310AE27CB00;
	Wed,  4 Jun 2025 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6mP+Vlz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE79927C861;
	Wed,  4 Jun 2025 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748999244; cv=none; b=jE6W+yAgs2ymTlmQqS30tt/jNrkHo3C03dAE7zfUvdU1lsNYHD9bYfktXcIbEdd/Sdk8NtAkqFS58nKqC5rdihz3xAX9h4qZWBeGRU0BCNCYh+Pvw+rbhLKsRjwUr0ai0b5odmnMgL60jm5goQ8XDAyDL1sJofY/qoOIClarqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748999244; c=relaxed/simple;
	bh=rjF3uAC5sDiakL1mOlNOmrSdPifA6TY0iaN0TIa7V3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L+Ty5JCk/klezB4NGAFWius7ppwmT+Etgd1JuK4w7wf4+CDo/mc5rn7K9SLf2yqbJ+XJ+1GGSohy96UvdJaTOozySZYZtEyT677PeB310G3P1vAV9OxYpcDiIN9a3R/JXybnAnkVhnesCFnKuULYY9f/KsTs+5haSSRZzyQ8b0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6mP+Vlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788DCC4CEF2;
	Wed,  4 Jun 2025 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999243;
	bh=rjF3uAC5sDiakL1mOlNOmrSdPifA6TY0iaN0TIa7V3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6mP+VlzzuITGyjRiAOvsjUjg0lIG03rt6R7blaih3MZQsshtzQeN+VT2pVIz4sJj
	 +lpRriRYtBoXuXUJijhrAWMqLOS8+gSTHyWJLrb5htlmjPCdIhs23nmy7UiQakIqfr
	 V4MmaE6xwKGzxwglq+eWAzq5vpsooD4k3qiJo+k6PfNyAwNWJJTE8AqEsENMhHrC3A
	 71hUqPKl/6dG2MVs+FQbsgscFnr09BkNkKGQZp5w9GU+bTDrszmifQuCAf37Ci0Mp+
	 g4Y2grJHr16URb4fWQ6DCpfkjKQHahP05egEdrsGq4H4AFt9VPSktkffDS53c6FD75
	 KY72c/Pd6NJxQ==
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
Subject: [PATCH AUTOSEL 5.4 10/20] pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()
Date: Tue,  3 Jun 2025 21:06:56 -0400
Message-Id: <20250604010706.7395-10-sashal@kernel.org>
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
index 359b2ecfcbdb3..1ae1a944f35e0 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -353,9 +353,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
 
 	val = grp->val[func];
 
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_set(struct pinctrl_dev *pctldev,
-- 
2.39.5


