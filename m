Return-Path: <linux-gpio+bounces-28084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF74C3494F
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 09:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4A8F4F7FFE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 08:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054B22E7F2D;
	Wed,  5 Nov 2025 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qtO7Sb8g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AD2DCF41
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332496; cv=none; b=VwzV46TOUOKfrvJ9+0ur2gsWnhPgv3gI2A+8uVKD6mHO3gm5z3eUJfv4yI0o2tqXTv9S7eJIYNbagpJyV9XNB9hZ46TzVSA8qvF8iddQx8q7snCVz+iWzYQtG/sSdq1S254FcczhJiUM1XK4zkiMb+jl9ZoSvSv9h2UzxIUl4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332496; c=relaxed/simple;
	bh=SGEipYyBFPCCyVC6q8YgOSs4LCXD3vaIIQV9W9NaxB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XzZ+GCbRl5H9SmUa0Niu2ZVPMDVoDIGJ+aQjpJXrN8xrsqiscNBEk6h7i5OuwnLR4ZscoQnc54pASnuSihqOl0DVkQgvmQgfsloeXGnxe373zPgAtJFQhCocO7tNcGKoZk7+0L3NuRlGNQB8MFzPvYCjU76LjnIDjpNvh9hKRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qtO7Sb8g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso4631925f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 00:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762332491; x=1762937291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkhhDNpmKZjGJKpspl88pg7px7XG43dcD6b9QvYDK5U=;
        b=qtO7Sb8gg3JwQxi9AazobilbIhGG9+btvldMINwfkCRsQN2X4ODwsFY16FnjQSSIms
         kPyoOXE4GgYEvU61UrKdnNrIUCKRFn1nZCc6h4yQdXYHkpvR6RHiR+shmNVntOGydRK1
         06Eboa3SJ418r1JauJYYI5azGLhvd4c45n6jrkQ7Afqio3s9NgYOsFztIh+BoqYPULzu
         ZcwTGJGhvcAmeqiB5mYDSd52e/3qPtPbJG5cSkaM0tobtE80hlxMVb0Psw+MQAv3Sgqq
         Nqqa7IFUHNdpLXVPuiRdwdWEM1ECegivBZ2tcDv1WGVmmK5vVS2y1j/6PU8VD+39q/Ps
         eXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762332491; x=1762937291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkhhDNpmKZjGJKpspl88pg7px7XG43dcD6b9QvYDK5U=;
        b=oBByINzwWAoez8ADVmFyUKg2Ri3KTus+NVPBQD+OOagfmRnMMrnFYmYqiWcSBc72oL
         3lzd3IO4qLbyk/P19GUVIUTEalVYWBxEogRSDMVHhlrk+23v8XjgqcUdvcmtH7thTEO6
         yCS/3xE4WpxqLi0So/DEpnheDd6ixnu3VdqLyKNBnRpjuk+Xy1dit9W+pHYys5YvqIJG
         3RRNx9XUW7SBzNiFezVqz4WoPsY7zYtx1OnUbhfUjsL0FhjRtYBdfraZ2U0cMxYZXJuy
         ycZP88ymirBnZRaTJYhJJSS/rrjrv88mXLSTIuDmHt3veK3GuoCTIdHDJtc7SCLE3GiD
         ejTA==
X-Gm-Message-State: AOJu0YzJ+KJGfN5Ee+YzchiincNee2Sl3kNUBvcfyiguATYasr/Zmlbq
	zNt8Vckfmq9YF55Sk8u4PJ0rzpiW296XNzCcM14mcQUd8kOZB98D2kzQ2RFAPQMqo80=
X-Gm-Gg: ASbGncvU3QEqmn9LOgThSfLORKWYbit12nZ4Jb8w2WeeK84EsTnWGZ8Z1iPIhYjmwb8
	dzveme3ejzXP33bA4MNq1oiiiO41Oy8IHL/1O8aYi6pJ0JetTesclSglgn1mvoiaO6EZjlv/lTn
	+It9L/MviVubuZPI7AW85QnjYjyKaqj15dgB9kq0ZdLraAFlHGCccnZMW5JqMckvaVC2Dpxlp/e
	hjGbkTnA8dl2JxneIYf/SwSXzZ7YQQJ/dUT7/bZJkf5cRFYiaDjt59wtLfKaeMP9nfwRPn9/4wW
	g+Ne1LzElFvzgVvqI0esSNyNm2BIKuEvD2QNjguNgJylRtPueshSH9nZTV1tRdk5npWq2uAFw7q
	lKy5OOkC6nUzfnq5DsvF8cYaxTDs19ng5N/UpXcSTOCeF9hOqJo6quM6cZo+azbZcnB8HQQ==
