Return-Path: <linux-gpio+bounces-26440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A8B8FDBA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 11:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B86418A222A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 09:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718372FE077;
	Mon, 22 Sep 2025 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Kl0i8cm4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2342FBE1C
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534860; cv=none; b=TCRFU8U7qxQNhjnJpNWYaFUpABlcREWfM8CCWAT0HyMUBd/WhB9YidWIucsnaZbDOm0wekLphCYwCnCjejGFKb9CL2jXenrzzjgcDI68i/peukhbpxvNcZGX9Dmjxl1RYhg6Te1aYqolAzGwR+dBGA3wXbySO+Y+OWP1P0g6iqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534860; c=relaxed/simple;
	bh=hpTElvONWN7x1N39i9IekHWxIKuXTqEFxseyIF0jX/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhSGdm7sig5iN0i4gR6NY7YMIZJvOcbOxdOHGWJSM05mVbyRCB7pV9H5U6+JbSM6wApmQDCoFAecKRFVc/MJVLNZ9/RPZmOUIuqe0/UCdXKErFLv7vTGJLlsI4qrQqGXspylA7bSGKJ4VUFPZe88FS7rnbXlqPCsuh1Pbv+7Myw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Kl0i8cm4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46cbdf513d7so10080275e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758534856; x=1759139656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlPqTMOSQ2GWJ7JUOlfTZtSKhKxw8yffbKrhlZX/QZU=;
        b=Kl0i8cm4n+nGubWQ4T9k8IyICD0yocTsd2M1MWuH/CN1Vu0RqiwUPbmOh6ttvwN1CF
         hjJDYTjbUlQfY1JGMDGn5AtFdIeZbchsumUTwtSLnfEqkB9vPXxBQQLjgTP+oQizqDwU
         KfYAIGNHxO66gilDq9fP9Oy6i0vBeaAt+nrDBTu2xgoW7yqh+BDMKewEyCHKQYPazwXV
         r58Gj7SrIe8EmnPHoVFr2E8/zgm+xolTeAw8nkZ7R67ExSMzfe1a+NKKFeKGDMdmWwY+
         cUl4594EdeOKh+ArXgfd8Pz5zoQP3+M2NXb6oclCZfetz1dG8EPY0KaVhb/7OYaQrSpv
         YFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534856; x=1759139656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlPqTMOSQ2GWJ7JUOlfTZtSKhKxw8yffbKrhlZX/QZU=;
        b=sEowrdQDQxvbGv3x/E+3OcspEGzBqw59JsIdXb2ch0PT3sAwB6oiIcMsiUka8QmIru
         muXQm27fthq5le32ZxdL2vRbmxIVNiOjMixebY2sbBatvJUjzew5KhaJY06x73HGMIZq
         VJGsxlwrFFHnn5R227Fk+HXNGRgnfgpuLlqmR+Mhplcduc9LBGT8lojffYJSLc9e9Kos
         xcLwg8yfCRtx3cvoNBR1kpvyJnn/Qb85sK0llI1DXtP9pmR8Lf8f3osMqyH8GumagrNL
         BKRDsTDbDoT7GSVyNVUfKyWxWGC3sNuThnR03uqlPvjbwgXaNWKs+1gq9fqgC5IcE7yz
         vHrg==
X-Gm-Message-State: AOJu0Yzz0wr8Q2Kzwdbs3+zBCkYvRXLDYm9Fqy8hzlJeOdzw2AuhN6sT
	yvTNXcq+b/aaKXAdFsv5/SBxlEh8LQYrMXX8Gk5bFi3yuMSqEcxRHXQze1eWUSmDRY1S2pjyEw6
	9yazj2Ak=
X-Gm-Gg: ASbGncteRPhWcggBvqT1tQqaeROjMNOEU+ji6gxUg+29VQGIVyLoA2XIRa7POSIHQxh
	A2JZIi2JlMvBlhcM7gEydWpv7euIT+8mxgk4oN6v2ZcIfu4m2FYuh9qeuCWX3L1g/XFpmQ2vaLh
	Q7zBXH2PWNpGwozx/RQPceoQzi7KcllVMqbftwh5OPDBUmrdwq+BugfvbbTxBcA/R9dw/YOs5UZ
	qYqmErYFx+1jYpTVMJCODsAAZiMr5f28wNY1rTGh5KaYK8uKy2vIbTR60yX89Sj7MCi2yV6Uglf
	qBLSvwAnZZHacPZu/JaAdgVOuZPrcCpCUvOKbhbDvOKNKMC4uCc+PKIL5krwmYKnwcNIg0ECuq7
	xRYjZTOXgKz/dNR0X
