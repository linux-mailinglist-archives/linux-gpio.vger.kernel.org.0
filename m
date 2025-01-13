Return-Path: <linux-gpio+bounces-14735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F9A0C494
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962AF1881926
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA9D1F9AAE;
	Mon, 13 Jan 2025 22:19:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF81F9AAC
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806791; cv=none; b=mIHpPTGopv3p6QtZFrDircxvmyrDa4Lp9oSYXhsRdo/PRmDcCcCtGuhl3ajXLWt+hdeRBcqcC3w/DuxIvpJ3ZQMMWJIgXRbIDs3bFYoKgP/+av1egmenrwQ55PGWQGcK8+WeYs80St09CFzhxIaNHWVjV192xPBuVV8xiQ/LBk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806791; c=relaxed/simple;
	bh=rsvZIG5C3LCxurR4WnzogyTG4fOHh6liz9gTArj2w9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ruvwhOra89Ij/Z5w0uUkscYj6ToE77YvILI0v50UvWW3S0Wqrt2cW4oE0p7TF+zOoNLwlqGSAcfgsZeWCr0Y4QusxYjZtdqSoOll/6YBqy2Nm73xq20O8MmsnmTw8/7W7AxC+TPTITO7ePj8IrU8AVO7E5dbey66AB5w53fwht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005yl-7v; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYh-2C;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2e;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:19:11 +0100
Subject: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Haibo Chen <haibo.chen@nxp.com>, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

struct platform_device::id was only set by board code, but since i.MX
became a devicetree-only platform, this will always be -1
(PLATFORM_DEVID_NONE).

Note: of_alias_get_id() returns a negative number on error and base
treats all negative errors the same, so we need not add any additional
error handling.

Fixes: 0f2c7af45d7e ("gpio: mxc: Convert the driver to DT-only")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/gpio/gpio-mxc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4cb455b2bdee71ba4eb20c93567c3b8db100dbb2..619b6fb9d833a4bb94a93b4209f01b49ad1cbdb0 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = mxc_gpio_request;
 	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
-					     pdev->id * 32;
+	port->gc.base = of_alias_get_id(np, "gpio") * 32;
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)

-- 
2.39.5


