Return-Path: <linux-gpio+bounces-23539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C1B0B800
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 21:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9EF33BD499
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF27E224B06;
	Sun, 20 Jul 2025 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ct66e4xf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD541221F0F
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040350; cv=none; b=jGhwEUhQBAgX0MpXY0TpiNobhDo4nBaup5u9p4AaUWWbQE2wsC2fG0JTNaDn4wr+z70xNCqSh3TpgoscFt2tnvC8m3y7wnLs4yTfgAoX+K99DvL9BbB6PdR8E7jEL2zbhUzU4hBnQ4y0g8SimRs3G4tn/ZcY5D4a5uIeZ6ndRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040350; c=relaxed/simple;
	bh=iDtvHuWeWWAvaDrc1D90AZ0sVF5gJEyOSaBvzWOZYBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILEhuNIUbWRQJERXrRMpetLnjblqWmW5GgPHKDukMe0nOxxfJucS71xepsJtxLbzqKOgNkRtUiY3jeiiQ3fEKtlj0IrFH9MPkRf1rceZjNi1WapFmiRPE1YMsom4sgfj8tq20X0RQkpAKC7zPAqBLq68Yn82Fdq9OesRhLww5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ct66e4xf; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73e810dc22dso1441064a34.3
        for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040348; x=1753645148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzWMDQiQhqKDucj4xDCvdrZWSeCpiJ1tZaaA5u2Est8=;
        b=ct66e4xfWyBumlCu9mdkTKmo7lpkX7txgrmlVNZocTJPFVh1tbH2hrQ3S/PXrb7DwT
         QGyA0vqLPgWwF4RnWlo3sqZQy5/bVeuuOKFFiMc/atQk3ceL8V3fvuBkMhJVTPZAhRCe
         AGt6WU6GLn8m2MjevlH931ZIwKjIVEF7bsXFkxR4i/NjAcCXSqHVBDZiQ/LbDR3Vh6PR
         8Bt+9Ip0ENszW2iSzjkr7ssszsixlbxdSOu8TZpWTAbbD9o32EGg5wVdF0N3zBzLJCHT
         DAMTTkHaiKUNHnOZocAULkPweHjDu0oy717DVCPYceU6FViqGgffPzWwKzyNMtf3f+3q
         95aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040348; x=1753645148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzWMDQiQhqKDucj4xDCvdrZWSeCpiJ1tZaaA5u2Est8=;
        b=C5se3LYVHBcKO1KY0JzmMV5Yq+d0GrwHtEU78TUxhZLvVLL5ij3lfyGjsxdGOPrSjY
         5Mfrfei7RdwPmaitHeKN8pMJI6TNJYphbOYnhu9glmieLLV8K66wSNJGfobOPrlGQ4ht
         PzSIOschMmEQcJGRY4HJQq9yOLABPQMsfm7gnGT7mDBo11k2vukUR1p8g8FAkauhU6X4
         vgNqpuPrKCG8tbUn4X/twZdBa/pkwJbXmhvJvvCE4oTkoLvaqqlW4B7W+0Gkh1ByQygj
         uGdnxtWJRt1OrSIJI6ryGNS6mh1nV+eHoqKJWkXjufV2YILeTpDG4HN2FiWLhu+AisZY
         bazw==
X-Forwarded-Encrypted: i=1; AJvYcCWIDzTy+Y/t7Y1nbzk2VFl3ItrSElbT6if9FnuxYvmR3A34ZKeQiHlc/l5+O2bDxsfb3tT+/rkQSwDY@vger.kernel.org
X-Gm-Message-State: AOJu0YxwKoK7XXKVQ59ls1ajpGi1AOf3She+xDOW68ucTFVun6JA0zcu
	JMmvLbTUUNPMHK12dd6ER6trag1DMWIHcvTvsEo3zS0Bzou5dXeNRlXvZoSB8q1D+I0=
