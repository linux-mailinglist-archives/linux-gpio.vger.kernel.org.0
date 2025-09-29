Return-Path: <linux-gpio+bounces-26657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 499B2BA8CF7
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 12:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68FBE16E72B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 10:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6519221CC79;
	Mon, 29 Sep 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yZmMvw87"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25CB2F9D82
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140213; cv=none; b=lm3p7EultMhpjlRdGG5eDeKDL4aDUDLlRxL9/A3dIC5lYcp4NzgNXOfpiZHTRKH7cyve7EzMaBdwFUsTO1K9cxKEi0p4UkwlDF4o5aBkm85w2Vmdz1qXmO8wV8fDX6sp57b6i4oxhbzURaX/+oAPi5p0EXcsKdKuSXglgYV5iV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140213; c=relaxed/simple;
	bh=Gb6plK3EJ3d85XJC/cRBKFIt6aGiETbC1ZAxTfJSusM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U5Fg/0oHqAA8aSksb/iy4V0U1OMCmqIV0u5H5/hUPFG+/U+ad3GgyiievAXXfjAwyEdm5a8WMZKqgMDYN4dPcv9LnqTfpQw988hw/fcJJSWEA1j8a4X4JWPlwThd0kswb3H3ZpQbBTiqzZeL6AbBXzM7cjczYMxzZ0WrMGnObtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yZmMvw87; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 03BCF4E40CF3;
	Mon, 29 Sep 2025 10:03:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD76C606AE;
	Mon, 29 Sep 2025 10:03:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64891102F16DD;
	Mon, 29 Sep 2025 12:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759140206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nosQxd96ycahxgkVNsH45X4Mmg0uZGQR0ZhzKavrO8Y=;
	b=yZmMvw87olC8a35uyjm6444EgYeuajvWZ2Z93O24etjRn+q26PbRGkdexLccXguXJIl9XZ
	WB3gkJOZ4ON1Tuwr7Ou88osRLQN+reis2UgvwZETbngKgv6ghkFzaA2rhmRoU2ZVvQzhaf
	H8tZm+kN2UyEMwJ81Oug5wVF2inN8+LuStmGOjKOgUXxEwsuhHJrNLEZpKs8OMwlJ9f6wD
	F+4F/HbLA/nWaBPkKAQl7VHcYiJ56BcE+HjqiPdO3zW0XpruP14DGzUzOqvI2We49TGobx
	C7ujSR8p+TTSw52nzI+XwCrHZZiXFNPob0G4QziQnR9bnvA+Za3tHbcZElydUg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 29 Sep 2025 12:03:13 +0200
Subject: [PATCH] gpio: aggregator: restore the set_config operation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGBZ2mgC/x2N0QqDMAwAf0XyvEAXmeB+Zewh1jQLk1ZSGQPx3
 y0+Hhx3O1RxkwrPbgeXn1UrucH91kH8cFZBmxsDBXqEkUbU1QqyqovyVhyT/bHKhrHkZIqRl2X
 i+MVhpimlPgyBemi11aWp1+n1Po4TB4MsmnkAAAA=
X-Change-ID: 20250929-gpio-aggregator-fix-set-config-callback-6d2bff306023
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <oliver.sang@intel.com>, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Restore the set_config operation, as it was lost during the refactoring of
the gpio-aggregator driver while creating the gpio forwarder library.

Fixes: b31c68fd851e7 ("gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202509281206.a7334ae8-lkp@intel.com
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 37600faf4a4b728ceb1937538b3f6b78ab3e90fa..416f265d09d070ee33e30bf6773e9d8fffc242bd 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -723,6 +723,7 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
 	chip->get_multiple = gpio_fwd_get_multiple_locked;
 	chip->set = gpio_fwd_set;
 	chip->set_multiple = gpio_fwd_set_multiple_locked;
+	chip->set_config = gpio_fwd_set_config;
 	chip->to_irq = gpio_fwd_to_irq;
 	chip->base = -1;
 	chip->ngpio = ngpios;

---
base-commit: bc061143637532c08d9fc657eec93fdc2588068e
change-id: 20250929-gpio-aggregator-fix-set-config-callback-6d2bff306023

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


