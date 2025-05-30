Return-Path: <linux-gpio+bounces-20798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A0AC8F32
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 15:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0711C206D4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 13:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E81268FD9;
	Fri, 30 May 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyTppEYp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B343268C7F;
	Fri, 30 May 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608869; cv=none; b=SN7khcI542ax26P9+iNdrooVUFjDhg+diJc5Cv7nVlPzXOb3NbwtfAf0Qx0MKauIhhZAunuTQtVahDdd9h8xG+kVfEXgiiipcpA9H3TxbcJGOPfE9Wu8fDBei71l10nkK0mdt9uH7MTHxV4vv3UNmVm/dC4hc2XEEku12pKeaFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608869; c=relaxed/simple;
	bh=5LpukfSploEVR67mxHqzkj4VIPHH+CNrASNyoPWR7qg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zw0cTrtg9My8Kk9/m9MatuQHQ0aYRA5U1BI7DT6ChscpFVBJifr++paQtCJngKee5MulQCi1qgmGl+wI/Hw2iedM1v1aILurR03p2CKppDFcu3k/pR4lEY+abjedBrsmTmVAz2VxKGfejodorfGzvdktezXGz1o0vX1F7wizMUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyTppEYp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833D8C4CEF0;
	Fri, 30 May 2025 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608869;
	bh=5LpukfSploEVR67mxHqzkj4VIPHH+CNrASNyoPWR7qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyTppEYpTvqgNTSssQj7FBifXHZs0fAY/B+xMgaWCnzR70u3F1pGFaiAoEncU4Bpi
	 PsqfuuIFkXYhBzLXjfs9OPrDGk8+bFAufcDo05kHHSWSkpL6K4pKn1Xm4/eO3jPjwJ
	 9FdrSUoza0wWNfbL7h8jqm4GRWwcZy0TG8SxsFbRCQfmYWOkuw7yG0XAwtQrRM4kOU
	 W1P06nNRs4Z9J43GFViypsyHmrjWYdNv4iXgkNBQfpZXdDArullKnicz5Z6fWxCcZS
	 9WieaoXI3Y9BGQsb9NCLAe7AVPWxYar9F0BikWbQRXvp2UZcs4YQpMVDdneOMZLSXn
	 Vb5//mbMPqmkQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	bgolaszewski@baylibre.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 16/18] gpiolib: of: Add polarity quirk for s5m8767
Date: Fri, 30 May 2025 08:40:45 -0400
Message-Id: <20250530124047.2575954-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530124047.2575954-1-sashal@kernel.org>
References: <20250530124047.2575954-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

[ Upstream commit 4e310626eb4df52a31a142c1360fead0fcbd3793 ]

