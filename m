Return-Path: <linux-gpio+bounces-21235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF95AD3B55
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 743CC17B736
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8500B22B8C1;
	Tue, 10 Jun 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vYk1+APO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3BE221281
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566317; cv=none; b=ZzMTdjX9CO08VDTVR3gedoNTH9EZdG5Wkzw9cy+49dZeZTfjEi1WbfNsIhOTgOQW6sdFRb9ejs+BKPMnxyLUVx4Q9Db8OuasQjHZ5tl+OV1UW0l5Y8R/BJi88PBwLm63FXP1qNaUtQIdzM7i1FDYRv2a1BiIvAIH/ydy+FFPMsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566317; c=relaxed/simple;
	bh=SuhcWnQjnt1V0zaDkIpP3r+TFOAIWMDQ1nvmYS1xN+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksrYMNvQBohzQRGxAmhd9hKYOSpxYR7Q+joIWS8ioBsnv9YORrKZlKZ3buG9cOfBa8llyYR9EBGy4Bnuw+IXIpPa1c/wXm7pOYmKBI29+BGNeVEEHuZD6mbcAv7K3WtJLGyKfdmMW7Hx7nUN0n0fNa131kSD0QlUvjQ5n9N32UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vYk1+APO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so67518335e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566314; x=1750171114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Shn2eyZ5fd8Sf9FUXjLdmt+2r+pNCPfrOT0YWQfJc1Y=;
        b=vYk1+APOhL/JkXmtx77pRYXlmiB/wffHut3LT4UdqcajXcVePVUEdQnZTj3topAJZc
         gPK9XczQt/fpoBiLjPgF06E+fh7ZTRyovaViFoDU/jBEqqFGVRNLYTKDVanxa4KMcC9i
         Qli59hF3tEc5ueM3XewLe09CJijW9dkJhNvjaoDmJURV7ijth5CwwGmqLEnX8Jjlg8m3
         jOdd2b8wou4G3dPFQHy5Rm5/lDJrmJIs6QdwirVy0WAjz/Ek0rZAS3gc1nqnTihA92qZ
         7tQK3Lv4wrQcKW3FTPjRjJDqpwAMnP40j0obKFU+pgdMGixfTMPIichW27pYoPA0LjNp
         cnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566314; x=1750171114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Shn2eyZ5fd8Sf9FUXjLdmt+2r+pNCPfrOT0YWQfJc1Y=;
        b=orgjWK3+SMXXblQm3OAZvJ36fdHXEM1vmCUv9aBOq4V9Bql5JL5DBlJqKYAqNY9pca
         81RcJNhokUTtvrMaG26LGWBrH3Lidm0GbbrIg9Hy2ihK67D9h+s2p+vcFwQ7MUb0a5e8
         i+3R0SOGlHIQnONz5R4+xzrqilcbOdSPtUBoGkigfrXsa/qRJ6xgEK1aQHKdWskuJp4h
         LqK9whGxDfqx3TfglEhB0nIEubLiC6PsMSOLc/jNDQM53jmCzwNhGsYF+MSJFa0J5day
         vC0zA7nkoCB22LvFEMc0iQp5pQ3alFYMTnYbLQFemD9vkqpwTTn/QKAFtes3Q25kk+fU
         3UMA==
X-Gm-Message-State: AOJu0YwkRd0c7mvEUwGBNbdqlbWtNTavVOoh7BKvXGaf1lGyPPK1v0Zp
	MfaEgFYZxlGg3E8C1xLc/Tr6Rx+HSwe04h9D7TGUTfns5d+VqFI26rjkq6n4k4Z8pkI=
X-Gm-Gg: ASbGncuILJEMl+tfnUtszrmqWSBIzr6E67EB4am41vfMN2JedX0IhW6Il5tORX89Y1s
	Dt3hUgwFRcI6gVzsfXCOlLrPkhdEFTMC0Y5S7VqpKpJlXtOJvyjDQak8uMzPRL9wQsHk05N4LTO
	RW31l35LaPUuTkI6zDuMJ9A1rfPPxJRBu7NJ7Iw2twGe5B+wzGhG7YwCDIAVurpGb5QKizdVFz+
	bM43adbrw5qmFR9ip5H/NsrnC7dZl9LkIe50zRPADAHoCgA9VMP02UR1xGVyIhZKNW83gy0uSkZ
	VHhNA/34DYjv82g0pEBAAptcmAyEgZivn7GkAFzGQDAJbt3e0HXVghuDud3MHEc=
