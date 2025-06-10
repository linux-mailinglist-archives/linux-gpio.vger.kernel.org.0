Return-Path: <linux-gpio+bounces-21239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB06AD3B5D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E39F7AAC22
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBEE23183E;
	Tue, 10 Jun 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qBqAbxDd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBA230997
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566321; cv=none; b=ulWWb44pth5B+k2AeyQcA8di2vHVt98yDEqhBYJEOIYrwNcvFVtXwICYQlgVxctVx+cEQ+325vyEGsBJuFb/LzefSBIzeeYXzA/rdwzo8194y0Lgw2l4N1Z6r5ahXYYWcdz4tn/ZhxqRI9720syypPutRrJeC/LIBs0CAumSVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566321; c=relaxed/simple;
	bh=b8EHdhj3xnw5oclyrVliGAMrvB3IqzLhHzIVXS5RyUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZ0TROcAmtKyscqxQRQl/d8WuiQ0c3Au3TcuxU0f2vevVX3lpZW3dhp+giyZs7Dq0vqzm4LLw6keopD7qUo8UnYcD9AcWb8aizwgKAlq2/JaGIXDJiCzsfqXV8knRsoocu43x4qfI4sr6CUAdCMj5Mk5i1Ynfv2iZyF1/bTAIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qBqAbxDd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442ea341570so36527025e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566318; x=1750171118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoP5RvFV2ifyJeEVAaERNQ3+MFbOQYYVwQX6PDXiIlQ=;
        b=qBqAbxDdPFTy4olUPn4qNWjI68X10BQQIp4ve4+argyWR6M5sfpRDF05psxTOQ5roj
         Z9b4TnjtDvtjhttU0O5CBZPLyEptChtFYhkpOTY1i26rotIMuYR831imqA1iP6r/cRva
         EuhjfkQ3l+zebsQHsHEEjmjKXpiyGMYbtrl2KzXsFquTChByLcn7e/ue6x791yOvfUwK
         9ah7GT+onMT4gBQ5/X/8BAi9VRaDrrX65SOEpZBFMWBZTo/WpSI3+EoilkDI2CnNgxCn
         5PDKClUuZGc/Y20Tq/Rzv0zllpET6yNp1/FGm0eQ6a52OCokQTcwwQjlE7JruAEIfBwq
         vUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566318; x=1750171118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoP5RvFV2ifyJeEVAaERNQ3+MFbOQYYVwQX6PDXiIlQ=;
        b=s8FQn9Ka2h7t+8aW/imVkmmg0fdnaJngwVVfpoQuFl6RFgZnyBie2TQADz8rYNDKT1
         eRAmdra+SryiSzXu1L7C9saH4uZTOrjhu1quw6vK1JoxdsoEG9KL5bQ2J1sKkpSPQ+oG
         gZHU2r1fXvbx+3+sMdxlY1igSkfnGyanfXzorIsowUCBqijZIvEP037ndyB3GwunH2L8
         rXvNMtgyu0osA8aEjfM4ncpNin3oyqnCG/JM5kgDLt3a1kankBrP/h/PIFMcpTd46Rve
         3GIwt59WLloLsVD013r3y8LUQyq1GyiS56prhF+/shaLNzjy9abKbOZY9tBEA6CIMdvl
         5BTA==
X-Gm-Message-State: AOJu0YxagEe0LEIz390E20Ne1Op9nmeVwzvs4jW/CqzOdPr09ew+aPh9
	/H3TZ5oP8x7K6eDaLlHlSE87tecmz6Kk0jl5y4pDi7zuwKgN6DeCaraq8wLa9obp7Nc=
X-Gm-Gg: ASbGncsmOp98+PMuWNDTTgJDELccBtrNf6XwCV86WSA4IzHdfZzUPbl7htxIS18RzKj
	R3td7gGGSM6VPDlpMAbrpFjPik+4Ga3rWnpoI7m/5ufByFRaB9lQQ6o14qTvOEfjpsfnVZ+hNO4
	HPEaSme1D0DdAqoCxPlEJ2Qkaw+43BYC2/osJxNlcZapT5Rlu95ubTjJqMOt+vLR0x86qnXMtNM
	gTYjJeKoL0//Whxw0WRw8Gi4nnMOWGwYRLklZiu9hOH/UwY2tQ+2BHHckfJO0wdfHLv9OjbJ4iu
	/sDwNcdRh/Jg8qkSkFEp4uK2E//VHbAuzBjFi60UN8YOpRDO6+uJ7m0lomAeayY=
X-Google-Smtp-Source: AGHT+IFWC4RtUHSgUSrUNgrZ7GSj5JevOQ4eZ5K4U/rexE1ZJ45Jp6j+/ZmPH0+J19iLtIt0zcwpqg==
X-Received: by 2002:a05:600c:4fce:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-4530a95f7aamr99365775e9.12.1749566317982;
        Tue, 10 Jun 2025 07:38:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:25 +0200
