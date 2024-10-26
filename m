Return-Path: <linux-gpio+bounces-12139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DA9B185B
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 14:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26E51B21EE5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 12:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79BE1D47DC;
	Sat, 26 Oct 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YGyXXAUM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779641D79A7
	for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729947525; cv=none; b=jVGzkCXDQcsEeKp1i7FDuIYE9RMQduX7E034N3JgL0zOkLLXe/sahNcin0dN5WEfOpmBEGFQDn71uzcJvxj//jSYGeWVY4nf7+mVZhVMvLBOGD2REbdm3AsOyqP4ilIycxlqzEB3pxXwCRkwApTh+URH/7SWgLI6euMA8F7HLnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729947525; c=relaxed/simple;
	bh=bW8qrFgUol+s7+3gDjhkK0B2kD7uN6DwQnNIFUlT4zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIqePcXv1W68C7RTSedSa+zhkM3/6zP6cNx/ZcgCBC/M/76QnopFv3+JKa3r7AB/pwpp5cB+OU32drQQjUnQycrsxfI3ijva6YaBwaH6ZW/FYUqhEAzApyYS8FGajlX6Bw/B4BYQ/9k14APFNl9VmcUc4wCA9YTUD/moePycAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YGyXXAUM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so27532865e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729947522; x=1730552322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwfuUsrVXcG/Q5hqvr1hocl/oy9tcRc7ZfbMloqGud4=;
        b=YGyXXAUMA703mUHu/E021rXEyQho5F06mWqUGYkiNu+F7B3KUzh5jXqyG3m5Kdbbib
         UzmNmdV/IUcs17DuM9aejYtBrHzbo5hbWZH8mwtLA8ulgSs6tXc+FXgJfO+I3Fzd6JBm
         lInzV33wMgLMUFcmFOtmeln0Iq3u5cYzQ8N9xcIrGbusV8sbmBEtzXOKclAZYCv4K1es
         34IkSaG2RY1aWKHmEyZ7hlPx4gXAKcoY58CwQfuLA40Tt1vnqqBShcBJAp4XfDUopBjE
         dkidu5tfCsb+Jqtrahq/bB42cvask8SWlNFSHHEZqlnddYXh/lBaZQJbRlCJxR0SQC3Z
         K3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729947522; x=1730552322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwfuUsrVXcG/Q5hqvr1hocl/oy9tcRc7ZfbMloqGud4=;
        b=A4cowumHovca6Wd8X3d/IdSnW/WcdskbEZLnpxKoW2qlPEqRfph7rCfalS1TmSMtiD
         U6+gLArJwgPbzhVNjy2gP6AE+9BKJims0Av9kcipCvKQV4BhSTv48l/T/vk3RrjsoYB1
         xq9NzlIj+YoGdJPwnCd1eiza/OmVLPg87sUU/HkFumLp5lJUeEzHggn0AtsuqCt+tj8X
         FlzP9Go44VAr1oCG4AJSUVEvGcaDu5bAxmTkMJJa1SFpObWyu+qwlqVjv33JYj3e36nn
         4Sn0KAlUIvVypZ3R3zIW4lzKOkayznHzNmZEa66Z2+bPEc5ZT3NVzh67tZLhamG+EZXP
         2T1g==
X-Gm-Message-State: AOJu0YzEr5HJEc+e1rOWzxftLRj3AK8tLzkq+p6KWNnVquP0nDvvycgd
	dMybqt2M/+sXv2bpn8o4ZUUb2OCQhmWWrdnMtaRMlDjWRxdwhaAFeAOxa7FlezI=
X-Google-Smtp-Source: AGHT+IFHJsUbQkytNu9WLFPtWbu99lnOz9Ni3qbp2fcQ3uKkMAhzQvRn06v/+K/yJ6xRL1NFmvvZaQ==
X-Received: by 2002:a05:600c:4455:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-4319ac9acadmr18410465e9.12.1729947521839;
        Sat, 26 Oct 2024 05:58:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:617b:5770:df34:27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a3edasm47498535e9.22.2024.10.26.05.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 05:58:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 26 Oct 2024 14:58:33 +0200
