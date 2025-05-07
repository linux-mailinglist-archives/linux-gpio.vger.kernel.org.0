Return-Path: <linux-gpio+bounces-19754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B3AAE7CC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 19:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAFDD3BB65D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82E128C871;
	Wed,  7 May 2025 17:28:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039D228C864
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 17:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638905; cv=none; b=lGCguCbwvmiUb595f+uVLYJFh69MZl5t/AsRZsN2wkpRzZRtEf6HTGGziT6BUNlwL+V8AqX9S71dSn37H+LdrVoOL5lKM5sGCWevPBao2kT+KD3jfZ3+5CjTbLjn5NF0RcWuHMtNnjqW119zctIckwV8tHLQWI3N5LtjZaBSnu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638905; c=relaxed/simple;
	bh=Z1JmpgVecB6yzG5XqAzSSlmLXEyS3//+7bggBnpdz9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuQSILD5toy8jMsd8f9/GfFbLGhs4Gr/4eZcllUnGGgi9t1rhKXqdaSE8ir9NFc9r7NleTpgikvpHjuJmkfhnfdpA3kZo4IWqqmNP3R4VzUxqZuua/4jTMzef/vmaMOOQ4gDXupjpJUXF81t+5aMr5YCwTEs1+vy2K8TsWofEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-0001Ez-DN; Wed, 07 May 2025 19:28:09 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-001axU-1y;
	Wed, 07 May 2025 19:28:08 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-000ING-01;
	Wed, 07 May 2025 19:28:08 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 07 May 2025 19:28:02 +0200
Subject: [PATCH 2/2] pinctrl: at91: add FIXME about read back of struct
 gpio_chip::base
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-gpio-chip-base-readback-v1-2-ade56e38480b@pengutronix.de>
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
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

drivers/gpio/gpiolib.c has this:

  /*
   * TODO: it should not be necessary to reflect the
   * assigned base outside of the GPIO subsystem. Go over
   * drivers and see if anyone makes use of this, else
   * drop this and assign a poison instead.
   */
  gc->base = base;

This would break the driver, because it assumes gpio_chip::base to be
the same static base that was written into it.

Point that out in a comment, until it's fixed.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/pinctrl/pinctrl-at91.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 93ab277d9943cff3a0b771f3e997594cb144826c..b0e00f3793312de2288aa1b900793d9e2b6125d6 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -949,6 +949,11 @@ static int at91_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);
 
+	/*
+	 * The GPIO chip base is an internal detail that will
+	 * eventually go away alongside sysfs and the global numberspace.
+	 * FIXME: stop reading it back here
+	 */
 	mask = 1 << (offset - chip->base);
 
 	dev_dbg(npct->dev, "enable pin %u as PIO%c%d 0x%x\n",

-- 
2.39.5