Subject: [PATCH RFC/RFT 10/15] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-10-a8c7aa4478b1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9621;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=m4j+fX0TlGurRWTg2bXu1FuZz0ENTYE+Xi6kt5xTUdY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENhJ8r6ge1uwoYf5B9C3sRyicujal3OEPAcs
 p909zNb5/WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYQAKCRARpy6gFHHX
 co38D/9AWormvfd373nMekiFxkO3mL4uJ4Tf3tLh2azOSLvczM7Ph0T/HraKpYlBi6Ro8BmZVEj
 YlRjPNAsk/qRN7ap8x9uL77qrjWx3vujFjUq2LS0YB3FAOQtT4gXCusQVx4TeNhk6VInIzGgEHi
 fQ/gKRx/5Po0wQZvKZFgyRxNJN9TXTGGIpnLupZrXiaQEjNu10vvQ7/j23sTQDWrytwKziUjyG/
 Xlp3zyhJFRV/g7aYnJZkTQ4Ghk9lFIJfH4BsZFbEJ2zoY0nesGqDdlbicUVl+D7mL/GSC9vs/jU
 1VPYBqqASDJlZjc9IhNC2RS11AHhF2O5UUc6baN6H6/pU+N05lD0XNgEOUqqHsP2YFj2y2+lPQ3
 n+3u7kS8YgmAknMus4i3IwHEkyls4eMGNfzqBZ3TJTu2e2zEqJ1G0N20cyrXOnOVSQnO0HVy9rS
 d1l44ua/4CPE0d/CBKAPcRQDhqpdfgghS4BaBqPvqG/sim+Sf2tQZFqATSvBs7euXTKsjHC7dyh
 EGFKWrrFvrPx6b06imENissuCkOuo5qhw57AR8hFV5u6AUQC0/8uCnPYH8AyVdbahSj/4YFvvMR
 f+euFGQAYyHpaZ0N4O+WBq9yPXjaipugserq+LbGXWf/B2d/U8JI1raS8aZCGiTn+LN8tGjBalo
 bO4bJMUFAdjCpbA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently each exported GPIO is represented in sysfs as a separate class
device. This allows us to simply use dev_get_drvdata() to retrieve the
pointer passed to device_create_with_groups() from sysfs ops callbacks.

However, we're preparing to add a parallel set of per-line sysfs
attributes that will live inside the associated gpiochip group. They are
not registered as class devices and so have the parent device passed as
argument to their callbacks (the GPIO chip class device).

Put the attribute structs inside the GPIO descriptor data and
dereference the relevant ones using container_of() in the callbacks.
This way, we'll be able to reuse the same code for both the legacy and
new GPIO attributes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 122 +++++++++++++++++++++++++++++--------------
 1 file changed, 82 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 811328c8e72d819bcd4b4215cda450c73aaa65cd..03e97697b7f26a8aa9f527f25f048f25588f3ca2 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -32,6 +32,15 @@ struct kernfs_node;
 #define GPIO_IRQF_TRIGGER_BOTH		(GPIO_IRQF_TRIGGER_FALLING | \
 					 GPIO_IRQF_TRIGGER_RISING)
 
+enum {
+	GPIO_SYSFS_LINE_ATTR_DIRECTION = 0,
+	GPIO_SYSFS_LINE_ATTR_VALUE,
+	GPIO_SYSFS_LINE_ATTR_EDGE,
+	GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW,
+	GPIO_SYSFS_LINE_ATTR_SENTINEL,
+	GPIO_SYSFS_LINE_ATTR_SIZE,
+};
+
 struct gpiod_data {
 	struct gpio_desc *desc;
 
@@ -41,6 +50,14 @@ struct gpiod_data {
 	unsigned char irq_flags;
 
 	bool direction_can_change;
+
+	struct device_attribute dir_attr;
+	struct device_attribute val_attr;
+	struct device_attribute edge_attr;
+	struct device_attribute active_low_attr;
+	struct attribute *attrs[GPIO_SYSFS_LINE_ATTR_SIZE];
+	struct attribute_group attr_group;
+	const struct attribute_group *attr_groups[2];
 };
 
 struct gpiodev_data {
@@ -79,7 +96,8 @@ static DEFINE_MUTEX(sysfs_lock);
 static ssize_t direction_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       dir_attr);
 	struct gpio_desc *desc = data->desc;
 	int value;
 
@@ -95,7 +113,8 @@ static ssize_t direction_store(struct device *dev,
 			       struct device_attribute *attr, const char *buf,
 			       size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       dir_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 
@@ -112,12 +131,12 @@ static ssize_t direction_store(struct device *dev,
 
 	return status ? : size;
 }
-static DEVICE_ATTR_RW(direction);
 
 static ssize_t value_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       val_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 
@@ -133,7 +152,8 @@ static ssize_t value_show(struct device *dev, struct device_attribute *attr,
 static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       val_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 	long value;
@@ -150,7 +170,6 @@ static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 
 	return size;
 }
-static DEVICE_ATTR_PREALLOC(value, S_IWUSR | S_IRUGO, value_show, value_store);
 
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
@@ -247,7 +266,8 @@ static const char *const trigger_names[] = {
 static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       edge_attr);
 	int flags;
 
 	scoped_guard(mutex, &data->mutex)
@@ -262,7 +282,8 @@ static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
 static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       edge_attr);
 	ssize_t status = size;
 	int flags;
 
@@ -289,7 +310,6 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 
 	return size;
 }
