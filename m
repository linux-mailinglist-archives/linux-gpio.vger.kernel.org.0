Return-Path: <linux-gpio+bounces-1563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A2814C22
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 16:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F5F1F23797
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 15:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C4E39FEB;
	Fri, 15 Dec 2023 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3B3hjoiy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE4381BA
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c55872d80so11467175e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 07:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702655586; x=1703260386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ap5YKACnlUbXS6eetDez0VUaGPWZc+QwWEfEjI6SZuQ=;
        b=3B3hjoiyG4DVgpHA4+wXSmF6nRAJxitREHTvJCqkLiQTINL8x1wPMpVQq72pFMQsvp
         VbRU7hpIdOCog6/zXv2kV1fO5eZUZP46D0OonH/mxY9sk6X6QCm4EiaN7DbzQmmn3h1q
         ZuLuiH29Lc0cfDzGjIHxy1Ce+CKnr7ks8Q4uvAwUORpB4Md2RpEMbGVHrnQvXBRazXNr
         JsQ39BluYyrr/lC0L0XKCtbhDCN8r3MlOF9UfMGwFbj3mgJrqpEMXFjSImKRhsh7h2lN
         LR7Mx0cANYBtW35d9hMXqwGR8KDpsltNcxoEtrQDDm0ahPIOW64cPM3xCNwedkjChvd0
         tITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702655586; x=1703260386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap5YKACnlUbXS6eetDez0VUaGPWZc+QwWEfEjI6SZuQ=;
        b=voc6uLgfll86+XNobZAwpvMwnv5rF9ZzQtglAiJwzY0ThgH5nZfqBl9AgBdEvFFqNl
         6DmkmljoRWP3g2+8u81v9DleXBgcHg0X2JBTzurrmY7JFTHMTqkGDHRcIGHF20LWgSNx
         wfM2tVOifKPUcN5D5jO/S4UXjqDnSXLIIuAEtN3WqAZMROU+8RTY3r4GUVjrfzNd8t9E
         5thi1W7VjW7EaCBJutRSvGJ/FIcBlQe5juLUaNGfQ7GnZ1RsmMilNwPDMkiRxAEOAm3q
         hPhy3W7su4UtggigVkUnef4V5sd4lexE2dMemoI4M4yvEuliaNW5cGvuK8Th3hHLIO4f
         1kLA==
X-Gm-Message-State: AOJu0YzC01Z9PU9dQcgSV7/hKadtWHsQOSEFvLEMEiNvaWRrZ0Fbrer1
	d6jegBWxEhELydQ4Qed2ye9cNw==
X-Google-Smtp-Source: AGHT+IF6K8SjQo/shg5notyyh3x4VLQTAlKPXSj8f3LI1pLV3JognaX/IjfDO2WSfpICTKBfnEwyZw==
X-Received: by 2002:a05:600c:16c9:b0:40c:3dd7:98d9 with SMTP id l9-20020a05600c16c900b0040c3dd798d9mr5620884wmn.21.1702655585948;
        Fri, 15 Dec 2023 07:53:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8672:e2c5:37d9:3743])
        by smtp.gmail.com with ESMTPSA id bg22-20020a05600c3c9600b0040c6ab53cd2sm3110484wmb.10.2023.12.15.07.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 07:53:05 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 1/2] gpiolib: rename static functions that are called with the lock taken
Date: Fri, 15 Dec 2023 16:52:59 +0100
Message-Id: <20231215155300.21186-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215155300.21186-1-brgl@bgdev.pl>
References: <20231215155300.21186-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Rename two functions that read or modify the global GPIO device list but
don't take the lock themselves (and need to be called with it already
acquired). Use the _unlocked() suffix which seems to be used quite
consistently across the kernel despite there also existing the _locked()
suffix for the same purpose.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6efe44570333..5b744d1f31f6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -290,7 +290,7 @@ struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
-static int gpiochip_find_base(int ngpio)
+static int gpiochip_find_base_unlocked(int ngpio)
 {
 	struct gpio_device *gdev;
 	int base = GPIO_DYNAMIC_BASE;
@@ -363,7 +363,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  * Return -EBUSY if the new chip overlaps with some other chip's integer
  * space.
  */
-static int gpiodev_add_to_list(struct gpio_device *gdev)
+static int gpiodev_add_to_list_unlocked(struct gpio_device *gdev)
 {
 	struct gpio_device *prev, *next;
 
@@ -907,7 +907,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 */
 	base = gc->base;
 	if (base < 0) {
-		base = gpiochip_find_base(gc->ngpio);
+		base = gpiochip_find_base_unlocked(gc->ngpio);
 		if (base < 0) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
 			ret = base;
@@ -927,7 +927,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	}
 	gdev->base = base;
 
-	ret = gpiodev_add_to_list(gdev);
+	ret = gpiodev_add_to_list_unlocked(gdev);
 	if (ret) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-- 
2.40.1


