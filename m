Return-Path: <linux-gpio+bounces-28632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADB3C66BFB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 80F343651CF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4C5328619;
	Tue, 18 Nov 2025 00:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bg1KhUKZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9795D3277BA;
	Tue, 18 Nov 2025 00:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427094; cv=none; b=aGqEKvRMwCewh/7mqwodY8bOGzZO+GUQuWyUz4MjRQ22B7KBrmm/nq7XmDpmsAw6bByBO0dKXMnGTeYfqpFdYpCGjdynPnSuCA37Lx6rIZvFdABcPG9PZet4+CKj9Ur/RsBakwT7WT1i8Z8otWx/TAhvBwik3pcbyLRI5sVCL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427094; c=relaxed/simple;
	bh=abw3WyBlH0LdVJ/qIAAe2kgPCAjhL8NOjxt6Yr6wl4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/CwwmpvID4IfmDCpYW1jPBz4b+7s9ybd2fnSiG0hyjFlp2X7C7o3guWUFXl6FkH5E7JjVw2yIPa1s3TZmowoz4ZgA7NWrAdH89TECbVf621oJ/ON1cO/W21Cy7btWD/jYjx6+Z8uQibMNRpf5rtgJy6iNSHbpdjUCw91/rtK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bg1KhUKZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DDCC4CEF5;
	Tue, 18 Nov 2025 00:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427094;
	bh=abw3WyBlH0LdVJ/qIAAe2kgPCAjhL8NOjxt6Yr6wl4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bg1KhUKZpfzoAoxC1bueX15q0RQckG7lKlski2DfUPEs+ldrPVfCF939PKLNUvt/x
	 4l+cZd0/Ti0jY89zlOIe6iRqVuGcccnXowBvZn3Gd6c63lweOb+MDzU7brSscPOwLe
	 Vyk2XNLFc0cJRdj0T1aHrM/Pxt1xvCSsG+Z7lfgE6m0Lg6i0s4RRUvbiZcUZGkmW46
	 opDwsuGVAXVUpr5xWevv1r0NAXRPWNGS2VCODXcXnY3bupdbeGoF4uB9/nUA66wxxL
	 SVUYD6yjtoZ+6cb7tvnF1kV0+Ydoy88zC2QIOHnuH4+Z0t4/FPDKzs4ELyy7fNewwO
	 f/6drP/pku9lw==
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
Subject: [PATCH v2 13/15] gpio: xgene: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:27 +0800
Message-ID: <20251118003229.26636-14-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-xgene.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 4f627de3f56c..809668449dbe 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -130,7 +130,7 @@ static int xgene_gpio_dir_out(struct gpio_chip *gc,
 	return 0;
 }
 
-static __maybe_unused int xgene_gpio_suspend(struct device *dev)
+static int xgene_gpio_suspend(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -143,7 +143,7 @@ static __maybe_unused int xgene_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int xgene_gpio_resume(struct device *dev)
+static int xgene_gpio_resume(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -156,7 +156,7 @@ static __maybe_unused int xgene_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
 
 static int xgene_gpio_probe(struct platform_device *pdev)
 {
@@ -204,7 +204,7 @@ static struct platform_driver xgene_gpio_driver = {
 		.name = "xgene-gpio",
 		.of_match_table = xgene_gpio_of_match,
 		.acpi_match_table = ACPI_PTR(xgene_gpio_acpi_match),
-		.pm     = &xgene_gpio_pm,
+		.pm     = pm_sleep_ptr(&xgene_gpio_pm),
 	},
 	.probe = xgene_gpio_probe,
 };
-- 
2.51.0