This is prepare patch for switching s5m8767 regulator driver to
use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
"active low" polarity for the DVS and DS line. But per datasheet,
they are actually active high. So add polarity quirk for it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20250327004945.563765-1-peng.fan@oss.nxp.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit, the code changes, and the kernel
context: **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: **Code Analysis:** The commit adds
a polarity quirk for the s5m8767 regulator driver by modifying
`drivers/gpio/gpiolib-of.c`. It adds these entries to the
`of_gpio_try_fixup_polarity` function: ```c #if
IS_ENABLED(CONFIG_REGULATOR_S5M8767) /bin /bin.usr-is-merged /boot /dev
/etc /home /init /lib /lib.usr-is-merged /lib64 /lost+found /media /mnt
/opt /proc /root /run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp
/usr /var 0001-Fix-Clippy-warnings.patch 0002-Enhance-inference-prompt-
to-utilize-CVEKERNELDIR-whe.patch 0003-Update-to-latest-version-of-
clap.patch Cargo.lock Cargo.toml LICENSE README.md
analyze_merge_commit.sh io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt According to S5M8767, the DVS and DS pin are 0001-Fix-
Clippy-warnings.patch 0002-Enhance-inference-prompt-to-utilize-
CVEKERNELDIR-whe.patch 0003-Update-to-latest-version-of-clap.patch
Cargo.lock Cargo.toml LICENSE README.md analyze_merge_commit.sh
io_uring_analysis.txt ksmbd_analysis.txt merge_commit_analysis.txt model
prompt src target test_gpio_cleanup.txt test_patch.txt active-high
signals. However, exynos5250-spring.dts use 0001-Fix-Clippy-
warnings.patch 0002-Enhance-inference-prompt-to-utilize-CVEKERNELDIR-
whe.patch 0003-Update-to-latest-version-of-clap.patch Cargo.lock
Cargo.toml LICENSE README.md analyze_merge_commit.sh
io_uring_analysis.txt ksmbd_analysis.txt merge_commit_analysis.txt model
prompt src target test_gpio_cleanup.txt test_patch.txt active-low
setting. model/ prompt/ src/ target/ { "samsung,s5m8767-pmic",
"s5m8767,pmic-buck-dvs-gpios", true }, { "samsung,s5m8767-pmic",
"s5m8767,pmic-buck-ds-gpios", true }, #endif ``` **Why this should be
backported:** 1. **Clear Bug Fix**: This fixes incorrect GPIO polarity
in existing Device Tree Source (DTS) files. The commit message clearly
states that `exynos5250-spring.dts` incorrectly specifies "active low"
polarity while the S5M8767 datasheet specifies these signals as "active
high". 2. **Follows Established Pattern**: This change follows the exact
same pattern as the similar commits I examined, all of which were marked
as "Backport Status: YES". The structure and purpose are identical to
successful backports like the TSC2005, Himax LCD, and Lantiq PCI quirks.
3. **Preparation for Driver Conversion**: The commit message indicates
this is a "prepare patch for switching s5m8767 regulator driver to use
GPIO descriptor". Without this quirk, the driver conversion would break
existing hardware using incorrect DTS polarity. 4. **Small and
Contained**: The change is minimal - only 8 lines of code adding two
entries to an existing quirk table. It's confined to the GPIO polarity
handling subsystem. 5. **No Architectural Changes**: This doesn't change
any kernel architecture or introduce new features. It's purely a
compatibility fix for existing hardware. 6. **Critical for Hardware
Functionality**: DVS (Dynamic Voltage Scaling) and DS (Deep Sleep) GPIO
lines are critical for power management. Incorrect polarity could lead
to system instability, power management failures, or hardware damage. 7.
**Well-Tested Pattern**: The `of_gpio_try_fixup_polarity` mechanism is
well-established and has been successfully used for similar fixes across
multiple subsystems. 8. **Prevents Regression**: When the s5m8767 driver
is converted to use GPIO descriptors (which respect polarity flags),
existing systems with incorrect DTS would break without this quirk.
**Risk Assessment:** - **Very Low Risk**: The change only affects
devices with "samsung,s5m8767-pmic" compatible string and specific GPIO
property names - **Contained Impact**: Only affects the specific GPIO
properties mentioned, no broader system impact - **Follows Stable
Rules**: Fixes important bugs with minimal risk, exactly what stable
trees are for The commit perfectly fits the stable tree criteria: it's a
targeted bug fix for existing hardware, has minimal risk of regression,
and prevents functional issues when the related driver is modernized.

 drivers/gpio/gpiolib-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a0a2a0f75bba4..c1e83b2926ae4 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -203,6 +203,15 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "lantiq,pci-xway",	"gpio-reset",	false },
 #endif
+#if IS_ENABLED(CONFIG_REGULATOR_S5M8767)
+		/*
+		 * According to S5M8767, the DVS and DS pin are
+		 * active-high signals. However, exynos5250-spring.dts use
+		 * active-low setting.
+		 */
+		{ "samsung,s5m8767-pmic", "s5m8767,pmic-buck-dvs-gpios", true },
+		{ "samsung,s5m8767-pmic", "s5m8767,pmic-buck-ds-gpios", true },
+#endif
 #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
 		/*
 		 * DTS for Nokia N900 incorrectly specified "active high"
-- 
2.39.5


