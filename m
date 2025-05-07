Return-Path: <linux-gpio+bounces-19736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B483AAE03D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26A4A1C2524F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD986289348;
	Wed,  7 May 2025 13:07:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF6288CAC
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623274; cv=none; b=rswArgkNOT/c09xM7aIyeM1nA2vk/RSWxxaHX796ra9yJiykACEVmZ6paHp4QFuBaeOtnw7YaFrVNTKPTRHPKPcUDIMKT4V30k1zpjA7sNUhVcumWmg+fQANQtP4bT5P5oqUve1kRWR5KiKGwSKYwWmwx8ewrcpCW/5EcawJkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623274; c=relaxed/simple;
	bh=VrozmJHqdPopRWKMda1tn1rm5/kvvsrCa0JkWaKp31M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h20Jbhc2stRVLLuL8gGEI2PmsNEip6yVNm5Px9ZL0D74LXOtZKcxA/NYShN46L4rKqneWb9g8smkRlJR7a8KHB2BqRWcH4WweC6K72JhAh1kTyzsURBEEYC3psz5rc81yOUHYT9epZw4iP/YtFfP0gmz8GF5Av2BZDT9qJFFeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeUy-0006P4-8e; Wed, 07 May 2025 15:07:44 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeUw-001ZIn-2o;
	Wed, 07 May 2025 15:07:42 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeUx-00EJKB-0s;
	Wed, 07 May 2025 15:07:42 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 07 May 2025 15:07:25 +0200
Subject: [PATCH v2] gpio: mxc: configure dynamic GPIO base for
 CONFIG_GPIO_SYSFS=n
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAA1bG2gC/42NQQ6CMBBFr0Jm7Zi2gBRW3sOwKDCUWdiSFhFDu
 LuVE7h8L/nv7xApMEVosh0CrRzZuwTqkkE/GWcJeUgMSqhSSJljVyA/N7Qze+xMJHyb4NhZLMb
 akK61rgYBaT4HGnk704828cRx8eFzPq3yZ/+IrhIFCqN0lUtT9uPtPpOzryV4x9t1IGiP4/gCg
 LUfEcUAAAA=
X-Change-ID: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Haibo Chen <haibo.chen@nxp.com>, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
("gpio/mxc: specify gpio base for device tree probe"), a year after
device tree support was first added back in 2011.

Reverting to dynamically allocated GPIO base now would break most
systems making use of the sysfs API. These systems will be eventually
broken by the removal of the sysfs API, but that would result in GPIO
scripts not working instead of essentially toggling at random according
to probe order, which would happen if we unconditionally set base to -1.

Yet, the warning is annoying and has resulted in many rejected attempts
to remove it over the years[1][2][3].

As the i.MX GPIO driver is device tree only, GPIO_SYSFS is the only
consumer of the deterministic GPIO numbering. Let's therefore restrict the
static base and the warning that comes with it to configurations
with CONFIG_GPIO_SYSFS enabled.

[1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@amarulasolutions.com/
[2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.com/
[3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu@leica-geosystems.com/

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
This was one result of the discussion with Bartosz at FOSDEM 2025.
---
Changes in v2:
- drop warning opt-out flag
- set a dynamic base only if sysfs support is disabled.
- drop unrelated driver cleanup separately picked by Bartosz
- Link to v1: https://lore.kernel.org/r/20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de
---
 drivers/gpio/gpio-mxc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833a4bb94a93b4209f01b49ad1cbdb0..38504c9486b05802a792367111c9d71dc08bdd16 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -490,7 +490,14 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = mxc_gpio_request;
 	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	/*
+	 * Driver is DT-only, so a fixed base needs only be maintained for legacy
+	 * userspace with sysfs interface.
+	 */
+	if (IS_ENABLED(CONFIG_GPIO_SYSFS))
+		port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	else /* silence boot time warning */
+		port->gc.base = -1;
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


