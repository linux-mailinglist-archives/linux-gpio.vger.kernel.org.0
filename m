Return-Path: <linux-gpio+bounces-15092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AEFA22102
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 16:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5883B188440E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 15:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B5C1DED73;
	Wed, 29 Jan 2025 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="TOAqwnkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E851DE892
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166170; cv=none; b=qeaTckZ/60zoA3+IZCE1BCz0VIp2DU70yYUOxowlLyDRvfBqExIFWbfDa812jf4lPvycpHWsUuJLGIkGdClH4wLYf0U+/VeQVo0F9i32nJy7Cc4o5Z4WaZWm5vERcu8sTuAM+S44J+EXqulVgT5a0Jt/N9o9aGyXlgXq3iULNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166170; c=relaxed/simple;
	bh=5+OrJzj0VE962N5YwRs/JWP6s0he08iKxAz6WvoXRMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0VlH/RAY6sX7k72dPPUHFXpYjYGYNibCbJOFrUn96KBAX3Lr7VsL2EiTS1I+AFjsFzFx5BCZrgwOmYgDhg9eWUwR+8owKRdITtFAO71PNsvYlDV4sr47G8CW/e479cbruaIK4x0RKTVk7KYw8Jv5YAqbJncfLKG5/H6ZhNQnRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=TOAqwnkx; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AAF163F871
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738166165;
	bh=yi0QNwrD3iE1YqyCu0HWM2nWr2NBX0dPTj1NHEUytGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=TOAqwnkxvvImbXmzv57eS7srcl/9h/p03W8Kx1YXVUMhvLdKDUSLRijltz8NYfsIz
	 x+ckVZfmgVKBb0lEiCCnME1PppFJCrZvYmX8Ut8BG5Iy4LOMmrpVdemEEJsrzKEovu
	 9WsDCMBZbHuJf/dRSmVqzaAVk1jUAlMKdA4+ZOwnCn0Uf5RkcSOmpkdCHgc7bex9aD
	 f24n7BNyNJR1hQoVA13d+TkYcjsBNK6D5KG2cPECRe7pLa4Gf7ivo6cPy+ZgW1/tSL
	 15jC5RiPTFEwZpnR6W5Otxm1+917kFmpJFiys0OnBWFz9a0P/LiF854ZJnoDyFtGgN
	 mDD8jhFDGc+HQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21661949f23so210273865ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 07:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166162; x=1738770962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi0QNwrD3iE1YqyCu0HWM2nWr2NBX0dPTj1NHEUytGE=;
        b=MZiVqKk/stP3NlLEsYcVnOz1bQFW7MiVKQjscf5ix7Dsy/7odi0d5zGf95Hac7hRch
         oLLJ/iFixxJJiF11w8k8aMe4kczVxHiJ7iNkDQ/hO3GB9vuL9Ia09hPvbQqDMsKDUCUY
         M8CQGEkG6+bkhaV+Dew7IVeKMAr64sV/RzCyZBaTsZOQ537ZShW3yj14xT939tve7/cp
         oKtfiuNUraBLiHp5VUI0X1dAdBPFPKdcrvOelnbgMsclE0TQ6gV8iCIcmjIPbM5Wr6QK
         06RZIPjmjq3TV4HZgXInzNBCVZNVYHd2MySzHy4jqOyxNHVjAhndHfaQofRGTzLlACTZ
         LloA==
X-Gm-Message-State: AOJu0YwmJRpZyenxqQORE7nXBJCBbrDhG7J5CmWaZz364FKMM1JQJ/xK
	rKmHkImEmN0i7udQA1OwAlcFdLTZ3iDAyiCK3WxGCgwuWM94aVDhhOMfBX9HTVQHedm2ysECLH1
	2tPN/k5iXGsSYjhfyQoW04vYEhqP+VowYamY2NhVxJZAvswiCMWbwab3bhOYt0mWfk3ILXvv3KA
	j5Fd7sOvQ=
X-Gm-Gg: ASbGncvruHVuCuFCUw5lsq6xCzS8QmJZwFK7ohNXojbaECxSveOX1mu01hge/GvJidi
	41Tb6Fdztvy2Ph7tPeLUOZKulYMiApJFluKPVR9u9dn7T1sPkb48aeH6TfjpjJpgvTfJE9arnx0
	HwctLNLD19ds7f9UxHRdPalV0z7dEgC6vlYveVQVFYbizJL5IBS+JvcF9zzZUi7wY/Em8hIR3q7
	85qFM1ZFSSgJe9MEZnUvA9pYcbVcweckJleTrB+s9Cb0Dit3pP8DVKuCuYzjvBUv1Vhmu0zIBAM
	MgdhjFKBw2rpHFcSixrKnvY=
