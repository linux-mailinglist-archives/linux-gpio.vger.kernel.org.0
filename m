Return-Path: <linux-gpio+bounces-782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CD7FF093
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A392C1C20EC0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEE7482E5;
	Thu, 30 Nov 2023 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1zTRCSLg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63CA10F3
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:47 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3316bb1303bso679868f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701352006; x=1701956806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JkcbylM7pAQh/R7rY3XvCoFJsyCRp+V27URZHzTJKg=;
        b=1zTRCSLgTdXz21Tn6xXOIRLL1FQTefqdWPzzetBIrrXOHVet7/oNgmIzaIBVxl3qBX
         Kj3oL0NiDJNwESGPukPK2xH/icTMM5wWoiB0atmwi8clfbVprTI0VtgWUXqodHjwjap2
         xqF2Z2UHBkeb5N/DnI+zWuIhfBZQJXjJF9UXDRkFmW5tPBYAzKRVwuEroL9OucU8WCuS
         mxtcE23Qnwj2fOktg+5XCBwhmsTc5qAwOUOJkOVQiWRzyMNJhO6J5D222fzlW7NIarg+
         n922xRYJYaRlAAR0IXKfVyXrgEdBx49HrnBTFkY206UW9UB2Ae8BvCmtSBK3w3B/ppsR
         CfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352006; x=1701956806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JkcbylM7pAQh/R7rY3XvCoFJsyCRp+V27URZHzTJKg=;
        b=YFoaxzM9bVZWk/071CpaLXVqdIRDAzBm1vPTfFWuW2D8qHigWkuk3lYEjXvLrWcJZs
         kahkZep3KVhE8eUwrX1SGJVGWzTrOxZVzdsh7bfWC3SbIj2D3ji3O9G3u6p/vCJKuUAL
         I+quII9s2OM5w8mhWHwuoYFomG9Fzy2pYyc6fN1DnfwGO5UHgzfTSU5JbBOQpxxxmcVM
         tOO+BxA0fstPAie/lw2PIerzMr9sJ9E5QI01qze8/zaOViuI+w2kTdBbROkk4B3WJQP1
         TieCw+D5Q9tPcuxJxZjfiffY2S92Xqv8BBQaDXp/zPqj0d0jvvFxSsoagR0Fa31wdf50
         gD7A==
X-Gm-Message-State: AOJu0YxwQjuHArjoyqLShJv56/OcV+RFOhDtaJLziXAzUnC6MUYApqoc
	JBheH/Iq0fZROxHNWWkUFIXFSw==
X-Google-Smtp-Source: AGHT+IFrUo2pYjPmikAyxVnU28S07nWrd/CCV9cpK7VFkHjyiiXqIwOTpiNbElhJRnnawaDyhekvAw==
X-Received: by 2002:a5d:4c84:0:b0:32f:b407:5b77 with SMTP id z4-20020a5d4c84000000b0032fb4075b77mr15296007wrs.64.1701352006413;
        Thu, 30 Nov 2023 05:46:46 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 09/10] gpiolib: use gpiochip_dup_line_label() in for_each helpers
Date: Thu, 30 Nov 2023 14:46:29 +0100
Message-Id: <20231130134630.18198-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130134630.18198-1-brgl@bgdev.pl>
References: <20231130134630.18198-1-brgl@bgdev.pl>
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
 include/linux/gpio/driver.h | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9796a34e2fee..b1ed501e9ee0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -534,17 +534,36 @@ struct gpio_chip {
 const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
+
+struct _gpiochip_for_each_data {
+	const char **label;
+	int *i;
+};
+
+DEFINE_CLASS(_gpiochip_for_each_data,
+	     struct _gpiochip_for_each_data,
+	     if (*_T.label) kfree(*_T.label),
+	     ({ struct _gpiochip_for_each_data _data = { label, i };
+	        *_data.i = 0;
+		_data; }),
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


