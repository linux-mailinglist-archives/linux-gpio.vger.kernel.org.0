Return-Path: <linux-gpio+bounces-27819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 248DFC1A6B4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78ACA358C84
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF763570AE;
	Wed, 29 Oct 2025 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SNf7g7sZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0863E3563E6
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740950; cv=none; b=Y0P3TY540eOdYydPI2Coa+Heft2ovzZLdPzY9v+qG/JJpObkOKCUVfEfJKsNFJm6UUPle+mggrUzbZLx7RHni/fdivN2pBRCY2DPJ5W4411heoVDzGekue4k1onrGtFUrk9uF6EyM5zP8kT68tbmiWAvMplyeo74gyl10R1PiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740950; c=relaxed/simple;
	bh=KHUpwyaRy27jndVwBTJWj6h9p/PHS1us3gbIrxKp/eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/AOotp2m5oa8c77udhOqCppA3vf/G9qV9PksfK4qHhEGLr9VcfpFE9v/iRH2Nh0Q9vNfsZVjkjtzKJOl/sPtlPPaBYccxfQnF2ssFYnQkw1wOi4TASBuGoYTFAqdZHAnDnl/klaSLe9i50G4fql4kSG2IgbpjKCxcZ3vnQiNbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SNf7g7sZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-474975af41dso48985105e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761740946; x=1762345746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuoZoKue2NApDFKbLTdbDzhemOg3AhMIDiuZU1f3Kv8=;
        b=SNf7g7sZ4VSzN5IrbqR/SskH+sH1f6q5OZt+1youNEW9+Zd+zHN3WcKavi1hkjTcM+
         t+TdRPpv0WcxJWD49a4Cpt5oMevvzK18VYwD1KDVpBHwmF6ZnEGFdZq+JkQFAesvYjlA
         1BXYDPmZ2+nR/jiNKyNZwMPwLZrWGauycVDnRlorVrTfvFUUap6hJwaqv/rX2RaNUKZq
         IkH6HVgVBAF+Ax7QwSFYKHqEVEH/Xxp8RQMmmbWOQywjge5BU7EQFtY5FaEY7ST9DMf5
         Rd8s91170hkWOPbnroYA9h/xzXHqVe/8NPfsWFgITLlPLhwHQ8X2/FmJoIwhYnY7rMSh
         gpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740946; x=1762345746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuoZoKue2NApDFKbLTdbDzhemOg3AhMIDiuZU1f3Kv8=;
        b=QDGyOXNQl+UMYAGvfyyVAThIC1WJbABuGxqqqbwwYyyEeK77G5Z3Gg89qRvrpCb2V/
         AnNbD+4EO4j7mIWwbXE0nVzg3BhiZ72T8WarqL98I0XWsouZ+vQW1+Q/ov9kbZ8mHlHF
         0H5SVH9o0TW2f7a7Lh+F39YMIj5N7E+Q2vGk5TT9aBH0XK909tnq+iGJs9AzZ3W5kcLd
         bLj87ANd9IEhKGr69lJJJ2dFAtrFVGo8ljdMmNcGDbjneK2pqJqH/1O/P+fzg4JjvSF4
         zs2fU2RiawyVVl7kr6T9gqpvG8lO+x/Jgk/lRYlAjQkhn/klZQ60Lu1XunileeuudwtF
         BOAA==
X-Gm-Message-State: AOJu0YyKDHQxHl0h1hoVg6UNT3HSTsncILKWI4HsCW/SjMHdG9FTjpce
	1yv2C6Itn19m77fbyn6xFu7f5McMo91rMwxImqu4QjmMKepQpTq7SKSoEcMNI/Piik0=
