Return-Path: <linux-gpio+bounces-28624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6DEC66B6E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1B6D360BBE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091F32FFDCE;
	Tue, 18 Nov 2025 00:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1dKoioj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B228E2F60A6;
	Tue, 18 Nov 2025 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427051; cv=none; b=edIfB7B/Uyph2pT1/afJomc4Tfmd+fUWPg1SCDPTBxaSWBNo9jd0T8PCqojPiORiTYxeVw9qgZe84VS4847mPIbMalsljexlrnMkp+K7W5K9K4ikGNjs2Y0z56vipvl7HNzTS5KxdN7oqmPtHb0uZVaAaZEsPzH9MjEcFXQx5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427051; c=relaxed/simple;
	bh=4ox7C0QaWmV0Nnx5hdJFmtfNWffG0pNyqJvi1TSzbhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRDVL5GvSPTZUiiM5jeH1zbR/5H1Sl1P5mvJqJkB49omvyTAU/k+6DjhsSdEgIaTar2kyA+me4ZSaZJ2GsQsOygekp3gixmfGpqK1+u4KEPqXGkey39v7Qo15+3cuJEDINPlDRT391BkLal01D16XTaIffNJDLve0xL3DHWeg+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1dKoioj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E05C2BCC6;
	Tue, 18 Nov 2025 00:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427051;
	bh=4ox7C0QaWmV0Nnx5hdJFmtfNWffG0pNyqJvi1TSzbhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1dKoiojyJfciQVkiaj1s73st57y+w+AaivuSuqltXBsHVMKDXtfqZTATra9QNHEt
	 HKHtTAG05Zt4L5+uK1D7pmvTHEwIWGhXWi3gI3tWCTXw10S3f6EvKk29DrDSZS4zCS
	 oPCdrG96MH0JksMeMfAUHbCKvZ/t/UeJ4dj7IV2bOztJEM9yZO52932v8UHhoaUPMY
	 W7PmJtHf5+vwIkpfGMwgOJHeJ64JL0a5yXJw9RV/YFOLWw5ovdviJP2PNKLUXp/yoM
	 +K1bT5h2TYobS6hbePkQJGDwQEBikIz147AaIuL12fl5POwp9b+oluSgknUf15v0EX
	 vje3ThTMJj7AA==
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
Subject: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:19 +0800
Message-ID: <20251118003229.26636-6-jszhang@kernel.org>
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
2.51.0