X-Google-Smtp-Source: AGHT+IGMBSQTf6yO9n9dXfnglqDrXxdQVaaRqfuRiSAJi+cLQHzxBSjg8HqWLQMIdo3sszJUNkJO7A==
X-Received: by 2002:a05:600c:5248:b0:46d:3576:2895 with SMTP id 5b1f17b1804b1-46d35762b25mr29467745e9.24.1758534856262;
        Mon, 22 Sep 2025 02:54:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:824c:ead0:65a5:c51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-467fc818e00sm156496835e9.0.2025.09.22.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:54:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 11:54:03 +0200
Subject: [PATCH 2/4] gpiolib: rename GPIO chip printk macros
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-gpio-debug-macros-v1-2-d99739dff711@linaro.org>
References: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
In-Reply-To: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11065;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ThGiG3a81yVXSYBI/CFfvTpmsLi/CuglWfNyPf5q87M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo0RzBBQoVZQDgw825/pEBE0TnbeDLB9npZOK9s
 xvxw2VFkKSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNEcwQAKCRARpy6gFHHX
 chKzD/sE+F0yOHeMKpTbBEzlfAN3q4vDtMyi++IN5Q1M1cZ7DcNgaeGO9Tv3mgIXtWXBva7t9ck
 Cx6JogbU3yc0VZxs+vY9QNZlQWv4hkBPyOfeJWkyl9Wu2pvAjMmvVC6kXyDZ10BqLCQ+oPKBofb
 m1FUtyQENkJ+QdwEh749YNE4989YYWizeqvioa1Jw9NwY2kcyMOZFES5iQz5DRuz2ugL37uCSdr
 Hx+urdrPkcLZ7Y78G0rDd0Eq5tx5mk4wKmL7AVi2F4WzfqoMezBThYcoviA4EoKYjbiPjMZFQER
 q/cumNau5AKGUVhY0vUxkrRPsjouoKQcWiTh5Mfp7D6KGFBavZCgCWxIVIT8qxWIhFuJUwcwmcn
 Ad/eXPpxD5pWUb0eHYb24Np2k8pq3B+VoP+byobFM09mkrMKfqoBosMEnH5A2bzAsV4uOfQE0g3
 tQRwaJIm6SMwn9iTLGoy1PG2EDaq7Apw9m6z3n1xSH4+PVPgTaDVZvE14OpOrNFyzKqyGsidYmf
 2zQQO1YQ1EpSQk/iUtH1pEq46TGHPhnfk+jLAmPsVqpspvNLnt6AkQQRH2WwQevoo6X74rs90K5
 D5TIcZWQ6B28YFQ1YBFMawV+wuYq/TUZM38QrGlt9Xt2D7onTNs0TJCPfp0Dy/XqLLiLHnkKYOj
 NLf+DEHiL+z7x0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The chip_$level() macros take struct gpio_chip as argument so make it
follow the convention of using the 'gpiochip_' prefix.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c  |  2 +-
 drivers/gpio/gpiolib-sysfs.c |  2 +-
 drivers/gpio/gpiolib.c       | 80 +++++++++++++++++++++-----------------------
 drivers/gpio/gpiolib.h       |  8 ++---
 4 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 175836467f216ae372a2cb6e2cd68c7867534938..ddc452b5ee23a2be99fc2798cd1d55403a625099 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2823,7 +2823,7 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 	if (!gc)
 		return -ENODEV;
 
-	chip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
+	gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
 
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 9a849245b35880b66afeb042a8bb25520279e9a7..7d5fc1ea2aa54fce0c7c884b53d16ad1278c4612 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -1091,7 +1091,7 @@ static int gpiofind_sysfs_register(struct gpio_chip *gc, const void *data)
 
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
-		chip_err(gc, "failed to register the sysfs entry: %d\n", ret);
+		gpiochip_err(gc, "failed to register the sysfs entry: %d\n", ret);
 
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0bc2363e71a488a9c21b3da59821e04bc08be69d..cf461c1d878b7bd158e33dd6aee7e42f77bbac37 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -921,8 +921,8 @@ static void gpiochip_machine_hog(struct gpio_chip *gc, struct gpiod_hog *hog)
 
 	desc = gpiochip_get_desc(gc, hog->chip_hwnum);
 	if (IS_ERR(desc)) {
-		chip_err(gc, "%s: unable to get GPIO desc: %ld\n", __func__,
-			 PTR_ERR(desc));
+		gpiochip_err(gc, "%s: unable to get GPIO desc: %ld\n",
+			     __func__, PTR_ERR(desc));
 		return;
 	}
 
@@ -1124,7 +1124,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
-			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
+			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
 			goto err_free_label;
 		}
 	}
