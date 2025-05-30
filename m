Return-Path: <linux-gpio+bounces-20796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A79DAC8E65
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 14:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8695501946
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 12:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7DA24DD0D;
	Fri, 30 May 2025 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6H3GlPy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210BD24DCFE;
	Fri, 30 May 2025 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608806; cv=none; b=iHSZhjgn6NMzx32SYet0FW8DEm6j8NpMJzO+xhqLqV2WEwKCyIPMH+N4iWWgugeRfuuunfu9I2UI1EC+ttQAifDHZ2DFd02p6MGmdSG5baNtHfQsUWgDPWQ5cchCf6KFzE5//cqfiE2chXKXv4B1SgLRsZDlFffWfbuqaeY9YQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608806; c=relaxed/simple;
	bh=/KMKhsC20lO+88vNfZO8XyQaur54SvUKzj6kgl/4csg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QL2WAu8/htQB8I3yBRknA6W9mEXS38HQAa4zbsCAp80IafzqiFB8RLzn7LcYeYthHuDo4YHPHrCb+CUtrj6e1+Ut3IYM1kfMeoRdNWsgnMMsrptSIHbUwIl/pSFdUbOtJ553SoreCMPnsuCX6tDjz8rtjgTj2uN9ikQQgLRpclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6H3GlPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266BEC4CEEB;
	Fri, 30 May 2025 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608806;
	bh=/KMKhsC20lO+88vNfZO8XyQaur54SvUKzj6kgl/4csg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R6H3GlPyDrgrlb/cTd1pxXwPdhBurRPFwAkRS47pUburAsi6+gKpE8qxUCO0DpC+O
	 le/u/WdxNMiFF+dM9+RwMaH10aD5v0lBuY5SNplbavjCCKt1B2N2PQlAP6WX6i5X4r
	 2z6VveN4IAjke1sR+S+VLen+c1EAmmK3gKyD2aRHI0DHu1X1SN9i/oivHsXKti6MQY
	 OdZfvEnN1WCjKMX66Sx5gG3ZiNxTvJVWsbUDu+vmRnTD5llDF4cmNzeso7AF4ydC5P
	 oC92YgIgyPKdtXMEW7BUMtmEBdC1tRM/yG9elQg8A0SEqXaBrZ72Xy9n73iTU7FXgb
	 jXd9pZUNjbnlA==
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
Subject: [PATCH AUTOSEL 6.14 24/28] gpiolib: of: Add polarity quirk for s5m8767
Date: Fri, 30 May 2025 08:39:30 -0400
Message-Id: <20250530123934.2574748-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530123934.2574748-1-sashal@kernel.org>
References: <20250530123934.2574748-1-sashal@kernel.org>
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
index 56f13e4fa3614..db7cc8e5f7c7a 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -215,6 +215,15 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
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


