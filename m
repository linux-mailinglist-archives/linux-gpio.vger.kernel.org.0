Return-Path: <linux-gpio+bounces-26830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA6FBBE1D2
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 15:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D01513ACC21
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 13:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D167C283FD3;
	Mon,  6 Oct 2025 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RJyNXgpk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC31285CB5
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755644; cv=none; b=tblVdUqcqT22lhw84SML5s2W8arrp6Mvu7l9SL8EKFV8c7ddQ4uSP/+zDWcTh+NzzlfSoICE/wSZl4zXY84kOB/VAmlxBI8J295OFd6WqnKs+OKrHa8pePNhkpXcM94OZ7tBpkN6skdGalWuLn5PylbkKFslShfGDP0Gd2obfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755644; c=relaxed/simple;
	bh=5pnEeKqHYnawOAlljhNqLC8nrX9toglKozfFs0IQDGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDq0i0wvq6ZnYP8qOYAJZioNaD2Cp9rCENdtTFOdmXuXOa7kdfP6OxS1zJhaY6IsiE1Kho5wlT/T3dmlStmLFvVdyS9o60I2KigCa9W7T4E2/JpqfO90XdmTbdZ12PqM/wcghCkIp9pa6PoKASTaoixKcCsZ6z01a+TaMRUayn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RJyNXgpk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so28087405e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759755641; x=1760360441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IB9li0p0kE9jGTTsXmkO4xLyhxPXUk87ZAQLNug4IQk=;
        b=RJyNXgpk89bTAvE79qK4tgAWBWIHCubMUeY9cjjFZ8Btb7Zhab4StlGZBbEcrwEKsB
         oZ+EWh6xvVmhnfxfYN/12d6PBh3P00UF/5rBOR7aljE76bLGAcPSBU8HFdtrigj6zIpM
         Uf6I72unEyTPuD5wqTpVEkGh/bX6K4r6uGWUrB6LW6q7DEU8qN+kl7VC8Eg1e5orDzX4
         RUul+l0w5tPB/sqRKWRW2pPKSOOSV1J19YVbpHLOLDbX79b/Iw9GeVSV4Xr8jWwAfjt9
         QEKca0m4llXzytWneQRNhfCbJ20ULA6MDxEWWU2YkeSxRu2+zc/wrplnkCH8RVeea5lm
         AQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759755641; x=1760360441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IB9li0p0kE9jGTTsXmkO4xLyhxPXUk87ZAQLNug4IQk=;
        b=ibcP0y7htbYCKrgZRg/08gK3ohDKYNbxgRlQAr31pK1B2ujTBlbFr6jAvMTii7NcaQ
         8Yc1hJCULI1E//lD2SwJkc/0oURNBZCE3g8v5woL077aHt/PNqCHCasoNIPgrCbGw4wT
         8bFWubvgBkMXH9Agc/FOEk8S94JpIoFBUjfUbSSQuDOqdk/klWFzrEqyvT/ixgpdKNAp
         02Ly/X/JfAUWc/MRee2IzJ/XaEBc+P/hqRvJ41NUYMAhNm3w96IwvEln/AnY7Qho+OhY
         9hvDtb/vb1+QBVLWv4KoBoFPpOLm3Dve/KZaaZN0ENtroC5SLLgT+IUWGWU2p/q78rTf
         MfHA==
X-Gm-Message-State: AOJu0YzzTSFDEPoHG74N0VpRqXOzxfarsH1hkAegpzqAokha51a/mSId
	mdzgVMf/qMBfOTMhvLksyyVJWuyUqbzej6atGrmcQDlS0Z+t98FW3pRsHKUV+mtnCls=
X-Gm-Gg: ASbGncvIplFIzbgtd0pr2g/E1T5fM/HOHUYaOTZ+Na3nKFyJQIJsgCSnMCPo9+PtPiS
	uHkMDp9OrWYPt3yOAh5pIVuext3tZME5yADy9OaxuM92X6u2VjKzUSKgrq1eU5IDOwh0hnLkxzD
	GsZLgwlkCOAbfderCNe4e95I+JNgZDgMgK3nilTL4TfWSaIFqZes9iUTADWB7Xpc1jBehs9HPRw
	m5O93p4L0V3OlJaAm39N2Gx7Cl0e++3Z+/LbtIy8QqvfgewUvJOxOYRlINuDcB1qU38c+bUzQaD
	RTN0a/qr5WXl0IwIP8yG5Z+J73Xm0tDryJBGvOe2UFuZf4m8ipkSaAACpxjHU+cKakoS70CXE/P
	I5V9brullILHTOu6Jq+NTYDD/Yax6vxNs08y3IBt2c0Cn0QkXfPax
