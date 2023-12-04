Return-Path: <linux-gpio+bounces-945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DEE802EBA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5458B20A47
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83831C693;
	Mon,  4 Dec 2023 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TyF8oO8Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5504C11F
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:24 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso12468705e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682523; x=1702287323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFuMwgQtxRBsqcDwlkNhBzIxKsoLICNRiZ90QrUgNUQ=;
        b=TyF8oO8Zgq6hfxPV1cMsjP9afRhf0hgNUOLbU4Rvb3ogaJCuwo2tbg9pTt3vb/IebM
         AROZcQCsq3zKUJZqkJvA/fEaIxOXKJjcEY6T6tvQg4RfBxMMkWwYrkG/6Y2w7hbESEN7
         su11gsvp3FgytTg3ae+qC+lzENKTTqmjusFlxmrleMq4o8cB5QyzJNBbwlgm/W/MK0bn
         YkdfqaTBpL+zVAZDHpZyRPa5Vtxy7cyP0s5W4jrtvB/m+dZavr+DjeLyyYPbbdryuhXr
         ycGSXUWyqOvVk/mjPpKxnge3EzO6KwRO60THue+HMQ5hInhfNoUIR38bRvw0C15EIHPk
         Th4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682523; x=1702287323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFuMwgQtxRBsqcDwlkNhBzIxKsoLICNRiZ90QrUgNUQ=;
        b=rl7lBMNw8buVbONDdShDoQwW3Cl2U+Ej4tFiS+r20vLCsEe88P/nyxlEDdjs+Fp6o3
         kjIpQLMOYUqpNhOBMERVmT8gAsrlxy56zbFk0ltS0kcxIsyU+1Kqa72IH8bUWCD+45oo
         xie2EClfmrZKsYrcA7GWrqrv2Vj3OHj1yaZIqyeoMUR+JUf+nMoj0qEej2piLiBLmrem
         sbLAUn8hrYr2cDi5VBKa9QFZsd4wI2nWDCLTfMUvLbmQFdUmdsGDZ86kabFrmjXzqDhR
         kmEkBkyiQQ7g6iT1A/CZRCpKFyNnLEx81kn48pXAoOq5Sfvv19s60bFr/qM3toRDbBrM
         ZgkQ==
X-Gm-Message-State: AOJu0YwZZdo8sHtiXy997ATnbWRxs04ELpaJPAuGsnjPt90jCr3MTs/w
	Ay26TW71AdH5OY/nCekx0iQqYw==
X-Google-Smtp-Source: AGHT+IFKo4W36xXyE4SejxNtVX66lYuHh3b28bjD0alZD+yoHQII9dsGu8t9qenz9PMKxEkEtHV4Yw==
X-Received: by 2002:a7b:c397:0:b0:40b:5e21:dd1e with SMTP id s23-20020a7bc397000000b0040b5e21dd1emr1025046wmj.76.1701682522864;
        Mon, 04 Dec 2023 01:35:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 09/10] gpiolib: use gpiochip_dup_line_label() in for_each helpers
Date: Mon,  4 Dec 2023 10:35:08 +0100
Message-Id: <20231204093509.19225-10-brgl@bgdev.pl>
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

Rework for_each_requested_gpio_in_range() to use the new helper to
retrieve a dynamically allocated copy of the descriptor label and free
it at the end of each iteration. We need to leverage the CLASS()'
destructor to make sure that the label is freed even when breaking out
of the loop.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9796a34e2fee..910fc50d3ab5 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -534,17 +534,38 @@ struct gpio_chip {
 const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
+
+struct _gpiochip_for_each_data {
+	const char **label;
+	unsigned int *i;
+};
+
+DEFINE_CLASS(_gpiochip_for_each_data,
+	     struct _gpiochip_for_each_data,
+	     if (*_T.label) kfree(*_T.label),
+	     ({
+		struct _gpiochip_for_each_data _data = { label, i };
+		*_data.i = 0;
+		_data;
+	     }),
+	     const char **label, int *i)
+
 /**
  * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
- * @chip:	the chip to query
- * @i:		loop variable
- * @base:	first GPIO in the range
- * @size:	amount of GPIOs to check starting from @base
- * @label:	label of current GPIO
+ * @_chip:	the chip to query
+ * @_i:		loop variable
+ * @_base:	first GPIO in the range
+ * @_size:	amount of GPIOs to check starting from @base
+ * @_label:	label of current GPIO
  */
-#define for_each_requested_gpio_in_range(chip, i, base, size, label)			\
-	for (i = 0; i < size; i++)							\
-		if ((label = gpiochip_is_requested(chip, base + i)) == NULL) {} else
+#define for_each_requested_gpio_in_range(_chip, _i, _base, _size, _label)		\
+	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
+	     *_data.i < _size;								\
+	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL)			\
+		if ((*_data.label =							\
+			gpiochip_dup_line_label(_chip, _base + *_data.i)) == NULL) {}	\
+		else if (IS_ERR(*_data.label)) {}					\
+		else
 
 /* Iterates over all requested GPIO of the given @chip */
 #define for_each_requested_gpio(chip, i, label)						\
-- 
2.40.1


