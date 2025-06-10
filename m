Return-Path: <linux-gpio+bounces-21237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A1EAD3B5A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F918189FDB7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941632309A3;
	Tue, 10 Jun 2025 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LAaRMPM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3C22B8AB
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566319; cv=none; b=KiOUc517zSJIS8j+ydcVNF3+Mq50CDkhavuHAsaUAhpThR8SurepHBHsYl/ET7F3gpc/z/a1OBxqC/M/aQ9T+howJnRdGiDsHrLST1VbItaE+pDjq9xIEz53frWORoCqg5ylSKrmeDkVZGT0iSJPbtk5nr8Otcm88Ub8vDPm2qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566319; c=relaxed/simple;
	bh=d+Bxl0NSiM7UA5F5Yp7jtiVxMzixcYH43BuoVTlUtbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfKTtP6ZbIFkq/Bp+fr0Git1mTWzC1y+vwzrvq6YBuzj6uPoZBHKkkEb0D8R0THCl34YK0SFASGSgOPBj4BOCQHCuR3+0C9f9codfBAmodWEMHuc+ioZMGwaYupzzSO/jabTrsDJoO1azvpH6f1NVCEEzxm7rGr4sjQB6TbjyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LAaRMPM/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d7b50815so48176165e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566316; x=1750171116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7rYTyytP41wrzRonx/qeQvGqjmG0GLYCtZlfrWBrxo=;
        b=LAaRMPM/J71m7lqGbl+BGSmqrCU672zGAtGqQhNbukLXkcnpex/CEEy3nWzTbHHnEN
         Sn5+0Flumcojd/WLsQiON2qwAV7vf6HQmlOUx3ApuK5TylvrDdfpvRK8lg4/Ek4ZjsOY
         B/uDVWf/RmnRyUqu4FzA3g64hQKRC5FIT96RlSm6yOYyhKBeZzMNsErpJ1nQR7Ukw0FK
         3/LXKRhRw1sfYZO48re6zE+2qBR/YeDEel0HNp3Gr9OfryhKHQwcEUhSIjb/uEcReHYF
         G1VkM7r1i0m66VfZYSpcX2+Cy+3/Ia56/vZdUj0vmYHeOMvJq1YJ3+wXeGa52z0Hdzw9
         ojsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566316; x=1750171116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7rYTyytP41wrzRonx/qeQvGqjmG0GLYCtZlfrWBrxo=;
        b=qL7Hq761gRXiBCythq29kG41MKOYVumcYT8WrNjnX8mg2Qhs42vVGenn+K2RUO4GF4
         w+xh6lbSV8Q56kLNnXGAWcDunPtGiikOYBP6lBaazaUDx17eqVSlEK0AEwfsF7pZY/3l
         Gyk6KyqoKzgGEWgXTlKIEg4DbbQk239w3kwxMflZxQb+ZkTAJRzlrk0tAM2X1R+Zop8V
         t7sSw0dRxEy543TN83xxHGrxLMxmfuodtDgGz7RK6TitORG7siqXL4gfxPHCta38niIL
         mnWCOwsHrRYloTbAX2zFNFrKEogErkkmwdKWjtARtY5erYlbXeL46YyoJaVJmIEYU8jA
         ZwYA==
X-Gm-Message-State: AOJu0Yyd220U7Zdf//t3ezTA1ZCp5XpdDfTC1B099XGgJGFDUbnpt2Jc
	lYEW8R35j6gcG5T5iZu439BvpasPBFpJOvu42y9nNCs57KGSyDtxfnGF2J3NHFkBk/aAFiqN8+0
	WQ+Ys