-static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
 static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
@@ -318,7 +338,8 @@ static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 static ssize_t active_low_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       active_low_attr);
 	struct gpio_desc *desc = data->desc;
 	int value;
 
@@ -332,7 +353,8 @@ static ssize_t active_low_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       active_low_attr);
 	ssize_t status;
 	long value;
 
@@ -344,48 +366,34 @@ static ssize_t active_low_store(struct device *dev,
 
 	return gpio_sysfs_set_active_low(data, value) ?: size;
 }
-static DEVICE_ATTR_RW(active_low);
 
 static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			       int n)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct gpiod_data *data = dev_get_drvdata(dev);
-	struct gpio_desc *desc = data->desc;
+	struct device_attribute *dev_attr = container_of(attr,
+						struct device_attribute, attr);
 	umode_t mode = attr->mode;
-	bool show_direction = data->direction_can_change;
+	struct gpiod_data *data;
 
-	if (attr == &dev_attr_direction.attr) {
-		if (!show_direction)
+	if (strcmp(attr->name, "direction") == 0) {
+		data = container_of(dev_attr, struct gpiod_data, dir_attr);
+
+		if (!data->direction_can_change)
 			mode = 0;
-	} else if (attr == &dev_attr_edge.attr) {
-		if (gpiod_to_irq(desc) < 0)
+	} else if (strcmp(attr->name, "edge") == 0) {
+		data = container_of(dev_attr, struct gpiod_data, edge_attr);
+
+		if (gpiod_to_irq(data->desc) < 0)
 			mode = 0;
-		if (!show_direction && test_bit(FLAG_IS_OUT, &desc->flags))
+
+		if (!data->direction_can_change &&
+		    test_bit(FLAG_IS_OUT, &data->desc->flags))
 			mode = 0;
 	}
 
 	return mode;
 }
 
-static struct attribute *gpio_attrs[] = {
-	&dev_attr_direction.attr,
-	&dev_attr_edge.attr,
-	&dev_attr_value.attr,
-	&dev_attr_active_low.attr,
-	NULL,
-};
-
-static const struct attribute_group gpio_group = {
-	.attrs = gpio_attrs,
-	.is_visible = gpio_is_visible,
-};
-
-static const struct attribute_group *gpio_groups[] = {
-	&gpio_group,
-	NULL
-};
-
 /*
  * /sys/class/gpio/gpiochipN/
  *   /base ... matching gpio_chip.base (N)
@@ -645,6 +653,21 @@ gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
 	return dev_get_drvdata(cdev);
 };
 
+static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
+			    ssize_t (*show)(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf),
+			    ssize_t (*store)(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count))
+{
+	sysfs_attr_init(&dev_attr->attr);
+	dev_attr->attr.name = name;
+	dev_attr->attr.mode = 0644;
+	dev_attr->show = show;
+	dev_attr->store = store;
+}
+
 /**
  * gpiod_export - export a GPIO through sysfs
  * @desc: GPIO to make available, already requested
@@ -664,6 +687,7 @@ gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
 	struct gpio_device *gdev;
+	struct attribute **attrs;
 	struct gpiod_data *data;
 	struct device *dev;
 	int status;
@@ -709,8 +733,26 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	else
 		data->direction_can_change = false;
 
+	gpiod_attr_init(&data->dir_attr, "direction",
+			direction_show, direction_store);
+	gpiod_attr_init(&data->val_attr, "value", value_show, value_store);
+	gpiod_attr_init(&data->edge_attr, "edge", edge_show, edge_store);
+	gpiod_attr_init(&data->active_low_attr, "active_low",
+			active_low_show, active_low_store);
+
+	attrs = data->attrs;
+	data->attr_group.is_visible = gpio_is_visible;
+	attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] = &data->dir_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_VALUE] = &data->val_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_EDGE] = &data->edge_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =
+						&data->active_low_attr.attr;
+
+	data->attr_group.attrs = data->attrs;
+	data->attr_groups[0] = &data->attr_group;
+
 	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), data, gpio_groups,
+					MKDEV(0, 0), data, data->attr_groups,
 					"gpio%u", desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);

-- 
2.48.1