X-Gm-Gg: ASbGncuhZ1XK4c9GchS3YySmOPWbuCI2pPI4q9Q4cjeQeWkohMqbcSKCA+CynNeT0az
	KoOJLNmDvVzN6zmJgsZZRz0GZq7aM/lxVEfh+AcruJZfngYogctItvZLD3YSXGkEHiPwjW4aD1l
	qozMIv+khw+i3Qbws4w9k1PAoXmeTZ5RBgn/AWEFbiV/K5oxy6LZ2NhCyuo6AzA07NWH4I/4jmi
	y6sh7grg+aT7XDEJ1RReZ3D3nKpJRf0xqDluAZb8L3zHZXre8Wn87sN7oZf2p/fvD4R1m474Ds1
	t0+uXdwJIPhFPXgU0AfnFcPIOXF4+EVWlYLCqxWZy2QzdhyZtaRHjm0pL+PYSDBRzLzbDoB75jI
	Vb4CxUcWQaaI=
X-Google-Smtp-Source: AGHT+IHG0eQajqarHbENrvaixxkoziriMrVyGz1oaBStUnyceEv9srArOzG9hJaXtUODGRIJ4Pm6Aw==
X-Received: by 2002:a05:6808:3a15:b0:40a:533c:c9cb with SMTP id 5614622812f47-41d05654bcdmr12175951b6e.38.1753040347679;
        Sun, 20 Jul 2025 12:39:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd498c1cbsm1799638b6e.27.2025.07.20.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:06 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:39:04 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC v2 6/7] pinctrl-scmi: Add GPIO support
Message-ID: <bd79aa90-73f7-4d7b-a340-539b52a73bcf@sabinyo.mountain>
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

This adds GPIO support to the SCMI pin controller driver.  It's an RFC
patch because I'm not really sure how these are used and so I don't
know how they should be configured via devicetree.  I've labeled the
places where I think devicetree configuration would go with a FIXME.

