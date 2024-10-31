Return-Path: <linux-gpio+bounces-12403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FFB9B83EE
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 21:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B10F02826B4
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AEB1CC89A;
	Thu, 31 Oct 2024 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A1vdRIA/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5041C7B62
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404927; cv=none; b=ZgVcMbxAF8f6Rg2YbqWcQ/xz+GmBWg3ynpmRsaLzE62Fi7buChYoHUYlkkC26KokHr81tHvj7ds0QpiCK8FT77K/CENHBxW46JSp/vA7JG0sXwHyg+T6UxE85Jc1bBZGrTJk4S1tDf3EJlUy62uiFqlbajaYDyWokEZW8dYxolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404927; c=relaxed/simple;
	bh=lxfcHFlINBm4B273RJGWT9N7EfQtgO45pd+YAFioyAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chD+gVKStXQB2m1WncjdOFLPIoTZ0yG3B8cB1JqBQdFI/160wr+bfKwHpqUKdAEcu8uu6/h7j1ZQ70SnwyrEkiv72V7PgKUQUEh805HLz+v0z03uV/uhgT3G19ynLz5g0SRTHKFfa2xi3Ct+koN7FKOuvvjrfG3Ly/U1VRU9oQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A1vdRIA/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so939902f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730404923; x=1731009723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzrxfr7wPhfTvrfVJLIuoZ9JjJdY5AB7ATojPjTFoR4=;
        b=A1vdRIA/j6CFHA585KI3akgUqOsi94+PdSdv9J0zO10hiDR2DX0XI4dljLleAgg9Nr
         X4PGJwG+YZk2aht6+NFEjLFE0poCcIkv2ApIejkVUUwP8P8cp1xyK5viAF7OUHIP0LBm
         JGayKPkwKHeyy666jM9WwzAOOXO3p7xK/dXk8f/MMTTqV9g43H9tJjnc+TRF9wd2l3+b
         IuVDgmtM960x98VBn45t3Obg7eFZ0tRACBoYvS1ePGDZvhc3ZkwPCxF8uKbro1EZC7G3
         aQPawEFtEqPHUBksukHt5KpbN2QwJHgC6Z8TCHlF5dVduZADBToPmTq5RD9sbrzIt6WM
         u1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404923; x=1731009723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzrxfr7wPhfTvrfVJLIuoZ9JjJdY5AB7ATojPjTFoR4=;
        b=PJVqtWtTpHYi2yyfdAC0oVFnmp7tOa3Uuymk8Z9LM2H+VkLz7fbBmWARXOr8V0n76B
         pwk97RqN4EBVlWCgKmWEYZ3qP2R3h+Rhnbj9oRQ95gBRsROsv/TfsJqYmJkYrl+J5lH4
         EVfp4UYmOwu0pvSWPmNC1fMWX6ECgv77Ofp61GIeg3oEIvtvNOjxuV7idLdftifVCxMd
         ejlMJFP57aPgpVALSsw5Mf3JQuZ5g+PLTr6feqQEtx7z52H6NnLwp3YKDNWQXvWlWhll
         6vJhT1m9C2P0ymv/Ouo13V50LxjsDDLo+9i2V9l9cWVk0zA1IcpHo6wzYoFdW+XBJHTy
         Q7QQ==
X-Gm-Message-State: AOJu0YyWpDXtF6Qf++LHgalv7B5uKIlcZaQpAq5+2iU7ah0cg2Eg2Ncg
	TNUxzQMH5JOcP5F5tSFlBfKpWUThzrBBEeDIjXA3Z1Tv6MBBzsn2lAcTVANy2bY=
X-Google-Smtp-Source: AGHT+IGgFm4zjZjWhXC7650nVqWNS1PFsWNFmkOgJQXkZXvXD+FgAP7Ug+L614sjMLXKokJuGBunpw==
X-Received: by 2002:a5d:5988:0:b0:37d:30e7:3865 with SMTP id ffacd0b85a97d-381be7d63e0mr3768793f8f.34.1730404923552;
        Thu, 31 Oct 2024 13:02:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f39e:5519:d578:740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm3003993f8f.115.2024.10.31.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:02:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 21:01:52 +0100
Subject: [PATCH v4 2/5] gpio: sysfs: use cleanup guards for the sysfs_lock
 mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-gpio-notify-sysfs-v4-2-142021c2195c@linaro.org>
