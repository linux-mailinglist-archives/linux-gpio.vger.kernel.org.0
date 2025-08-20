Return-Path: <linux-gpio+bounces-24639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F54B2E1A6
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 819691C47430
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB033322C84;
	Wed, 20 Aug 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5dcz1Uq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58E4322A17;
	Wed, 20 Aug 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705501; cv=none; b=mAL4v7SWCmY+O8dTIy5gOsFH1u6L12YXYKBYYCbDa9NMQ1fvSPvgxr0Dx0X49BwAKDosV60YiyopfFnz1A5r6CL2Xkqr+SdzJIBwlTCkS3ix5FYdR7hwQ+5bBq0pMM6ICmGFNrBZGPvezwfpZRq0XNrBD1Qj5Zbrxa4hry3Gqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705501; c=relaxed/simple;
	bh=aVoXTtsvhaosrLhSRxcZ+cIPb5uQPbIY1uKxiV2Spso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTz9WHR/bsLmfSF6PQFeQ0whJJQmRhExItYkywOUhi89MvVG5TiajthFOm69EwIk0fcajID7qmbvSFpAFHSTMbEWumPoDDEoEO7UfTNd8CWzdsQ5RCD80llc3r+PP0AKblvLaJXbYAqC5g4nvEmL8JhtKkom36B81UYsyN7tsbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5dcz1Uq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE431C4CEE7;
	Wed, 20 Aug 2025 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705501;
	bh=aVoXTtsvhaosrLhSRxcZ+cIPb5uQPbIY1uKxiV2Spso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5dcz1UqdHbjUg+r49tsZneSmpjTus6c2ZMTVa6W0KwZVA5b79wV7LOJ75uiA169H
	 msIA1UfdWjOghB/pUnOWYZwlXT2mcW3kZkjfBfhfmMfcbfolYAPP7uLJQZsTWmnglh
	 Gs/nVyMG5uu+3FmwGulG9MRwKFh3OUZ90435U0exhAdH/XwG+3sOBzuEiHrWqk98iq
	 5vGvfHlI/2Cgo4W9zTkHE+wFbbC3ubVY549drBLDNvWIQimT/X01FQxT3o48souftF
	 jfMm36jradpBwtN3tCsXpj2UMh4XPZTrUpAoHQepieIewDZ2GAnSrAaV0R5jsHrjN/
	 HY0MNLBPLnGOw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Buesch <m@bues.ch>,
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
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 02/16] gpio: brcmstb: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:23 +0800
Message-ID: <20250820154037.22228-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
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
---
 drivers/gpio/gpio-brcmstb.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e29a9589b3cc..0ca3e0d8aa46 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -534,7 +534,6 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 	brcmstb_gpio_quiesce(&pdev->dev, false);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 				      struct brcmstb_gpio_bank *bank)
 {
@@ -573,14 +572,9 @@ static int brcmstb_gpio_resume(struct device *dev)
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
@@ -747,7 +741,7 @@ static struct platform_driver brcmstb_gpio_driver = {
 	.driver = {
 		.name = "brcmstb-gpio",
 		.of_match_table = brcmstb_gpio_of_match,
-		.pm = &brcmstb_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
 	},
 	.probe = brcmstb_gpio_probe,
 	.remove = brcmstb_gpio_remove,
-- 
2.50.1