X-Gm-Gg: ASbGncvuj3G2h8GiyCX/sqBr2Vz46Noee140Ugfjj2vSmcNTbJePDf7cCIALjZh4Qvl
	imxP17dmc3Ec2tJjf5xvuz0RQFBXKmb+Gr8EYC+WAmHVnC/MNYXWAJEbaEpsGGfahRMh+frJV4x
	8W5aZZzelhBBtKznM13EviVb983OVuyHKwrj3+cMpsJo6lnqvUcLfWV184UPuWI6/TQrarLniSD
	pbXJz14+SmC3qNUc7SsMoNlIYy07WJd02AxwUVWRVwHne9otpwEjdNKewizRgcrCorU/YevUq+O
	NQI5u5S5Kwx4xdDLbVleN0ZpQr47NKr7/frtnJvZw1Q0xP19aQD+
X-Google-Smtp-Source: AGHT+IFqsL6AQNgjHvVYwct1knCOR3BWEgK6/JlDG1gE359gCrycIIxTwv7hXlhov+kj+IZkQ+EiqQ==
X-Received: by 2002:a05:600c:5288:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-452013916bbmr165982055e9.13.1749566315808;
        Tue, 10 Jun 2025 07:38:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:23 +0200
Subject: [PATCH RFC/RFT 08/15] gpio: sysfs: only get the dirent reference
 for the value attr once
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-8-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3042;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TO3LbK7dPeG+FDRNFnBsVRIrM0Iiro3kG2oek3lX/7Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENhw51P2TaMhnBGwcf0wBuqFshm7H07M2gUq
 wktCql8YLGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYQAKCRARpy6gFHHX
 cjlED/9HPFz5JqtJcL2ZD/+Ti6nEEqSLtmF4iWdyX4stOkurGwfrGeXibADRzBfPk/eO/xwznhL
 vmD2PMNmkristKf1FXxV9YtsbCsJUcwXePaiqqkIh/o63een8sSWcLPHCuWLUHR0SwSoG5IvMJA
 wckCkUnyKRoA3DTx/ARkJlgOqf0sPgJuwB2eq7mIcyaFS6NZdhjmt+fXuVuoNG6SvEfdzRhAVoG
 DM5rklTx0t+Ifm7xDvs+m/xspdpgLDJPJpPXenX5VMs5HbhGXbdqiN5roDspIsVRyU9DIDhhAJ5
 KJSz0X/YR1mFBejmx13dvJs74B3vSdYWYVGD154lGMJz0bLrjyjqMq9G0zGXnfL+0zKLWSr8Jcc
 VuHMBMLKO0rpoYzSbMKU6fgIfbf7TVfWkHLlVr0L2tADV1QNCHtAU5hcrFAiZLtILngqyza3n19
 IfdVZaema8GnDkJ9z0StGNeDFRTa4tfbHrO7mcJNLRSFDqppnqhpNORfuLQqNK0Rh6IOR3brliG
 khqPPFODOU/G2GWl2Ymjts3DyF4OmZntvCSmLin4UMwaE2/Mv4KKpVOyeO4MuYo223L/VeSdwuU
 vnRr80vwUgfmuyx7VdJ4mFB3N78nodwdySG/cXESClA9zm+ncAIt1lLzKKGqso6wTImX25aEIK8
 flleW2TY850E6lQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason to retrieve the reference to the sysfs dirent every
time we request an interrupt, we can as well only do it once when
exporting the GPIO.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index a3403b963d6488aad24e47e9e28e0439676de704..642635c9f84bbd869727755e72781fae31a9cca3 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -36,7 +36,7 @@ struct gpiod_data {
 	struct gpio_desc *desc;
 
 	struct mutex mutex;
-	struct kernfs_node *value_kn;
+	struct kernfs_node *value_class_node;
 	int irq;
 	unsigned char irq_flags;
 
@@ -156,7 +156,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
 	struct gpiod_data *data = priv;
 
-	sysfs_notify_dirent(data->value_kn);
+	sysfs_notify_dirent(data->value_class_node);
 
 	return IRQ_HANDLED;
 }
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
 
+	data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!data->value_class_node) {
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
+		sysfs_put(data->value_class_node);
 		device_unregister(dev);
 
 		/*

-- 
2.48.1


