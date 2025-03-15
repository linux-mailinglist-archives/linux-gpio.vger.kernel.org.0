Return-Path: <linux-gpio+bounces-17652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8DA6302E
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 17:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8189176CF2
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 16:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2C8205E3C;
	Sat, 15 Mar 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="m+/SwThj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199622046BC
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742056914; cv=none; b=IMl8+q7pBPfZECgGU+PNJUigfYIWlD5ZJemWOW2kT7E1V/XUaVs9b/Opo+iqKeIg0YJHddRIE6mk7sIbWWiApSc9PnZCLdEgprG2SF0LMWHgsqpvBKNNcijfDdDy7bwhSbshJB4UiQ1MEC6+6vusuyMk8psyevexfuW95LXQ+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742056914; c=relaxed/simple;
	bh=tZpIixhIz63xwZmTsIFO5W2unoS3No4bx4rWhDwxvBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTOd+0AnwuFEa920Qh7y9CzhAQu0PX1n9xp1LkAM9XhLbd3IITuqGNb4lKjWSSvshOvnM4Eou9s1BOQ7VdPwExww9fsFQteCLFktbGivG2I4eGmBgpO9SJ+szpp076YpaE7skfvKj8apnEdQdoEEetAB62PJNu0nglzewrb3zC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=m+/SwThj; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4BF753F27F
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742056910;
	bh=YNZ+f28bALe1cBFd+IhRUCCUv+emwMU47KrwcCRAyIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=m+/SwThjZ8rtcmF3o0mWBQRm7FTn3qogq2Cnzl7b4g62amuRdONsMYV+AfLuPuJI+
	 IPxcuKe+dlUX1ZE6C/ybIXohAndA0redaSBOr6KDn1w34sVX6Tx4W3ocm5sa24U4oJ
	 k6Klg8aGVAO6tIemwnp9e3AnxkhozSlML8hbZbQlOoHvvQqXtVnmtZHrIxU2WLbUxe
	 qXzZWO5lT5t0bQe9jrFGJSWOeH2zdV0rmVqsh6tk2ENK/uMAsaK25mJi4JywdkEF+J
	 lmbBR/DhG9pZmF41hqakRgsyNtMIKcBJhCLFz/WkgLiBwgfZ7pNju5hgP1zk+DaGMD
	 OsTlMaEmgzVyg==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff5296726fso2044400a91.0
        for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 09:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742056907; x=1742661707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNZ+f28bALe1cBFd+IhRUCCUv+emwMU47KrwcCRAyIY=;
        b=PIL5JAn2hDiXCEzikAT0p/xC3FArgiaIsgB/lmaHg6xYxVTE28LP5IJ34gMhQ47tKO
         vP09vHXvfXpqNeYTqt/WjmtHRpC5qJCB+YlfOwvvsbg64q+OmRZbHQjLOR+FPNW1IH4P
         iViikQqOEby7aAKReo6Y2UfB5E83UTyBBbWt/vc2ZrFYD8wjTcsHY9X+DaZOoJj+E2Hq
         1Z35MvBFU08om8N1n4hlXKF6YwZcZ+dSru+ZrKPnJzOhhUmDTeMB1kZXkGZv53pBl/24
         qcJav9t5EHgkrRTSAThek8ptuaioq6OosTdvvFyRqRCkVtzq/D+dxUjwj3CJM4VRQyfe
         7byg==
X-Gm-Message-State: AOJu0YzYk+jwXrG67C//VO3ph9V4ME6mfYkojE/wYWLA/yLwv3xb1g6q
	Ss0mSd/yKHXuOX/HKn/oqnHoolJgXokgINpTMN6vfAtsTM40PQ5zi/KApUpPEz9igXjv61RJ+/s
	6ylaXMpN/qTLWB8ucLQUs6SjamF1eJkYKGWS/fFdFVfAHvzHIMKk60VM+s48vE6N3GZoAMXdU2b
	k66Blx99s=
