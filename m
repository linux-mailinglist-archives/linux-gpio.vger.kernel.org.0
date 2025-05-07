Return-Path: <linux-gpio+bounces-19753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153FBAAE7CA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 19:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608C53BB2AB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE5728C869;
	Wed,  7 May 2025 17:28:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804EA28C5D0
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638904; cv=none; b=RjrwdmeeLA31SDpn4hBxyeuqQCFhgyHnh2GMJArGDH7cRu+dS9FBfGsRAFwAXLNDae0YNeVwHumejOOvaD7iQsulSQasXaXCu8nxld8A4RJoCcMz6Q5tOn44xHweDio5vPr4RcO5ztVnckuFg70d3XUsVF3dgHi8pW0mDB/VHVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638904; c=relaxed/simple;
	bh=LUbZ2ZVksxFfFOy/YMs2XJTER9hG3sAfvocQkpgZo5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HYH3kO4RIGgE67Gsd1vTeVySp1mNNr0L90rYFrDNhQWccSCCC+koiwGo+DsbA4mQW73NusIr69i8u2shpqlZnoZgkstnLJvCbq5zyYelxX+u9ul98Nyx7f8QSYsbbWNc1rgJKWV9j7KCPxP645+dT5anjShozNrH+oRKwLmi4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-0001Ex-DO; Wed, 07 May 2025 19:28:09 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-001axS-1u;
	Wed, 07 May 2025 19:28:08 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-000ING-3D;
	Wed, 07 May 2025 19:28:08 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/2] gpio: TODO: add item about GPIO drivers reading struct
 gpio_chip::base
Date: Wed, 07 May 2025 19:28:00 +0200
Message-Id: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCYG2gC/x3MQQqAIBBA0avErBuwIrKuEi10nHIIVBQiiO6et
 HyL/x8onIULLM0DmS8pEkNF1zZA3oSDUVw19Kof1agmPJJEJC8JrSmMmY2zhk6kyWm22g7kZqh
 1yrzL/Z/X7X0/GKFvzmkAAAA=
X-Change-ID: 20250507-gpio-chip-base-readback-c7d8eb8b3cd9
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

Bartosz requested that I add this to the TODO, so here goes.
While at it, I also added a FIXME into the driver.

I'll be away most of the month, so feel free to squash changes as
appropriate.

---
Ahmad Fatoum (2):
      gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
      pinctrl: at91: add FIXME about read back of struct gpio_chip::base

 drivers/gpio/TODO              | 7 +++++++
 drivers/pinctrl/pinctrl-at91.c | 5 +++++
 2 files changed, 12 insertions(+)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250507-gpio-chip-base-readback-c7d8eb8b3cd9

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


