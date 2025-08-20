Return-Path: <linux-gpio+bounces-24640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65422B2E1B8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8CB17EBA2
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB4A326D65;
	Wed, 20 Aug 2025 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMarVKiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C1322A35;
	Wed, 20 Aug 2025 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705509; cv=none; b=gVKLVVZ111AjDDFrCf3iTn2qVZNYYi4WtLEm9iJ+41gZ+nhJnPedHJPlwRtCOBqjRHqRqanFkqqWs2H7zM/7rfwfHp6+Q13lUwzvz3OLC1PEtf/ONVmdnXsfG42xf/hcuDVD0OjXJnZHtDro5b+432nGGyNqJJ4npRgbFVcg/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705509; c=relaxed/simple;
	bh=uoSbjGAjNpOfd1OcdZRXRKGUEQEMmIyMXjnKacIc5oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1eCQzhrL+CaHFuD/f/j2uD37/Ztg9agzPzao1IcryF1W6OJBIa4SJXkRi/1sQLbLzf4UahytBqUG6hwax78Hq2TPi1UJUQxP4gb6WVSE/ccWTvKewsJkQdq56Af8/aZf7KHoaAOtrxzfIPCC+8ifDZWyXw6jhGhcKxqKO0gjGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMarVKiB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022F5C4AF0B;
	Wed, 20 Aug 2025 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705508;
	bh=uoSbjGAjNpOfd1OcdZRXRKGUEQEMmIyMXjnKacIc5oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMarVKiBdQIuLgKwPfD13No3DlA+Kc8jorgjnuRyCKP94YwgFFJt2Lr7Aa0N1fTzV
	 dRXrmIDwFF7WhmpixyqE3PLfYw5Ivct5fOm18+3VH0JhK2U/77LVg3UhuAdYZ5BDBV
	 CpKOAuqIWVz8Zn54RxbTBPQgEtD0+LZOfeBgwwWxEKXS2JPjINTAUuZVd4TL46i8Wz
	 YOoqhHtUo6AR43QkZ76fx4NljkrzsTx1kNCvxo+3TBykmi/4kRsYAEGxmuebwiSDZS
	 Fyx17aG/S9b316OQKH13qhuoWGpsmO0IwWeZYe3hlrE+/sjsjEzIJjRMPpDjL5jTO/
	 zV13/GtnO1/HQ==
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
Subject: [PATCH 03/16] gpio: bt8xx: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:24 +0800
Message-ID: <20250820154037.22228-4-jszhang@kernel.org>
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
 drivers/gpio/gpio-bt8xx.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 05401da03ca3..5e120c4dfea5 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -52,10 +52,8 @@ struct bt8xxgpio {
 	struct pci_dev *pdev;
 	struct gpio_chip gpio;
 
-#ifdef CONFIG_PM
 	u32 saved_outen;
 	u32 saved_data;
-#endif
 };
 
 #define bgwrite(dat, adr)	writel((dat), bg->mmio+(adr))
@@ -224,7 +222,6 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
 static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
 {
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
@@ -267,10 +264,6 @@ static int bt8xxgpio_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#else
-#define bt8xxgpio_suspend NULL
-#define bt8xxgpio_resume NULL
-#endif /* CONFIG_PM */
 
 static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848) },
@@ -286,8 +279,8 @@ static struct pci_driver bt8xxgpio_pci_driver = {
 	.id_table	= bt8xxgpio_pci_tbl,
 	.probe		= bt8xxgpio_probe,
 	.remove		= bt8xxgpio_remove,
-	.suspend	= bt8xxgpio_suspend,
-	.resume		= bt8xxgpio_resume,
+	.suspend	= pm_ptr(bt8xxgpio_suspend),
+	.resume		= pm_ptr(bt8xxgpio_resume),
 };
 
 module_pci_driver(bt8xxgpio_pci_driver);
-- 
2.50.1


