Return-Path: <linux-gpio+bounces-19599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BFEAA9238
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 13:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC753B23F9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 11:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F0A205E26;
	Mon,  5 May 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQPbTG5E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8400205AB9
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445196; cv=none; b=KxQJqgHUcOTe8T9/kSVJKfuGmHgwUAxr34pks0FwAJgIB/5NltVkok00R7xdD67CUhmAVZ8L/1jghg4x2Pi//U96n/UCuPQ9UhoaeTIORgqnkAZx1dAyyTsHdefRI0Ue9bJ8+vIn7L9pLVNz8xfYuSj+H7KEqXLOoBWJ/DMiXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445196; c=relaxed/simple;
	bh=vRN32xZ85C9p5S5NbFDW7sAvcDsmUVdlaouvdtHK2no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emuIDdPxHurOabwYSodaHfk+TTgmwQuJadUgrzUMolkPsRoxife4sYwkFLOX0e3dKlFt62X0Dd5gpsANW8A1MC4fTOYfFWQidn9Y/4LwHKROE6lsE7JLVfDwzVeYmgnIOJ92ockxpfm+GXNL8XQSC5LfBB1CnfE/r3oHENrBrOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQPbTG5E; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso27539145e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 04:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445191; x=1747049991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=upLirTeDgN21tlG/CSaFHFN5b+EY/GrJw53DQ1VbDB4=;
        b=wQPbTG5EY5UcYBuQ3q1KEabpWuElyFOGLPLeM7/mfCCUdDieQlbbx+fa5Kpha1X9He
         dVfOyEWTi1zX86D39rj1mkDX2IXp6rgQkpfJWXhkOzq76Vl2hbYJxbmHCOUvdYEz1T25
         VOBnXdKVT54346QbIipNlezqUThsFDAAvNQ1c40BqMw4p6MIiUBt4EOv47INtYxENSoS
         yNCD3SA9D0sFVH2lRN8Dr1ZHzy8cHDuCwPRYCYulhz/2ubj9Deg7Tnzk7DOi+8uPbz8d
         NrUeUqBkP5113mYtPpE6QpcFrVwxLTxjR7MeFjMhypqtoq23e846p0WF33NBNN2p22um
         mDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445191; x=1747049991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upLirTeDgN21tlG/CSaFHFN5b+EY/GrJw53DQ1VbDB4=;
        b=DT0WsaRZle0DLYpya6UYU4lRH3pShnwxe1MzHOE5FNFsjLc8I5/QAQpRtkFoDYu5g/
         GqCBa8IBqTdai8+kALGytuYYl4zYB93zZ4AwJiyHDoJtf4NkHwNvl9t0zJmbBgeLfSV2
         s07EJIf9wH9LajL2Xv23Qj7V0fxG/avgSN03K3OcTA5SKlQ+pvNX3I1kRvNWXRXpdrTq
         xgRNoKIUEIXQCERIEiuy2rkIeknTvmfJMes1/7pCRHP6+4lXCqi8UO8uxtFHYCF1slKy
         PyVj6HVAEqscT0k9xEXc5rqqDWwqxY/VSCV328INaqJAtVV84RdfaNkcaoADT/bE8CtC
         qa8g==
X-Forwarded-Encrypted: i=1; AJvYcCXT6hSA1GmUhkOH0qtdfjI3mLbhCyb9u68pgWg2UCNO/fLynoXD/Jb1VWsM47g8Q2eIRYk24ZS80l79@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/Sh8Tuf/tcVlby5J9txjIK0xa1mKnbRmBKSXoRJ3FR/R4/Up
	29zzYh+PRqM7ff5Kxp3NMyCTQ58iYhKWlK4aZ3JN3H0DairV/x9geytGT7pUZd8=
X-Gm-Gg: ASbGncsO1tC//SQIp8+RPTWAiiycmzC6UfO7vDRviAW5+RKKo/XI3anqu30ojey0ewY
	Arg3pWXB+nmN4Xxmm8TiyKqwnlZ79hWfD3q4sKy1w1NBzDLYFDjpbwXbOgzg1gQIvr7aeEoe8yG
	onxfU3mAE39i32IWmrKAdm+WeGd2gsveWp2vUuvZSVi48fWQxuqN+D8XMQR30/PyY4hddy6ApTE
	LLvp1z3zI0tkf3zqgi66y/Tgmewsy8MMDeDwFYX3DggG+5YYT4nX+LHkSoYX7ewtPdQLT6aJFyA
	NH7Z3MYwSWJRunBefOffHVeq4AwiR7SlGhGenQqGcMy1tg==
X-Google-Smtp-Source: AGHT+IGvkzc1/h1CubNXx94UDKKtRArlm1khwfK49K/JcXsvwL+en0lghy11gufsaBe7uLcgb93WCA==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr95014525e9.26.1746445191044;
        Mon, 05 May 2025 04:39:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a3113csm129876775e9.33.2025.05.05.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:39:50 -0700 (PDT)
Date: Mon, 5 May 2025 14:39:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: [RFC 6/7] pinctrl-scmi: Add GPIO support
Message-ID: <901a636b06f5ef25f8c0021c514bfcc01344c5df.1746443762.git.dan.carpenter@linaro.org>
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

This adds GPIO support to the SCMI pin controller driver.  It's an RFC
patch because I'm not really sure how these are used and so I don't
know how they should be configured via devicetree.  I've labeled the
places where I think devicetree configuration would go with a FIXME.

This driver was based on work from Takahiro AKASHI.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 206 ++++++++++++++++++++++++++++++++-
 1 file changed, 205 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f369f0354e43..40b432aa4756 100644
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
 
+static int pinctrl_gpio_init_valid_mask(struct gpio_chip *gc,
+				    unsigned long *valid_mask,
+				    unsigned int ngpios)
+{
+	bitmap_fill(valid_mask, ngpios);
+	return 0;
+}
+
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
+	int group;
+	int ret;
+
+	ret = pmx->pctl_desc.pmxops->get_function_groups(pmx->pctldev, func, &p_groups, &n_groups);
+	if (ret)
+		return ret;
+
+	// FIXME: fix the correct group from the device tree
+	for (group = 0; group < n_groups; group++) {
+		ret = gpiochip_add_pingroup_range(gc, pmx->pctldev, 0, p_groups[group]);
+		if (ret)
+			return ret;
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
+		pmx->gc[i].init_valid_mask = pinctrl_gpio_init_valid_mask;
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
 	NULL
@@ -558,7 +754,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
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