X-Gm-Gg: ASbGncssCLgib+ZRQB2LfcFqz2ZuS71hpM6og4NJVx56bCUZioLnfK8W8/NHqbAGu6v
	dddkZe81vPdsWBE7y6WhsNQSU734NX7aALMFUoorXz8RB45Sebhw4fzqDq0LOqgd2uEK3AX4nfA
	J3pfYMkM4QoQkj0s30rfLVVyMdlZtvKfEn+v8RgRQ08HRfdzaHGIzvZt57TXJM2nQxsah96OLoK
	XDugmE8q2lfW8CWA6HM2WtnYxSDqZf57H0so1YkZ447vusRWS6QyxsA9LAn8zR9kcYXgaXh/pfr
	h3BUFNloDXiUdmfO
X-Received: by 2002:a05:6a21:9014:b0:1f5:87dc:a315 with SMTP id adf61e73a8af0-1f5c1183d5emr9009302637.12.1742056907216;
        Sat, 15 Mar 2025 09:41:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU0ceoD51BZ11smOJZX/JIzzQoRljOZk4JbL6veMWIaCrSH6Aif/TUrWT0CUiSbp4awP4Kbg==
X-Received: by 2002:a05:6a21:9014:b0:1f5:87dc:a315 with SMTP id adf61e73a8af0-1f5c1183d5emr9009286637.12.1742056906854;
        Sat, 15 Mar 2025 09:41:46 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:83e6:3590:3498:db44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155e3a9sm4637104b3a.71.2025.03.15.09.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 09:41:46 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/9] gpio: aggregator: expose aggregator created via legacy sysfs to configfs
Date: Sun, 16 Mar 2025 01:41:20 +0900
Message-ID: <20250315164123.1855142-7-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250315164123.1855142-1-koichiro.den@canonical.com>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose settings for aggregators created using the sysfs 'new_device'
interface to configfs. Once written to 'new_device', an "_sysfs.<N>" path
appears in the configfs regardless of whether the probe succeeds.
Consequently, users can no longer use that prefix for custom GPIO
aggregator names. The 'live' attribute changes to 1 when the probe
succeeds and the GPIO forwarder is instantiated.

Note that the aggregator device created via sysfs is asynchronous, i.e.
writing into 'new_device' returns without waiting for probe completion,
and the probe may succeed, fail, or eventually succeed via deferred
probe. Thus, the 'live' attribute may change from 0 to 1 asynchronously
without notice. So, editing key/offset/name while it's waiting for
deferred probe is prohibited.

The configfs auto-generation relies on create_default_group(), which
inherently prohibits rmdir(2). To align with the limitation, this commit
also prohibits mkdir(2) for them. When users want to change the number
of lines for an aggregator initialized via 'new_device', they need to
tear down the device using 'delete_device' and reconfigure it from
scratch. This does not break previous behavior; users of legacy sysfs
interface simply gain additional almost read-only configfs exposure.

Still, users can write to the 'live' attribute to toggle the device
unless it's waiting for deferred probe. So once probe succeeds, they can
deactivate it in the same manner as the devices initialized via
configfs.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 133 ++++++++++++++++++++++++++++++---
 1 file changed, 121 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 7087ac599ace..de693182070c 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -33,6 +33,7 @@
 #include "dev-sync-probe.h"
 
 #define AGGREGATOR_MAX_GPIOS 512
