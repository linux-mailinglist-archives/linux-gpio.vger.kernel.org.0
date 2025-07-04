Return-Path: <linux-gpio+bounces-22798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14BAF9352
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E0921BC342E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 13:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D342EF9C7;
	Fri,  4 Jul 2025 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hqXbj257"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314232F9484
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633942; cv=none; b=tSzCIwsZGQGZIutZvgzPXRBM4XRgRvmXk3nRdit/ScKcoqi24BUce99+6j1Ce4Y7jjW4Gu/YcjpCYDJMwRyd1kYAQb51L15hjnydLID41es1BaYDe9LS7pF9F6Vbw+PIsAHwlEE/UM+mY77+eR6J+C4FSWzBI3y5L8z01G0gFiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633942; c=relaxed/simple;
	bh=QvDRysI0zKBvfiq+uUhVzRccMt+3EXYSAt0+5f6/hQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7euXSOdosXpF8mFcJcbjjuONi/tvz8ke5eKn+z5xyFEcQAWzjVdrHto93cqlTD2LHVKzHCWPu0qKnKIeT/t8c3d91g6DBbQaD6m7FFD+8hn+ClJ+HicKZhXN8vC5tetNbKqab0AaATNZDSu+m0Moja+oFoiet74BQdLDWIRW7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hqXbj257; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso6815295e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633939; x=1752238739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chUTeulTUPdeqVOJNiNnsekTGU96gw2BccovvxawDKo=;
        b=hqXbj257IxLgpASSb+RAohYUPutr3Rrz56TuXUwcYt6FiZb18pBpDGbJC7MQRQRoo4
         /JDesDauwNibsTyog8lgY6xF7Ktgjnn4Aj36Z0UlXdHLUb1HIhgEnqJogY6MObMG0L+t
         lS1hIwUt7KUVseXJWrFfqrkru0YQKmBLLBKVkyTNDWeg5HgWlqkZarC81fdndQ3O+aPN
         LSOT+uTCq2LkUV+zlFjadQaYLrWTlqDa65IrUGMv5N19ndyJW8UHFvh1ASEJJ0013d78
         M9JHE4AZvUpe4WTJjmKuuZow6eas/xeV42ZtyAEncquPlNRW414gumAe1VhcLDUBVJCG
         wTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633939; x=1752238739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chUTeulTUPdeqVOJNiNnsekTGU96gw2BccovvxawDKo=;
        b=eu3yLA+0Tb7hYeDJgtO9TOLsh4f/5QBOxnyA0bbfSgu8dLoc5BMbpaRKdgo/cSsNgu
         efaze65RsnKfGKd9s6ZXl/5DhDJv0GI0uYpgcvORC7CG2UG7k/JfVDXvvcSPaTqtMSuK
         FgS3xI5EjnRosRnAB8mPRv34xN3VcCgfA9Crw99/dQwBplJH8j6q4N93T5spqoi1VAzy
         +GZ7vIsoqWz5h4sa46wjRXLTfXbqmpP6/1OH/m+L6yeDPrYlptL9UmDm5CSoH/TYi4BH
         n9L5+JlrJFi1qi02m8A6QGPTN3Ohc14mcfoIjlUtTABpPeOZiqVHq/bglHfbI1/o1hDb
         fxQA==
X-Gm-Message-State: AOJu0YxxFXoovHf1/LWRPjcnWiushtSUumj88/kPT0UmMmXdf39TGATR
	em3OwTl9jEbsSs9SfO9OBl7DN9kIbldqrkrArsQ9TLlbq7x8BMO7seua9DlIQi7S7JM=
X-Gm-Gg: ASbGncu7Q9e6+tY51BwMlRAx1KGBqzfbCWVVpg1Y/zEE6fLSAcrYUb3Y7+VVM/jW++z
	sL/xwm2HNlpdV9Kj0QLIQijQVNssfwqeD4BSUen0u+fXZ3tyK+ggrHFoke1b3g5GeFQox8b34BK
	ZmTd6M/uSiHlnhUdhT0d65+f7+j4xJrfLRTnLPggd+n2UW0lnyAgcefkiUzFxAZ/r3/0nNEyGyC
	CeFqg1pH9vBacjy0ijOEXZbMCgpqUdhnzxKf9nrn/LNOFV3Cmr9e8AX0OwhbSTX1IT+uDRXBnjk
	HsWei39jmrWBVMQpQln7Vlj/Equp8/lFR2OLZE0J5XwuYjDY1Z7QZk7Dfc4xjFZJew==
X-Google-Smtp-Source: AGHT+IFZsxDFGsENnbAxd4uEJgHOkB70NNoxo3f2t8JXpzb3sCCH+idVcQZQ6iCzYFTSff30PFmkFw==
X-Received: by 2002:a05:600c:3487:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-454b319326fmr27666635e9.31.1751633939453;
        Fri, 04 Jul 2025 05:58:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:58:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:51 +0200
