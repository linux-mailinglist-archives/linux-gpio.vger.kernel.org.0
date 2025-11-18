Return-Path: <linux-gpio+bounces-28634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F504C66BBF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BF27429819
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9319932A3DE;
	Tue, 18 Nov 2025 00:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3/V9coc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0E22FA0DD;
	Tue, 18 Nov 2025 00:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427105; cv=none; b=FpgIAEid7QebG0dX0eX3gheAVv/ucHE09GnhGRguDL701RgwihjofyO5DnygET0n6em5NqV1c68foHMQtmSn232ISgOjP2s8Sg3zBsFi+MN0KZ5ZkDUIzlj5MsNKkegE/H9IibThpg2Sm4BT4pwUmmVeTGGhxNb/TVEvmlpuQfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427105; c=relaxed/simple;
	bh=FEK010iEOZpE1vC5lN9I/F/j5Wfem9fU26SaGIIbC5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiCItMovVUBGUM1RA4Kz6BSimcqoiOf/UVM7apQhJ6jwK05aZjTrKs2Qbe3DH61rWCOf64T65w396qMHOdLerA5ePa154MAi1k3oSNu4mc1NC58RB2L4lUIZ4ybw58mUAKTTbhNGsU2AXUhRcLRQfK6YU2GbxCglppedzmacDa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3/V9coc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09303C116B1;
	Tue, 18 Nov 2025 00:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427104;
	bh=FEK010iEOZpE1vC5lN9I/F/j5Wfem9fU26SaGIIbC5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3/V9coc2bW6juf3h/XwPfkdiNfDKVgkLi8Gs2jaoUFWAdZzEd4gzUrMNhUwaZl5L
	 z9rBmyrAGTI7TZl0sKobAaKKqDNqMtSf0uoLQSEVOay2YrTsIn6cPksc6rWm9CXtdZ
	 QNaAs1gEzsuo/CSspc8/UqBpZVDQrevXIwtq26+RFr+J86q40KxbD54ZBMYpAFz9L1
	 Ipq35KA2QMx6OlvmijDpnH5Oa8SDVS0ByCnskVeS62XPdJUg62Vn8dWrDpHWOCF2/J
	 BjwwK2bJM7FeKxN5+4Fe9kktZZavXITLk9R2l78QUd5R2nPABw78MdZD3h+VX/u77d
	 ROKdh49O9xGog==
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
Subject: [PATCH v2 15/15] gpio: zynq: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:29 +0800
Message-ID: <20251118003229.26636-16-jszhang@kernel.org>
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
 drivers/gpio/gpio-zynq.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 0ffd76e8951f..97780c57ab56 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -735,7 +735,7 @@ static void zynq_gpio_restore_context(struct zynq_gpio *gpio)
 	}
 }
 
-static int __maybe_unused zynq_gpio_suspend(struct device *dev)
+static int zynq_gpio_suspend(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -756,7 +756,7 @@ static int __maybe_unused zynq_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_resume(struct device *dev)
+static int zynq_gpio_resume(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -779,7 +779,7 @@ static int __maybe_unused zynq_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
+static int zynq_gpio_runtime_suspend(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
@@ -788,7 +788,7 @@ static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_runtime_resume(struct device *dev)
+static int zynq_gpio_runtime_resume(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
@@ -814,9 +814,8 @@ static void zynq_gpio_free(struct gpio_chip *chip, unsigned int offset)
 }
 
 static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(zynq_gpio_suspend, zynq_gpio_resume)
-	SET_RUNTIME_PM_OPS(zynq_gpio_runtime_suspend,
-			   zynq_gpio_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(zynq_gpio_suspend, zynq_gpio_resume)
+	RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume, NULL)
 };
 
 static const struct zynq_platform_data versal_gpio_def = {
@@ -1022,7 +1021,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 static struct platform_driver zynq_gpio_driver = {
 	.driver	= {
 		.name = DRIVER_NAME,
-		.pm = &zynq_gpio_dev_pm_ops,
+		.pm = pm_ptr(&zynq_gpio_dev_pm_ops),
 		.of_match_table = zynq_gpio_of_match,
 	},
 	.probe = zynq_gpio_probe,
-- 
2.51.0


