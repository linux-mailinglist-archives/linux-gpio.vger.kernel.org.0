Return-Path: <linux-gpio+bounces-28630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EB7C66BB3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20B734ED754
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B3A321F51;
	Tue, 18 Nov 2025 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQHIY8FF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A6320CC0;
	Tue, 18 Nov 2025 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427084; cv=none; b=aBLw55x2wyvHpjNaYGKaLfTbDFi9jkdJquvamCsaFfDjFekhtChFrVM0PfKbTWVbAYJBQL9cosVuOJ4OR+m932uvnFwzStXKVW3t+F1nku5AafLMXVIZO9d6FzkUUd6Tjd+kH7ouGIcD4b2ltumNps6tWypaNbXmY2xTDDifo28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427084; c=relaxed/simple;
	bh=El1hxWSbR3GmHln8ZOHlWcFS/7CJ8C4SvNQbzWmhhGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlRjADFwPle7zflYPTemQ9v3+fqFiDK1E3UnqhrdkN0jq2qcTCDRGTJGNm7KYr5zIP2Yawjz6J+afV0vSN1crRdQwrmsdUGkGiDJtUgQsgCigCrcvYRwG5Sohp5Decx67KR/I/z54AufCU2EE4C10I5WZhRhDIko/aRPIgk0FUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQHIY8FF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD7DC2BCB7;
	Tue, 18 Nov 2025 00:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427083;
	bh=El1hxWSbR3GmHln8ZOHlWcFS/7CJ8C4SvNQbzWmhhGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQHIY8FFl8C33JofqotXTXmXAkvXecRsBuM5it5qqHEY8LkeUlIvcaPDvBLNhEC8H
	 uDOc8UUG/9giAms/keb8FL9uDAsYB6TePrEYiAMjXavV1YpUlUPjbFS+XsjfnVL7Fl
	 iUhnJ+NiRqA+pXKy/rFCeqMRijwh4Nd0IH5OzYLFohggimMRfR7moisDSpC3mX1/t4
	 Xb+aN17DupfhOwJXjAZ6COlTl3ykgMVYUZP1KbgtHxM2XZW3z1rbxlSakEFqv3ffl6
	 dlSdq5KrVnW4Jep0O70GPyFMiqTZnJ2eWwh9uimKljHuedy9Ni3ci4HwUw4RSHW8Fw
	 U7mf4XQDtp3dA==
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
Subject: [PATCH v2 11/15] gpio: tqmx86: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:25 +0800
Message-ID: <20251118003229.26636-12-jszhang@kernel.org>
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
 drivers/gpio/gpio-tqmx86.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 27dd09273292..d79f515137a5 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -279,19 +279,18 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 }
 
 /* Minimal runtime PM is needed by the IRQ subsystem */
-static int __maybe_unused tqmx86_gpio_runtime_suspend(struct device *dev)
+static int tqmx86_gpio_runtime_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused tqmx86_gpio_runtime_resume(struct device *dev)
+static int tqmx86_gpio_runtime_resume(struct device *dev)
 {
 	return 0;
 }
 
 static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend,
-			   tqmx86_gpio_runtime_resume, NULL)
+	RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend, tqmx86_gpio_runtime_resume, NULL)
 };
 
 static void tqmx86_init_irq_valid_mask(struct gpio_chip *chip,
@@ -425,7 +424,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 static struct platform_driver tqmx86_gpio_driver = {
 	.driver = {
 		.name = "tqmx86-gpio",
-		.pm = &tqmx86_gpio_dev_pm_ops,
+		.pm = pm_sleep_ptr(&tqmx86_gpio_dev_pm_ops),
 	},
 	.probe		= tqmx86_gpio_probe,
 };
-- 
2.51.0