Subject: [PATCH v4 04/10] gpio: sysfs: pass gpiod_data directly to internal
 GPIO sysfs functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-4-9289d8758243@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3592;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OQguaD3u1rCmwb79TkTjoMlipA/AyroTXpUaKeZMACU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9ALKbygKkNInfE1rZp+MSje0r1Pe8dXXF7eI
 UkE/owHd6OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCwAKCRARpy6gFHHX
 cmAMD/0dkkcQ1Lgyn5JoVK4UyoFt5HdrbSy7z9imWG4iqGGL9KQpQoJby4gZM4ctqiiccsMF1pj
 HcUt/XVF4l9coo5BQaKGxZxMrwi1i9LUmwBOuOuE2LKGu4VWLCGSyXwbdLQIhwG5mIBL+Art4C1
 QJ4yeOKdMLQRQm8EvAPiN+q6UArAENfw+xCrNRKtoQGGvCatMck8KCVrUPq3YdWSq29ZmEY031F
 Tt+OQPyKkfTKIzXiW7iXCoZkjDW2uesY8qrsyfymoDUiVBOa5Et0Q/EJ4yfh6W392m0syt7eONk
 TLdiBCD3bm2Orx235jVn6Gomv5x7/thDpe/j6mltVIxLX5wqUQKq6WQd+9h1Bao/5+5S6kaH0uh
 YhzdyOBKfe9FRMjJ6NcvVTCDm1prwpq36HbWtN66kXjondhrixkX+xzYGX2l6Ak7dP/BzFEJcA+
 yVmNc/y3qJEV9f56gsxtGaKy4xCJWZg9ysRFb1YpiNLt5jH7FPKLCDlwRz8TvKGlYd5T4qfNSz+
 FTV9KNsphx7hqP4eLcwZeODv6bL6VaOYVTSAr6vd+z6jtGqA/aL/Hhfl9+RqhLd3fCI+wjPkKy7
 lxYv+ffN65md1sXCERyYWQF3kR6BNmFqYlqwm5RvNPy/VxrbgQaOXwX/QoooI9XPcs6w/skY7KT
 vuAnat5VCsTCaqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't use any fields from struct device in gpio_sysfs_request_irq(),
gpio_sysfs_free_irq() and gpio_sysfs_set_active_low(). We only use the
dev argument to get the associated struct gpiod_data pointer with
dev_get_drvdata().

To make the transition to not using dev_get_drvdata() across line
callbacks for sysfs attributes easier, pass gpiod_data directly to
these functions instead of having it wrapped in struct device.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 39e9ca31f034e20abd08fb5e9b4eecf24f127d5e..0cfa73e92b47fd089b973e96b5062694b7f8abd3 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -162,9 +162,8 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 }
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
+static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	unsigned long irq_flags;
 	int ret;
@@ -223,9 +222,8 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
  * Caller holds gpiod-data mutex (unless called after class-device
  * deregistration).
  */
-static void gpio_sysfs_free_irq(struct device *dev)
+static void gpio_sysfs_free_irq(struct gpiod_data *data)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 
 	CLASS(gpio_chip_guard, guard)(desc);
@@ -278,12 +276,12 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 		return size;
 
 	if (data->irq_flags)
-		gpio_sysfs_free_irq(dev);
+		gpio_sysfs_free_irq(data);
 
 	if (!flags)
 		return size;
 
-	status = gpio_sysfs_request_irq(dev, flags);
+	status = gpio_sysfs_request_irq(data, flags);
 	if (status)
 		return status;
 
@@ -294,9 +292,8 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_set_active_low(struct device *dev, int value)
+static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	unsigned int flags = data->irq_flags;
 	struct gpio_desc *desc = data->desc;
 	int status = 0;
@@ -309,8 +306,8 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
 	    flags == GPIO_IRQF_TRIGGER_RISING) {
-		gpio_sysfs_free_irq(dev);
-		status = gpio_sysfs_request_irq(dev, flags);
+		gpio_sysfs_free_irq(data);
+		status = gpio_sysfs_request_irq(data, flags);
 	}
 
 	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
@@ -345,7 +342,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	guard(mutex)(&data->mutex);
 
-	return gpio_sysfs_set_active_low(dev, value) ?: size;
+	return gpio_sysfs_set_active_low(data, value) ?: size;
 }
 static DEVICE_ATTR_RW(active_low);
 
@@ -814,7 +811,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 * edge_store.
 		 */
 		if (data->irq_flags)
-			gpio_sysfs_free_irq(dev);
+			gpio_sysfs_free_irq(data);
 	}
 
 	put_device(dev);

-- 
2.48.1


