Return-Path: <linux-gpio+bounces-1790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041D81BE66
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 19:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8DC41F256D2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 18:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B4D65194;
	Thu, 21 Dec 2023 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KRjJ0okl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6B05B1ED
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d2e56f3a6so6738575e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 10:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703184203; x=1703789003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caPc62PO2k3hY6zqjKKh6pA90RRGF5zHw9ThpEEdfos=;
        b=KRjJ0oklKDGuSrumgM7nhjuxzhW4Vx/FVFns0wZP3k0OPQkhI0qtZYp4ns1rmWqAfs
         GB6As3AmVKs/NqZtgD5VRXE5GqWCBi3h4TsTKvkx3TC1S724yRyMzf5QH7PLRntRTYH2
         C78PrXQ06eF9K9ckqyMKRoUsLE1xdiA86i8/kR+uG+lrk3Ox2D5L9TpV/+ZDLdYbMCyC
         yXxOIxZdKru6qHM/gd+JItDZL0AmyGwvDqOStJd9/ELUTeraI2Du3IMj9Tm6bhyfF/A2
         bVVoAauoFxrLlUO1D9tMbNXr+qW+X3Y//SDa8kNQ3VBqkdt5leRNvc0qnzDNlCL6pyNV
         BCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184203; x=1703789003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caPc62PO2k3hY6zqjKKh6pA90RRGF5zHw9ThpEEdfos=;
        b=WJVCxEOpfKXR5hpJl4QwlNm8bEJBejujXRkkRwCz9lxdN05WCQ0ku6/9b2d7a2KtGp
         Hg+OWnL/eUxviTMoDI/XNyA+im5rQdKYTLDqSm3QqtNncS5ynZOOOQann/pC2usoTHik
         EglUqziyEFmRzPKeh//2BGaF74X+GKt93iIrz/QIzV3Yxs/KN3qhlFv0mux8N1bJd4kX
         JhGZc0qO/0qBzCul1DzXlgKBxy1Wg+lOInsVCONLIsrsAkG0zRGvJnT9XzfPq7v42PmN
         xI5zSal6iG/62ZYDRZWvOF78aB+d3Wz13FVpIt2AQrk9oisNaSgMOR7CsULe2bwn0VJG
         io1g==
X-Gm-Message-State: AOJu0YzS48496KI2gyceV+QmZhPn5Lh/H5Moos6cVxXsOI9rIIPYhrac
	K2+z9MO291UnBiS4WRHjb/A3uRrAFLMFqg==
X-Google-Smtp-Source: AGHT+IFbU5OLYMJJhjrDxQMIpLizL9R5CCWumfMpRONFOBqZt3EbyalrOJqABQxYouHoTeWtcDCtqA==
X-Received: by 2002:a05:600c:190e:b0:40b:5e26:2379 with SMTP id j14-20020a05600c190e00b0040b5e262379mr78889wmq.42.1703184202724;
        Thu, 21 Dec 2023 10:43:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7701:a2c3:cba4:74db])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0040c42681fcesm4188059wmq.15.2023.12.21.10.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:43:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpiolib: pin GPIO devices in place during descriptor lookup
Date: Thu, 21 Dec 2023 19:43:16 +0100
Message-Id: <20231221184316.24506-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221184316.24506-1-brgl@bgdev.pl>
References: <20231221184316.24506-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's time between when we locate the relevant descriptor during
lookup and when we actually take the reference to its parent GPIO
device where - if the GPIO device in question is removed - we'll end up
with a dangling pointer to freed memory. Make sure devices cannot be
removed until we hold a new reference to the device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1baeb6778ec6..8a15b8f6b50e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4147,27 +4147,33 @@ static struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	struct gpio_desc *desc;
 	int ret;
 
-	desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx, &flags, &lookupflags);
-	if (gpiod_not_found(desc) && platform_lookup_allowed) {
+	scoped_guard(rwsem_read, &gpio_devices_sem) {
+		desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx,
+					    &flags, &lookupflags);
+		if (gpiod_not_found(desc) && platform_lookup_allowed) {
+			/*
+			 * Either we are not using DT or ACPI, or their lookup
+			 * did not return a result. In that case, use platform
+			 * lookup as a fallback.
+			 */
+			dev_dbg(consumer,
+				"using lookup tables for GPIO lookup\n");
+			desc = gpiod_find(consumer, con_id, idx, &lookupflags);
+		}
+
+		if (IS_ERR(desc)) {
+			dev_dbg(consumer, "No GPIO consumer %s found\n",
+				con_id);
+			return desc;
+		}
+
 		/*
-		 * Either we are not using DT or ACPI, or their lookup did not
-		 * return a result. In that case, use platform lookup as a
-		 * fallback.
+		 * If a connection label was passed use that, else attempt to
+		 * use the device name as label
 		 */
-		dev_dbg(consumer, "using lookup tables for GPIO lookup\n");
-		desc = gpiod_find(consumer, con_id, idx, &lookupflags);
+		ret = gpiod_request(desc, label);
 	}
 
-	if (IS_ERR(desc)) {
-		dev_dbg(consumer, "No GPIO consumer %s found\n", con_id);
-		return desc;
-	}
-
-	/*
-	 * If a connection label was passed use that, else attempt to use
-	 * the device name as label
-	 */
-	ret = gpiod_request(desc, label);
 	if (ret) {
 		if (!(ret == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
 			return ERR_PTR(ret);
-- 
2.40.1


