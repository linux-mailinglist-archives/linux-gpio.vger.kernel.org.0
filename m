Return-Path: <linux-gpio+bounces-3090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFAD84DDAE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE761C27DD0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0646D1D0;
	Thu,  8 Feb 2024 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lZyJUMJh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB979927
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386403; cv=none; b=G5CD7AwKuC4whBKhDjk7XhbS62SgMbp/Qi1M8kunc7RhPNWEb4zyX5SsuTVivh598CrSoe4HnGl21D+rPC5mbjY5k1b9Muk/4PyjjhKwHB0s9GBfrR1/E/EOq9Vvk+T8sXs9Zyn2crMiHpYE81M46YxRofbsQoOBdJK8PNqE3fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386403; c=relaxed/simple;
	bh=CtfJea0llJCBLvTJBTUKy6/8afj286rr8HrvBr31xBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I+qC6nkMzPBfYVat5OEIi6EiU9pbnK4+kTTVoeTbiGtevLw2uyJ6ANgDrAsfDGJzP7iumhJEzbC6o2rEoJAVh3mf1q6ruaxwPOTtu2UfvIWDqwX716ou6UjueH9N1UhVVb/5+W8O0vkTrDwwPui+lPuG9UroR3KpzhRHLTTjKv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lZyJUMJh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3392b045e0aso1005404f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386390; x=1707991190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQkXxgYTerhoxLqWK4A1mYLklWfm7Kp5H6fCKOtV4ow=;
        b=lZyJUMJhcFnOaL0i6TGu+B1up7B8tzncMZ/E0NKuoAY2P3obkhn9L4JdPrXwfXjG0i
         iIITJhIcpsNMeVE3wXB5MQQOMfPVprUHYsleuYHnTIcPHbKsSM2LsbUdrw2x04oAgMQo
         DZ27XBdKMQGF3Gq6aAoeRAm87FYEInaR4KzQt7NsiwEg8XqWYCl8mE5pw4gZ8KciCGn0
         bYjNwY9NbPi4UbfGEQ4SBjEyoK7Xn1/8WjmWt60nIFcfqGBq4GvGU3TIYC1QDTgomMPd
         shsSKgx5rueSYTGF4foCW80h2GoxWoccYpEnwEv3gQ6X1Xs+LdkBubo63HSo0bJ15se5
         anXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386390; x=1707991190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQkXxgYTerhoxLqWK4A1mYLklWfm7Kp5H6fCKOtV4ow=;
        b=YD6Rr5yx+0S+In8NRi22XGB6gU+HyxJEfxzBrpa9UEpNFXk984lA/NH0xwe7kcpmmL
         BoUEJxSQVGIDT0gG7WGKEeweeaI1Hxm1sO0cB0y+DxA1r2iDHhV7Ij1jOcBWpQdi/o7l
         4xwU7AQMgn8aZ+ZeMgQc1uetsYXfyiel1sXvyyx+cdPLJQSZMDx/GQRA7t/MkTUoyhyq
         iuxT2NEa0atT9d0hvxIAgXtyuZVLAcO+WISt9cFhcRxoTbefnJLBYXuJ02uRKKBXE4zj
         mtEfUAgKkYmaBh/wntuV5nLfgRZk0lUDJNuEpmp7CtT8KCegVKxl6ITAqiyErj0iLTdK
         VSpw==
X-Gm-Message-State: AOJu0Ywdny4oFSNwYYCpfhtXEGGit06vdSJX9GoXqgcvppLUvUBzIhbd
	2T1JgUzysY3Bn58f+1Ym85Ppmz8DEPq8r/DfBLc1yY8w+STH+E1Sb4jXoEyImT0=
X-Google-Smtp-Source: AGHT+IGq3e298KVnbRyWWqb8ismpBx3ut4qdYui+oTCRp3zXsE+6izxgvQ0scMCLcwxnS3lYbIGtHQ==
X-Received: by 2002:a5d:6da2:0:b0:33b:48ee:8a35 with SMTP id u2-20020a5d6da2000000b0033b48ee8a35mr6663999wrs.3.1707386390500;
        Thu, 08 Feb 2024 01:59:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxrRfrkwx9pQNCPSexFg8gEuiisVSgdZDXYZemOfQu32vyLwfYaTiNTWin3thqJL+dyhNvivFtPGRwobRpYoMfOn/mOUrzvMwHWbE6NjArsDWPDj4OMDcqwqB9En/dv16KW1hPfl2a99JOlnRckxpb4NoPxIfoP70RZyn2foTURzqaYHLxASUq+yMbgrTnBtzAPmHYhmwoNe0Kw7gVS/VgP/KrVYH6qTiKaxO19iAA+Thbb9Mhojx3bDeJZx9iNgvhW2zWGv8ZCzw7JUcuFax3lDLrTk70sfGNQ6UPieT+NHJEDS0sGb240hUf5pzrDJec68rpd1DcsoAl5WTrL/k1lpWMaHhSmg==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 24/24] gpio: mark unsafe gpio_chip manipulators as deprecated
Date: Thu,  8 Feb 2024 10:59:20 +0100
Message-Id: <20240208095920.8035-25-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208095920.8035-1-brgl@bgdev.pl>
References: <20240208095920.8035-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We still have some functions that return the address of the GPIO chip
associated with the GPIO device. This is dangerous and the users should
find a better solution. Let's add appropriate comments to the kernel
docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 97829f0c8487..9f8cf064002d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -211,6 +211,11 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
 /**
  * gpiod_to_chip - Return the GPIO chip to which a GPIO descriptor belongs
  * @desc:	descriptor to return the chip of
+ *
+ * *DEPRECATED*
+ * This function is unsafe and should not be used. Using the chip address
+ * without taking the SRCU read lock may result in dereferencing a dangling
+ * pointer.
  */
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
@@ -275,6 +280,7 @@ EXPORT_SYMBOL(gpio_device_get_label);
  * Returns:
  * Address of the GPIO chip backing this device.
  *
+ * *DEPRECATED*
  * Until we can get rid of all non-driver users of struct gpio_chip, we must
  * provide a way of retrieving the pointer to it from struct gpio_device. This
  * is *NOT* safe as the GPIO API is considered to be hot-unpluggable and the
-- 
2.40.1


