Return-Path: <linux-gpio+bounces-22800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0BAF9359
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442721C816A0
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 13:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CE52F948A;
	Fri,  4 Jul 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lifRdjHz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED6F2FA659
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633946; cv=none; b=r+U1Wh29k/Ih+QwVpQAXFYcPQiiEJWXS2KWGLYHUPoAIkCT8TBqXs92AfV43tHR6n0F18mLSIaYkaefJO3+hUqs7bYxnDcux1KwIKKP20MGKjX6eUNmXAl3Q9ExAfzCipdV8wruKHc5swhU9PhoY6dqEOEDZBjZeMYvL5mXIRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633946; c=relaxed/simple;
	bh=cRLUt00itQyCNVDApOds8IW0t+If0N85EbImDHHhimc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWqSebmNNIMxeiBG54YpijXIO90cbdgzE/2bfYA/BbxoRyDA2X1o9P5VBoLnr2yV6dX0zSkOa7Y+VxlxWd4MalN9vX28y3b79zYvJl1S2kx86424Y/+eqSxJgCkRUd/34yydi9O+q1kbRmwJ4Z+Oehwld5idpzwiPBqB34kRXVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lifRdjHz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso7735905e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633943; x=1752238743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGmFGA8T0I8vbIJDw6IMfH4IDK3sle0n2iLWaYwSGLY=;
        b=lifRdjHzB5n76g8L+fA44Qs8QsLLpq4QR/hDkHeFqRtxkQEELBJN7Ig/7ifJ6YazSl
         Kw72y0UfgZOeDsKasToo+dyiedjlgXUdN2Ru01PZVZ+2ooAkN9YHwT4PBR/SIGmefNFb
         D7R4mS4/eVUS13pb8JlOS6bHVaBI+Lesms2ou0iG3ZZ+CKHgADlbU5T0W0a1ccMABrpk
         edlAAsKFojUWePtni3a+SETWAKkAk6JUbT5TqSiNzzgAw2C2YEy7arof4WTx/UyAODJ1
         aML4kRrQo4NndeJCIFkVzfSr5dVJ6v+nEg2s4k2ccje8SQ+qrrJ+gQ6TGRZIQOsXWz9p
         83eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633943; x=1752238743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGmFGA8T0I8vbIJDw6IMfH4IDK3sle0n2iLWaYwSGLY=;
        b=M7o6w6UI0BN03dUxhipmlSMK06CV7NooJ9Stm+eEhZz/L6Ntqx6OHzUC0aalZJ4c7l
         ypblmTdHIQg1jSCfzl+mSQscg7wY1PHkmZpefXofjDYdy3o3OUSiGUeSAS0NhhcqNo5X
         y/IxCo4+g1Ecscn4Z03nJZ4V1Ih7/sMth3Rb4247X7+/Ox3quc9QezeHjn+yP3HshhMB
         0CyCGfFAOISEDtQFYM4JLygXdR1/8Hygkjg8j+XAZfRVwLtw2cJKUYkyp6WnQqHtpCZQ
         lewmhgr6CXHLksljw0ATem0N7aZZaJhlnCa7kqaKbvE8LwLNEuTWWOSoL5yEPY4ywusJ
         Z0mg==
X-Gm-Message-State: AOJu0YwDDAmCUPsAHXvG4xwBa/c6xpbqxllyeXCUbn2mKBb38yI9SVDs
	B7R/CRbw2Pik5o66wJi1dNIJmuS3R4rXYIbIv9sAoKY7YZmhSzlno9R5SKlXXyTpUSc=