X-Google-Smtp-Source: AGHT+IHebbAPMR7oXC5VLW2/w5/FrK+xciuNp+N6rz1Yq+ku7VJkWBjybJF2PazE1vgpg855HYVNnw==
X-Received: by 2002:a05:600d:41cd:b0:46e:1d8d:cfa2 with SMTP id 5b1f17b1804b1-46e7113dc01mr82047925e9.20.1759755641145;
        Mon, 06 Oct 2025 06:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b86e1sm249725965e9.5.2025.10.06.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:00:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 15:00:19 +0200
Subject: [PATCH 4/9] gpio: swnode: don't use the swnode's name as the key
 for GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-reset-gpios-swnodes-v1-4-6d3325b9af42@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j0RRfSQSsKVGeiwXPp8qsWRU8zLDV2TSTGFBIXN+YdY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo471wtB/HnaJ+O09mQ+9lgzCae0qQw32NwTefs
 jSgoICyADGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOO9cAAKCRARpy6gFHHX
 ctnHD/4+TTw++elPkjzjI+nwSVBBsHusvZ7gjWSbofVCsBjApKaJ9Jkxm8Nlj/uyMBJ4WBQwwNo
 hpq036tS1eW5uIhf3nUOQ1tTJ9a0Z0LBUE7Vp7/Xsul0r6BB1JGZuW6MKXsSi160DQn/i0NK4RZ
 PvMLswbpfF/6d1JlYrD2l7+aBNwx6qG4sDt7HAdVoA4opQqYU1GE2zbOLFylFdVcPTKoypmVM5R
 YtUytXE52w8c00pwe8sZKJs8RHpz/6m8Rxe1YyH9Bt4X7BrAxxqJbaPNDXyrdew34ShdrpxnHrC
 ePzLlLx9GPkLxLG+GB8JjySOlClZyiqDzWH7F6XxWLjXm+mVS7X4AwvoN9JAZyRdZPDE6K5Acyv
 36sD88S8vx1ACVfqhh5OosZZJdyT2cdp+3+jlhQpGh74rLJomPs/67Xw8lagwFNwwnMF7H4VCXg
 m0qRihA289PN8TWMEF2feUNL5em0YXu3yRgf4OA1h90O2oxbJt/jVl3DH0CJb7hnXzbHfkhsaXE
 gVpBsfy6W+IOhPurkNZmV14obSmYS9RE9FA+tDi84Hi5VKn77gK3hZryWIJWEs+97srDMd17fan
 dyHc7gZalByu7pstT5/2NsYlFvSM+O+G7/QHZuUTuLLGzB6UXoI/FLDPiJXZLo0cNMBb0oG37rb
 Bj5vwuIyKtX6u+A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looking up a GPIO controller by label that is the name of the software
node is wonky at best - the GPIO controller driver is free to set
a different label than the name of its firmware node. We're already being
passed a firmware node handle attached to the GPIO device to
swnode_get_gpio_device() so use it instead for a more precise lookup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-swnode.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index f21dbc28cf2c8c2d06d034b7c89d302cc52bb9b5..573b5216cfda105bafa58e04fc5ad3a38d283698 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) "gpiolib: swnode: " fmt
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -26,23 +27,20 @@
 
 static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 {
-	const struct software_node *gdev_node;
-	struct gpio_device *gdev;
-
-	gdev_node = to_software_node(fwnode);
-	if (!gdev_node || !gdev_node->name)
-		return ERR_PTR(-EINVAL);
+	struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(fwnode);
+	if (!gdev)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	/*
 	 * Check for a special node that identifies undefined GPIOs, this is
 	 * primarily used as a key for internal chip selects in SPI bindings.
 	 */
 	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
-	    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
+	    !strcmp(fwnode_get_name(fwnode), GPIOLIB_SWNODE_UNDEFINED_NAME))
 		return ERR_PTR(-ENOENT);
 
-	gdev = gpio_device_find_by_label(gdev_node->name);
-	return gdev ?: ERR_PTR(-EPROBE_DEFER);
+	return no_free_ptr(gdev);
 }
 
 static int swnode_gpio_get_reference(const struct fwnode_handle *fwnode,

-- 
2.48.1