+#define AGGREGATOR_LEGACY_PREFIX "_sysfs"
 
 /*
  * GPIO Aggregator sysfs interface
@@ -131,6 +132,14 @@ static bool aggr_is_active(struct gpio_aggregator *aggr)
 	return aggr->probe_data.pdev && platform_get_drvdata(aggr->probe_data.pdev);
 }
 
+/* Only aggregators created via legacy sysfs can be "activating". */
+static bool aggr_is_activating(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return aggr->probe_data.pdev && !platform_get_drvdata(aggr->probe_data.pdev);
+}
+
 static size_t aggr_count_lines(struct gpio_aggregator *aggr)
 {
 	lockdep_assert_held(&aggr->lock);
@@ -188,6 +197,30 @@ static void aggr_line_del(struct gpio_aggregator *aggr,
 	list_del(&line->entry);
 }
 
+static void aggr_free_lines(struct gpio_aggregator *aggr)
+{
+	struct gpio_aggregator_line *line, *tmp;
+
+	list_for_each_entry_safe(line, tmp, &aggr->list_head, entry) {
+		configfs_unregister_group(&line->group);
+		/*
+		 * Normally, we acquire aggr->lock within the configfs
+		 * callback. However, in the legacy sysfs interface case,
+		 * calling configfs_(un)register_group while holding
+		 * aggr->lock could cause a deadlock. Fortunately, this is
+		 * unnecessary because the new_device/delete_device path
+		 * and the module unload path are mutually exclusive,
+		 * thanks to an explicit try_module_get. That's why this
+		 * minimal scoped_guard suffices.
+		 */
+		scoped_guard(mutex, &aggr->lock)
+			aggr_line_del(aggr, line);
+		kfree(line->key);
+		kfree(line->name);
+		kfree(line);
+	}
+}
+
 
 /*
  *  GPIO Forwarder
@@ -697,7 +730,7 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->key);
@@ -734,7 +767,7 @@ gpio_aggr_line_name_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->name);
@@ -782,7 +815,7 @@ gpio_aggr_line_offset_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	line->offset = offset;
@@ -841,11 +874,12 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
 	if (!try_module_get(THIS_MODULE))
 		return -ENOENT;
 
-	if (live)
+	if (live && !aggr->init_via_sysfs)
 		aggr_lockup_configfs(aggr, true);
 
 	scoped_guard(mutex, &aggr->lock) {
-		if (live == aggr_is_active(aggr))
+		if (aggr_is_activating(aggr) ||
+		    (live == aggr_is_active(aggr)))
 			ret = -EPERM;
 		else if (live)
 			ret = aggr_activate(aggr);
@@ -857,7 +891,7 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
 	 * Undepend is required only if device disablement (live == 0)
 	 * succeeds or if device enablement (live == 1) fails.
 	 */
-	if (live == !!ret)
+	if (live == !!ret && !aggr->init_via_sysfs)
 		aggr_lockup_configfs(aggr, false);
 
 	module_put(THIS_MODULE);
@@ -901,7 +935,7 @@ static void gpio_aggr_device_release(struct config_item *item)
 	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
 
 	/*
-	 * If the aggregator is active, this code wouldn't be reached,
+	 * At this point, aggr is neither active nor activating,
 	 * so calling aggr_deactivate() is always unnecessary.
 	 */
 	aggr_free(aggr);
@@ -923,6 +957,15 @@ gpio_aggr_device_make_group(struct config_group *group, const char *name)
 	if (ret != 1 || nchar != strlen(name))
 		return ERR_PTR(-EINVAL);
 
+	if (aggr->init_via_sysfs)
+		/*
+		 * Aggregators created via legacy sysfs interface are exposed as
+		 * default groups, which means rmdir(2) is prohibited for them.
+		 * For simplicity, and to avoid confusion, we also prohibit
+		 * mkdir(2).
+		 */
+		return ERR_PTR(-EPERM);
+
 	guard(mutex)(&aggr->lock);
 
 	if (aggr_is_active(aggr))
@@ -960,6 +1003,14 @@ gpio_aggr_make_group(struct config_group *group, const char *name)
 	struct gpio_aggregator *aggr;
 	int ret;
 
+	/*
+	 * "_sysfs" prefix is reserved for auto-generated config group
+	 * for devices create via legacy sysfs interface.
+	 */
+	if (strncmp(name, AGGREGATOR_LEGACY_PREFIX,
+		    sizeof(AGGREGATOR_LEGACY_PREFIX)) == 0)
+		return ERR_PTR(-EINVAL);
+
 	/* arg space is unneeded */
 	ret = aggr_alloc(&aggr, 0);
 	if (ret)
@@ -996,6 +1047,8 @@ static struct configfs_subsystem gpio_aggr_subsys = {
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
+	struct gpio_aggregator_line *line;
+	char name[CONFIGFS_ITEM_NAME_LEN];
 	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
@@ -1012,9 +1065,24 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
+			scnprintf(name, sizeof(name), "line%u", n);
+			line = aggr_line_alloc(aggr, n, key, -1);
+			if (!line) {
+				error = -ENOMEM;
+				goto err;
+			}
+			config_group_init_type_name(&line->group, name,
+						    &gpio_aggr_line_type);
+			error = configfs_register_group(&aggr->group,
+							&line->group);
+			if (error)
+				goto err;
+			scoped_guard(mutex, &aggr->lock)
+				aggr_line_add(aggr, line);
+
 			error = aggr_add_gpio(aggr, key, U16_MAX, &n);
 			if (error)
-				return error;
+				goto err;
 
 			key = offsets;
 			continue;
@@ -1028,9 +1096,24 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
+			scnprintf(name, sizeof(name), "line%u", n);
+			line = aggr_line_alloc(aggr, n, key, i);
+			if (!line) {
+				error = -ENOMEM;
+				goto err;
+			}
+			config_group_init_type_name(&line->group, name,
+						    &gpio_aggr_line_type);
+			error = configfs_register_group(&aggr->group,
+							&line->group);
+			if (error)
+				goto err;
+			scoped_guard(mutex, &aggr->lock)
+				aggr_line_add(aggr, line);
+
 			error = aggr_add_gpio(aggr, key, i, &n);
 			if (error)
-				return error;
+				goto err;
 		}
 
 		args = next_arg(args, &key, &p);
@@ -1038,15 +1121,20 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
-		return -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	aggr_free_lines(aggr);
+	return error;
 }
 
 static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 				size_t count)
 {
+	char name[CONFIGFS_ITEM_NAME_LEN];
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
 	int res;
@@ -1075,10 +1163,24 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 		goto free_table;
 	}
 