X-Gm-Gg: ASbGncvgH+h4WXjoMhk+p8M8v2G3T/XsVkyEZwiGC3Na70+ofBf2yKI1QVcUC6RAXup
	XMYD0NrxrH0pFS9ikbalDnyAdX9B5g7tBQSvnRtj5TxrDuC8q+83PlvXM+rAqTdkm36pk/95AD2
	alUkrL6Uhi0u4sRL1trrJHPyG7WAlezHrljPMzL53BmZFhSH1EXlj3WbHPvUEOmdKFhltgSTxrX
	bdXR/GoCw4msfWXrFOob2iBTTv3O6ABIAXC7s3BBzWTxNaH9PRrMOAXbcodL12GlBMpwGm0ynze
	U+SBiimzGnh+iZxCKMhX0Pc7H0zWPSlDD5i/s0iAIGpu+CncdynLBoY=
X-Google-Smtp-Source: AGHT+IGoAGnybMHcQ7i1hiirbYZeH2V6G3az+afM2C1mRoLzxdmit+tRGWqqf1cz3gOBya/nH+kaXg==
X-Received: by 2002:a05:600c:4686:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-454b4eb82f0mr21794685e9.27.1751633942956;
        Fri, 04 Jul 2025 05:59:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:59:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:53 +0200
Subject: [PATCH v4 06/10] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-6-9289d8758243@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9835;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=X0f/dTpikuoddylbcLQ9jRYPBWNTjeVjP/0rrKM/JVg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9ALQsPodd5UdGApCUSkPgb4MuCj1CEH4jglu
 167kjtKa8GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCwAKCRARpy6gFHHX
 csohD/9pvVhcpETRjSkonAJFVIZU31wWxEbi5pxPaMDePNXtTox3H1vidTm3MD9ED2PrEY3/Msy
 OS+XpygSkDFkDW5hPzNww2Mqoklm96tFgJ9ZQnq56ZBBKboWYEuZX/6OxqvfdhuO5gFMpGRrFQ8
 lFI/9TqXN0TGmJHY+1zRUtStDU0CcjAPLtnYyBkd2WJZaA3WaXVOZQFEYm3qCnFjLU6e8b/fqA+
 KmeWEFHL8b0voN6T7JDWml2obMOf7YEOqh5kZSYRAdLvN9NN9YL94XAcVoyO6ZP44ajtcNTifyt
 4xkFRBK91NXZiNj6Obrj8Ma4xEMwywfysi8gIVPVv3JsOoggEB7o2J2kfJHFIZ+k8s6jYe4PALA
 YNNLI2HEgi1wcnQ8KneFleaYs2VXrd21olDDApT7CC86zY5bS4gdWshcb5CLZAIMYxM2hW8O4HU
 HoeZTSKtEQZr+1nFZa+FSa3IzWVJgA1xpoOiR+Hjpk8bTaPOUT7/sOCq4QPglO/Xmt7MZ032hqE
 XYMwettsZvq5n6dFAml5JCDonYV4OhqwIzPlLbxdCUHZay0oFUVIKL5+gC78jlKbvptOot0monI
 jcWKs6W14Ntso+WGSt9QS7wDyBSdNEOhOMeBCGsXIaoqGMxXiw0Kb6uy4mqVUW5VLn0eB0eOl63
 IL7HN79a1uf1EKw==
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 123 +++++++++++++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fc9c19fde3f12c16a26aa09dcb6f17960942c4bd..e10d720ee0adb3b0f6e91eccbf64c33e5700c616 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -32,6 +32,15 @@ struct kernfs_node;
 #define GPIO_IRQF_TRIGGER_BOTH		(GPIO_IRQF_TRIGGER_FALLING | \
 					 GPIO_IRQF_TRIGGER_RISING)
 
