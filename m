Return-Path: <linux-gpio+bounces-24643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10861B2E1BF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AEF25E26A1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6C8322DDA;
	Wed, 20 Aug 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkZkH2wB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23170242D72;
	Wed, 20 Aug 2025 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705535; cv=none; b=PRCVKQlNd8Das6EcM8WvwQ/DqlYMa3YgwfWiuMeG4xOQ112X5pAI3e1KIvpvOx0IOz/Fe8yjAii3c+5urffkYevehui7fEvREWwHtlzIF7MEHvavaw2Km/uyO4WD1CDU9vPaR1IL09D+n2wWp48wWKJVYu8zzNoxuP98RnqUj1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705535; c=relaxed/simple;
	bh=oPqtKgFreHnLsUNC2EY7WHHjaSeINUT8RuOawyyZA5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TG2bExloS7Tpys41XqvG//pMlVoqDW64gTi0Pomqyt5nRAOOUbr4pZxI+Rvt8rP+cM1yROqbdUQMD0bPXv3+q/vAmG7n9O5th5+eco/qRZoIKFXHAM48HvnZsVmaaJF/T7q39EYzDTKJNKTIfdPqqXf6ZcQj07FtFKGmiN1vuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkZkH2wB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5B3C4CEE7;
	Wed, 20 Aug 2025 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705534;
	bh=oPqtKgFreHnLsUNC2EY7WHHjaSeINUT8RuOawyyZA5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkZkH2wBzqw6wGRB5skSUnmXedvk5OgGjsCW4k/UVKgQeWK0RTDu9YWTYizL1nPYJ
	 9p8wx1jNTci75I8/TYE8CTalbUKTpEjcCd2XrPATbUF6Kb/UKgAWjI1yHjxQcwR4Fk
	 rX7DSnyqpSpZK4wgXRuNQsF3ovroyfQAlvVZBbQlJbTVZmEINAktLdEu67Fm64/qri
	 hA6fxX60L/MyI5tf+uiZd6T+mpUFLHUuoyIM1ZGvCAAYGmRrd2JoLS9sb5KOriWcUC
	 OPTc2NxJcQz33eQkssFTNCFZabFQphaTjjO36jRIcLoqD1Abgvi7dMw0JEAC10xN2R
	 2HWvFsB4wrA9A==
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
Subject: [PATCH 06/16] gpio: pxa: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:27 +0800
Message-ID: <20250820154037.22228-7-jszhang@kernel.org>
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
 drivers/gpio/gpio-pxa.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa22f3faa163..288c72f9c015 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -66,13 +66,10 @@ struct pxa_gpio_bank {
 	unsigned long	irq_mask;
 	unsigned long	irq_edge_rise;
 	unsigned long	irq_edge_fall;
-
-#ifdef CONFIG_PM
 	unsigned long	saved_gplr;
 	unsigned long	saved_gpdr;
 	unsigned long	saved_grer;
 	unsigned long	saved_gfer;
-#endif
 };
 
 struct pxa_gpio_chip {
@@ -746,7 +743,6 @@ static int __init pxa_gpio_dt_init(void)
 }
 device_initcall(pxa_gpio_dt_init);
 
-#ifdef CONFIG_PM
 static int pxa_gpio_suspend(void)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
@@ -787,14 +783,10 @@ static void pxa_gpio_resume(void)
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
2.50.1