X-Google-Smtp-Source: AGHT+IFQxMr+KpfJbCsHx4fMzLU8Ewr+onA/3HvlnZLPIEF4Pbfk+QHCSRE8DIYbR5+FKFsmMZn9+Q==
X-Received: by 2002:a05:600c:4e88:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-45201364b20mr151409425e9.5.1749566313774;
        Tue, 10 Jun 2025 07:38:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:21 +0200
Subject: [PATCH RFC/RFT 06/15] gpio: sysfs: remove the mockdev pointer from
 struct gpio_device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-6-a8c7aa4478b1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6366;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=je470wIsOKjy+Wgh3vMCa95VKbv92LlyIwF4JpS1fa8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENgMzYrTrIqo79b7bugZj00GqsKV3l++8Gvu
 Dgz89ZkFJeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYAAKCRARpy6gFHHX
 ciedD/427LXr8cn0G7iqWrhFjM8Ewz+h+HQY5DVXsTqUfMe4R46IvTfJHW/JwJGT6DxflIice4r
 bRD1dMj6CyTLuYnc4aOCTw2mIJd006otLq+fV1z2uqwdf5MKE+O7VeHHuNyJtBejL0os/altIEh
 Wz5Iio0yp0VZ8yWTgGVs+15budcVQ8I8qdLzo53o7L9j6PeRNWzIPDC+CfyUdY2QUgFup786G2D
 Mr1q91sRH8VzkUyXAVawG07RTmOD7th1kTH0yEWodWQFpBuQrJG92YKcc+q0n363lzmhS39bXno
 iR8vdq674gUvGGQf/JFtey7iLeh/AQ1eBuj5HB+WCUFEXNS9ESmXCoRNe4Z2zG7K1RBR7hHa7W4
 DrjBqvqNvFRQJPjp1iNUvjpNwZqv2zmxMnY4qrcNdo+iHKpKphNgh+LRkTJj1ATPAEk902rwSn7
 QC7WJir6buQtT/oUgUzYUFb6IYy7HbuGV7k3n5420bm4rFHjKK66p8rTkB3PeGhW31bMci69GsK
 K/Vr0YZMuqbSkUnl1scq/4ux9xeBEDEKp+CXAfhwykfuoeMcGd2zCVYsGQuZD6y6xTIOCE1yo/L
 EXXrBb05K8pdId18H227bdT1Lok+4seuGzXHAbReOKDLbOlVqizlCRENqPxyNRwig0paxtF+RPV
 hOQJkk3e46ar/iA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The usage of the mockdev pointer in struct gpio_device is limited to the
GPIO sysfs code. There's no reason to keep it in this top-level
structure. Create a separate structure containing the reference to the
GPIO device and the dummy class device that will be passed to
device_create_with_groups(). The !gdev->mockdev checks can be removed as
long as we make sure that all operations on the GPIO class are protected
with the sysfs lock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 81 +++++++++++++++++++++++++++++---------------
 drivers/gpio/gpiolib.h       |  3 --
 2 files changed, 53 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index f23b4efea5905a9eab51ed9e50b5159135a8e26c..956411fc467a26a9827c616d8dc067c70f9244bf 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -43,6 +43,11 @@ struct gpiod_data {
 	bool direction_can_change;
 };
 
