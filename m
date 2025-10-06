Return-Path: <linux-gpio+bounces-26835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E519CBBE202
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 15:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7BB1890A4D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 13:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3557A28852E;
	Mon,  6 Oct 2025 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UnmSROMG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D452877E9
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755654; cv=none; b=gA50FlbFv4kj7ZRp3V1syxM1EdNUCRmOBhJ3S3XFBArju5HdubMGOyn1q6OUZ5b+vG1sSefExXPt+dAd7jnaHb8tr2SS5dQ+QxWAEFk41NDCwu2SHa9nsM2mUJ9bXLFmwG0IC/5tV8gYkQKWmRSEkSRY2K84gRD+6upnuKKLLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755654; c=relaxed/simple;
	bh=3ITU5SMeBS5gbZ6+V2JyPdn7cXGWn2ep0zbQ9J0rsIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxMO3F1p8K3ZYQT3c6j4gNtn7Ra7DXvDnVGABLnj5IUw8LAQvLsqifgoEiVffeDRHMr4P6oZS7jrqkbv5nuBU7AwOKG+ZVGQOKfdPgzqjlSCBzvhd+g6M6xsHyWGTxeQYm3acL/+Ek+cYuORaQu0gUznjnmzDDr7J5KvPfBzWOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UnmSROMG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so55947675e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759755650; x=1760360450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQTP5tVg1KBqcYjkGWU/UXGNSpYIuMZY/FCVFHH95b4=;
        b=UnmSROMGZ2MmfEmnM0lKIrU/0z+R2U8y43ppUlZoCcXhQxl3+rjHLMrM3da/CFLIoE
         qRSQlqP75qHIvo0mNgZ6gH4wZg417V3w+MaZS2OpDAq1KzJ1iU0YoxvZ3hNA+KMl7QZx
         Bs9mDeyouFo/Lh7ChnC2AnH/jLZBEeDLPkc3GNy3USfVEa+pUOcVXOLz2upKYg61crhP
         0kdQPGAbO+sBBggt6s6yxVMnS5T3XDA6If1/jxt/a1pGYjy2lbmjl3LpcFKtIiVKiecS
         5Un+uSzyqtaWTvr8vj3hHEUi452NQ9FhxrN8FgLkkqauNpAEXXhY7VBrgcxNM7yEptt8
         Bfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759755650; x=1760360450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQTP5tVg1KBqcYjkGWU/UXGNSpYIuMZY/FCVFHH95b4=;
        b=H2v6OTUG79n4AcAPkl/ICW2jJSF8UOUjHFQRZ2OVhgX7TMkySNSbURNAvSXJt6aXzS
         N8TmlBbD5GrkrIMVd6KMGIKOksbKMS9VkqhDzhhkSZ1aDkDJffqC53LkvXtBnNNfJxyY
         md9tFfT5LCf0q7zy/yfcJ2kU0WdV3dC+h7Wtc9DKriUN/g/QCaY2uTJr70y/5aQ/QD5v
         FbwFXp0KiDLHmE/oJC3Jqugzr/R5xtcezPUESmUK23a6YrGdhr8xeQFnRnWm+iDj5sVC
         7uH3S5L+rxMSlgifYkycxkSFGu8E+YY5mMhxWbwsm0nhADCU931oNUffHYXcQfLalTXb
         5txA==
X-Gm-Message-State: AOJu0Ywq8QAEhVIyPUGqX/T+mlqGEf9BgNj2pbaEeOjA9uhXdljZBMPw
	2jBBguTzjCd2+wI5vEjbT63r7FS7EONadW5vaBzwcCJ5jC/FUMfdEc2hnu5GtHDg+LE=
X-Gm-Gg: ASbGncsbmS3Xn3gOyRYjoJOZk9DzGHduLOry4v9AlGTpJpvioL7c9+iCK9CXd+zWbzC
	LQmQvKpptTSd1ZqJxdaY30HXAgfoN1UC3f1vtnFuZxtMQ2FvbwVzUt3CiEZR7H3/2zdjQzb1A/N
	rz/K5R4O7QFd6AOkGcM3DrbhY3DwOXghbraE09GN9daNgbrsZV6VZUOS+EvLdm0od2p6ZqgZJ8V
	vytjJjPiDRANYX/UunuAW5tDmD+FeyXHgkLSoT/kxZ9KggHdNUYL8S0Tf+dWDenQ3KMicjg+Bvu
	CMXHONB05gypnM9MsuM1GwXammZUn4O21r8le6KWsdwfLjexxPxHw6by7OxIX6U9hFyFFWU/8q5
	yeNyAABhmhUz5xPrwr5B1OjClouz0isyXbhtbP1NDVg==
X-Google-Smtp-Source: AGHT+IF+07vLyKlUC9AZcX/ELvnHFPy4Xnjef8d+glDiXjGJaJtY0fp2bybEmkWjDlxNv8CyAWcKSw==
X-Received: by 2002:a05:600c:19ce:b0:45f:2919:5e6c with SMTP id 5b1f17b1804b1-46e7110c3d5mr106900545e9.16.1759755650133;
        Mon, 06 Oct 2025 06:00:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b86e1sm249725965e9.5.2025.10.06.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:00:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 15:00:24 +0200