Subject: [PATCH v3 5/5] gpio: sysfs: emit chardev line-state events on edge
 store
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-gpio-notify-sysfs-v3-5-ad8f127d12f5@linaro.org>
References: <20241026-gpio-notify-sysfs-v3-0-ad8f127d12f5@linaro.org>
In-Reply-To: <20241026-gpio-notify-sysfs-v3-0-ad8f127d12f5@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=synZM9gyk9YMODwzYkYQGZuMR4c2wQyGyi5f0Leu46g=;
 b=kA0DAAoBEacuoBRx13IByyZiAGcc53uifGVDUqayr9Nu63c6UYNA6kWe8RXouGvpVqdqTGCW7
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJnHOd7AAoJEBGnLqAUcddyVc4P/2Bq
 5SHZPBZ3mqTbQcefSCqIjEqNbtA1rb80M3iIJMSx3OcVz+KYqSNHOoeHhobNHW081B6GT24aVtJ
 tGSdpyB0oDRVP0b11sbyD7AqZpzmtn5TFZ/iOhFgmSRkCmRxfBffX6Akm1verIeaoBvFIsck1sU
 BBQnuAjhRfp9kMHrpqVPEInXTmTVZ3cW5L7TJad2su6i/+nVFQ6qaZjiscyrANvuFSgawCNrbCs
 ICg9KDXuNBXpEazuxZAwOKWuylRREoM/wKuQaJhqOsjiOcVCPStEbHOeZMWskecNd7hCRGN5C1E
 YTpQITO0aIa1faTPkZhxDy2w+zNsgE+j12TfvlpHJfXP9fX/fEcOm+Eazqv4ji+tbMUtucDVpL4
 mPTQzvg9CWvZL//R3LkJSV09s+8btdJ4XvPAQsUL/P0S74t6QoJIq4o9CWyFSyiuTn5GjQGNP4G
 KbFx6pZSI+/rGDMma0NXVHGEeXOZhWASvl3VTvxy/Jc7Ero7C3o+g/Yo5aUlmW5d3Ex87bcx9VM
 dOIgfrePmZYx1bWy4JIiKDxDRdP7U0gaH5wYEWRJTQqF0Oo7b0PthKXfStFeC7WQ8C3mbgHVt15
 O0gwer69CGSwVW/0e/1LDyEz9/4gpLDo6pTFgw9L1SLrJWA8uoMmqqSE4MmClOa83skxj1m0GA5
 NYncx
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to emit line-state events on edge changes in sysfs, update the
EDGE flags in the descriptor in gpio_sysfs_request_irq() and emit the
event on a successful store.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c0b7f42a0860..a7aa9fbb226e 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -179,12 +179,16 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 		return -ENODEV;
 
 	irq_flags = IRQF_SHARED;
-	if (flags & GPIO_IRQF_TRIGGER_FALLING)
+	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
-	if (flags & GPIO_IRQF_TRIGGER_RISING)
+		set_bit(FLAG_EDGE_FALLING, &desc->flags);
+	}
+	if (flags & GPIO_IRQF_TRIGGER_RISING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+		set_bit(FLAG_EDGE_RISING, &desc->flags);
+	}
 
 	/*
 	 * FIXME: This should be done in the irq_request_resources callback
@@ -210,6 +214,8 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 err_unlock:
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 err_put_kn:
+	clear_bit(FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 	sysfs_put(data->value_kn);
 
 	return ret;
@@ -231,6 +237,8 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	clear_bit(FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 	sysfs_put(data->value_kn);
 }
 
@@ -282,6 +290,8 @@ static ssize_t edge_store(struct device *dev,
 	if (status)
 		return status;
 
+	gpiod_line_state_notify(data->desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
 	return size;
 }
 static DEVICE_ATTR_RW(edge);

-- 
2.45.2


