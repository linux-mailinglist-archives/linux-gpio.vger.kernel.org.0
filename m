Return-Path: <linux-gpio+bounces-27462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE525BFC601
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 16:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FFD6665696
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C4734C98C;
	Wed, 22 Oct 2025 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xy6KUmqm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE04E34A79D
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140481; cv=none; b=RdunvMDvqfDVdSgGfMkNMZCY6fhy7ipMS5JZl2HAoE3jf8NuljZwQ/jSf7fpmDvpJjOQs2Txz8ks0sPbpI2bUsVYi2/81hJwoxx1z6ygz5hDm9GHWYwEhCIXeMw6gcpOKwcFS0s2x92VaiUAeu5yncWJPLoMF1suESHXlo3XGaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140481; c=relaxed/simple;
	bh=5pnEeKqHYnawOAlljhNqLC8nrX9toglKozfFs0IQDGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIQ5TYT23bBO+kGJCVuVhNYla9wrBW0IrKUcLQL8VCfjugjwKLCwjc8I/NgjhaTjRioz4DousTQBPey1jRnCJLi5GpZ9eit2mILQx3fBAXjbvo2ShzQ3mUhAoAlktIkyxLHBueR2GiU09r79NWpprVXFOBj7wCEbo5c662MYw9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xy6KUmqm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42701b29a7eso642111f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140478; x=1761745278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IB9li0p0kE9jGTTsXmkO4xLyhxPXUk87ZAQLNug4IQk=;
        b=xy6KUmqmO2LuRsaEJZ2cX1/pPNsOwI0lpKn585/62UxAz34II8Oy2nChoJav6tqtiw
         dwTgCYtDPgxYEtSinTFjJEEk4RwBLhwSw4b9Mkuuwnjk2D0xOvJyXcmNe/wE+yP7xKwZ
         dmhFwOhZwvEoj2Fvrr+IHAT8AFhAEzI3xQtUFv4LoEGvUJIx+DbVgJhveVsIDVvGcIsu
         wCXSfeZ7oYWurXQu5A9/M0pIEOkJsg1tK2o1kAgq4I3GUayx0h/l1pS9rOwyGpYcCEWB
         1HUf8NUS0NKgQnRiR67/+97mBN+ZQGc7vnVp4fEaonKWW6R8AeBDYgZ0ZE8o0J1vs1yX
         CDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140478; x=1761745278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IB9li0p0kE9jGTTsXmkO4xLyhxPXUk87ZAQLNug4IQk=;
        b=RAiUwPYrMgrfShvCLq9iN42NP9XN7bGN4kb/rirE8uUVG+/D60L2Z/O20wXv405P9A
         /MVj3Os5If/YGPZc1/iEa+8kEe3ZzleFOctTbRV9QgAEfP6VpYmFxFPZxQJBng4O2WPb
         Lqv0dJEvF9mlm88GP9veeVqEqMcCPDuS6D7C5FQOBQkh483XsKHXQFT3EA916ckXyOGh
         U1gQJydT+bluW0Wg8r1REGO+hjCfLOQrJ4h5Gu2WzpoAiTaJ3EvK1u294i6QbaR9d/ip
         iqO1VfxfdkkdL+BcDkETmWoqEHFUE/wE0JPtd6RFXWDPNmtATbLYhL1QFAPIxTYxxsXr
         Hn7Q==
X-Gm-Message-State: AOJu0YzkDXb9AMWhbg/F5AS969HtaWoQ1X7TEtSrPavAzYUGMTPIAf85
	5HotEO4qWoKTB1J1Fpci5CXTSe5MK8Y0DZTwzgLiULi0olQRMzlNd8NsrsR+lG/yjgs=
X-Gm-Gg: ASbGncts8N4JzvAtlcc5dbjXp10kROF2c6dcZASRyKgBRLduulijX5CgDTYGl1nPKT/
	Es0iY0I/T+Sycd8NOkToRpuyvSyYN0h6Soo+dlAZ9xeeTEyKMPtH98wS1mhEU7gBlT5TRKBU4yh
	GAW1LotjEMILXuyx8a67AfiJOyNeo8buogoiSKJzy+gK9fs9R71e61O813Fd4Y2pE4Uj5bmHFKB
	m24tuWysBl/wSuu++dwYObmjYN9hqKENl3s9dTSO7GnD4z/xkg8MzibXg4jrePAyQZSyk7KyDWR
	xPuC7j3UOktCRvKO51NMHdyp7NI4Irw+YQA6xFJEaUymtrZTnMi59iThOO9mUNFUi/0luKKlETs
	SR6SbJINpKa1D7QeF37bKB1XRMvIyfM+ZnIti+cK+6DkSq/i39rYLYDsGnWCGhi+WKGSho/ogeI
	wj3wrhnQ==
X-Google-Smtp-Source: AGHT+IGIAhHl3iBbSsIlZxptiKhSeaDZ+A9/kpiciRpUjZ51o0YXjN8IimxBA1mLx2BidoALCb+2pQ==
X-Received: by 2002:a5d:584e:0:b0:407:d776:4434 with SMTP id ffacd0b85a97d-42856a89d28mr1422269f8f.30.1761140478163;
        Wed, 22 Oct 2025 06:41:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm24863066f8f.36.2025.10.22.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:41:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:41:03 +0200
Subject: [PATCH v2 4/9] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-reset-gpios-swnodes-v2-4-69088530291b@linaro.org>
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
In-Reply-To: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+N7zN9M1F6+4W/2WiZN30Pc19ffcx3bG0PGon
 jferVnkFZGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPje8wAKCRARpy6gFHHX
 crbjEADRzMnnMUvUDGxPFquwAawTcGYdsAROSzDL8Hjb3McdgxFrLrM4VxiTYVIV6UQOECIo4of
 bYwC/B/dsBs1Wpwuk1R0B+4axozYKb43/odBDt6YX0vD8p/5aKc5liBbPWhr8wT4xqHsf/HVDEb
 trKeSG4W6WFkHcaxXdhql7jNUX2dr7Qxnif77badixcUQiUo7q2Hq8k9d4X9maW3/hqdXqi0jX/
 ds1Nwf+sa8fzOmWdQXGFbV6j+G8uzJKpM6T1a4mAsIgy2FbVZpuvTaBz9rRNUkGD87VwUam8sou
 biE6gUrd/l9UAWIfXTXesmxNfAmTpj83RO8m8ifqP9lree2muENZiae2m1wYYGmOb9JsgacVMp2
 oFJ92Kjv1k+ZYVTrtejwxhboPJODsF8ns0sCz4nDmwVPEYHyT7DRLJGLIbx4UbM52m3Cftf4V1Z
 ETZedSDcFXVKJ7gtB5C3MmdoYrP2mrIXZgtYWloN7XxRhAqNUaVSurW/mCQrF5pDoTAW83r6oc8
 5J573jK0TIE0P57RjVYLtTRIaPtjohoUJUatgKAmVlA/91fu4VnD5GXH9NXc9c0hgQRtsXZpVK+
 sf5J5Xl7Exdoy8Z+lDl+L12ndos96H1PRmS2lA59Gsu5ZEHgpZ+Smp1fxX5UrZZxTD13D+Mgtqb
 9h4XB0oRz7I4zew==
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