Subject: [PATCH 9/9] reset: gpio: use software nodes to setup the GPIO
 lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-reset-gpios-swnodes-v1-9-6d3325b9af42@linaro.org>
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
In-Reply-To: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7200;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=euQnOmMaUXav6qiP7aQUzAMCDMlmaWDfPNDFpx0Zd40=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo471xS0cpgGKN+eCwr4RM2flGdhV1fuNmW7IEy
 pih/wsr5euJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOO9cQAKCRARpy6gFHHX
 coIXD/sE/r5VEuU12M8wenUEnCjWZoJJuKKYrWL2E7T4Hg5PiNgjOGaF62J0OdBofMxEpp7rkba
 V1Zb0qdvdTcb6zjP8tMlIiZf+DI7S8ifG7KBRU5kELDN9xifiv7wbUd2bCaDBIrjZduZjII2eGU
 XqQ+ySRjRpK2oa201uID8kJPlOQy8IsgNmhhhNAA100CDKAfs3m4prThhnkrJJTo7vR5npJ8Gvm
 I3J7mAAwAb4JZMHQ7gw7ddZEdYEtccdhMWJgy+mq3UoKLF40EjUH7EllFOLDZnMEauOuhhpmv1Z
 6QwQNgrctI1hykn++MHmdCmWN3Rc1ve+V2yH4z3wNhGnajq1AFvkd8r90U9e4CWTX2f7PEvwbfD
 dT4/c5j8d9zdeTQjNAcNrBlDeAOD0p6aovQc3ZAgsDl9WBb7sp3qCbDgVh5tvycyM22ZX5nVLS0
 ph12Vs8sJ9dXkAEbrhZk4suiee+dIafR5g5ipYuVz3AHnmhxbz5xuUCxapQK0kj5q9aoZzSJ7bq
 F71aDZP2VWHHZj5qJrZtiUAJics9X0DRE66hE6Qedl77sNKVCtIuEEOldJmj9BHLYyRBYT7IdxB
 MTffYjKJZy8PPvBBlqmCRkLOApcb+bob6RSos+/m8v/uXHTbW/wNC+E1rBDesJofLmkM2zlmc18
 gyLYW+PH5ODOiaw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO machine lookup is a nice mechanism for associating GPIOs with
consumers if we don't know what kind of device the GPIO provider is or
when it will become available. However in the case of the reset-gpio, we
are already holding a reference to the device and so can reference its
firmware node. Let's setup a software node that references the relevant
GPIO and attach it to the auxiliary device we're creating.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/reset/core.c | 132 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 78 insertions(+), 54 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index c9f13020ca3a7b9273488497a7d4240d0af762b0..b3e6ba7a9c3d756d2e30dc20edda9c02b624aefd 100644
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
 
@@ -849,52 +852,45 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
-static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
-					 struct device_node *np,
-					 unsigned int gpio,
-					 unsigned int of_flags)
+static void reset_aux_device_release(struct device *dev)
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
+	adev->dev.release = reset_aux_device_release;
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
@@ -903,8 +899,10 @@ static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
 static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 {
 	struct reset_gpio_lookup *rgpio_dev;
-	struct auxiliary_device *adev;
-	int id, ret;
+	struct property_entry properties[2];
+	unsigned int offset, of_flags;
+	struct device *parent;
+	int id, ret, lflags;
 
 	/*
 	 * Currently only #gpio-cells=2 is supported with the meaning of:
@@ -915,11 +913,30 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	if (args->args_count != 2)
 		return -ENOENT;
 
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
 		return -EPROBE_DEFER;
 
+	parent = gpio_device_to_device(gdev);
+
 	/*
 	 * Registering reset-gpio device might cause immediate
 	 * bind, resulting in its probe() registering new reset controller thus
@@ -936,6 +953,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		}
 	}
 
+	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
+
+	memset(properties, 0, sizeof(properties));
+	properties[0] = PROPERTY_ENTRY_GPIO_FWNODE("reset-gpios",
+						   parent->fwnode,
+						   offset, lflags);
+
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
 	if (id < 0)
 		return id;
@@ -947,11 +971,6 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
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
@@ -959,19 +978,24 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * Hold reference as long as rgpio_dev memory is valid.
 	 */
 	of_node_get(rgpio_dev->of_args.np);
-	adev = auxiliary_device_create(gpio_device_to_device(gdev), "reset",
-				       "gpio", &rgpio_dev->of_args, id);
-	ret = PTR_ERR_OR_ZERO(adev);
+
+	rgpio_dev->swnode = fwnode_create_software_node(properties, NULL);
+	if (IS_ERR(rgpio_dev->swnode))
+		goto err_put_of_node;
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
2.48.1