X-Google-Smtp-Source: AGHT+IGTUfxyJN5QHNOp0FTOnoLQgzs14kVKOEtC+nMrHYH+LcVaxtpywpF6tGJ9j4zAjwjvArwqFw==
X-Received: by 2002:a05:6000:458f:b0:429:cbba:b242 with SMTP id ffacd0b85a97d-429e3306470mr1523705f8f.41.1762332490686;
        Wed, 05 Nov 2025 00:48:10 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4e71:8371:5a52:77e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f9cdbsm9315936f8f.34.2025.11.05.00.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:48:09 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 05 Nov 2025 09:47:39 +0100
Subject: [PATCH v5 8/8] reset: gpio: use software nodes to setup the GPIO
 lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-reset-gpios-swnodes-v5-8-1f67499a8287@linaro.org>
References: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
In-Reply-To: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7132;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NNQdvThjugcgWNXPcBcBS6gI52byrFAWIB9wM4h8qXg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCw8yu1+tDlfSt4WuUulr+TLFSJdB3g8qziixY
 B74F11UPXuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQsPMgAKCRARpy6gFHHX
 cr1ND/9zeaDEMfSGJ6sFnCXa81JnjVuhcR/lMtxHf4udsqyjNAXIcSXpxXHKffLYaG8Fr39Xxd1
 EydW+kJbY6qoaZDS5iXNm8aXsZl990kvC1or3OWfVvL226s3ZUOXL/Dmagok6Yo6VdYj54gMuOd
 /I0Fy45FfGNXMn4CJZczIWZC8qFYa398RWzQdmYxTIiSeJiLjBbCbboFqWKzOBAmVvTg5wF40Pu
 3vCU2pBUT5DVJoh7HHYiB5BJ59axl4ycnXbf97Q+03sNPXakO7mKAIgCsxUrl7HBCuZt/TpiQiT
 B0dqiIbzIs+kwk4hvDuhvgFkSc64bGxpA+CvWctGtLLAZG2lmm3tTSZjjGk/NOzCdiK6taFXQHh
 9VtL6y18Fnv97p8M1Q15bWZB3jKe5f5ERhlRI0pbpI5Ia4guNu3a+Tw9wtfXQpwqAuOJViy5qXl
 7S+4VMLHJbsHTfrjP9Fbic++ocS83Bu5ZIUNd3M4KjlpQB0RSfGGepSiR5Ooq9izM8s3gciyBE9
 h+KXawiFy4us4GwQ7CJ+3Nabw+VxjUC/4v+mjlRRVj5bth1J73Y7opJ46yFsReWYXYWyoe8l2FO
 7hjwcPqI2m0M0B5FrqWDVhz+DqUHyCCnAxgztV/ffn+2wjevtkFt0pUcCpxYanR7j8lgyAlx+ov
 yWEQj8EO+3TUSHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO machine lookup is a nice mechanism for associating GPIOs with
consumers if we don't know what kind of device the GPIO provider is or
when it will become available. However in the case of the reset-gpio, we
are already holding a reference to the device and so can reference its
firmware node. Let's setup a software node that references the relevant
GPIO and attach it to the auxiliary device we're creating.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/reset/core.c | 129 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 54 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index fcf1c24086e565015b0956fdd40334274a1edb00..66a99bdfb7093232d169c92d49cb953c4b1033e6 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -14,6 +14,7 @@
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
@@ -77,10 +78,12 @@ struct reset_control_array {
 /**
  * struct reset_gpio_lookup - lookup key for ad-hoc created reset-gpio devices
  * @of_args: phandle to the reset controller with all the args like GPIO number
+ * @swnode: Software node containing the reference to the GPIO provider
  * @list: list entry for the reset_gpio_lookup_list
  */
 struct reset_gpio_lookup {
 	struct of_phandle_args of_args;
+	struct fwnode_handle *swnode;
 	struct list_head list;
 };
 
@@ -822,52 +825,45 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
-static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
-					 struct device_node *np,
-					 unsigned int gpio,
-					 unsigned int of_flags)
+static void reset_gpio_aux_device_release(struct device *dev)
 {
-	unsigned int lookup_flags;
-	const char *label_tmp;
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
-	/*
-	 * Later we map GPIO flags between OF and Linux, however not all
-	 * constants from include/dt-bindings/gpio/gpio.h and
-	 * include/linux/gpio/machine.h match each other.
-	 */
-	if (of_flags > GPIO_ACTIVE_LOW) {
-		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
-		       of_flags, gpio);
-		return -EINVAL;
+	kfree(adev);
+}
+
+static int reset_add_gpio_aux_device(struct device *parent,
+				     struct fwnode_handle *swnode,
+				     int id, void *pdata)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->id = id;
+	adev->name = "gpio";
+	adev->dev.parent = parent;
+	adev->dev.platform_data = pdata;
+	adev->dev.release = reset_gpio_aux_device_release;
+	device_set_node(&adev->dev, swnode);
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
 	}
 
