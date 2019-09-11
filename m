Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A683AF72E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 09:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfIKHwV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 03:52:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43555 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfIKHwV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 03:52:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so9805897pld.10;
        Wed, 11 Sep 2019 00:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N/GjfbWA+RT4gvpUShhTUqBALupjPg41fqn6WwTjqE8=;
        b=ptdsTxWiTvFUGvrlP5m+kPG3LJsr5ASlqVgee6QnmwutqeOF4XtZu+TpCsbObJA835
         o85qjgzV3c84lTa5LkUKDnu5tu9O1qKqLvQyrS18y29TChjjHT8R/iSSkce33t9aOVsE
         hONq81j+SxOFVDN7fADn2XEtL3KExFt2A9qEj+uRKZrWiXfqeHV/fXND3zjLgAHlrNbL
         dbkqVNui7SrzfcEHddurH76YFOkyTgG42p2C3Pf3ZZx4Y2VzgZR15hp82o+gWbsS30MS
         8fqDONmh9OWhfc5ft4ibDVWrZa7CuvtZBmNhvqL1gQhs47olKancZufT7AgiwYwi540H
         Xz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N/GjfbWA+RT4gvpUShhTUqBALupjPg41fqn6WwTjqE8=;
        b=jVUaxdOxqqxi9JQ7PW9tpPlKKl2ZvycZl94ByRq4I58qZcakJqmzyGLCHW+HY0vQrT
         CZMtq3DPMHdLvGcihm+KE7x4cFrOGfWuGPRi15iwwPNQkTm+yQw0PsYskKB5ea673ESA
         2fSA1icgoploDf4m5f3j0MuNYv6242HGZ+fZtP5O8Jx0ZcjBipyOjlABhBeWRwdzk7ML
         lwFhiM+zX40h4o5pVKeItYUCEJJIjO4dTZYYY93pHZ7P9xwv5h4Jlq79pkUVt/rGiVy4
         Gc3FLfuQQucnSkskaNHUNERw5/hgM2ZH6p0qvQUXulH40IaQHll+aeHU8bu86HWBuT71
         98MQ==
X-Gm-Message-State: APjAAAUViKauaaMl4jAJPbF/y6+KvPsV8tAW6e2dTebvDMEmF6SsFyYP
        tK/zjMjhXKF2DouI4e/6P6M=
X-Google-Smtp-Source: APXvYqxIW0PX/nOXMMfVGvEomgvv0qKWZzTUpN7yhe8ZSsFC8YH78lNXUr9+MsjaA0JwM6OCWsVUEg==
X-Received: by 2002:a17:902:9f96:: with SMTP id g22mr24631406plq.212.1568188340495;
        Wed, 11 Sep 2019 00:52:20 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 00:52:19 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 01/11] gpiolib: of: add a fallback for wlf,reset GPIO name
Date:   Wed, 11 Sep 2019 00:52:05 -0700
Message-Id: <20190911075215.78047-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The old Arizona binding did not use -gpio or -gpios suffix, so
devm_gpiod_get() does not work for it. As it is the one of a few users
of devm_gpiod_get_from_of_node() API that I want to remove, I'd rather
have a small quirk in the gpiolib OF handler, and switch Arizona
driver to devm_gpiod_get().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/gpio/gpiolib-of.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index b45b39c48a34..8b773f7d7724 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -438,6 +438,19 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *
 	return desc;
 }
 
+static struct gpio_desc *of_find_arizona_gpio(struct device *dev,
+					      const char *con_id,
+					      enum of_gpio_flags *of_flags)
+{
+	if (!IS_ENABLED(CONFIG_MFD_ARIZONA))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id || strcmp(con_id, "wlf,reset"))
+		return ERR_PTR(-ENOENT);
+
+	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
+}
+
 struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			       unsigned int idx, unsigned long *flags)
 {
@@ -479,6 +492,9 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 		desc = of_find_regulator_gpio(dev, con_id, &of_flags);
 	}
 
+	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
+		desc = of_find_arizona_gpio(dev, con_id, &of_flags);
+
 	if (IS_ERR(desc))
 		return desc;
 
-- 
2.23.0.162.g0b9fbb3734-goog

