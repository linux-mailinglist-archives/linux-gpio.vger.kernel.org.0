Return-Path: <linux-gpio+bounces-25709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20228B47B93
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 15:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D60189AEEF
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 13:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77631277003;
	Sun,  7 Sep 2025 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZS9Na2BC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C4248F7D;
	Sun,  7 Sep 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757251549; cv=none; b=u3Hdw43d3LCDD8c2XcWk/4Z+KurDqgpz360XlzULm0QYfT+B5w8YePiAdORIAzNvfXGUD0zqePiU7yk2iVkAjcLcsbo9rppmQNGHyq2gz9R0v/dEocZVu2dPZBzHcDGJ9bfWs5aVWJUumJvxeAvMvntpxi1xr6t9jItwKzweRrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757251549; c=relaxed/simple;
	bh=a4guLoMBhzfxWOET15e5kQm0vrWnUpcSCI+d9tZ7IU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6tmW11QA1rg5DGtEV2GIKlYbjPcriQKzqcEyqiLY7E3qTzCQ0HwQvcQxMz3CyZV+njcxddr9WWYPTvoaxtNBKePSLC5FMODaLjgofosYns8qdRUYKCGmR/Sjj2NVaJ+FCIKf386/WXCC8sbeZ+orGmSJvPYGn4K1r1QszYxUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ZS9Na2BC; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id vFOous9LW0vTevFOouhc72; Sun, 07 Sep 2025 15:25:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1757251543;
	bh=swveuZJuqIP5IKsdaIkmgdwwjs028Dc0hj0b/QeseIg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ZS9Na2BCbLyho4ayNteQNCuqfLxOOkDpx4JZFfm0h9nZr7Oj+I44vksKM4dXmz0rF
	 hq1vEJNi18xbgyL9jEyoipJfWhVweNTv7je/6NnNaunsjbwBaAPwLf7JE9b+19/4a3
	 X6g95/cdGZY4eJLLV8sUwsHbsxGL41BXpJ6zOcB2YEg/6Idw79bHBNehY3eVCaFEhs
	 KWltcMluaSE5jeb4pht9rxLTjKrbHr3BqCxf5YVSpGgAlC7ru74FXK4cGW54aRvvkS
	 p4E5ewRJ8VuBSecCgeFuwkLQjVKDFcNitv9/cUo3Np/8UpdUS6tOo96tKz5P1X9p9W
	 iEybEg+CCWqqA==
X-ME-Helo: fedora
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Sep 2025 15:25:43 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: pisosr: Use devm_mutex_init()
Date: Sun,  7 Sep 2025 15:25:38 +0200
Message-ID: <01910ebdaba7d8d0cdc4ac60eb70da8e29cb85f1.1757251512.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_mutex_init() instead of hand-writing it.

This saves some LoC, improves readability and saves some space in the
generated .o file.

Before:
======
   text	   data	    bss	    dec	    hex	filename
   8431	   1808	    192	  10431	   28bf	drivers/gpio/gpio-pisosr.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   8112	   1736	    192	  10040	   2738	drivers/gpio/gpio-pisosr.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpio-pisosr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index a69b74866a13..7ec6a46ed600 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -108,11 +108,6 @@ static const struct gpio_chip template_chip = {
 	.can_sleep		= true,
 };
 
-static void pisosr_mutex_destroy(void *lock)
-{
-	mutex_destroy(lock);
-}
-
 static int pisosr_gpio_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
@@ -139,8 +134,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(gpio->load_gpio),
 				     "Unable to allocate load GPIO\n");
 
-	mutex_init(&gpio->lock);
-	ret = devm_add_action_or_reset(dev, pisosr_mutex_destroy, &gpio->lock);
+	ret = devm_mutex_init(dev, &gpio->lock);
 	if (ret)
 		return ret;
 
-- 
2.51.0


