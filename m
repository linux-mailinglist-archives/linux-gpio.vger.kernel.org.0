Return-Path: <linux-gpio+bounces-14734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D5A0C488
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF24C3A5C36
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86511F9433;
	Mon, 13 Jan 2025 22:19:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6181F9A91
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 22:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806782; cv=none; b=loTPI5gbudLKzred+UMzd4s6b7RMY9S6PwmLK6A+vX5HtN1RU4SgWpPVX+XII7HXThK8qcx/dD4SsozDYvxRUJnFAghzJPM9nKWLr8TlAbCDfNEW/VjyIiXrm9uvmhiTPF43J0TEk9zqBOzAlFYeUq1u3fDWTrfsURRX1SMIwZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806782; c=relaxed/simple;
	bh=LZUqTKQG/VudoIdjL3NreEIvE2/yKrFha28dh32t4+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tf7dXeNZTHu3QF/zHbQb3eLhO6X3CBSHrtS4NtkRc6Ax4Atqt66x1R/gn0rqHkNBllPVn4agkmccpho2WDwNsy0Kq6WOLzukj8HTLrOJBHz0EknmpIdTgSZxwbOVUfuXBQbOLIPCgzvLYT6AhYm0i1y/zZybD6qR3zD7Mvq/Bz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005ym-7s; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYi-2G;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2f;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:19:12 +0100
Subject: [PATCH 4/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-4-0a28731a5cf6@pengutronix.de>
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

GPIO numbering has been deterministic since commit 7e6086d9e54a
("gpio/mxc: specify gpio base for device tree probe"), a year after
device tree support was first added back in 2011.

Reverting to dynamically allocated GPIO base now would break most
systems making use of the sysfs API. These systems will be eventually
broken by the removal of the sysfs API, but that would result in GPIO
scripts not working instead of essentially toggling at random according
to probe order, which would happen if we change the base to -1.

Yet, the warning is annoying and has resulted in many attempts
to remove it over the years[1][2][3].

Fix this by silencing the warning via the gpio_base_static_alloc
opt-out instead.

[1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@amarulasolutions.com/
[2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.com/
[3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu@leica-geosystems.com/

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
This triggers the newly added checkpatch.pl warning, but this is
intended.
---
 drivers/gpio/gpio-mxc.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833a4bb94a93b4209f01b49ad1cbdb0..c25a50abb02389e75b5ca2924828f4a7fb32fe6c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -45,6 +45,11 @@ struct mxc_gpio_hwdata {
 	unsigned high_level;
 	unsigned rise_edge;
 	unsigned fall_edge;
+	/*
+	 * Static allocation of GPIO base is deprecated.
+	 * Set this to false for future SoCs.
+	 */
+	bool gpio_base_static_alloc;
 };
 
 struct mxc_gpio_reg_saved {
@@ -88,6 +93,7 @@ static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
 	.high_level	= 0x02,
 	.rise_edge	= 0x00,
 	.fall_edge	= 0x01,
+	.gpio_base_static_alloc = true,
 };
 
 static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
@@ -103,6 +109,7 @@ static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
 	.high_level	= 0x01,
 	.rise_edge	= 0x02,
 	.fall_edge	= 0x03,
+	.gpio_base_static_alloc = true,
 };
 
 static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
@@ -118,6 +125,7 @@ static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
 	.high_level	= 0x01,
 	.rise_edge	= 0x02,
 	.fall_edge	= 0x03,
+	.gpio_base_static_alloc = true,
 };
 
 #define GPIO_DR			(port->hwdata->dr_reg)
@@ -490,7 +498,19 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = mxc_gpio_request;
 	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	port->gc.base = -1;
+
+	if (port->hwdata->gpio_base_static_alloc) {
+		/*
+		 * GPIO indices have been fixed for the i.MX GPIO controllers
+		 * for many years and changing that now will induce a lot of
+		 * breakage at runtime. Setting this member buys users some time
+		 * until they are forced to migrate when sysfs GPIO support is
+		 * removed completely.
+		 */
+		port->gc.legacy_static_base = true;
+		port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	}
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)

-- 
2.39.5


