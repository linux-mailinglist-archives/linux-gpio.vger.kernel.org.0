Return-Path: <linux-gpio+bounces-23537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DAB0B7FA
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 21:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84AFD3BD1EB
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0D7223719;
	Sun, 20 Jul 2025 19:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1q5u3x4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C922425B
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040334; cv=none; b=QfQHuV5e5iAOZwMx5Mt2zLLB1SN6PIpdaN91W9ImKhxYvbFXLWPwgNUSwglClB16yVmyIaUxd8lJlqPRXI/9KbsPXebDyIKnEggaIQ72tMxomshdyRUmEoLGlnT39S+rdJqY6SkxeAOmNbjvJQZAWyq7VDCcTtJwzf5QVdWL938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040334; c=relaxed/simple;
	bh=mYX7pyCKmgBI3xkaCZ3OcyOD6ECMbja6Ks4OfZzYD0U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8/v+1LQ2i8k0FNot9Zxbr+ur0z7YCpZrv+p2NzQpbecAlpgvi1w48cnT0aUBsSk3NNmsKYLucFqQaNAaZpP7KXUZ0C4A9TGZImK2DqO7GcsOd43zNv3DoHTIAkdfXDg3JSkNPjV/gRBo67VThMgg+gQ95DmPGM/xszKEdvVLlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1q5u3x4; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-30194d82366so1217403fac.3
        for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040332; x=1753645132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ8CW0vLOfnenhTuOWc+TeZEp3L4Zf69FjBvFuh8CCU=;
        b=E1q5u3x4B/jU8dBh3OI7i5oFnomFS/yqXGh7i7eibqWMDCDVF+YHgXvPPkmK0g131u
         KZltk0AjUoyYqdF+ly+ZJFucbWBIK0sB6mMrCFyRhjne1rjfBcMIsYjd3a9ThdE2WX4D
         XbpPChMrsUZl5NZDdySchkilblrGn9LM49JrFEQDPCs1U3JW4FEIry34/pDOcNf4KLEZ
         L8+Be9LuHlLt2LyeYc6sbzd6UREd7qT4PEysPrQgnvnpz6F3Xpdv9FgSX9SShVdRQOad
         vPyo2eM7lp5G43DgTC3m7Hew5KvdgmVK+POkBGBDk74wrj5imbvO+nx5mtu+BowgQBKk
         w5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040332; x=1753645132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ8CW0vLOfnenhTuOWc+TeZEp3L4Zf69FjBvFuh8CCU=;
        b=hwNQ9x+lyTyTPeaC3cuhOe09rRPPSt3FrPp5Txof+VJq+fR6lpkBfwXj87TMh17Rix
         ILjSaY+zqRYdmdQZduwkPiAf+e9dVZ3rZB2xqY9PhB2N0aTNcnsEzPor7cjIxDfpbUWP
         xe4QAfUdezbsGK6igvKj1eTHipUNQ1mFZ1lwsXo1gXvG0JIIbXLegZKBJrd1YrjNGDGv
         PESoMjjSzb/0/fNB1UF4483NM9gLWsq7h2upjG/V4BS8Dt8AyOSla4vGQqu5fvvqp6+v
         0WyvaT5DuLnzNDDiwgs0uo4tqY3DyVszWSuBjujcGO8RWkzxwNNY1EqbBOw/Jz3HJ9+J
         IrVg==
X-Forwarded-Encrypted: i=1; AJvYcCXk/Ws0NY7fWQ/+j+A6u/ZzvH346lGF2/CrrLfIEnWi6S/61nJ68w2Z3Pf+kGBzhjl//mYG71BVDN3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwQc/a3hj6soWxB5+Fnpk+CPJ3eiPfiXj+nGKfShq3NUhf6b1F+
	GtRyM4HktLmE1vQNej+s9yX3iFDunRwSlqMKXfwqtLyMw/WaojYdEJfhxy69cwgR8A4=
X-Gm-Gg: ASbGncvoQO+OhToCl2XWEN+wXo3hbmM6wXk9CXtkGy6f35Pm/jGMMPVWdeagvOF0vCD
	OGIZ7teFoqjE+3v7wF/Lh+xbVccgPyUGaROKiy9athvZuVlDAMEQO/lM2CN/4alpBTZVWvD6eSP
	5+QQNZ1JbYmC2nBjMKWkQcRLfoSeOyeRh09cz7gKskGLG8jvJm6TKC79L5cBNn9IsgKUXsUfSaR
	LKwU+rW+daLDRgriuQvUmhMiba8ZluenD8mcCZWzan2D0kRyHJJ/nqulsV2opPHFbWyy9dePOib
	BF06f9ypPp34DFTpY6lCERYHg2gpwGL1c/1octadD4kXWn0quO6Hx3caM7WfymsCo5ETtMTAFmF
	8An1Xhmd6/R2H7w==
X-Google-Smtp-Source: AGHT+IFbjLhU8/44DbMUEvvTUW/4Nyns5hHtifrjZpoaHHE4Bl1HkYPNemmL3YlLCmSkuw2CsDAi/w==
X-Received: by 2002:a05:6870:4149:b0:2ef:ac47:798a with SMTP id 586e51a60fabf-2ffb2246fc7mr13966393fac.9.1753040332019;
        Sun, 20 Jul 2025 12:38:52 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-30104256720sm2795172fac.33.2025.07.20.12.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:50 -0700 (PDT)
From: AKASHI Takahiro <dan.carpenter@linaro.org>
X-Google-Original-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
Date: Sun, 20 Jul 2025 14:38:48 -0500
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 3/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <c15de1d1-e72a-48d8-ac45-95a6578e29b1@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>

This is a counterpart of pinctrl_gpio_set_config(), which will initially
be used to implement gpio_get interface in SCMI pinctrl based GPIO driver.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c           | 35 ++++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 ++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 73b78d6eac67..bbcc6881b119 100644
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
+ * @config: the configuration to query.  On success it holds the result
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


