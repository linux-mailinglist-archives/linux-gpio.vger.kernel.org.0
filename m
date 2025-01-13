Return-Path: <linux-gpio+bounces-14736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EAA0C48C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB89E3A317C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C13B1F9EDA;
	Mon, 13 Jan 2025 22:19:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6541F9F40
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 22:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806799; cv=none; b=sGqEaW4VJwOVv69YVIN8je5JNqGdYfLBRN3CNXRQlmJ6paRNMIl4jCz464tRwe9jWXyubqBS3FFiBpXmQ4ObVln04MTi9NNtOEZx09SDUD760xUL8LoYq0NTgr8y8DvMZqVQrlaGCuNOYWTJvVel87rPBU5RVOZnPiHC5cmygZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806799; c=relaxed/simple;
	bh=3tZhAPCNYwnEOO3+MI7+F0UKPfOLrwl6htzbycYw4qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYAG15Nehc2NJrPs2y2hZlu0EZpWaTfu7kOgIHWg1+P4P1cHLihOL0LBLsOdAcjHOJGFYZYuuATny/JEvHxDSxiWFfkGav+P0y4qq25hs9dnLYf7MVm17Fj3NLLV96UA/KwynOuFriSLqxzhZuzU5WVeqJvR0Au6jdv7xpYcnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005yj-7t; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYf-29;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2c;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:19:09 +0100
Subject: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
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

Some drivers have had deterministic GPIO numbering for most of
their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
("gpio/mxc: specify gpio base for device tree probe"), more than
12 years ago.

Reverting this to dynamically numbered will break existing setups in
the worst manner possible: The build will succeed, the kernel will not
print warnings, but users will find their devices essentially toggling
GPIOs at random with the potential of permanent damage.

As these concerns won't go away until the sysfs interface is removed,
let's add a new struct gpio_chip::legacy_static_base member that can be
used by existing drivers that have been grandfathered in to suppress
the warning currently being printed:

  gpio gpiochip0: Static allocation of GPIO base is deprecated,
  use dynamic allocation.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/gpio/gpiolib.c      | 2 +-
 include/linux/gpio/driver.h | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb143c4b3357106de1570e8d38441372..bedeb8f28badfb7287c4929f9ad0825e050a79c9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1011,7 +1011,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			 * drop this and assign a poison instead.
 			 */
 			gc->base = base;
-		} else {
+		} else if (!gc->legacy_static_base) {
 			dev_warn(&gdev->dev,
 				 "Static allocation of GPIO base is deprecated, use dynamic allocation.\n");
 		}
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..6e820d79d03e61123f89aaf884d35d4a1a5918a7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -382,6 +382,10 @@ struct gpio_irq_chip {
  *	implies that if the chip supports IRQs, these IRQs need to be threaded
  *	as the chip access may sleep when e.g. reading out the IRQ status
  *	registers.
+ * @legacy_static_base: set for some existing drivers, where @base is non-negative
+ *	and changing that would induce so much breakage that they were
+ *	grandfathered in until GPIO sysfs support is removed altogether.
+ *	Do not set this for any new drivers.
  * @read_reg: reader function for generic GPIO
  * @write_reg: writer function for generic GPIO
  * @be_bits: if the generic GPIO has big endian bit order (bit 31 is representing
@@ -467,6 +471,7 @@ struct gpio_chip {
 	u16			offset;
 	const char		*const *names;
 	bool			can_sleep;
+	bool			legacy_static_base;
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
 	unsigned long (*read_reg)(void __iomem *reg);

-- 
2.39.5


