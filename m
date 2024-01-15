Return-Path: <linux-gpio+bounces-2239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D060D82DC25
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 16:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881931C21C9E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 15:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73D617735;
	Mon, 15 Jan 2024 15:14:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFC617732
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 9D39F30000647;
	Mon, 15 Jan 2024 16:05:02 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 89B4C3058E7; Mon, 15 Jan 2024 16:05:02 +0100 (CET)
Message-Id: <f481d5bff884c16606cbe577e707e1c1c0e6ccb2.1705330861.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 15 Jan 2024 16:05:26 +0100
Subject: [PATCH] gpiolib: Fix scope-based gpio_device refcounting
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Commit 9e4555d1e54a ("gpiolib: add support for scope-based management to
gpio_device") sought to add scope-based gpio_device refcounting, but
erroneously forgot a negation of IS_ERR_OR_NULL().

As a result, gpio_device_put() is not called if the gpio_device pointer
is valid (meaning the ref is leaked), but only called if the pointer is
NULL or an ERR_PTR().

While at it drop a superfluous trailing semicolon.

Fixes: 9e4555d1e54a ("gpiolib: add support for scope-based management to gpio_device")
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 include/linux/gpio/driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0aed62f..f2878b3 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -614,7 +614,7 @@ struct gpio_device *gpio_device_find(void *data,
 void gpio_device_put(struct gpio_device *gdev);
 
 DEFINE_FREE(gpio_device_put, struct gpio_device *,
-	    if (IS_ERR_OR_NULL(_T)) gpio_device_put(_T));
+	    if (!IS_ERR_OR_NULL(_T)) gpio_device_put(_T))
 
 struct device *gpio_device_to_device(struct gpio_device *gdev);
 
-- 
2.40.1