This driver was based on work from Takahiro AKASHI.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c         |   8 +-
 drivers/pinctrl/pinctrl-scmi.c | 206 ++++++++++++++++++++++++++++++++-
 2 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index bbcc6881b119..91882c68bcd5 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -947,7 +947,6 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
 {
 	struct pinctrl_gpio_range *range;
-	const struct pinconf_ops *ops;
 	struct pinctrl_dev *pctldev;
 	int ret, pin;
 
@@ -955,19 +954,16 @@ int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned
 	if (ret)
 		return ret;
 
-	ops = pctldev->desc->confops;
-	if (!ops || !ops->pin_config_get)
-		return -EINVAL;
-
 	mutex_lock(&pctldev->mutex);
 	pin = gpio_to_pin(range, gc, offset);
-	ret = ops->pin_config_get(pctldev, pin, config);
+	ret = pin_config_get_for_pin(pctldev, pin, config);
 	mutex_unlock(&pctldev->mutex);
 
 	if (ret)
 		return ret;
 
 	*config = pinconf_to_config_argument(*config);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index fba0a3a2fc10..9a947ced0df7 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -6,6 +6,7 @@
  * Copyright 2024 NXP
  */
 
+#include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -16,6 +17,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <linux/gpio/driver.h>
+
+#include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
@@ -42,6 +46,7 @@ struct scmi_pinctrl {
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
 	unsigned int nr_pins;
+	struct gpio_chip *gc;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -505,6 +510,197 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static int pinctrl_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	bool in, out;
+	int ret;
+
+	config = PIN_CONFIG_INPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	in = config;
+
+	config = PIN_CONFIG_OUTPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	out = config;
+
+	/* Consistency check - in theory both can be enabled! */
+	if (in && !out)
+		return GPIO_LINE_DIRECTION_IN;
+	if (!in && out)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return -EINVAL;
+}
+
+static int pinctrl_gpio_direction_output_wrapper(struct gpio_chip *gc,
+						 unsigned int offset, int val)
+{
+	return pinctrl_gpio_direction_output(gc, offset);
+}
+
+static int pinctrl_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	int ret;
+
+	config = PIN_CONFIG_INPUT_VALUE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+
+	return config;
+}
+
+static void pinctrl_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	unsigned long config;
+
+	config = PIN_CONF_PACKED(PIN_CONFIG_OUTPUT, val);
+	pinctrl_gpio_set_config(gc, offset, config);
+}
+
+static int pinctrl_gc_to_func(struct gpio_chip *gc)
+{
+	struct scmi_pinctrl *pmx = gpiochip_get_data(gc);
+
+	return (gc - pmx->gc);
+}
+
+static int gpio_add_pin_ranges(struct gpio_chip *gc)
+{
+	struct scmi_pinctrl *pmx = gpiochip_get_data(gc);
+	const char * const *p_groups;
+	unsigned int n_groups;
+	int func = pinctrl_gc_to_func(gc);
+	const unsigned int *pins;
+	unsigned int n_pins;
+	int offset = 0;
+	int group;
+	int ret;
+
+	ret = pmx->pctl_desc.pmxops->get_function_groups(pmx->pctldev, func, &p_groups, &n_groups);
+	if (ret)
+		return ret;
+
+	// FIXME: fix the correct group from the device tree
+	for (group = 0; group < n_groups; group++) {
+		ret = pinctrl_get_group_pins(pmx->pctldev, p_groups[group], &pins, &n_pins);
+		if (ret)
+			return ret;
+
+		ret = gpiochip_add_pingroup_range(gc, pmx->pctldev, offset, p_groups[group]);
+		if (ret)
+			return ret;
+
+		offset += n_pins;
+	}
+
+	return 0;
+}
+
+static int get_nr_pins_in_function(struct scmi_pinctrl *pmx, int func)
+{
+	const char * const *pin_groups;
+	unsigned int n_groups;
+	const unsigned int *pins;
+	unsigned int n_pins;
+	int total = 0;
+	int i, ret;
+
+	// FIXME: get the correct number of gc.ngpio
+	// Find the right group from the device tree
+	ret = pmx->pctl_desc.pmxops->get_function_groups(pmx->pctldev, func, &pin_groups, &n_groups);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < n_groups; i++) {
+		ret = pinctrl_get_group_pins(pmx->pctldev, pin_groups[i], &pins, &n_pins);
+		if (ret)
+			return ret;
+		total += n_pins;
+	}
+
+	return total;
+}
+
+static int register_scmi_pinctrl_gpio_handler(struct device *dev, struct scmi_pinctrl *pmx)
+{
+	struct fwnode_handle *gpio = NULL;
+	int ret, i;
+
+	gpio = fwnode_get_named_child_node(dev->fwnode, "gpio");
+	if (!gpio)
+		return 0;
+
+	pmx->gc = devm_kcalloc(dev, pmx->nr_functions, sizeof(*pmx->gc), GFP_KERNEL);
+	if (!pmx->gc)
+		return -ENOMEM;
+
+	for (i = 0; i < pmx->nr_functions; i++) {
+		const char *fn_name;
+
+		ret = pinctrl_ops->is_gpio(pmx->ph, i, FUNCTION_TYPE);
+		if (ret < 0)
+			return ret;
+		if (ret == false)
+			continue;
+
+		ret = pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE, &fn_name);
+		if (ret)
+			return ret;
+
+		pmx->gc[i].label = devm_kasprintf(dev, GFP_KERNEL, "%s", fn_name);
+		if (!pmx->gc[i].label)
+			return -ENOMEM;
+
+		pmx->gc[i].owner = THIS_MODULE;
+		pmx->gc[i].get = pinctrl_gpio_get;
+		pmx->gc[i].set = pinctrl_gpio_set;
+		pmx->gc[i].get_direction = pinctrl_gpio_get_direction;
+		pmx->gc[i].direction_input = pinctrl_gpio_direction_input;
+		pmx->gc[i].direction_output = pinctrl_gpio_direction_output_wrapper;
+		pmx->gc[i].add_pin_ranges = gpio_add_pin_ranges;
+
+		// FIXME: verify that this is correct
+		pmx->gc[i].can_sleep = true;
+
+		ret = get_nr_pins_in_function(pmx, i);
+		if (ret < 0)
+			return ret;
+		pmx->gc[i].ngpio = ret;
+
+		pmx->gc[i].parent = dev;
+		pmx->gc[i].base = -1;
+	}
+
+	return 0;
+}
+
+static int scmi_gpiochip_add_data(struct device *dev, struct scmi_pinctrl *pmx)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < pmx->nr_functions; i++) {
+		ret = pinctrl_ops->is_gpio(pmx->ph, i, FUNCTION_TYPE);
+		if (ret < 0)
+			return ret;
+		if (ret == false)
+			continue;
+
+		ret = devm_gpiochip_add_data(dev, &pmx->gc[i], pmx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const char * const scmi_pinctrl_blocklist[] = {
 	"fsl,imx95",
 	"fsl,imx94",
@@ -559,7 +755,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	ret = register_scmi_pinctrl_gpio_handler(dev, pmx);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	return scmi_gpiochip_add_data(dev, pmx);
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
-- 
2.47.2