-	label_tmp = gpio_device_get_label(gdev);
-	if (!label_tmp)
-		return -EINVAL;
+	ret = __auxiliary_device_add(adev, "reset");
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		kfree(adev);
+		return ret;
+	}
 
-	char *label __free(kfree) = kstrdup(label_tmp, GFP_KERNEL);
-	if (!label)
-		return -ENOMEM;
-
-	/* Size: one lookup entry plus sentinel */
-	struct gpiod_lookup_table *lookup __free(kfree) = kzalloc(struct_size(lookup, table, 2),
-								  GFP_KERNEL);
-	if (!lookup)
-		return -ENOMEM;
-
-	lookup->dev_id = kasprintf(GFP_KERNEL, "reset.gpio.%d", id);
-	if (!lookup->dev_id)
-		return -ENOMEM;
-
-	lookup_flags = GPIO_PERSISTENT;
-	lookup_flags |= of_flags & GPIO_ACTIVE_LOW;
-	lookup->table[0] = GPIO_LOOKUP(no_free_ptr(label), gpio, "reset",
-				       lookup_flags);
-
-	/* Not freed on success, because it is persisent subsystem data. */
-	gpiod_add_lookup_table(no_free_ptr(lookup));
-
-	return 0;
+	return ret;
 }
 
 /*
@@ -875,9 +871,11 @@ static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
  */
 static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 {
+	struct property_entry properties[] = { {}, {} };
 	struct reset_gpio_lookup *rgpio_dev;
-	struct auxiliary_device *adev;
-	int id, ret;
+	unsigned int offset, of_flags;
+	struct device *parent;
+	int id, ret, lflags;
 
 	/*
 	 * Currently only #gpio-cells=2 is supported with the meaning of:
@@ -895,6 +893,23 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	lockdep_assert_not_held(&reset_list_mutex);
 
+	offset = args->args[0];
+	of_flags = args->args[1];
+
+	/*
+	 * Later we map GPIO flags between OF and Linux, however not all
+	 * constants from include/dt-bindings/gpio/gpio.h and
+	 * include/linux/gpio/machine.h match each other.
+	 *
+	 * FIXME: Find a better way of translating OF flags to GPIO lookup
+	 * flags.
+	 */
+	if (of_flags > GPIO_ACTIVE_LOW) {
+		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
+		       of_flags, offset);
+		return -EINVAL;
+	}
+
 	struct gpio_device *gdev __free(gpio_device_put) =
 		gpio_device_find_by_fwnode(of_fwnode_handle(args->np));
 	if (!gdev)
@@ -909,6 +924,10 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		}
 	}
 
+	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
+	parent = gpio_device_to_device(gdev);
+	properties[0] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
+
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
 	if (id < 0)
 		return id;
@@ -920,11 +939,6 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		goto err_ida_free;
 	}
 
-	ret = __reset_add_reset_gpio_lookup(gdev, id, args->np, args->args[0],
-					    args->args[1]);
-	if (ret < 0)
-		goto err_kfree;
-
 	rgpio_dev->of_args = *args;
 	/*
 	 * We keep the device_node reference, but of_args.np is put at the end
@@ -932,19 +946,26 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * Hold reference as long as rgpio_dev memory is valid.
 	 */
 	of_node_get(rgpio_dev->of_args.np);
-	adev = auxiliary_device_create(gpio_device_to_device(gdev), "reset",
-				       "gpio", &rgpio_dev->of_args, id);
-	ret = PTR_ERR_OR_ZERO(adev);
+
+	rgpio_dev->swnode = fwnode_create_software_node(properties, NULL);
+	if (IS_ERR(rgpio_dev->swnode)) {
+		ret = PTR_ERR(rgpio_dev->swnode);
+		goto err_put_of_node;
+	}
+
+	ret = reset_add_gpio_aux_device(parent, rgpio_dev->swnode, id,
+					&rgpio_dev->of_args);
 	if (ret)
-		goto err_put;
+		goto err_del_swnode;
 
 	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
 
 	return 0;
 
-err_put:
+err_del_swnode:
+	fwnode_remove_software_node(rgpio_dev->swnode);
+err_put_of_node:
 	of_node_put(rgpio_dev->of_args.np);
-err_kfree:
 	kfree(rgpio_dev);
 err_ida_free:
 	ida_free(&reset_gpio_ida, id);

-- 
2.51.0


