Return-Path: <linux-gpio+bounces-19755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC9AAE7CD
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 19:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAFA3BBE12
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016CF28C87C;
	Wed,  7 May 2025 17:28:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3E728C5C7
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638906; cv=none; b=hQ2MjU1Oa0JvUnh1gh2MaytGOzx/BJl2LBMRIaIchxz3CirnWaoYnk4lU/XMQjcuy6FmOx5Enim5lAYkzUtfc9A6y660LzQYrSm/pEZ3N5ZYc7viIxW4ncToxWKZpym1NXPiNDVeQOQqmc1dj/0v8K1f8AzkqGWF67qJeWd88s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638906; c=relaxed/simple;
	bh=tIL6e0hHjDhjd6a+BWn/ilZL2rPSvZp8qpyDYLOj2hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8lv+C1ab68ILX9fbF6hpli3tprrLnZBFQPlVmLzRP5vyrPY/M94IOWlesFpqIkvmg7gfPAqlmMVSC8hdnVNWg12mbAdBnmKIU/UOFn+FJsxGuWJ+IQutUHxEHmkvBlP7QEK4Od61pEpKabWej1BG6EKnaxRR7hnr/8DL8MeDVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-0001Ey-DN; Wed, 07 May 2025 19:28:09 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-001axT-1v;
	Wed, 07 May 2025 19:28:08 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-000ING-00;
	Wed, 07 May 2025 19:28:08 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 07 May 2025 19:28:01 +0200
Subject: [PATCH 1/2] gpio: TODO: add item about GPIO drivers reading struct
 gpio_chip::base
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-gpio-chip-base-readback-v1-1-ade56e38480b@pengutronix.de>
References: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
In-Reply-To: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

drivers/pinctrl/pinctrl-at91.c uses struct gpio_chip::base to find out
which bit to set in a register:

  dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);

  mask = 1 << (offset - chip->base);

This adds a non-obvious dependency on the global numberspace from the
GPIO driver itself, even if all consumers use the descriptor API.

More such instances may exist and will need to be fixed in the quest for
removal of the global numberspace, so add a reminder about it to the
TODO list.

Link: https://lore.kernel.org/all/1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de/
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/gpio/TODO | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 4b70cbaa1caacdcc04044039782e86a7a44135c1..4a8b349f2483a91883c74b07a43efb1462dbd377 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -44,6 +44,13 @@ Work items:
   to a machine description such as device tree, ACPI or fwnode that
   implicitly does not use global GPIO numbers.
 
+- Fix drivers to not read back struct gpio_chip::base. Some drivers do
+  that and would be broken by attempts to poison it or make it dynamic.
+  Example in AT91 pinctrl driver:
+  https://lore.kernel.org/all/1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de/
+  This particular driver is also DT-only, so with the above fixed, the
+  base can be made dynamic (set to -1) if CONFIG_GPIO_SYSFS is disabled.
+
 - When this work is complete (will require some of the items in the
   following ongoing work as well) we can delete the old global
   numberspace accessors from <linux/gpio.h> and eventually delete

-- 
2.39.5


