Return-Path: <linux-gpio+bounces-26833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BCEBBE20E
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 15:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4666D4F0221
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 13:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC84C2853F8;
	Mon,  6 Oct 2025 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ecq37Djg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A528726C
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755650; cv=none; b=gCrxyRAionDmNiJr7B+AdexDnPrWBcwUCslbsCQc/M+J+pygXQ0YriQWbPY3OJyXXfcR4HysmDJSFsrDgszQP8Q5aiwVrsZnjW9gzBweBd/KgZk66aHpy0qV84mS3uDn+IFfs+4XO+F7OmMyDeJSjYGxKXVL5w1EthXgr+vZeA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755650; c=relaxed/simple;
	bh=K8U+CHaEDTDTAOOAhIZGQLKRldV6biiXuo/pIPzTEZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAqtX2LrSxCcliIIyteULlPAi7mGsldb+lz+sER+wJc06Fgz753/+3oL0QOxElLZ/RgJ+kuUzf0W9/6dfhrjd4PoCuNWDH8BQ6oP/zr0sh/IBfB5gBXcLylGk6bfEO/WmLjDZTvtIgxGZeD1dJQ2XwlOB+G5pZ8FoTZ+ydnSkPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ecq37Djg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so28088255e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759755647; x=1760360447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pKa9jDqQ70bpsXEO6w9amEFdc6+U1mZOoJWBfQBYnU=;
        b=ecq37DjgMG+ZVpr3twoAHY6abMk19/hn0RwDKgRYMG6hcgjKMQvbgffI0K5820fJaA
         prGG/WZ751lrqbERuKQILKIuqvnk0/PE/OpF06y7Y1vHdEz3dPi3qNJO0oDBQrIpt7Bs
         GLZsY0Pgpo0pfj0D/VcRBtattHmSFYs2le/MEsCbJQt+Uc/UflvOGvYcJ6Lh1cfB+6Yq
         VbR82popzFAvnydO6lTyZuAX6CjE7EsSqTZvF+vOiWVuTgRmEqVozQZYGeooXccjP5MP
         o7y8Pa6D7xXY+p16EXClSDmtVfiF/iwdufK0vnGxts+cxOlFVCkeKxglIUHVzNhgLQSj
         Ikig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759755647; x=1760360447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pKa9jDqQ70bpsXEO6w9amEFdc6+U1mZOoJWBfQBYnU=;
        b=H7ihvX9VR7wdaOyDKkR8aSel38hgdAkbd/FBIJ7Jhyk56V9fwJVyEo8YeFI7BWyzjA
         zNViWxrfI5kKDW0VHCglTkD3Ca4nny4YAR8ldnUA/ol2W4wg4NjGiR3WZ2M9iht7kW59
         Ct7Qu6Hmz958DCjPGo2zphlJYvG6Q7GcamuMqSera5wc7YEmayMtPF8LArJTieKpfPKP
         7oZ1lBLAtzhWoPM7N/PiLiXoHs5Evd87FBf95sOW4XuTzMHBodzzA3oJeOV6RIPuIkMM
         O8nkxj4mJpidvgxv+l3Y63Qt6hecAfdnE/0/j4pF68MfR/s9QBdIupZrlrpR6DB4HsCV
         4Rbg==
X-Gm-Message-State: AOJu0Ywl9YHQjbYKazZrXwRSrjSauhql5ORlY2UHum3pTkQ90bycQp9s
	d873OkxGZ5GiGvP1D0fktNFlsgT3EbvefZJROsUTZK6Nt/o2prJCVpJqMfkTnNmGFQs=
X-Gm-Gg: ASbGnctae0XWrS5bI4luuFWDMuPrwLkyWf8dPJCjg55wz38Z7ZuY0JTbUYtESqLdwRj
	TKdz9ZDix8Pqn/L7yTMFRsEjH4BHVpbWvo/jDO9mdlylg+wHB03zdR30kEmVqI2jmlnPUxa00Pi
	CwSkCbG3Dw0T6URksHnVDO0KpSn7sFKOUDRdT7YE9pWJKxz+lpTKcY0f0KF1cIy+sl8vMlnNJFK
	n7HIXsbvMim0mzb5gTx0OXTwtsqvR0r1nrS5iDP5J1Sop815/3MlvK5I9Zm0/Mwz35HZB3KQIsq
	7D7kipGbxtiKqwuPPNGNSHT115hCcbwtamPRT0OBUBpa3r0fzJAGp0O8L0qrsA6wlzMlwyegs/Q
	SPw3L3stfr1W5wFP5tlzYzisPOsNFGqBJGn8+WcSqGnxiB8JiBzF3
X-Google-Smtp-Source: AGHT+IHVfVXF804VbQxWVSNoeBDUmpNoTUbLdSk8nlsC5TJ7pPo085L60e5shPycALSUqFXkTIsQZg==
X-Received: by 2002:a05:600c:354d:b0:46e:6a6a:5cf7 with SMTP id 5b1f17b1804b1-46e711026c4mr87577545e9.12.1759755646723;
        Mon, 06 Oct 2025 06:00:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b86e1sm249725965e9.5.2025.10.06.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:00:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 15:00:22 +0200
