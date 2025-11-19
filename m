Return-Path: <linux-gpio+bounces-28815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE30C703DF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 7992828A38
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ECA32FA21;
	Wed, 19 Nov 2025 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXCBOHKp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000C0309DB1;
	Wed, 19 Nov 2025 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571103; cv=none; b=rS3dGbLo0G7U6jldGaOSaifO0tCC69LKDO+c/4dAyzylejyiWprPBLUuHSlZNM8p+wEZMvbwV9U5OSEPZrgW/ULgUOQ0tXJLWxUU29aMBzA+G8xrwwzron83cYil9GrDF7AvVY1EHt8nqBTaYzF0gbgyj+xlojZhGiFsPhdu6O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571103; c=relaxed/simple;
	bh=QwUEwA3W4uoGikamrTnsYO8wbCGZ57Q4s7Y5tcCZlBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6B/POyY8kinOhP0/LX4k6ZKmFTPPpf4xVwfTk6XuhDtOCHi/lAd69VU/5NuPeiq0vHzc0syiPWIhhsFhnElvesg6sdpAoce5S/DgQAWPu71GY1yqofro5ef0DGKuF6F+9xJaADZuaDKyn5u8mfIiK+gZvipPvV1U5OWcRkAERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXCBOHKp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4660C4CEF5;
	Wed, 19 Nov 2025 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571102;
	bh=QwUEwA3W4uoGikamrTnsYO8wbCGZ57Q4s7Y5tcCZlBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXCBOHKpIz9x9NZxo4o0Uv4HVwPZB6sAi+6Ad0vjNHnOrwlKorqkZeMbrW6SksB/A
	 qN45Csi0xe1fbvpY5fgZl9A7yipQcX7GPcY2JSOVVZZX3oXjJyD/rEUfphh//x8bLX
	 TLpyWZa1trodf8Uw7C/bB6IOlP7IgKqawevF9qJIn+cNWhGxi+noUfKmyXR2Vt1ZVp
	 vVXMoNKlCHuBsI3ZUm0nshbn04bEpGPlAboZKhAey16v4vBWsUH8XpyPUEsuOaujTn
	 9LeZWDTE+GgWYrOswRdepUHasm0gmLmMhlJRRun7EoYcg7Cp8mxXU7oTuw87zaJn2Z
	 cIK1qMsAPOdmA==
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
Subject: [PATCH v4 05/15] gpio: pxa: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:17 +0800
Message-ID: <20251119163327.16306-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
References: <20251119163327.16306-1-jszhang@kernel.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa22f3faa163..17350fea2113 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -67,12 +67,10 @@ struct pxa_gpio_bank {
 	unsigned long	irq_edge_rise;
 	unsigned long	irq_edge_fall;
 
-#ifdef CONFIG_PM
 	unsigned long	saved_gplr;
 	unsigned long	saved_gpdr;
 	unsigned long	saved_grer;
 	unsigned long	saved_gfer;
-#endif
 };
 
 struct pxa_gpio_chip {
@@ -746,7 +744,6 @@ static int __init pxa_gpio_dt_init(void)
 }
 device_initcall(pxa_gpio_dt_init);
 
-#ifdef CONFIG_PM
 static int pxa_gpio_suspend(void)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
@@ -787,14 +784,10 @@ static void pxa_gpio_resume(void)
 		writel_relaxed(c->saved_gpdr, c->regbase + GPDR_OFFSET);
 	}
 }
-#else
-#define pxa_gpio_suspend	NULL
-#define pxa_gpio_resume		NULL
-#endif
 
 static struct syscore_ops pxa_gpio_syscore_ops = {
-	.suspend	= pxa_gpio_suspend,
-	.resume		= pxa_gpio_resume,
+	.suspend	= pm_ptr(pxa_gpio_suspend),
+	.resume		= pm_ptr(pxa_gpio_resume),
 };
 
 static int __init pxa_gpio_sysinit(void)
-- 
2.51.0