X-Received: by 2002:a05:6a20:3d94:b0:1e0:cc4a:caab with SMTP id adf61e73a8af0-1ed7a530d19mr5466138637.19.1738166162249;
        Wed, 29 Jan 2025 07:56:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpfHj1m4TnkAKMydkV2iBmNzUa8E8y/DH2MR033ztsysfZOHgaIw3ltZ9PzVLVhobWf0yHbg==
X-Received: by 2002:a05:6a20:3d94:b0:1e0:cc4a:caab with SMTP id adf61e73a8af0-1ed7a530d19mr5466097637.19.1738166161646;
        Wed, 29 Jan 2025 07:56:01 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:daf2:7ab4:ebc3:f450])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c4fasm11674432b3a.132.2025.01.29.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:56:01 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] gpio: aggregator: Introduce configfs interface
Date: Thu, 30 Jan 2025 00:55:24 +0900
Message-ID: <20250129155525.663780-2-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250129155525.663780-1-koichiro.den@canonical.com>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing 'new_device' interface has several limitations:
* No way to determine when GPIO aggregator creation is complete.
* No way to retrieve errors when creating a GPIO aggregator.
* No way to trace a GPIO line of an aggregator back to its
  corresponding physical device.
* The 'new_device' echo does not indicate which virtual gpiochip.<N>
  was created.
* No way to assign names to GPIO lines exported through an aggregator.

Introduce configfs-based interface for gpio-aggregator to address these
issues. It provides a more streamlined, modern, and extensible
configuration method. For backward compatibility, the 'new_device'
interface is retained for now.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 673 ++++++++++++++++++++++++++++++++-
 1 file changed, 671 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 65f41cc3eafc..717a2bee3e8b 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -9,10 +9,13 @@
 
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/configfs.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -33,9 +36,22 @@
  * GPIO Aggregator sysfs interface
  */
 
+struct gpio_aggregator_line;
+
 struct gpio_aggregator {
+	struct config_group group;
 	struct gpiod_lookup_table *lookups;
 	struct platform_device *pdev;
+	int id;
+	struct mutex lock;
+
+	struct notifier_block bus_notifier;
+	struct completion probe_completion;
+	bool driver_bound;
+
+	unsigned int num_lines;
+	struct gpio_aggregator_line *lines;
+
 	char args[];
 };
 
@@ -474,6 +490,25 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 }
 #endif	/* !CONFIG_OF_GPIO */
 
+static int gpiochip_fwd_line_names(struct device *dev, const char **names, int len)
+{
+	struct device_node *of_node = dev_of_node(dev);
+	int num;
+
+	if (of_node)
+		/* not supported */
+		return 0;
+
+	num = device_property_string_array_count(dev, "gpio-line-names");
+	if (num > len) {
+		pr_warn("gpio-line-names contains %d lines while %d expected",
+			num, len);
+		num = len;
+	}
+	return device_property_read_string_array(dev, "gpio-line-names",
+						 names, num);
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -496,6 +531,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 {
 	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
+	const char **line_names;
 	struct gpio_chip *chip;
 	unsigned int i;
 	int error;
@@ -507,6 +543,14 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 
 	chip = &fwd->chip;
 
+	line_names = devm_kcalloc(dev, sizeof(*line_names), ngpios, GFP_KERNEL);
+	if (!line_names)
+		return ERR_PTR(-ENOMEM);
+
+	error = gpiochip_fwd_line_names(dev, line_names, ngpios);
+	if (error < 0)
+		return ERR_PTR(-ENOMEM);
+
 	/*
 	 * If any of the GPIO lines are sleeping, then the entire forwarder
 	 * will be sleeping.
@@ -538,6 +582,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	chip->to_irq = gpio_fwd_to_irq;
 	chip->base = -1;
 	chip->ngpio = ngpios;
+	chip->names = line_names;
 	fwd->descs = descs;
 
 	if (chip->can_sleep)
@@ -581,8 +626,20 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 
 	for (i = 0; i < n; i++) {
 		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
-		if (IS_ERR(descs[i]))
+		if (IS_ERR(descs[i])) {
+			/*
+			 * Deferred probing is not suitable when the aggregator
+			 * is created by userspace. They should just retry
+			 * later whenever they like.
+			 * .prevent_deferred_probe is kept unset for other
+			 * cases.
+			 */
+			if (!dev_of_node(dev) && descs[i] == ERR_PTR(-EPROBE_DEFER)) {
+				pr_warn("Deferred probe canceled for creation by userspace.\n");
+				return -ENODEV;
+			}
 			return PTR_ERR(descs[i]);
+		}
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
@@ -616,14 +673,626 @@ static struct platform_driver gpio_aggregator_driver = {
 	},
 };
 