X-Gm-Gg: ASbGncvEmGmTgL7jVtTJoG/7whnA5hlCr0oO18atHkuB83Xg1BbD1PiXxr3M4dKr9fL
	cX/E6ffGhSz1oCqjMVFArpa52a0B1zjJ2Yktl1xgjVsECjZ7YLkNMeIY4kFAaP7bNAGQRFQ7vG3
	JcI5YuASAXjFJ6CKm7VscvykMmbZ0Ru9xNabHjyd189DqFNfe+e2JJ7FFRDXBWtxfge3zVdzpWN
	JILJ6C6M1jaxnfrd7mQyWppVboD/jJkWrR/myPh1OOkPMHovizO1lMSdJfb5WjnWSVKY/CwzW1u
	rMiSeqDlCi6naoDIIcGs49GvBvl0NWQbAv7Fox2D7MjQN68vBxMcPkHdO++rb6kqwpvbxLGAVKc
	HL622TBYuxtUpXrE3ALg7B3hLC1bd01pw3oaO3LCmNqVIpGZrm2dmZ9bej6Wq2/Pz++zP9QJY8c
	vYT8Sb
X-Google-Smtp-Source: AGHT+IHwR3E1ohqgQkFjbdi+3LL+LGnvdsfijT0SDDASW8GHyDOAQXbsqr8fDlS2SZMFnYAgebrfIQ==
X-Received: by 2002:a05:600c:5249:b0:471:131f:85aa with SMTP id 5b1f17b1804b1-4771e18318emr24404285e9.13.1761740946181;
        Wed, 29 Oct 2025 05:29:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm52775545e9.10.2025.10.29.05.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:29:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:28:44 +0100
Subject: [PATCH v3 10/10] reset: gpio: use software nodes to setup the GPIO
 lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-reset-gpios-swnodes-v3-10-638a4cb33201@linaro.org>
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
In-Reply-To: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7119;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eucl+zWe24QxvRKIj278K94j2hpn49dlxqon0ctdxUU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAgh/Bf20DYGz8KasDtJFbAv5rSTD8oB6IVGFi
 pYQXnKy4i2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQIIfwAKCRARpy6gFHHX
 cuwcEADL7swZTZD6jjith1RSc0baXR+/qGR4nN8bPnzbmgh88wviHZdwotlOcwiMEksUcjPqbae
 Psjgml1/ZZJZtLX9axmdnmL1pZZSv9BGa6/S6OY2yhHMAatKKo+XWxdgxAQJrATr+jN384/294g
 dsednynqDi7eDcuJrHU7yuoNO5GfcGxrPilf7ti3qpUW0iz6J0Dau8OAsbONseFTv10CDDEkWZd
 BQq5Qp7yh1PLNyNWPkLqXUNebNr4wiFTfKx65w3NE74LDV6IQBDQ498VlrmvIe7ldRHcai+qyzc
 X+9hkgInT745mQYtsC16Ggf3Nq5+nfY845r2PQpAoycDxIvOLgLR6ruZpxzU/im54Jenhu+ge+F
 9GOoPDQjVRoExVVqqEIhpHoD+MphFuEKM1vygYqr/z3VL6BGaGToKeZHwWTG6dEgxGqiiBHjBpi
 G/RqYkQp3O1sHl/qJIo+TtGYoc7QdpamVcQRJVMZawzTIaeJLE/9GIUViuL9pS1iYOO88D+TMnk
 eipaQnsb6g/y0vjcHclJYr6t+XxQKRZnMRjlWaWMg+X0rRcTEKf2PjNxTu+Nr06Cd5HjISQjjk0
 gCk2tV7Ngv/fqG0sFbaG8qQPUpIln3dMvJcCvq7Xhel827nWqAEeJY618kFUGAfLgIwNWDwGM39
 2moEja05nhqORdA==
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
 drivers/reset/core.c | 130 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 76 insertions(+), 54 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index e129c4c803eaa7e7e7122d96e9eff187f8dd826f..4617bbac58314b1f37b937e7b0ffff745a81fcde 100644
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
@@ -902,9 +898,11 @@ static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
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
@@ -922,6 +920,23 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
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
@@ -936,6 +951,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		}
 	}
 
+	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
+	parent = gpio_device_to_device(gdev);
+
+	properties[0] = PROPERTY_ENTRY_GPIO_FWNODE("reset-gpios",
+						   parent->fwnode,
+						   offset, lflags);
+
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
 	if (id < 0)
 		return id;
@@ -947,11 +969,6 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
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
@@ -959,19 +976,24 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
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


