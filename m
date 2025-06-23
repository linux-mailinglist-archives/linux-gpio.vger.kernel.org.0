Return-Path: <linux-gpio+bounces-22008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB31AE3939
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43B451895B06
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2FD23817D;
	Mon, 23 Jun 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R5COwnhi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17B23644D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669224; cv=none; b=UGtGdoFDo0w0wyklPSIuNvY5BZFz0oZkEUEpGwuQ9uxsV5O/v/vj+w4t0IP86Kc4rm/xuEigDOHLkoMlc4PibkJ+/8PGsL+v1VzdaC6vTilgawR8Ji6e9OTZUTx/3t0UgQFIhHK0f4QvC5mG7Z5/yQ2hen//Qmk6cglJnbok/X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669224; c=relaxed/simple;
	bh=qhXKR5mSbv8ApDx6/W5MMvt+Akaan9xh97RBCcLaYwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cobyKnPb1hzZX7ysItoLpv26ulBIcBKrqEEmY3Nzel1XnNgqe46XdYcQfOlBzZ1/CiZEljd7kJiO6J5WoWQAIcWhQWV5qtths303+Vu9if2iZ3ZWqvh0CdhtNFQ1EIUs7Pq8I+NZo9vrJL+fKN/7y4Cn2QHk3Kzg/4shQbZOeJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R5COwnhi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so22681785e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669220; x=1751274020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xE1x+VGK8VPIQVNQvYqCI6uexl0lL7Kq5+Z/LW/Baew=;
        b=R5COwnhiJwCtOzD+YtoXh7dBflX25mjuJSBzP1gLJzTc7o/EiD5W17EZpCP9hYVh77
         nKTeyzQo2ezjiRMRH+odN5YpzEH5XuIbsyAB7xhTboJCGkSzTIobpOSm41/mASfNpWJD
         i5uJa06APRHdAIYwUZJ9COYX7Gcpci2txuSxi+FtVwTbX3hTPbjdTCHVfEgTPWrYBnTa
         cFL8txC5roFaXWKdpUYEOyvDyaz8DcRNvLGaEwu2cciFkMdiDr9vvyuYN5OitlLF8v2X
         gfXc8wv8W5UnjJU4fEMy737Q8fvRhGHan4ySENESSWC6v8CqJnVg4l+9489ITgl5DndS
         vvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669220; x=1751274020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xE1x+VGK8VPIQVNQvYqCI6uexl0lL7Kq5+Z/LW/Baew=;
        b=Tg2yaZLfPcQmf26SbvYdDy7/sP+Fa2Gd0vEhn0m9TdQW9wjeSD5PSDnl58wbIc2ZTM
         1F3pVsoZGf1ZLGXtwPAS9kxJuNGdduQ2ftS2JqjUNe4jf4at/9yYGIgUAhDSH9whO4tV
         or8euuXoF9xrrFFdsy+ndPN7QpCX92jH/eUQgLWSTmzKftKJQz2QZS2ZRlbAJY/LEp+l
         dwPLgqnYWTd3D6f4tHCIBSbB2apS0LXWUgDRJqIF0xSP2BXtTVVybeKPlnuMhdK98RrS
         rufsuOeEsPoBCCvQiDCkfW7VR/k67rYihlOFu9ldx2YocgDpYx29WdVjy4OBSLe4R/PT
         OL/Q==
X-Gm-Message-State: AOJu0YzJ5UC3es5Xb12AdmScaIFwY8xwNshhWrJJlQNEwDiYmLFIHrA4
	GCc5Ik3EKASd8XUgZXAPgCilTjh2KhLMuiyvVb2MADk1qKo2SH+YlMcqzUwZpkr6AUs=
X-Gm-Gg: ASbGnctgCw0leeSFg/e/otRfelwICQ8miikUIJmKAQHMUsJh4eHUUjeYBkEA50ceH4P
	d4ixE6CWoI4xSPJepHv44Q+lXEDpWEKB44N2HRSK4ktRgvWoGvULcwJDaPkW94+ykGMT/POIXU/
	fKXX/DotzNAA3jjwvGLgJwi3jRzjubT4GcGkxKY2CUwTpZ8US/ilTr9FO9dltlAwLqUtmwbZMyX
	1GWoAyENLS4lT7xjNhyv7JQVUNcmsCxupCXit3Ux0IHMtpRGs3kXqfL2BEvyRgv2E/ubeF8/oA9
	lqIjDR3GqiMV2NDbpR6Qm5X23zRbgJI51id9Zbejqkk9KWcAAkMdtfw=
X-Google-Smtp-Source: AGHT+IGyfl6XgfHw/Z/xgUn3ZCFhcTWnEk0s+22gzMu/4rZrmNBRzdVL7I4XCSMLxBzyPQe8+rqvXg==
X-Received: by 2002:a05:600c:1989:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-453659dd7e8mr91864485e9.19.1750669220441;
        Mon, 23 Jun 2025 02:00:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:55 +0200