@@ -1528,8 +1528,7 @@ static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
 							  &parent_hwirq,
 							  &parent_type);
 			if (ret) {
-				chip_err(gc, "skip set-up on hwirq %d\n",
-					 i);
+				gpiochip_err(gc, "skip set-up on hwirq %d\n", i);
 				continue;
 			}
 
@@ -1542,15 +1541,14 @@ static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
 			ret = irq_domain_alloc_irqs(gc->irq.domain, 1,
 						    NUMA_NO_NODE, &fwspec);
 			if (ret < 0) {
-				chip_err(gc,
-					 "can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
-					 i, parent_hwirq,
-					 ret);
+				gpiochip_err(gc,
+					     "can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
+					     i, parent_hwirq, ret);
 			}
 		}
 	}
 
-	chip_err(gc, "%s unknown fwnode type proceed anyway\n", __func__);
+	gpiochip_err(gc, "%s unknown fwnode type proceed anyway\n", __func__);
 
 	return;
 }
@@ -1602,15 +1600,15 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	if (ret)
 		return ret;
 
-	chip_dbg(gc, "allocate IRQ %d, hwirq %lu\n", irq, hwirq);
+	gpiochip_dbg(gc, "allocate IRQ %d, hwirq %lu\n", irq, hwirq);
 
 	ret = girq->child_to_parent_hwirq(gc, hwirq, type,
 					  &parent_hwirq, &parent_type);
 	if (ret) {
-		chip_err(gc, "can't look up hwirq %lu\n", hwirq);
+		gpiochip_err(gc, "can't look up hwirq %lu\n", hwirq);
 		return ret;
 	}
-	chip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
+	gpiochip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
 
 	/*
 	 * We set handle_bad_irq because the .set_type() should
@@ -1631,8 +1629,8 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	if (ret)
 		return ret;
 
-	chip_dbg(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
-		  irq, parent_hwirq);
+	gpiochip_dbg(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
+		     irq, parent_hwirq);
 	irq_set_lockdep_class(irq, gc->irq.lock_key, gc->irq.request_key);
 	ret = irq_domain_alloc_irqs_parent(d, irq, 1, &gpio_parent_fwspec);
 	/*
@@ -1642,9 +1640,9 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	if (irq_domain_is_msi(d->parent) && (ret == -EEXIST))
 		ret = 0;
 	if (ret)
-		chip_err(gc,
-			 "failed to allocate parent hwirq %d for hwirq %lu\n",
-			 parent_hwirq, hwirq);
+		gpiochip_err(gc,
+			     "failed to allocate parent hwirq %d for hwirq %lu\n",
+			     parent_hwirq, hwirq);
 
 	return ret;
 }
@@ -1720,7 +1718,7 @@ static struct irq_domain *gpiochip_hierarchy_create_domain(struct gpio_chip *gc)
 
 	if (!gc->irq.child_to_parent_hwirq ||
 	    !gc->irq.fwnode) {
-		chip_err(gc, "missing irqdomain vital data\n");
+		gpiochip_err(gc, "missing irqdomain vital data\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -1993,7 +1991,7 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
 	if (irqchip->flags & IRQCHIP_IMMUTABLE)
 		return;
 
-	chip_warn(gc, "not an immutable chip, please consider fixing it!\n");
+	gpiochip_warn(gc, "not an immutable chip, please consider fixing it!\n");
 
 	if (!irqchip->irq_request_resources &&
 	    !irqchip->irq_release_resources) {
@@ -2009,8 +2007,8 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
 		 * ...and if so, give a gentle warning that this is bad
 		 * practice.
 		 */
-		chip_info(gc,
-			  "detected irqchip that is shared with multiple gpiochips: please fix the driver.\n");
+		gpiochip_info(gc,
+			      "detected irqchip that is shared with multiple gpiochips: please fix the driver.\n");
 		return;
 	}
 
