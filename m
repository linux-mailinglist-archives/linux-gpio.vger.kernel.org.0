Return-Path: <linux-gpio+bounces-681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB47FD944
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36F99B21737
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7180B30D04;
	Wed, 29 Nov 2023 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b2ZS6wga"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C666C10D1
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:32 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b5155e154so8430175e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267871; x=1701872671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fr1TOXD+5EiiAKWXZPldv8mvv4Hxfk7OfOL3Vw/aLQs=;
        b=b2ZS6wga3v9XoxDjeUSryuw1P4M6qlXzKNKjP25dKpR2fGbQkDw6OlONxWl6vU+60W
         vBvnnoN19QdApekYchbioO0xkDXZWeS9uGMY315nz8+jc9GCZfp1FYrzehNWBL3In4Hp
         kuqk02sODqkYicoWGnwkgmyYg/mVEer1w2PUL+rrBQYRsF4+6+BBdcXK6SKQQQ9fFzKR
         4/sMLazccw4ZJkEXhVOOBRWtMPpjHfAQDR1CE4JTd+YKPXRU8Al4N+12V5AF0MkwYo0Q
         awHCZ913nFmMcU8BYLhjfODTfHBJXm9gQPVuVQVpsp4quE9tPp9Yz6ZjOMmDGQJ+0n+i
         6q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267871; x=1701872671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr1TOXD+5EiiAKWXZPldv8mvv4Hxfk7OfOL3Vw/aLQs=;
        b=Fyd+l8UCmXiFCkl6O55oU73mqVpelXSiJ88ev50wiMRlgH0XxBlWcAbxxkH9KuEMDz
         P8Z3ZIy4CAuBKkk/h5pwNCxEovrr+YSBoWNw4MXIeT450BGHl73ZzaSEwlU/Lj24PyT0
         T5pRyJbPQspH3KpQfPuAzSKrQ2b3/QLgQW5lWXo/nzlmk1pxWEHBwEuYx5Z3XRGerDeJ
         ZtA0KSpR6q2znTZ2V7nGirAVZ2iPwdnentDqiHw8SkqckJAuIHKWJBcRfEZvLHO7dbi+
         XIbTqsh20BpQY34Z4dmhLd46jaP0MVPkqHpCFLkYkUolZ7lSgkYUUaJ9KahHiHf+xP3k
         dEKQ==
X-Gm-Message-State: AOJu0YzYYRP2uLexnPG7WJ9HMTeGTxkSpJjKPWE0r1mXnBtGW6qmW/zJ
	fqJbYVVZ1j3YbQHRJIEzz/klqQ==
X-Google-Smtp-Source: AGHT+IGXheSQA/LGa1P9UW8p+tbga/Gnp13k7Ued9roRRHog+HQ8GZ429C+BiN61YuawC8IhiKC8tw==
X-Received: by 2002:a05:600c:1c9d:b0:408:434c:dae7 with SMTP id k29-20020a05600c1c9d00b00408434cdae7mr10543652wms.2.1701267871356;
        Wed, 29 Nov 2023 06:24:31 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 09/10] gpiolib: use gpiochip_dup_line_label() in for_each helpers
Date: Wed, 29 Nov 2023 15:24:10 +0100
Message-Id: <20231129142411.76863-10-brgl@bgdev.pl>
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

Rework for_each_requested_gpio_in_range() to use the new helper to
retrieve a dynamically allocated copy of the descriptor label and free
it at the end of each iteration.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9796a34e2fee..6405f6d454af 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -543,8 +543,10 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
  * @label:	label of current GPIO
  */
 #define for_each_requested_gpio_in_range(chip, i, base, size, label)			\
-	for (i = 0; i < size; i++)							\
-		if ((label = gpiochip_is_requested(chip, base + i)) == NULL) {} else
+	for (i = 0; i < size; i++, kfree(label))					\
+		if ((label = gpiochip_dup_line_label(chip, base + i)) == NULL) {}	\
+		else if (IS_ERR(label)) {}						\
+		else
 
 /* Iterates over all requested GPIO of the given @chip */
 #define for_each_requested_gpio(chip, i, label)						\
-- 
2.40.1


