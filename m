Return-Path: <linux-gpio+bounces-20933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444AACD185
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 02:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA8E189995A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 00:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54D11DE3DC;
	Wed,  4 Jun 2025 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWzdcGci"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301C1DE3CB;
	Wed,  4 Jun 2025 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998350; cv=none; b=JFWfKm3QvB377dAdDBOjBC6i/6RTaXsoSdqa2/eHKdeCG4Mjm83IJqKgQAQbMkgM4P3xoRSYyv5EqK2ibPCgZKotV6cBHlmp3rEY4DUnKHhqBXrxyM/b1xwlQIoK1pPa+UbfhJVeKvIZ11nXZECREQm5PfgYY9bw0MhR8cVFaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998350; c=relaxed/simple;
	bh=jTneZdOJjc2eX7VIrXjV3E1T7NY9+qMScGkWfoPBP44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJY7xJ3WOBxbfqwTJyU/asUt3xlhDgn4PFSW2ApII0CSUtME3M4u0yWiGHhpJrKwNBD1lmhQ6e6WLRW2Cn64wJBzl0XWm1ZzUf1oBpbH3JkuoB+bOz9DWHAPwU05kgej8Sc994crJJiCKQW7JBMlr68MNi9SlF3eEi5l/1op4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWzdcGci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253BEC4CEF4;
	Wed,  4 Jun 2025 00:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998350;
	bh=jTneZdOJjc2eX7VIrXjV3E1T7NY9+qMScGkWfoPBP44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWzdcGciwj267JiNnpbVtQ/AC5NtHDlHrMmJ+WrcXCUBl4S9TNRRTcMI9/STwIGsS
	 vPWbEnm3nMTspi8Vp3c4UBaEgWvHjW/d2remf8JJzWI0IqrIUIW6K+5pPElFyTIJX0
	 JdTMeeRihWuAwarnfXaNgfdD+RWZYo74weRX2Y/+5ntxwEgaQEQUPRoKGvlmsnWnWo
	 EGd4ZrTHKbKboK6XIw5izRrkLXFkg6S7/kiBZTS6biWNnKwt+PQITHzsV+ZRkekElT
	 qc5OuXWMtQKxpyhLaHT+pk859Hq2DBZ9MtuAl2c2IbvspYfz8ZyE4chJZ44yB9bTg+
	 bznjFouUZ2jJw==
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
Subject: [PATCH AUTOSEL 6.15 050/118] pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
Date: Tue,  3 Jun 2025 20:49:41 -0400
Message-Id: <20250604005049.4147522-50-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Gabor Juhos <j4g8y7@gmail.com>

[ Upstream commit bfa0ff804ffa8b1246ade8be08de98c9eb19d16f ]

The armada_37xx_gpio_direction_{in,out}put() functions can fail, so
propagate their error values back to the stack instead of silently
ignoring those.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Link: https://lore.kernel.org/20250514-pinctrl-a37xx-fixes-v2-5-07e9ac1ab737@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my comprehensive analysis, here is my determination: **YES** ##
Extensive Analysis for Backport Recommendation ### 1. **Bug Severity and
Real User Impact** This commit fixes a **genuine bug** where the
`armada_37xx_pmx_gpio_set_direction()` function silently ignores errors
from GPIO direction setting operations. The current code at lines
476-481 shows: ```c if (input) armada_37xx_gpio_direction_input(chip,
offset); // Return value ignored else
armada_37xx_gpio_direction_output(chip, offset, 0); // Return value
ignored return 0; // Always returns success regardless of actual result
``` This silent failure can cause **real user-visible problems**: - GPIO
pins may remain in the wrong direction (input vs output) without any
indication - Hardware peripherals controlled by these GPIOs may
malfunction - Applications believe GPIO operations succeeded when they
actually failed - No error reporting prevents proper debugging of
hardware issues ### 2. **Code Change Assessment - Small and Contained**
The fix is **minimal and surgical**: - Adds only one variable
declaration (`int ret`) - Changes two function calls to capture return
values - Replaces `return 0` with `return ret` - **No architectural
changes or new features** - **No changes to external APIs or data
structures** This precisely matches the stable tree criteria for small,
contained fixes. ### 3. **Comparison with Historical Similar Commits**
Looking at the provided examples: - **Similar Commit #1** (Status: YES):
Also fixes GPIO direction callback behavior in the same driver - this
establishes precedent for backporting armada-37xx GPIO fixes - **Similar
Commits #4 & #5** (Status: NO): These fix similar error propagation
issues in different drivers, but the "NO" status appears to be due to
them being newer cleanup patches rather than fixing actual bugs ### 4.
**Pattern Recognition from Kernel Tree Analysis** My examination of the
kernel repository reveals this is **part of a systematic fix series**
addressing error propagation throughout this driver. I found related
commits: - `4229c28323db`: "propagate error from
armada_37xx_pmx_set_by_name()" (marked YES in autosel.txt) -
`6481c0a83367`: "propagate error from armada_37xx_gpio_get_direction()"
(marked YES in autosel.txt) This indicates the kernel maintainers
consider these error propagation fixes important enough for stable
backporting. ### 5. **Risk Assessment - Minimal Regression Risk** The
change has **very low regression risk**: - Only affects error handling
paths that were previously broken - If the underlying GPIO operations
were succeeding before, they continue to succeed - If they were failing
before (but silently), now they properly report the failure - **No
functional behavior changes when hardware operates correctly** - The
worst case is that previously silent failures now get reported (which is
the desired behavior) ### 6. **Critical Subsystem Impact** This affects
the **pinctrl/GPIO subsystem**, which is critical for: - Hardware
initialization and control - Board-specific functionality - Device
driver operation - Embedded system reliability Silent failures in this
subsystem can cause hard-to-debug issues that affect system stability.
### 7. **No Explicit Stable Backport Indicators** While the commit
message lacks explicit `Cc: stable@vger.kernel.org` or `Fixes:` tags,
this doesn't disqualify it. Many important bugfixes lack these tags, and
the automated selection process (as evidenced by autosel.txt) is
designed to catch such cases. ### 8. **Meets All Stable Tree Criteria**
✅ **Fixes important bug**: Silent GPIO failures can cause real hardware
issues ✅ **Minimal risk**: Only improves error reporting, no functional
changes ✅ **Small and contained**: 4-line change in a single function ✅
**No architectural changes**: Pure error handling improvement ✅
**Affects critical subsystem**: GPIO/pinctrl is fundamental to hardware
operation ### Conclusion This commit should be backported because it
fixes a genuine bug where hardware failures are silently ignored,
potentially causing real user issues. The fix is small, safe, and aligns
with similar commits that have been marked for stable backporting. The
change only improves error handling without modifying functional
behavior, making it an ideal candidate for stable tree inclusion.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 2431989c97e82..2438785c9ef88 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -470,16 +470,17 @@ static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = range->gc;
+	int ret;
 
 	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
 		offset, range->name, offset, input ? "input" : "output");
 
 	if (input)
-		armada_37xx_gpio_direction_input(chip, offset);
+		ret = armada_37xx_gpio_direction_input(chip, offset);
 	else
-		armada_37xx_gpio_direction_output(chip, offset, 0);
+		ret = armada_37xx_gpio_direction_output(chip, offset, 0);
 
-	return 0;
+	return ret;
 }
 
 static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,
-- 
2.39.5