Subject: [PATCH 7/9] reset: make the provider of reset-gpios the parent of
 the reset device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-reset-gpios-swnodes-v1-7-6d3325b9af42@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Zc+xs5tXGUpl9lw3Fpnc7se6u+D5QtL6RaYw/hFc3wY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo471w3VajOAmI2LiZSnq9w/PmWaCe3q6SYPRBE
 9uM3dLHU1WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOO9cAAKCRARpy6gFHHX
 ckSwEAC5br4Du9+yyIV7DxA1c9XCvP2k/N0Ximod1Z6yO1qv18SfTIPIGICwPRXxjSk76i99qdS
 WG7yX/XIZDBSrvMfTgZ+YTiY51Qh4Ttg+Io8eAfJHZzgplYEGKXVCcXI647SGTQjkLjcKA2q61G
 nkUcFsYOP/3pIHQ8iS8O7yhAmFmOD8wV0bwVhdsQzS7Wiy/NXK7uhXdip/QeUs30US0X3bBADOm
 nmzoAA48zEJpHRppAeXCkiAWQCVT1xtycOPejnIcMyCkEs+n2v7kLKQsZsJKgVwy0DUrBMtdq4M
 RwbPmETuwWa1bvokYGPhDw8jEyxsovqmgdnDOSKaYqIQhkUUo7qLR/wEcw2WLwTrM9Mo67+evWF
 UlKucTeEzS4MEsECRa6Md3N4rbM/bgO48+Y4mG6qv3ya3ZmyCS37pxfr8b4VxPXhumkMQcCEjs5
 Jgn7mTvpYamv0aam+h/X7BR02XFJtNcLX3Vs8lzqaL05qDn6rHrEUZhqzCYUKu0gQErrd8zkGvR
 GvzgZ1lpz8qhp1lXCSR7XJZjDLnBTNS0suTS+JRcwB5WA3api9Rzmml14mF++54HXPRX1lC2QBg
 kzVYwShdQjhKe11vv3aVrTX6HBDKe1XAeB91KmXQGwtUYdISv+v+2yYff0sGQrOzSsGTY9RkuZa
 /MWcXjbxzcks0Eg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Auxiliary devices really do need a parent so ahead of converting the
reset-gpios driver to registering on the auxiliary bus, make the GPIO
device that provides the reset GPIO the parent of the reset-gpio device.
To that end move the lookup of the GPIO device by fwnode to the
beginning of __reset_add_reset_gpio_device() which has the added benefor
of bailing out earlier, before allocating resources for the virtual
device, if the chip is not up yet.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/reset/core.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 5a696e2dbcc224a633e2b321da53b7bc699cb5f3..ad85ddc8dd9fcf8b512cb09168586e0afca257f1 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -849,11 +849,11 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
-static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
+static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
+					 struct device_node *np,
 					 unsigned int gpio,
 					 unsigned int of_flags)
 {
-	const struct fwnode_handle *fwnode = of_fwnode_handle(np);
 	unsigned int lookup_flags;
 	const char *label_tmp;
 
@@ -868,10 +868,6 @@ static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
 		return -EINVAL;
 	}
 
-	struct gpio_device *gdev __free(gpio_device_put) = gpio_device_find_by_fwnode(fwnode);
-	if (!gdev)
-		return -EPROBE_DEFER;
-
 	label_tmp = gpio_device_get_label(gdev);
 	if (!label_tmp)
 		return -EINVAL;
@@ -919,6 +915,11 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	if (args->args_count != 2)
 		return -ENOENT;
 
+	struct gpio_device *gdev __free(gpio_device_put) =
+		gpio_device_find_by_fwnode(of_fwnode_handle(args->np));
+	if (!gdev)
+		return -EPROBE_DEFER;
+
 	/*
 	 * Registering reset-gpio device might cause immediate
 	 * bind, resulting in its probe() registering new reset controller thus
@@ -946,7 +947,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		goto err_ida_free;
 	}
 
-	ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
+	ret = __reset_add_reset_gpio_lookup(gdev, id, args->np, args->args[0],
 					    args->args[1]);
 	if (ret < 0)
 		goto err_kfree;
@@ -958,7 +959,8 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * Hold reference as long as rgpio_dev memory is valid.
 	 */
 	of_node_get(rgpio_dev->of_args.np);
-	pdev = platform_device_register_data(NULL, "reset-gpio", id,
+	pdev = platform_device_register_data(gpio_device_to_device(gdev),
+					     "reset-gpio", id,
 					     &rgpio_dev->of_args,
 					     sizeof(rgpio_dev->of_args));
 	ret = PTR_ERR_OR_ZERO(pdev);

-- 
2.48.1


