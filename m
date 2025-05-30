Return-Path: <linux-gpio+bounces-20795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2BAC8E22
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 14:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB1BA43DB0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 12:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E78238151;
	Fri, 30 May 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3m5J/6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE298238145;
	Fri, 30 May 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608768; cv=none; b=pZ9i4k/oEsqTPRdU4mbBEO1yCbMhGY/BlpuFP6fk+gVyeMTz9hzq1JGMRE9nrWu0OO6YS2iY+x+EVtBc0EkMSgR6ZqMRLXT33+fsrT6JlGzD4IRgY7mqS0POpkPy5b4cBGZGiS7EH1DRz29pgge9Qlbp016PAlC8dEZGO3MRusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608768; c=relaxed/simple;
	bh=PFuS/P/Z3jWRUglB1GrBuK1+zlS+EyAfSjrB9hZYF+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LYIRhQn+7eYQQucwBPu6b/qAZihnJ5+VrvVcWhqrzZz+xX8PN6Cpin3UBoN8QbA6HMaQdnkrUXehz/UKrV5cG7Z3PWnS3oMYhm0+pbZP8pD8ft2Gfn9KuEmTJVeGgyXe/6kHFNC6Vt9/cpCWQ+aWZ//+By1RztF/6onFp5+B2Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3m5J/6R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA90FC4CEF1;
	Fri, 30 May 2025 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608767;
	bh=PFuS/P/Z3jWRUglB1GrBuK1+zlS+EyAfSjrB9hZYF+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3m5J/6RcnhprR8zGpJYJ8cqNvIIzavpWwzWZyTnvdYg+I4uAaiOId7Y9tMXwGd5F
	 RWr/s+OG/+mow9R1+nUqYb0KKxlc+PWA6dXtf2QXViQf1lOQ+mI2EW9qsc1MYaXfZ8
	 OnAgcolbDidBDUtm8EwpmgLys0rIAxAa8GsablB9rAqUA1gGJ9CLR06PysaObLixm7
	 AvkOdBOfJTwBnZsvanDvJod+F6afiN6SHfPuR43Wp/9qHGZKyPh4HdBsc1FUrHyiDj
	 uLJjDLlfTAr96Tf/S7PQd0HYHZ7aXpMqOogx30a09m12zWYfYOBzzjopB7HMcQRfZO
	 I+AN2APjuHkCg==
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
Subject: [PATCH AUTOSEL 6.15 26/30] gpiolib: of: Add polarity quirk for s5m8767
Date: Fri, 30 May 2025 08:38:48 -0400
Message-Id: <20250530123852.2574030-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530123852.2574030-1-sashal@kernel.org>
References: <20250530123852.2574030-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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
index 65f6a7177b78e..17802d97492fa 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -224,6 +224,15 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
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


