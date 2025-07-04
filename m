Return-Path: <linux-gpio+bounces-22797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB15AF9353
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1683D7A1D3F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 12:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9F52F94A1;
	Fri,  4 Jul 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SOuN+D3J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68692F7D1A
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633941; cv=none; b=B2gizgLNsx5RpA4Gtwwu/T0ad4QUADhpIedFqUSoynd02fFGFoyLZEfidmmdehp1F/lL38OnckUdnw0kPGJbTshRr1WBRcKQ5yQChM4Q8J6/GQjovFD0e0z7WUFecSzf9wQHamufEK2dqhaiss0k5dNXjD1NRtuhT9N6L8+VN9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633941; c=relaxed/simple;
	bh=HdYrd5wAQlj2cg109qOltUEP+8Z89jrbFJR2AWTzVRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxzP2++8QWIRxboEBu6AgK7Tx3tAdMzwc1rOjLg3ZIR3EPvA6mBAWXnJz3QXGyklrF5hmTngQe1xASKNJHIH0shC2BE5PxyhwtAl3hmtafPB2Acdnfcbo3eNYpeiXAVk4AtiF7ZCdSe1PeRPuX04p9NgAj13re+OGGrbVOjvJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SOuN+D3J; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453066fad06so6403395e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633938; x=1752238738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nM06UOupnjpVIz2DIB+rEDMhBUDdLc/LT6TEZgEANCA=;
        b=SOuN+D3JniosxR3mRWjkGupPlz4HsiKpt6xeACXaleQ7S2RZ4QM2r1+pIY4Z5KYisD
         JT9JFCYnwoqQWehyKKD2NtNQA2SF3IpLQXHl5IVWcarvGU/iTX8+mLuijGbopfSBdbsH
         Mi6roMD+AOJc06roZPWNu9Hnq9pAOq4TXq542WWeAjbK9+yPlX/dj05CRhI0tMSWJBSR
         hCpi6Mf5kpttXOAmDkksrJzcSX/Lpx6Mbze843UeVPX8aMzq9oTFG+l63SmsIc0TSZ7a
         CRt4WpKqVtqYLqdu8cmCj/7ivtiBNkB8jJ8yjjG97X0TQ9Pn+9mZ7q6URpKC4X4Sx0E8
         FupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633938; x=1752238738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nM06UOupnjpVIz2DIB+rEDMhBUDdLc/LT6TEZgEANCA=;
        b=FTnCwTJ3pNubAkMXI2YGomYz000Xg4YwPjfTtUO3aOnVx/qtC+8U7TknxTrj2g/8Uw
         av2/XpczxmqixpZV893COhA2suEURwHQr0FwgSt7S24u3G1WTMhX8EecLjsNv2Vxhry/
         G9UflF2dKscoyFJPecZCPg642mgD5ONHT+Vz6dNUm2u9rPsRFxlVy+4D/PCiFzFnFe5+
         DTb7yR31HghjlmITJa/bgpQpmJA0u/ya8b7yhhEyb1/jq00kFBc7PklZ/rrBUSNpsF7y
         xLqbWj3gcviUXGep0FeCgt5x3+NzFfsN8nADF7uQ5ctEkyj45QdbjUH6tKeHZH8RClj4
         Noeg==
X-Gm-Message-State: AOJu0YwD0DaS9e4QOImatH7On0U1Doc1prR5UefRLPT7Zdugk0JpuC3Q
	4xljPviHh7gCSrBrwtXYKS9t/4RsdgJ3E995QGXMGeKWHEThBpoBnTpqs37CAMKKvDg=
X-Gm-Gg: ASbGnculhC16yHJcvBnjeYVWMQHnxizakbyH6k/Gwlv469Y0GrDi7kO/GKT5bz2zy29
	OKMYU6uGOKo18VqtWd8cPSZFFDSIHNiRB66pt7dsDk83SNDW098m//4cRrkJS0bRfL/w5oVqY2i
	zpMriRl1xrJPm4JM0x1wwsDdBCB3vGd10dUXp5hZ+7pzz1gDOH3ip2lYAkQolxbqz7lMId8mCqZ
	gcMoT7C9v6zvvoFU5fHOgvnPDf3DDBoU/j+MH0pl1ebLuqiXtgfxg4LQK1HmcseZ6au9c+/Md2l
	EonfxlugxHyHAxd/KWkUV3cpHEzQ72fXsDNoBZi/x6sVpii14CiCPb4=