Subject: [PATCH v2 7/9] gpio: sysfs: export the GPIO directory locally in
 the gpiochip<id> directory
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-7-d592793f8964@linaro.org>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4015;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=69h/lz9me1gz3hK9nMhFDYUeePtna8eHSBEPbFHyXuU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWReakhUNrQOuwA6fsapAuNzYerJ9SF+SiJIU3
 4yl6OQP+8mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmgAKCRARpy6gFHHX
 cloiD/94FDSiH3pAS0d9z4rgM3FSjbNQk7PiJ3Xwo73Orh4R4PYIWRIw7/KAOHxO45xqh6uVWG7
 pHAJpSmkWjKbC9T7TVljGgO7uJiHZ/WtJyVQ9PvNI9Pd8ePYs5pmedsoJPLtMtS9MJogMqbIQuw
 IMZzRUTaq148sYRR8NBPD4dV0gfv62+k4QnXNNJLnfCpHpO/QftaM0i2/DQuzSNPaE8VbO2d0R9
 HF2Eqy/WKak1js6H7fiyzbpAangiyroE3hMo2XmeEoL0Dcx4xEkNOhKhNJFP1Z9RgKb6dRr5qVq
 rHLz/mfE2SbWlGRu7dI9r2fndvDLGyng/25hop9deTcHNqCLaspiS44raOrorMxUl7wrOQLVXq8
 JhqiSaeoRB7miO8PGSEFwYJtpAYe4xYNh78ZxpK+mEV3IYgBPuIT3Og83Qnm+FaZIIFxvdLEkML
 XvsZPA+LBVbQJ9Cd2MzRF6boCjA8U9LkSKQDlQKx/VL7E1Is8Ky9kHiO61RxjMc+azb5TSXC1S0
 rjsNzSPu2tbfahV3/ip+JjxNbA3AXl+425QlouupxpklPSlKfbh8IhBA9Qi28OZCNc9ZiEZFegO
 e5OreYmEmqNq5j9ytvc8hzfh5mjRxHyjrmH5VO+BULix7vwbLBnD2H/UC+mUokgR0jMPlWmUQVo
 7WzQ0Dqe/06VxxA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As a way to allow the user-space to stop referring to GPIOs by their
global numbers, introduce a parallel group of line attributes for
exported GPIO that live inside the GPIO chip class device and are
referred to by their HW offset within their parent chip.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio |  5 +++++
 drivers/gpio/gpiolib-sysfs.c          | 40 ++++++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index ff694708a3bef787afa42dedf94faf209c44dbf0..c0bb51412a912cefe032c4e84288f99754acb1b5 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -27,6 +27,11 @@ Description:
 	    /base ... (r/o) same as N
 	    /label ... (r/o) descriptive chip name
 	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+	    /gpio<OFFSET>
+	        /value ... always readable, writes fail for input GPIOs
+	        /direction ... r/w as: in, out (default low); write: high, low
+	        /edge ... r/w as: none, falling, rising, both
+	        /active-low ... r/w as: 0, 1
 	/chipX ... for each gpiochip; #X is the gpio device ID
 	    /export ... asks the kernel to export a GPIO at HW offset X to userspace
 	    /unexport ... to return a GPIO at HW offset X to the kernel
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index adf030f74eb163f5d8b1092d00418b84354f923f..37d58009a51333f7d6a8d600dbeaeb333df27ac3 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -47,11 +47,13 @@ struct gpiod_data {
 
 	struct mutex mutex;
 	struct kernfs_node *value_class_node;
+	struct kernfs_node *value_chip_node;
 	int irq;
 	unsigned char irq_flags;
 
 	bool direction_can_change;
 
+	struct kobject *parent;
 	struct device_attribute dir_attr;
 	struct device_attribute val_attr;
 	struct device_attribute edge_attr;
@@ -180,6 +182,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	struct gpiod_data *data = priv;
 
 	sysfs_notify_dirent(data->value_class_node);
+	kernfs_notify(data->value_chip_node);
 
 	return IRQ_HANDLED;
 }
@@ -780,13 +783,46 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	gdev_data = gdev_get_data(gdev);
 	if (!gdev_data) {
 		status = -ENODEV;
-		goto err_unregister_device;
+		goto err_put_dirent;
 	}
 
 	list_add(&desc_data->list, &gdev_data->exported_lines);
 
+	desc_data->attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
+					       gpio_chip_hwgpio(desc));
+	if (!desc_data->attr_group.name) {
+		status = -ENOMEM;
+		goto err_put_dirent;
+	}
+
+	desc_data->parent = &gdev_data->cdev_id->kobj;
+	status = sysfs_create_groups(desc_data->parent,
+				     desc_data->attr_groups);
+	if (status)
+		goto err_free_name;
+
+	char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
+					     gpio_chip_hwgpio(desc));
+	if (!path) {
+		status = -ENOMEM;
+		goto err_remove_groups;
+	}
+
+	desc_data->value_chip_node = kernfs_walk_and_get(desc_data->parent->sd,
+							 path);
+	if (!desc_data->value_chip_node) {
+		status = -ENODEV;
+		goto err_remove_groups;
+	}
+
 	return 0;
 
+err_remove_groups:
+	sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
+err_free_name:
+	kfree(desc_data->attr_group.name);
+err_put_dirent:
+	sysfs_put(desc_data->value_class_node);
 err_unregister_device:
 	device_unregister(desc_data->dev);
 err_free_data:
@@ -876,6 +912,8 @@ void gpiod_unexport(struct gpio_desc *desc)
 		clear_bit(FLAG_EXPORT, &desc->flags);
 		sysfs_put(desc_data->value_class_node);
 		device_unregister(desc_data->dev);
+		sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
+		kernfs_put(desc_data->value_chip_node);
 
 		/*
 		 * Release irq after deregistration to prevent race with

-- 
2.48.1


