Return-Path: <linux-gpio+bounces-937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AEF802EAF
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCED1F211ED
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148AC1B298;
	Mon,  4 Dec 2023 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y7FnlPpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05003109
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:15 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b538d5c4eso37617035e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682513; x=1702287313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGHp/zivDD4UeGo/O0oZ0YEfeaPi8u0T0sTBfg7Gjaw=;
        b=y7FnlPpajpr8n8nucOvT8HBBlBNAKmKIhme1F3n6heV2mXjpufnCNqo1rMcbi6Jq6l
         PXVyMLf9hJeezi8ATsz7ZhKbe8k6RlTXr5S/ASXktAMyWNBEsYasdrQgrtAUl/K36wco
         UgR443z5q7FqNgUzuarTTq2hqeEVUeOFC1VtztZwMMEYQQrZ5IJIETGJcqlo7t6QEfs3
         SR0Ie0/puufn+o6dSYhb1B36XQR/1T2AOG/ZtEeJbybbSmjJfEyx0RTIpO/km+l7B5I2
         aDfKqtz1TeA8gGfbUPVP+78txBLdJkkvv76++vKGEo/+jW6PkAtdx/R6J8tVFYxTkXkb
         41jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682513; x=1702287313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGHp/zivDD4UeGo/O0oZ0YEfeaPi8u0T0sTBfg7Gjaw=;
        b=eVdnGgn+cDZjei8iQQsm/gP3/6J6muAvZ3hDbWE+S9FesQs2DMAK9+UbgIfmvF70uo
         wYJr9LU7kXVYPZiNB8AVLVYfZHUtztv5ODpbTaWX3n/vQHJUuSC9sX/qT/SoJ40+GVJP
         xaKOjZR8QRwZ4vvUm4XCp3DL76h850npzXTeJj2odFU84a7rENM5oMfj7yN22/slcX8i
         Bh+CezpMkO+kQex8FsvQd9Q25iCTajhwpiKr4o5YWQq+BVTwglKJK7Cq7ZlvmIAVqXzg
         O1XeXmULNiYbl90ETuri0qJncVVwT2PW9VYBrlKXoVWYaP5W2W63OoCqohN7cPLxSnCF
         D+eg==
X-Gm-Message-State: AOJu0YxxsC3RYDFicb1uwREFVfAGb+4Bm0zqe8RLYgtKalW5fcV7Uu0P
	Y8s4XaSF2K+YhHliGOo5OWDOWHEkJhpouHbFsCk=
X-Google-Smtp-Source: AGHT+IHty3BbyOZtDzbcT1aXZLimxuywhqB43xcMqgA6c48GKHsKE4IJgMpVfVz1QHmQAv2GfiPWPg==
X-Received: by 2002:a05:600c:2044:b0:40b:5e59:b7a2 with SMTP id p4-20020a05600c204400b0040b5e59b7a2mr2362002wmg.127.1701682513268;
        Mon, 04 Dec 2023 01:35:13 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 01/10] gpiolib: provide gpiochip_dup_line_label()
Date: Mon,  4 Dec 2023 10:35:00 +0100
Message-Id: <20231204093509.19225-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231204093509.19225-1-brgl@bgdev.pl>
References: <20231204093509.19225-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiochip_is_requested() not only has a misleading name but it returns
a pointer to a string that is freed when the descriptor is released.

Provide a new helper meant to replace it, which returns a copy of the
label string instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 29 +++++++++++++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a5faaea6915d..d4b33782cc10 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2400,6 +2400,35 @@ const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_is_requested);
 
+/**
+ * gpiochip_dup_line_label - Get a copy of the consumer label.
+ * @gc: GPIO chip controlling this line.
+ * @offset: Hardware offset of the line.
+ *
+ * Returns:
+ * Pointer to a copy of the consumer label if the line is requested or NULL
+ * if it's not. If a valid pointer was returned, it must be freed using
+ * kfree(). In case of a memory allocation error, the function returns %ENOMEM.
+ *
+ * Must not be called from atomic context.
+ */
+char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
+{
+	const char *label;
+	char *copy;
+
+	label = gpiochip_is_requested(gc, offset);
+	if (!label)
+		return NULL;
+
+	copy = kstrdup(label, GFP_KERNEL);
+	if (!copy)
+		return ERR_PTR(-ENOMEM);
+
+	return copy;
+}
+EXPORT_SYMBOL_GPL(gpiochip_dup_line_label);
+
 /**
  * gpiochip_request_own_desc - Allow GPIO chip to request its own descriptor
  * @gc: GPIO chip
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 100c329dc986..9796a34e2fee 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -532,6 +532,7 @@ struct gpio_chip {
 };
 
 const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
+char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
 /**
  * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
-- 
2.40.1