-	res = aggr_parse(aggr);
+	scnprintf(name, sizeof(name), "%s.%d", AGGREGATOR_LEGACY_PREFIX, aggr->id);
+	config_group_init_type_name(&aggr->group, name, &gpio_aggr_device_type);
+
+	/*
+	 * Since the device created by sysfs might be toggled via configfs
+	 * 'live' attribute later, this initialization is needed.
+	 */
+	dev_sync_probe_init(&aggr->probe_data);
+
+	/* Expose to configfs */
+	res = configfs_register_group(&gpio_aggr_subsys.su_group, &aggr->group);
 	if (res)
 		goto free_dev_id;
 
+	res = aggr_parse(aggr);
+	if (res)
+		goto unregister_group;
+
 	gpiod_add_lookup_table(aggr->lookups);
 
 	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
@@ -1093,6 +1195,8 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 remove_table:
 	gpiod_remove_lookup_table(aggr->lookups);
+unregister_group:
+	configfs_unregister_group(&aggr->group);
 free_dev_id:
 	kfree(aggr->lookups->dev_id);
 free_table:
@@ -1108,7 +1212,12 @@ static DRIVER_ATTR_WO(new_device);
 
 static void gpio_aggregator_free(struct gpio_aggregator *aggr)
 {
-	aggr_deactivate(aggr);
+	scoped_guard(mutex, &aggr->lock) {
+		if (aggr_is_activating(aggr) || aggr_is_active(aggr))
+			aggr_deactivate(aggr);
+	}
+	aggr_free_lines(aggr);
+	configfs_unregister_group(&aggr->group);
 	kfree(aggr);
 }
 
-- 
2.45.2