+struct gpiodev_data {
+	struct gpio_device *gdev;
+	struct device *cdev_base; /* Class device by GPIO base */
+};
+
 /*
  * Lock to serialise gpiod export and unexport, and prevent re-export of
  * gpiod whose chip is being unregistered.
@@ -399,27 +404,27 @@ static const struct attribute_group *gpio_groups[] = {
 static ssize_t base_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	const struct gpio_device *gdev = dev_get_drvdata(dev);
+	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%u\n", gdev->base);
+	return sysfs_emit(buf, "%u\n", data->gdev->base);
 }
 static DEVICE_ATTR_RO(base);
 
 static ssize_t label_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
-	const struct gpio_device *gdev = dev_get_drvdata(dev);
+	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%s\n", gdev->label);
+	return sysfs_emit(buf, "%s\n", data->gdev->label);
 }
 static DEVICE_ATTR_RO(label);
 
 static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
-	const struct gpio_device *gdev = dev_get_drvdata(dev);
+	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%u\n", gdev->ngpio);
+	return sysfs_emit(buf, "%u\n", data->gdev->ngpio);
 }
 static DEVICE_ATTR_RO(ngpio);
 
@@ -545,6 +550,26 @@ static const struct class gpio_class = {
 	.class_groups =	gpio_class_groups,
 };
 
+static int match_gdev(struct device *dev, const void *desc)
+{
+	struct gpiodev_data *data = dev_get_drvdata(dev);
+	const struct gpio_device *gdev = desc;
+
+	return data && data->gdev == gdev;
+}
+
+static struct gpiodev_data *
+gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
+{
+	struct device *cdev __free(put_device) = class_find_device(&gpio_class,
+								   NULL, gdev,
+								   match_gdev);
+	if (!cdev)
+		return NULL;
+
+	return dev_get_drvdata(cdev);
+};
+
 /**
  * gpiod_export - export a GPIO through sysfs
  * @desc: GPIO to make available, already requested
@@ -590,12 +615,6 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	guard(mutex)(&sysfs_lock);
 
-	/* check if chip is being removed */
-	if (!gdev->mockdev) {
-		status = -ENODEV;
-		goto err_clear_bit;
-	}
-
 	if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
 		gpiod_dbg(desc, "%s: unavailable (not requested)\n", __func__);
 		status = -EPERM;
@@ -719,9 +738,9 @@ EXPORT_SYMBOL_GPL(gpiod_unexport);
 
 int gpiochip_sysfs_register(struct gpio_device *gdev)
 {
+	struct gpiodev_data *data;
 	struct gpio_chip *chip;
 	struct device *parent;
-	struct device *dev;
 
 	/*
 	 * Many systems add gpio chips for SOC support very early,
@@ -747,32 +766,41 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	else
 		parent = &gdev->dev;
 
-	/* use chip->base for the ID; it's already known to be unique */
-	dev = device_create_with_groups(&gpio_class, parent, MKDEV(0, 0), gdev,
-					gpiochip_groups, GPIOCHIP_NAME "%d",
-					chip->base);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
+	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->gdev = gdev;
 
 	guard(mutex)(&sysfs_lock);
-	gdev->mockdev = dev;
+
+	/* use chip->base for the ID; it's already known to be unique */
+	data->cdev_base = device_create_with_groups(&gpio_class, parent,
+						    MKDEV(0, 0), data,
+						    gpiochip_groups,
+						    GPIOCHIP_NAME "%d",
+						    chip->base);
+	if (IS_ERR(data->cdev_base)) {
+		kfree(data);
+		return PTR_ERR(data->cdev_base);
+	}
 
 	return 0;
 }
 
 void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 {
+	struct gpiodev_data *data;
 	struct gpio_desc *desc;
 	struct gpio_chip *chip;
 
 	scoped_guard(mutex, &sysfs_lock) {
-		if (!gdev->mockdev)
+		data = gdev_get_data(gdev);
+		if (!data)
 			return;
 
-		device_unregister(gdev->mockdev);
-
-		/* prevent further gpiod exports */
-		gdev->mockdev = NULL;
+		device_unregister(data->cdev_base);
+		kfree(data);
 	}
 
 	guard(srcu)(&gdev->srcu);
@@ -798,9 +826,6 @@ static int gpiofind_sysfs_register(struct gpio_chip *gc, const void *data)
 	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
-	if (gdev->mockdev)
-		return 0;
-
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
 		chip_err(gc, "failed to register the sysfs entry: %d\n", ret);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 58f64056de77b05e8cbcb2395a55da793b1a52fa..9b74738a9ca5b1a4826c8d56d871f8a7cf6ea1e7 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -27,8 +27,6 @@
  * @dev: the GPIO device struct
  * @chrdev: character device for the GPIO device
  * @id: numerical ID number for the GPIO chip
- * @mockdev: class device used by the deprecated sysfs interface (may be
- * NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
@@ -65,7 +63,6 @@ struct gpio_device {
 	struct device		dev;
 	struct cdev		chrdev;
 	int			id;
-	struct device		*mockdev;
 	struct module		*owner;
 	struct gpio_chip __rcu	*chip;
 	struct gpio_desc	*descs;

-- 
2.48.1