+static int gpio_aggregator_bus_notifier_call(struct notifier_block *nb,
+					     unsigned long action, void *data)
+{
+	struct gpio_aggregator *aggr;
+	struct device *dev = data;
+
+	aggr = container_of(nb, struct gpio_aggregator, bus_notifier);
+	if (!device_match_name(dev, aggr->lookups->dev_id))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case BUS_NOTIFY_BOUND_DRIVER:
+		aggr->driver_bound = true;
+		break;
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		aggr->driver_bound = false;
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	complete(&aggr->probe_completion);
+	return NOTIFY_OK;
+}
+
+static struct gpio_aggregator *
+to_gpio_aggregator(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_aggregator, group);
+}
+
+static bool
+gpio_aggregator_is_live(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return !!aggr->pdev;
+}
+
+struct gpio_aggregator_line {
+	struct config_group group;
+
+	struct gpio_aggregator *parent;
+	int idx;
+
+	char *name;
+	char *key;
+	/* Can be negative to indicate lookup by name. */
+	int offset;
+	enum gpio_lookup_flags flags;
+};
+
+static void
+gpio_aggregator_line_init(struct gpio_aggregator_line *line)
+{
+	memset(line, 0, sizeof(*line));
+	line->idx = -1;
+}
+
+static struct gpio_aggregator_line *
+to_gpio_aggregator_line(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_aggregator_line, group);
+}
+
+static ssize_t
+gpio_aggregator_line_config_key_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sprintf(page, "%s\n", line->key ?: "");
+}
+
+static ssize_t
+gpio_aggregator_line_config_key_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	char *key __free(kfree) = kstrndup(skip_spaces(page), count,
+					   GFP_KERNEL);
+	if (!key)
+		return -ENOMEM;
+
+	strim(key);
+
+	guard(mutex)(&aggr->lock);
+
+	if (gpio_aggregator_is_live(aggr))
+		return -EBUSY;
+
+	kfree(line->key);
+	line->key = no_free_ptr(key);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggregator_line_config_, key);
+
+static ssize_t
+gpio_aggregator_line_config_name_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line =
+					to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sprintf(page, "%s\n", line->name ?: "");
+}
+
+static ssize_t
+gpio_aggregator_line_config_name_store(struct config_item *item,
+				       const char *page, size_t count)
+{
+	struct gpio_aggregator_line *line =
+					to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	char *name __free(kfree) = kstrndup(skip_spaces(page), count,
+					   GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	strim(name);
+
+	guard(mutex)(&aggr->lock);
+
+	if (gpio_aggregator_is_live(aggr))
+		return -EBUSY;
+
+	kfree(line->name);
+	line->name = no_free_ptr(name);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggregator_line_config_, name);
+
+static ssize_t
+gpio_aggregator_line_config_offset_show(struct config_item *item,
+					char *page)
+{
+	struct gpio_aggregator_line *line =
+					to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+	unsigned int offset;
+
+	scoped_guard(mutex, &aggr->lock)
+		offset = line->offset;
+
+	return sprintf(page, "%d\n", offset);
+}
+
+static ssize_t
+gpio_aggregator_line_config_offset_store(struct config_item *item,
+					 const char *page, size_t count)
+{
+	struct gpio_aggregator_line *line =
+					to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+	int offset, ret;
+
+	ret = kstrtoint(page, 0, &offset);
+	if (ret)
+		return ret;
+
+	/*
+	 * Negative number here means: 'key' represents a line name to lookup.
+	 * Non-negative means: 'key' represents the label of the chip with
+	 * the 'offset' value representing the line within that chip.
+	 *
+	 * GPIOLIB uses the U16_MAX value to indicate lookup by line name so
+	 * the greatest offset we can accept is (U16_MAX - 1).
+	 */
+	if (offset > (U16_MAX - 1))
+		return -EINVAL;
+
+	guard(mutex)(&aggr->lock);
+
+	if (gpio_aggregator_is_live(aggr))
+		return -EBUSY;
+
+	line->offset = offset;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggregator_line_config_, offset);
+
+static struct configfs_attribute *gpio_aggregator_line_config_attrs[] = {
+	&gpio_aggregator_line_config_attr_key,
+	&gpio_aggregator_line_config_attr_name,
+	&gpio_aggregator_line_config_attr_offset,
+	NULL
+};
+
+static struct fwnode_handle *
+gpio_aggregator_make_device_swnode(struct gpio_aggregator *aggr)
+{
+	struct property_entry properties[2];
+	int i;
+
+	memset(properties, 0, sizeof(properties));
+
+	char **line_names __free(kfree);
+	line_names = kcalloc(aggr->num_lines, sizeof(*line_names), GFP_KERNEL);
+	if (!line_names)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < aggr->num_lines; i++)
+		line_names[i] = aggr->lines[i].name ?: "";
+
+	properties[0] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
+					"gpio-line-names",
+					line_names, aggr->num_lines);
+
+	return fwnode_create_software_node(properties, NULL);
+}
+
+static int
+gpio_aggregator_activate(struct gpio_aggregator *aggr)
+{
+	struct platform_device_info pdevinfo;
+	struct gpio_aggregator_line *line;
+	struct fwnode_handle *swnode;
+	struct platform_device *pdev;
+	unsigned int n = 0;
+	int i, ret = 0;
+
+	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
+				GFP_KERNEL);
+	if (!aggr->lookups)
+		return -ENOMEM;
+
+	swnode = gpio_aggregator_make_device_swnode(aggr);
+	if (IS_ERR(swnode))
+		goto err_remove_lookups;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.name = DRV_NAME;
+	pdevinfo.id = aggr->id;
+	pdevinfo.fwnode = swnode;
+
+	for (i = 0; i < aggr->num_lines; i++) {
+		line = &aggr->lines[i];
+		if (line->idx < 0)
+			goto err_remove_swnode;
+		if (line->offset < 0)
+			ret = aggr_add_gpio(aggr, line->key, U16_MAX, &n);
+		else
+			ret = aggr_add_gpio(aggr, line->key, line->offset, &n);
+		if (ret)
+			goto err_remove_swnode;
+	}
+
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, aggr->id);
+
+	gpiod_add_lookup_table(aggr->lookups);
+
+	reinit_completion(&aggr->probe_completion);
+	aggr->driver_bound = false;
+	aggr->bus_notifier.notifier_call = gpio_aggregator_bus_notifier_call;
+	bus_register_notifier(&platform_bus_type, &aggr->bus_notifier);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
+		bus_unregister_notifier(&platform_bus_type, &aggr->bus_notifier);
+		goto err_remove_lookup_table;
+	}
+
+	wait_for_completion(&aggr->probe_completion);
+	bus_unregister_notifier(&platform_bus_type, &aggr->bus_notifier);
+
+	if (!aggr->driver_bound) {
+		ret = -ENXIO;
+		goto err_unregister_pdev;
+	}
+
+	aggr->pdev = pdev;
+	return 0;
+
+err_unregister_pdev:
+	platform_device_unregister(pdev);
+err_remove_lookup_table:
+	gpiod_remove_lookup_table(aggr->lookups);
+err_remove_swnode:
+	fwnode_remove_software_node(swnode);
+err_remove_lookups:
+	kfree(aggr->lookups);
+
+	return ret;
+}
+
+static void
+gpio_aggregator_deactivate(struct gpio_aggregator *aggr)
+{
+	platform_device_unregister(aggr->pdev);
+	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
+	kfree(aggr->lookups);
+	aggr->pdev = NULL;
+}
+
+static void
+gpio_aggregator_lockup_configfs(struct gpio_aggregator *aggr, bool lock)
+{
+	struct configfs_subsystem *subsys = aggr->group.cg_subsys;
+	struct gpio_aggregator_line *line;
+	int i;
+
+	/*
+	 * The device only needs to depend on leaf lookups. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	for (i = 0; i < aggr->num_lines; i++) {
+		line = &aggr->lines[i];
+		if (lock)
+			WARN_ON(configfs_depend_item_unlocked(
+					subsys, &line->group.cg_item));
+		else
+			configfs_undepend_item_unlocked(
+					&line->group.cg_item);
+	}
+}
+
+static ssize_t
+gpio_aggregator_device_config_dev_name_show(struct config_item *item,
+					    char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	struct platform_device *pdev;
+
+	guard(mutex)(&aggr->lock);
+
+	pdev = aggr->pdev;
+	if (pdev)
+		return sprintf(page, "%s\n", dev_name(&pdev->dev));
+
+	return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);
+}
+
+CONFIGFS_ATTR_RO(gpio_aggregator_device_config_, dev_name);
+
+static ssize_t gpio_aggregator_device_config_live_show(struct config_item *item,
+						       char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	bool live;
+
+	scoped_guard(mutex, &aggr->lock)
+		live = gpio_aggregator_is_live(aggr);
+
+	return sprintf(page, "%c\n", live ? '1' : '0');
+}
+
+static ssize_t
+gpio_aggregator_device_config_live_store(struct config_item *item,
+					 const char *page, size_t count)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	int ret = 0;
+	bool live;
+
+	ret = kstrtobool(page, &live);
+	if (ret)
+		return ret;
+
+	if (live)
+		gpio_aggregator_lockup_configfs(aggr, true);
+
+	scoped_guard(mutex, &aggr->lock) {
+		if (live == gpio_aggregator_is_live(aggr))
+			ret = -EPERM;
+		else if (live)
+			ret = gpio_aggregator_activate(aggr);
+		else
+			gpio_aggregator_deactivate(aggr);
+	}
+
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		gpio_aggregator_lockup_configfs(aggr, false);
+
+	return ret ?: count;
+}
+
+CONFIGFS_ATTR(gpio_aggregator_device_config_, live);
+
+static ssize_t
+gpio_aggregator_device_config_num_lines_show(struct config_item *item,
+					     char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+
+	guard(mutex)(&aggr->lock);
+
+	return sprintf(page, "%u\n", aggr->num_lines);
+}
+
+static ssize_t
+gpio_aggregator_device_config_num_lines_store(struct config_item *item,
+					      const char *page, size_t count)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	struct gpio_aggregator_line *line, *lines;
+	unsigned int num_lines;
+	int i, ret;
+
+	ret = kstrtouint(page, 0, &num_lines);
+	if (ret)
+		return ret;
+
+	if (num_lines == 0)
+		return -EINVAL;
+
+	guard(mutex)(&aggr->lock);
+
+	if (gpio_aggregator_is_live(aggr))
+		return -EBUSY;
+
+	if (aggr->num_lines > num_lines) {
+		for (i = aggr->num_lines - 1; i >= num_lines; i--) {
+			line = &aggr->lines[i];
+			if (line->idx >= 0)
+				return -EBUSY;
+		}
+	}
+
+	lines = krealloc(aggr->lines, sizeof(*line) * num_lines, GFP_KERNEL);
+	for (i = aggr->num_lines; i < num_lines; i++)
+		gpio_aggregator_line_init(&lines[i]);
+
+	aggr->lines = lines;
+	aggr->num_lines = num_lines;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggregator_device_config_, num_lines);
+
+static struct configfs_attribute *gpio_aggregator_device_config_attrs[] = {
+	&gpio_aggregator_device_config_attr_dev_name,
+	&gpio_aggregator_device_config_attr_live,
+	&gpio_aggregator_device_config_attr_num_lines,
+	NULL
+};
+
+static void
+gpio_aggregator_line_config_release(struct config_item *item)
+{
+	struct gpio_aggregator_line *line =
+					to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	kfree(line->key);
+	kfree(line->name);
+	gpio_aggregator_line_init(line);
+}
+
+static struct
+configfs_item_operations gpio_aggregator_line_config_item_ops = {
+	.release	= gpio_aggregator_line_config_release,
+};
+
+static const struct config_item_type gpio_aggregator_line_config_type = {
+	.ct_item_ops	= &gpio_aggregator_line_config_item_ops,
+	.ct_attrs	= gpio_aggregator_line_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void gpio_aggregator_device_config_release(struct config_item *item)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+
+	guard(mutex)(&aggr->lock);
+
+	if (gpio_aggregator_is_live(aggr))
+		gpio_aggregator_deactivate(aggr);
+
+	mutex_destroy(&aggr->lock);
+	idr_remove(&gpio_aggregator_idr, aggr->id);
+	kfree(aggr);
+}
+
+static struct configfs_item_operations gpio_aggregator_device_config_item_ops = {
+	.release	= gpio_aggregator_device_config_release,
+};
+
+static struct config_group *
+gpio_aggregator_device_config_make_group(struct config_group *group,
+					 const char *name)
+{
+	struct gpio_aggregator *aggr =
+				to_gpio_aggregator(&group->cg_item);
+	struct gpio_aggregator_line *line;
+	unsigned int offset;
+	int ret, nchar;
+
+	ret = sscanf(name, "line%u%n", &offset, &nchar);
+	if (ret != 1 || nchar != strlen(name))
+		return ERR_PTR(-EINVAL);
+
+	guard(mutex)(&aggr->lock);
+
+	if (gpio_aggregator_is_live(aggr))
+		return ERR_PTR(-EBUSY);
+
+	line = &aggr->lines[offset];
+	if (line->idx >= 0)
+		return ERR_PTR(-EBUSY);
+
+	config_group_init_type_name(&line->group, name,
+			&gpio_aggregator_line_config_type);
+	line->flags = GPIO_LOOKUP_FLAGS_DEFAULT;
+	line->parent = aggr;
+	line->idx = offset;
+
+	return &no_free_ptr(line)->group;
+}
+
+static struct
+configfs_group_operations gpio_aggregator_device_config_group_ops = {
+	.make_group	= gpio_aggregator_device_config_make_group,
+};
+
+static const struct config_item_type gpio_aggregator_device_config_type = {
+	.ct_group_ops	= &gpio_aggregator_device_config_group_ops,
+	.ct_item_ops	= &gpio_aggregator_device_config_item_ops,
+	.ct_attrs	= gpio_aggregator_device_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_aggregator_config_make_group(struct config_group *group,
+				  const char *name)
+{
+	/* no arg space is needed */
+	struct gpio_aggregator *aggr __free(kfree) = kzalloc(sizeof(*aggr),
+							     GFP_KERNEL);
+	if (!aggr)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&gpio_aggregator_lock);
+	aggr->id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
+	mutex_unlock(&gpio_aggregator_lock);
+
+	if (aggr->id < 0)
+		return ERR_PTR(aggr->id);
+
+	mutex_init(&aggr->lock);
+	config_group_init_type_name(&aggr->group, name,
+				    &gpio_aggregator_device_config_type);
+	aggr->bus_notifier.notifier_call = gpio_aggregator_bus_notifier_call;
+	init_completion(&aggr->probe_completion);
+
+	return &no_free_ptr(aggr)->group;
+}
+
+static struct configfs_group_operations gpio_aggregator_config_group_ops = {
+	.make_group	= gpio_aggregator_config_make_group,
+};
+
+static const struct config_item_type gpio_aggregator_config_type = {
+	.ct_group_ops	= &gpio_aggregator_config_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem gpio_aggregator_config_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf	= DRV_NAME,
+			.ci_type	= &gpio_aggregator_config_type,
+		},
+	},
+};
+
 static int __init gpio_aggregator_init(void)
 {
-	return platform_driver_register(&gpio_aggregator_driver);
+	int ret = 0;
+
+	ret = platform_driver_register(&gpio_aggregator_driver);
+	if (ret) {
+		pr_err("Failed to register the platform driver: %d\n", ret);
+		return ret;
+	}
+
+	config_group_init(&gpio_aggregator_config_subsys.su_group);
+	mutex_init(&gpio_aggregator_config_subsys.su_mutex);
+	ret = configfs_register_subsystem(&gpio_aggregator_config_subsys);
+	if (ret) {
+		pr_err("Failed to register the '%s' configfs subsystem: %d\n",
+		       gpio_aggregator_config_subsys.su_group.cg_item.ci_namebuf,
+		       ret);
+		mutex_destroy(&gpio_aggregator_config_subsys.su_mutex);
+		platform_driver_unregister(&gpio_aggregator_driver);
+	}
+
+	return ret;
 }
 module_init(gpio_aggregator_init);
 
 static void __exit gpio_aggregator_exit(void)
 {
+	configfs_unregister_subsystem(&gpio_aggregator_config_subsys);
 	gpio_aggregator_remove_all();
 	platform_driver_unregister(&gpio_aggregator_driver);
 }
-- 
2.45.2