+enum {
+	GPIO_SYSFS_LINE_CLASS_ATTR_DIRECTION = 0,
+	GPIO_SYSFS_LINE_CLASS_ATTR_VALUE,
+	GPIO_SYSFS_LINE_CLASS_ATTR_EDGE,
+	GPIO_SYSFS_LINE_CLASS_ATTR_ACTIVE_LOW,
+	GPIO_SYSFS_LINE_CLASS_ATTR_SENTINEL,
+	GPIO_SYSFS_LINE_CLASS_ATTR_SIZE,
+};
+
 struct gpiod_data {
 	struct gpio_desc *desc;
 
@@ -41,6 +50,15 @@ struct gpiod_data {
 	unsigned char irq_flags;
 
 	bool direction_can_change;
+
+	struct device_attribute dir_attr;
+	struct device_attribute val_attr;
+	struct device_attribute edge_attr;
+	struct device_attribute active_low_attr;
+
+	struct attribute *class_attrs[GPIO_SYSFS_LINE_CLASS_ATTR_SIZE];
+	struct attribute_group class_attr_group;
+	const struct attribute_group *class_attr_groups[2];
 };
 
 struct gpiodev_data {
@@ -79,7 +97,8 @@ static DEFINE_MUTEX(sysfs_lock);
 static ssize_t direction_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       dir_attr);
 	struct gpio_desc *desc = data->desc;
 	int value;
 
@@ -95,7 +114,8 @@ static ssize_t direction_store(struct device *dev,
 			       struct device_attribute *attr, const char *buf,
 			       size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       dir_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 
@@ -112,12 +132,12 @@ static ssize_t direction_store(struct device *dev,
 
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
 
@@ -133,7 +153,8 @@ static ssize_t value_show(struct device *dev, struct device_attribute *attr,
 static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       val_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 	long value;
@@ -150,7 +171,6 @@ static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 
 	return size;
 }
-static DEVICE_ATTR_PREALLOC(value, S_IWUSR | S_IRUGO, value_show, value_store);
 
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
@@ -247,7 +267,8 @@ static const char *const trigger_names[] = {
 static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       edge_attr);
 	int flags;
 
 	scoped_guard(mutex, &data->mutex)
@@ -262,7 +283,8 @@ static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
 static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       edge_attr);
 	ssize_t status = size;
 	int flags;
 
@@ -289,7 +311,6 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 
 	return size;
 }
-static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
 static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
@@ -318,7 +339,8 @@ static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 static ssize_t active_low_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       active_low_attr);
 	struct gpio_desc *desc = data->desc;
 	int value;
 
@@ -332,7 +354,8 @@ static ssize_t active_low_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       active_low_attr);
 	ssize_t status;
 	long value;
 
@@ -344,48 +367,34 @@ static ssize_t active_low_store(struct device *dev,
 
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
@@ -645,6 +654,21 @@ gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
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
@@ -665,6 +689,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
 	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
+	struct attribute **attrs;
 	struct device *dev;
 	int status;
 
@@ -709,8 +734,26 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	else
 		desc_data->direction_can_change = false;
 
+	gpiod_attr_init(&desc_data->dir_attr, "direction",
+			direction_show, direction_store);
+	gpiod_attr_init(&desc_data->val_attr, "value", value_show, value_store);
+	gpiod_attr_init(&desc_data->edge_attr, "edge", edge_show, edge_store);
+	gpiod_attr_init(&desc_data->active_low_attr, "active_low",
+			active_low_show, active_low_store);
+
+	attrs = desc_data->class_attrs;
+	desc_data->class_attr_group.is_visible = gpio_is_visible;
+	attrs[GPIO_SYSFS_LINE_CLASS_ATTR_DIRECTION] = &desc_data->dir_attr.attr;
+	attrs[GPIO_SYSFS_LINE_CLASS_ATTR_VALUE] = &desc_data->val_attr.attr;
+	attrs[GPIO_SYSFS_LINE_CLASS_ATTR_EDGE] = &desc_data->edge_attr.attr;
+	attrs[GPIO_SYSFS_LINE_CLASS_ATTR_ACTIVE_LOW] = &desc_data->active_low_attr.attr;
+
+	desc_data->class_attr_group.attrs = desc_data->class_attrs;
+	desc_data->class_attr_groups[0] = &desc_data->class_attr_group;
+
 	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), desc_data, gpio_groups,
+					MKDEV(0, 0), desc_data,
+					desc_data->class_attr_groups,
 					"gpio%u", desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);

-- 
2.48.1


