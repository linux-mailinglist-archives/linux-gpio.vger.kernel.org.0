Return-Path: <linux-gpio+bounces-179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0387EC8EE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 230A01F22B42
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 16:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6811233CDF;
	Wed, 15 Nov 2023 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XkuusTBH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B528DBD
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 16:50:10 +0000 (UTC)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF94419E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:05 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6779fb43e5cso32799356d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700067005; x=1700671805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc2uuTZzlGTGKEpxHmVUvwPiBGhZ61eMxIga50Is5Fw=;
        b=XkuusTBHn8B2hnTOerw4/6xlZ9ZWIUFmQ1oKhS1SW9ZDRGpHrhhn4uZ0uNT8qqIPYe
         oDSFpAQTP9qlq4NXMxzXHCUC9gvHVbUSW9hBAO/SkvdAAFi/5fF8gk9tM+E9knrT9Nd4
         ju62hBBll4lyXxs+13o1+IOUQTA8tuGVrXKXm2W3whWF2OdyxSUMCLahGnB5CfyqgdbB
         Q+T20NGEuVBEsbihPPsjIJhHLg82orZiEDlFmuL6BD7ZMdOqjGU6/6zSdo3+wfgnrAJM
         o9v4y211rCxztIA0vD4qSHw2k1iRciUrkp5OQRv28H25pfn+rq4lnLqepo5lPC/Btfmx
         mvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067005; x=1700671805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vc2uuTZzlGTGKEpxHmVUvwPiBGhZ61eMxIga50Is5Fw=;
        b=SD/uLjvhSPbs8xqcfdAObcAlGDN4w5FS8JpgMS8Th3rYQ9T/+EueLK89V5VANxTAOf
         Zb+MmYJeB1CsFwD7xYfPi/yogrxJ3OpakQ2In9gJkCqcp4lNVm3+I1H8iPzAzSRGu2sL
         jW7yrtPEwJ5bSBvrokI8xTnXKA9WF+zSpuvh/H3CNpygGxQOtFtJJq8KVZVDodhxr03w
         RLxbjnOPVi1VcX96oiWGdI/7+1GiNheLipej/NFKfxyt5Ld+mohCM7SbpJgeedpuAQZ0
         9lWUgWqcZYe+sDLxH/FcqnuvwQiHLqmpwB5oi+z8wlX0mV2ZlWa4wZIvwme9nq60BjCo
         FrpA==
X-Gm-Message-State: AOJu0YzM+Dp5hQ9GO2RekfvIbD5YLLnOC1wjW0UgwZ4pbDxo9JHQCheU
	YmxulfcXhsZOylQ1xdYhYwkvGQ==
X-Google-Smtp-Source: AGHT+IFz4DMZPFCc0axXCLers6mb90y64kt+KnZAZ09JG9DWqdGGF4MW6AF1dSPrKb6dRAw/PuIyvg==
X-Received: by 2002:a05:6214:4104:b0:65d:4840:6eb4 with SMTP id kc4-20020a056214410400b0065d48406eb4mr7154624qvb.6.1700067004848;
        Wed, 15 Nov 2023 08:50:04 -0800 (PST)
Received: from brgl-uxlite.. ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id mn16-20020a0562145ed000b00670a8921170sm658781qvb.112.2023.11.15.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:50:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] gpiolib: provide gpio_devie_get_label()
Date: Wed, 15 Nov 2023 17:49:59 +0100
Message-Id: <20231115165001.2932350-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231115165001.2932350-1-brgl@bgdev.pl>
References: <20231115165001.2932350-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a getter for the GPIO device label string so that users don't
have to dereference struct gpio_chip directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 14 ++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 95d2a7b2ea3e..a5faaea6915d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -254,6 +254,20 @@ int gpio_device_get_base(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_base);
 
+/**
+ * gpio_device_get_label() - Get the label of this GPIO device
+ * @gdev: GPIO device
+ *
+ * Returns:
+ * Pointer to the string containing the GPIO device label. The string's
+ * lifetime is tied to that of the underlying GPIO device.
+ */
+const char *gpio_device_get_label(struct gpio_device *gdev)
+{
+	return gdev->label;
+}
+EXPORT_SYMBOL(gpio_device_get_label);
+
 /**
  * gpio_device_get_chip() - Get the gpio_chip implementation of this GPIO device
  * @gdev: GPIO device
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0aed62f0c633..100c329dc986 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -786,6 +786,7 @@ struct gpio_device *gpiod_to_gpio_device(struct gpio_desc *desc);
 
 /* struct gpio_device getters */
 int gpio_device_get_base(struct gpio_device *gdev);
+const char *gpio_device_get_label(struct gpio_device *gdev);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.40.1


