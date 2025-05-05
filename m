Return-Path: <linux-gpio+bounces-19595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BE9AA9228
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 13:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FFF1172DB5
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 11:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75652202C3E;
	Mon,  5 May 2025 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpDJsqaL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E3202963
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445077; cv=none; b=Zjnt4E7jTPNwrzhnKicve+7oV/LWk6FNmraOOqimmvPt0kOiiLvzIsO0aMAVkxBVM4p4q+kNSOM8jf+wD0iTPg2KUyfkDGE+xYFmBs356l5p9dSq+XH5341kh1LLS1NWxmaUFAEIs17UU+/4j8T4JNN8wuKOP96eRot1Y3Jxku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445077; c=relaxed/simple;
	bh=msIu5pu5l6E3KRgt1qjtII1INljwPzQsjxoJDPpqKng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl0tpXEiWfv5Zpzp/NEU8U+i+RvJJpdD8olE7RLaE9SFTrdyrTmvrddA6C4NG/ZyfBMARHX52rU/QaT2XQBFCPzTVBp0GeqKy4zh+Y8TMnZpwr+nhsgtp0jFLOTijkjOFJi+e+2iX6LjB0WqvjU257zMA3NilkgWQ1bg6Df7Qdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpDJsqaL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3285218f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445073; x=1747049873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3kJw4Q1b9fZtWhj0ZAhlfc3rScj6eP/tzzAKRlMKnY=;
        b=FpDJsqaLx3U+IXm8VUJ94WB9L83Xsx/k42msz5Z8pd+WWa9wvcefdXFnAQKuUbXR3P
         c4GEOg8hPUrvRIq5GUG0US4wn1ESqvdqnRH+VxL1r88PPPSKJdw2rFcF/Qp2gnTSCniU
         BdQs9Ty1zkEFTI3fn7QPIjDMljY1dR5olxJmx6yrWyFHu9F2gjGbkrauI9s5XQ6DrLUb
         QbCtvriTjNvLGFWXEaAHi2LBEqaAwvF/qUSEwxtUd887GpoxRTjIJUyfya9ofsyTTU8j
         rEA7F5LGWaCwXfHNxZnc/sMSwtzDcurCn4GdIUWJLZRoZHU7V3L3FMS4hL1dTfwt9HvE
         DhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445073; x=1747049873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3kJw4Q1b9fZtWhj0ZAhlfc3rScj6eP/tzzAKRlMKnY=;
        b=xFj41pwQHnB30XOWtJI68Pm29GKeSRWCVGYY9DuWRFALF7ljIBB4g3AzzwsTyDVGRJ
         FEtBoPo5WPOLlk5WobzJ0ukfoe2PEGfPXpvmZuUkxp/eoLmw/BKr6K3IiLvRsYPEM6Rw
         1KqSpbINX2aMkGQjwUttY+1/HGuHxvRBIEpYGHgSC06Jm6mWHIfxGewxr5PcnA19iwRw
         5of+aADGSzDJ/DrvoAlE5aoYHe8rRCV9LkDwJ2BW30vfh0owyYSRpRJcW+Km+dScU7AZ
         fteB9dWfNYQEiaqbyX6EmoqjQ8T82HWK7eTeht+uRjpe5MN/TLwgsAu0kBh0/Usid8GR
         Ikjw==
X-Forwarded-Encrypted: i=1; AJvYcCXsJgrxiBoM1kaOS2Rw18S1L3AYa02GHkZSx6W6eCLFAt7VEb8UETX7bY9c/I76IVeqIQshODfiL4MR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98FS9m+AUq68lnwWmQkuNLXCKWSgjy7bc77KoyedFZcrWZH40
	R8Qtw8r7xkGuOJZduEOpBVJfqFdGQPbsNTBZKW5Rn42RLlwEwjVq61HwH1WOJPs=
X-Gm-Gg: ASbGncsAkgePYHlos02RgFGwSNA3RKMo3tqhgLNHGsUEEBMuiRPQRB0Kxl1fe4f6UXX
	amDcrhPqA2LpMu9QDJEBOCugbz7I5gyiCeB3rRD8nY3yuD0a0qRChnmLblsyzeoSGk4pcTMe+bg
	e2EnJZUymfYoPKx3QsxODNNmRCrQKEO5wwn/yYu3K7oSekSkD9E8+rAwAz1NPzmlzxgLtbcU6qG
	MWJx/CYGYGHvGtEOi2BGTC2OkmGAeBxForQhHQYlxpBz64hgg8qHE3yN1+FR30gJqsFrSZoUr8i
	VEStcdEKtOSXnYkwgZkKms3mpAWygrAfWYpIvwnFbEPOyQ==
X-Google-Smtp-Source: AGHT+IGPxugxwn+CsjAzxvLOzVE663H1t3E4BLdwFviF5LobM1IDVpFgBNA5rWFTXIgUJVgNZmuhHw==
X-Received: by 2002:a05:6000:400e:b0:3a0:839c:271f with SMTP id ffacd0b85a97d-3a09fdbcdfcmr5292749f8f.47.1746445073614;
        Mon, 05 May 2025 04:37:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b17260sm10423126f8f.98.2025.05.05.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:37:53 -0700 (PDT)
Date: Mon, 5 May 2025 14:37:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: [RFC 3/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <0e982ace876920162d27a521f5f460b1dd6fc929.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

This is a counterpart of pinctrl_gpio_set_config(), which will initially
be used to implement gpio_get interface in SCMI pinctrl based GPIO driver.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c           | 35 ++++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 ++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 4bdbf6bb26e2..4310f9e2118b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -937,6 +938,40 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
+/**
+ * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
+  * @config: the configuration to query.  On success it holds the result
+ */
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
+{
+	struct pinctrl_gpio_range *range;
+	const struct pinconf_ops *ops;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	ops = pctldev->desc->confops;
+	if (!ops || !ops->pin_config_get)
+		return -EINVAL;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gc, offset);
+	ret = ops->pin_config_get(pctldev, pin, config);
+	mutex_unlock(&pctldev->mutex);
+
+	if (ret)
+		return ret;
+
+	*config = pinconf_to_config_argument(*config);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
+
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
 {
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 73de70362b98..e5815b3382dc 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -35,6 +35,8 @@ int pinctrl_gpio_direction_output(struct gpio_chip *gc,
 				  unsigned int offset);
 int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			    unsigned long *config);
 
 struct pinctrl * __must_check pinctrl_get(struct device *dev);
 void pinctrl_put(struct pinctrl *p);
@@ -96,6 +98,13 @@ pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
+static inline int
+pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			unsigned long *config)
+{
+	return 0;
+}
+
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
-- 
2.47.2


