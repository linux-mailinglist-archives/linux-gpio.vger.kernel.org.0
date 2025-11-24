Return-Path: <linux-gpio+bounces-28998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 528A2C7EB71
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 497D3345330
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CFA221F20;
	Mon, 24 Nov 2025 00:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUur5oNj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DBC14A60F;
	Mon, 24 Nov 2025 00:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944799; cv=none; b=hRSxER8sbvg0DYNWtH2u7vJT+hA0rdimaDv5emtoCpRTEyyh7xpQ0/4Kw041zTJQo0XDOLqglyABNU/ASn+cLyZGqp8eLdMiE9mTpowE6Gvzgk55/d+KQ8p76YJzXCL4S1Zucl5aC9TFIObjUz3P5mBUI/gn9Lx7ueDtxODf1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944799; c=relaxed/simple;
	bh=59dk9hx3CmiQzssyFO/uVMRkm/znXuNpXQsoz9Ju1v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+yXyCR07K0m/SUmTIQFWw9LXUJ7Rgl3gkQfdCCKQ/1AnKeZDBfBfskWNNzjcIcx965iDMufbFd+KqVdtlHtwHwA7nopGx3wfdvx7oHOZMW1dzoF57NOlx99qqSU5+GoYb/gUa2WFqX2/EXViSaI5ocKqjl/y/qTO/kB3C2AgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUur5oNj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33965C16AAE;
	Mon, 24 Nov 2025 00:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944799;
	bh=59dk9hx3CmiQzssyFO/uVMRkm/znXuNpXQsoz9Ju1v4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eUur5oNjmxtcf4hxClFd72vx7xSlcJlWZv3a2cGpXd9ZweM8caP4vuTHt26Dkk1ST
	 l03zsuZWGwyVEnWhfgao0jFv9kQb9FUFsWQ6xOFctSu8wQN09fXB2fCaPVlQ4dD6es
	 OEQCeIVpDF4ZlpQTb3GLdF7oI0Jjbea/HX36T5B8KqVeLkJw2DoT6NVZ9IymvrUIAF
	 vpFAvQOiawC81th0Qybi0jXxL0Y4B+acgJw+8fY0twpctgmgJ0Yen1t/7rtpSyoxv4
	 KgI260pZ0BC7R0mizvQODUG2XaIM207DFKEhkISDdTvWVFxqLywTTx8MLXANZX/5rw
	 6F7tIhuOWPzhA==
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
	linux-omap@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 14/14] gpio: zynq: Use modern PM macros
Date: Mon, 24 Nov 2025 08:21:05 +0800
Message-ID: <20251124002105.25429-15-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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