@@ -2039,7 +2037,8 @@ static int gpiochip_irqchip_add_allocated_domain(struct gpio_chip *gc,
 		return -EINVAL;
 
 	if (gc->to_irq)
-		chip_warn(gc, "to_irq is redefined in %s and you shouldn't rely on it\n", __func__);
+		gpiochip_warn(gc, "to_irq is redefined in %s and you shouldn't rely on it\n",
+			      __func__);
 
 	gc->to_irq = gpiochip_to_irq;
 	gc->irq.domain = domain;
@@ -2080,7 +2079,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 		return 0;
 
 	if (gc->irq.parent_handler && gc->can_sleep) {
-		chip_err(gc, "you cannot have chained interrupts on a chip that may sleep\n");
+		gpiochip_err(gc, "you cannot have chained interrupts on a chip that may sleep\n");
 		return -EINVAL;
 	}
 
@@ -2336,7 +2335,7 @@ int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 
 	pinctrl_add_gpio_range(pctldev, &pin_range->range);
 
-	chip_dbg(gc, "created GPIO range %d->%d ==> %s PINGRP %s\n",
+	gpiochip_dbg(gc, "created GPIO range %d->%d ==> %s PINGRP %s\n",
 		 gpio_offset, gpio_offset + pin_range->range.npins - 1,
 		 pinctrl_dev_get_devname(pctldev), pin_group);
 
@@ -2392,19 +2391,18 @@ int gpiochip_add_pin_range_with_pins(struct gpio_chip *gc,
 			&pin_range->range);
 	if (IS_ERR(pin_range->pctldev)) {
 		ret = PTR_ERR(pin_range->pctldev);
-		chip_err(gc, "could not create pin range\n");
+		gpiochip_err(gc, "could not create pin range\n");
 		kfree(pin_range);
 		return ret;
 	}
 	if (pin_range->range.pins)
-		chip_dbg(gc, "created GPIO range %d->%d ==> %s %d sparse PIN range { %d, ... }",
-			 gpio_offset, gpio_offset + npins - 1,
-			 pinctl_name, npins, pins[0]);
+		gpiochip_dbg(gc, "created GPIO range %d->%d ==> %s %d sparse PIN range { %d, ... }",
+			     gpio_offset, gpio_offset + npins - 1,
+			     pinctl_name, npins, pins[0]);
 	else
-		chip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
-			 gpio_offset, gpio_offset + npins - 1,
-			 pinctl_name,
-			 pin_offset, pin_offset + npins - 1);
+		gpiochip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
+			     gpio_offset, gpio_offset + npins - 1, pinctl_name,
+			     pin_offset, pin_offset + npins - 1);
 
 	list_add_tail(&pin_range->node, &gdev->pin_ranges);
 
@@ -2614,7 +2612,7 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 	int ret;
 
 	if (IS_ERR(desc)) {
-		chip_err(gc, "failed to get GPIO %s descriptor\n", name);
+		gpiochip_err(gc, "failed to get GPIO %s descriptor\n", name);
 		return desc;
 	}
 
@@ -2625,7 +2623,7 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 	ret = gpiod_configure_flags(desc, label, lflags, dflags);
 	if (ret) {
 		gpiod_free_commit(desc);
-		chip_err(gc, "setup of own GPIO %s failed\n", name);
+		gpiochip_err(gc, "setup of own GPIO %s failed\n", name);
 		return ERR_PTR(ret);
 	}
 
@@ -4052,8 +4050,8 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
 		int dir = gpiod_get_direction(desc);
 
 		if (dir < 0) {
-			chip_err(gc, "%s: cannot get GPIO direction\n",
-				 __func__);
+			gpiochip_err(gc, "%s: cannot get GPIO direction\n",
+				     __func__);
 			return dir;
 		}
 	}
@@ -4061,9 +4059,9 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
 	/* To be valid for IRQ the line needs to be input or open drain */
 	if (test_bit(GPIOD_FLAG_IS_OUT, &desc->flags) &&
 	    !test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags)) {
-		chip_err(gc,
-			 "%s: tried to flag a GPIO set as output for IRQ\n",
-			 __func__);
+		gpiochip_err(gc,
+			     "%s: tried to flag a GPIO set as output for IRQ\n",
+			     __func__);
 		return -EIO;
 	}
 
@@ -4140,7 +4138,7 @@ int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset)
 
 	ret = gpiochip_lock_as_irq(gc, offset);
 	if (ret) {
-		chip_err(gc, "unable to lock HW IRQ %u for IRQ\n", offset);
+		gpiochip_err(gc, "unable to lock HW IRQ %u for IRQ\n", offset);
 		module_put(gc->gpiodev->owner);
 		return ret;
 	}
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2a003a7311e7ac5beeaa1c947d921149ad991acf..6ee29d0222393dfff84608c79d21f4022cdd9cc1 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -309,13 +309,13 @@ do { \
 
 /* With chip prefix */
 
-#define chip_err(gc, fmt, ...)					\
+#define gpiochip_err(gc, fmt, ...) \
 	dev_err(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
-#define chip_warn(gc, fmt, ...)					\
+#define gpiochip_warn(gc, fmt, ...) \
 	dev_warn(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
-#define chip_info(gc, fmt, ...)					\
+#define gpiochip_info(gc, fmt, ...) \
 	dev_info(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
-#define chip_dbg(gc, fmt, ...)					\
+#define gpiochip_dbg(gc, fmt, ...) \
 	dev_dbg(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
 
 #endif /* GPIOLIB_H */

-- 
2.48.1