References: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
In-Reply-To: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2976;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hQbFwd1QT9qA/6G04ep+yw6mU1491E7zvhbWfpDUDoM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnI+I2RfXIbXJmBgVj3RdDRuu1VHrPbMrDmhip1
 i4/Nv5KCieJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZyPiNgAKCRARpy6gFHHX
 cuR0EADJxy3vXb63V7EH/zHNUnjvJN4b/Jnp/CIAd6WwUskF72NdGGNHTRQzMXEMvcgewrEk2hR
 14WOrVchK+ryfS85FkruV8qf94ButgWv0rjh7tf8DvkI+kqQD69+tC70yTCZ4pHOte0Z5zEc2JB
 PNXUjSFL9RhoeBXWPE4ZsprN5UmtRx9XrNjCCKolq1PrDaGeBnZYrF9DYcGf00hrpTwufg1CbRH
 mSJ5PnXmCOzGbVVP5J/4dZ4M8RgXYDHr67ZRUAkwRWvginLBwNA5ZZCDKl+LRWbXeSxdhO9uK4C
 F3Vgeu2H1LBBD96tIzyGVu+rwFlnl+rYBk1Z4xIph6tyfa5vgFfaoMaxBLfKcrZVKj+OHdOZpvl
 /znYWNXA26/7FinsE5rwGOfKlgJ4NFYrtzsds98qre84LJUw8ZDKwDdaayU7jPP+9siATW0hu4Q
 jPBJuanaliUmNcxiJNeBvpxqHn2VEs3z+44kvOx/qYZoHg/os6TWE7Un1hKvQorNldyIqZqhHpK
 0uW6Q8yuREGLdr4ez609UwHl8Z9XY2BK6oafvDoN1aay7an4wYP1ex8WBvHoy9zge+nlppY8E9G
 ZA/J09WyVgumZ5XgKYXsyczyHTyAbOePwFViM0D0iEHNWmRQieoyiOAV843wD3yLDfyVnN5cvQZ
 fK96CAgt4iPXWDQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Shrink the code and remove some goto labels by using guards around the
sysfs_lock mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 55 ++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index a0926a1061ae..e6c1e26f302d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -575,24 +575,24 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	gdev = desc->gdev;
 
-	mutex_lock(&sysfs_lock);
+	guard(mutex)(&sysfs_lock);
 
 	/* check if chip is being removed */
 	if (!gdev->mockdev) {
 		status = -ENODEV;
-		goto err_unlock;
+		goto err_clear_bit;
 	}
 
 	if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
 		gpiod_dbg(desc, "%s: unavailable (not requested)\n", __func__);
 		status = -EPERM;
-		goto err_unlock;
+		goto err_clear_bit;
 	}
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data) {
 		status = -ENOMEM;
-		goto err_unlock;
+		goto err_clear_bit;
 	}
 
 	data->desc = desc;
@@ -610,13 +610,11 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto err_free_data;
 	}
 
-	mutex_unlock(&sysfs_lock);
 	return 0;
 
 err_free_data:
 	kfree(data);
-err_unlock:
-	mutex_unlock(&sysfs_lock);
+err_clear_bit:
 	clear_bit(FLAG_EXPORT, &desc->flags);
 	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	return status;
@@ -680,36 +678,28 @@ void gpiod_unexport(struct gpio_desc *desc)
 		return;
 	}
 
-	mutex_lock(&sysfs_lock);
+	scoped_guard(mutex, &sysfs_lock) {
+		if (!test_bit(FLAG_EXPORT, &desc->flags))
+			return;
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		goto err_unlock;
+		dev = class_find_device(&gpio_class, NULL, desc, match_export);
+		if (!dev)
+			return;
 
-	dev = class_find_device(&gpio_class, NULL, desc, match_export);
-	if (!dev)
-		goto err_unlock;
+		data = dev_get_drvdata(dev);
+		clear_bit(FLAG_EXPORT, &desc->flags);
+		device_unregister(dev);
 
-	data = dev_get_drvdata(dev);
-
-	clear_bit(FLAG_EXPORT, &desc->flags);
-
-	device_unregister(dev);
-
-	/*
-	 * Release irq after deregistration to prevent race with edge_store.
-	 */
-	if (data->irq_flags)
-		gpio_sysfs_free_irq(dev);
-
-	mutex_unlock(&sysfs_lock);
+		/*
+		 * Release irq after deregistration to prevent race with
+		 * edge_store.
+		 */
+		if (data->irq_flags)
+			gpio_sysfs_free_irq(dev);
+	}
 
 	put_device(dev);
 	kfree(data);
-
-	return;
-
-err_unlock:
-	mutex_unlock(&sysfs_lock);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
@@ -750,9 +740,8 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-	mutex_lock(&sysfs_lock);
+	guard(mutex)(&sysfs_lock);
 	gdev->mockdev = dev;
-	mutex_unlock(&sysfs_lock);
 
 	return 0;
 }

-- 
2.45.2


