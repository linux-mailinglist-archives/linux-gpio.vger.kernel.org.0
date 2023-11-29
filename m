Return-Path: <linux-gpio+bounces-673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5127FD93C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 381C8B21336
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F81F30CEE;
	Wed, 29 Nov 2023 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="crqE15JI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9479DF4
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:24 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b31232bf0so54742305e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267863; x=1701872663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2vlGJhIze8sK7FhkyHeBLiiHYWZ044RLoNjc90UYtQ=;
        b=crqE15JIivDRD7HPz9UTlXpZe8y6b3M0VcIyqiQVPCgE+EgTIuWAAjCRr8hdm5pIg5
         LHoZXe1ssMuLx7Ib1ksYYzD+7ipHUTZ5LLmpuHpWIPkRiHs8g37qiPeMtNq7RHJBCPKw
         tPR08+j7Do9gwDUkDi811MWKlE8nHUteE6W4Ge5vzYAqz4oq6wYHQ/72e10JG3Sct41s
         ldeGuzNoJcUmac9UgntzSZyvTGFoAAnluth+IO8yOUd9DSWbog4GOJ8EGEruztwtgDYl
         Vip9o8zX5WiBDZzdVkzV9cE1wouOKid3FvHM7Gikn4WG3gvPx5xhrdR5IjBsHxxofJb0
         IXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267863; x=1701872663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2vlGJhIze8sK7FhkyHeBLiiHYWZ044RLoNjc90UYtQ=;
        b=DJTX/rww0Le2dbgXJuakhKtDKwqUDtDso5tCSH/gbM6OYaItJAn7LVND4Ni9rtytXP
         I1AoswvS70nsjEL9Kc7TdkZsVdvzqzIbrEtxa129pAXCmHCwsSovOH0i4bIhSsIq7O16
         PfGD9uIqMMS01nuhWGv2BLoOZ4Yinhlcn2lG/BALdcVuQp5QPpyJAADyLJDnWgfH3oE+
         XjoAxplpIATIvFIjWGrRcYv0eK89tH9UP8zdaqCYG4ic7yHqCfUmN3CRkxzCpv/PlyPd
         /bnRgO5KfK8JP3UM6+K5hdJKTr/vvivHZ9jmtoP74GgzCAOB+VT02UQBY+fPiH9sqq4b
         zl6w==
X-Gm-Message-State: AOJu0Yzq0lLQmKAZW+E+gokMLI+noANykS6otifi/B4ChyO+nE3Tn3s9
	5GRwITk1YIRJ/OrT8fzyA6/TEA==
X-Google-Smtp-Source: AGHT+IF+n+Bguen0U7DsO4xPBjVSnhr/bzmyaozCPrrt3u3QTE29we1fJcSv4k6cx5guAABEETFQtA==
X-Received: by 2002:a05:600c:3510:b0:40b:45e2:1f56 with SMTP id h16-20020a05600c351000b0040b45e21f56mr6396343wmq.39.1701267862985;
        Wed, 29 Nov 2023 06:24:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 01/10] gpiolib: provide gpiochip_dup_line_label()
Date: Wed, 29 Nov 2023 15:24:02 +0100
Message-Id: <20231129142411.76863-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129142411.76863-1-brgl@bgdev.pl>
References: <20231129142411.76863-1-brgl@bgdev.pl>
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
index a5faaea6915d..8e932e6a6a8d 100644
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
+	char *cpy;
+
+	label = gpiochip_is_requested(gc, offset);
+	if (!label)
+		return NULL;
+
+	cpy = kstrdup(label, GFP_KERNEL);
+	if (!cpy)
+		return ERR_PTR(-ENOMEM);
+
+	return cpy;
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


