Return-Path: <linux-gpio+bounces-28621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D498C66B59
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64F3F35F14E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9644B2FC895;
	Tue, 18 Nov 2025 00:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1rWVBxF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417541CEAC2;
	Tue, 18 Nov 2025 00:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427036; cv=none; b=VZb/DyE3DANKLUJW2fJXQF4q+QW6ZgoegFZ9mhLVxVyuRXlgtvYR0G4hr3VlzbuFUbEZooK4E33+OBAlrEoFox0d3vXXO4cdPqCjq2TQNP8RreS3wd/OUZVVIZTxftPWSWzkoTLjUOLIaxVlvhSsneZjF9z0fFdDwhO1YqNvSAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427036; c=relaxed/simple;
	bh=qf5wQxbsrWU7owdm60ld7iye66QKm8BVRnc7uaj4vZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2lwUny6i1ZqXfmvnbvEoTMRH+Fyf2hGCjplYc5mj1YDXSMcMLW4+hvRi2MnWTJPSF49Ic094Quh+JTEEVAsdIJMVofBoMReDm3ENmNoRixDg/fGSPiYQNsG+cda3nvTUmakgn7Zid/tDOaEuU+hK2DkVBcjz0I+QeopCzXqEuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1rWVBxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABF9C113D0;
	Tue, 18 Nov 2025 00:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427035;
	bh=qf5wQxbsrWU7owdm60ld7iye66QKm8BVRnc7uaj4vZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1rWVBxF3PxBcDRtHZ/3/AuhwvMeHPLjKlvaFc06Xhw/3v4oA3BP9Jbs9UQxkvFWp
	 fPLHRgMqKDtRpAZWUhHdgLyPy+wMUcRtaMOOBf4p2s6ObYBkQ3Tbei1oDwVn1PXfr7
	 NQntMdcnn62DtpfXoXoFgSM04unvsoBpQrlHtmo7r++sG1ipw1JqQQc3H1MyxfOLc3
	 KDy0V6HA88aux18B58ZgbXaT3cUQ1rUfHzwWsApJLKrKvegt3sEG4MM19spIvoHi9d
	 b5R+7Zw5+NvT2uMFF8JIYO8OQWsNryXTmXdMo3bbRoBiH/lysMwa6F1T3jkDuNQ+C8
	 dKMGwakpuRYXA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 02/15] gpio: brcmstb: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:16 +0800
Message-ID: <20251118003229.26636-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
References: <20251118003229.26636-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Doug Berger <opendmb@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index f40c9472588b..af9287ff5dc4 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -533,7 +533,6 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 	brcmstb_gpio_quiesce(&pdev->dev, false);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 				      struct brcmstb_gpio_bank *bank)
 {
@@ -572,14 +571,9 @@ static int brcmstb_gpio_resume(struct device *dev)
 	return 0;
 }
 
-#else
-#define brcmstb_gpio_suspend	NULL
-#define brcmstb_gpio_resume	NULL
-#endif /* CONFIG_PM_SLEEP */
-
 static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
-	.suspend_noirq	= brcmstb_gpio_suspend,
-	.resume_noirq = brcmstb_gpio_resume,
+	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
+	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
 };
 
 static int brcmstb_gpio_probe(struct platform_device *pdev)
@@ -755,7 +749,7 @@ static struct platform_driver brcmstb_gpio_driver = {
 	.driver = {
 		.name = "brcmstb-gpio",
 		.of_match_table = brcmstb_gpio_of_match,
-		.pm = &brcmstb_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
 	},
 	.probe = brcmstb_gpio_probe,
 	.remove = brcmstb_gpio_remove,
-- 
2.51.0