X-Google-Smtp-Source: AGHT+IFYyioA9K5vuPmOKby5kRjktdDyy2pH75rERivuNYa351BCsQwioCaEkDqrzIKmj35uSH1aQw==
X-Received: by 2002:a05:600c:6295:b0:453:b44:eb71 with SMTP id 5b1f17b1804b1-454b3102952mr24742655e9.19.1751633938011;
        Fri, 04 Jul 2025 05:58:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:58:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:50 +0200
Subject: [PATCH v4 03/10] gpio: sysfs: only get the dirent reference for
 the value attr once
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-3-9289d8758243@linaro.org>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2623;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JxMuWlaSBErn8oTKxqgNq9xj/0gFj3dqHDBwJKynqek=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9AKi+r0yxZvERHr2Uf1I7PnjZZMDbcdwj/kF
 q/oUrY/17CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCgAKCRARpy6gFHHX
 cvL/D/9YbeIZ9MN+Z3MqjVnSkqEqLrA/CrhslXGF3Zm40e5pb96lwzI1SOU3Vjjij3zds0xg1MC
 IXnxbVHO5auLHY1MMfng1IbfTWwdJeNHfKPOvyh63sRxtfvmeYUbTAqH7fmiM5bwIDt7K33BgOC
 dBCUIXrR35eocfxD5IVIiXLcL231jc5PHit3nziuvqdq0efGzBk0AvN9MULBshgFYqnwkldtPmR
 rp9iQ+B46hWgxp0TshkwfA8NJyu87kvbeXgrJPCtw+ee0imoc6A7jZBllZImTT/e44MN5XT9vcY
 2U/9f0mZPyFgDsDVDoQ5WkT8uHZkhwJMPwm0NzcDy7MMxUtqEx/psFp11Yvz0OG5LXl85XIFSF3
 bKJJe+2rbIDDgxuBwPqUS8yQi7ZAWR+lzUfCuCHAMTrU8E4ArRCI+VyEnq9ZVuPVVPj1b47XN0p
 Y6X4qtI98mYoBWk2ueuIV0aEuidyeXWgACQl4OqZD1sFHfEZ54uCKfRtxopaDAuMLQr11TxYdRV
 IQZjWDBhj1b9h8cL1A6MYjBWEArs6wSjQciGzKFCjdT9bdLY4gLStVHdW7d4JdncNTNXbexx53u
 WX+SBiXcwXkvSvfwmH1/QYmT//4hI2MUHbyunlhlWAubJJVaddTaB2+SIZgd2W+Eq9ADja90b3d
 8t0zIhKMsEnlpGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason to retrieve the reference to the sysfs dirent every
time we request an interrupt, we can as well only do it once when
exporting the GPIO.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 990db0405cc86c42bad61295dc823f970199534e..39e9ca31f034e20abd08fb5e9b4eecf24f127d5e 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -177,10 +177,6 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	if (data->irq < 0)
 		return -EIO;
 
-	data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
-	if (!data->value_kn)
-		return -ENODEV;
-
 	irq_flags = IRQF_SHARED;
 	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
@@ -203,7 +199,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	 */
 	ret = gpiochip_lock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	if (ret < 0)
-		goto err_put_kn;
+		goto err_clr_bits;
 
 	ret = request_any_context_irq(data->irq, gpio_sysfs_irq, irq_flags,
 				"gpiolib", data);
@@ -216,10 +212,9 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 
 err_unlock:
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
-err_put_kn:
+err_clr_bits:
 	clear_bit(FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
-	sysfs_put(data->value_kn);
 
 	return ret;
 }
@@ -242,7 +237,6 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	clear_bit(FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
-	sysfs_put(data->value_kn);
 }
 
 static const char *const trigger_names[] = {
@@ -726,8 +720,16 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto err_free_data;
 	}
 
+	data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!data->value_kn) {
+		status = -ENODEV;
+		goto err_unregister_device;
+	}
+
 	return 0;
 
+err_unregister_device:
+	device_unregister(dev);
 err_free_data:
 	kfree(data);
 err_clear_bit:
@@ -804,6 +806,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		data = dev_get_drvdata(dev);
 		clear_bit(FLAG_EXPORT, &desc->flags);
+		sysfs_put(data->value_kn);
 		device_unregister(dev);
 
 		/*

-- 
2.48.1


