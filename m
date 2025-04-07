Return-Path: <linux-gpio+bounces-18258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF56A7D2F1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199F2188D570
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944FC22333A;
	Mon,  7 Apr 2025 04:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Y2R5CTRR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C6E222585
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000265; cv=none; b=TC5AXn/xG+mog8of0bfTyx37k50JvdsVsLHrnYR3yg7YOtfUWu/XIpfZHGW9zH8KTj6IDdu86yX3Phqrk1ETP4lcpr7E9qstYAqLSyU9xGY+1EAPqrsN7SASWz/GUq/ZJlBAz/a4/ivRPIum23w2kvq7LW6ECkG8V53kDuYkejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000265; c=relaxed/simple;
	bh=YRfwgBPjWgBBKoPJSbVVBZYu3/kI4nztcwIUXOqhvgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HT9Yf/4a4w21F3DwGasLQvsMwbz3+x+lAYQdhmqrtiwUiFMaQ2cCVwCEBzaceINdBPJK5NIxRJ9WntnNF4ghDVH0yH+TcxoVHfHaGyWO/AvV9RdZR+a2xSRRQV84P6VO4h5D4PxbzaabHQ3uWLkkyTaAeN7Q0EXup7I1FyLS4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Y2R5CTRR; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8EAE73F193
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000261;
	bh=pkRong3R1WAVT/Zk9oY39vsyRup91MiW4yFLIt9P1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Y2R5CTRRuE0j4SPZfgMa+y5bF8mb1EXgiSYwuTo07ni6JQ35mraGecCQLw2L+vFkD
	 Qs1sw25cxIEacb4dgNHkHtNLfPkOS9SRpTNZzuRs+UBS0VPgsAqCsi679bXCBzlLD8
	 64248XJTnVpyTE1vzxpPwf5EYyMfzFTgErUKckdFUt6/6f5U2FMYJfcmGepct/hkll
	 AfURNKE5CkNpFMP3WoagzNcDbuuT/bBJHWe2ylN81G+lU/S/lC560sQ9G02CkIRiM/
	 r4SFDHKJG/BJtMCwLiF1Ky7sZduCqqWmeg9CvwkiMJSa6pYSLlu+WmndzpBcPovD22
	 0nWe4WF7yv/Ww==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242ade807fso64457155ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000260; x=1744605060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkRong3R1WAVT/Zk9oY39vsyRup91MiW4yFLIt9P1U4=;
        b=Wuzby29RbJkCFG2kbpCjQHIwYU6g0EkSQ+vXspU1Aue64C/MxUH8EvnoTXzlikuFXI
         /+EzyvGHW4lUwQXk5O8IiGPA34DijgJvB3CTrecBS0+5wN80V5iQXxx6wGS4R8LC+v1l
         TYxZc4Rg02z6P20ZbCcS/GScxCiAn39P/wjhwCUAFVZ0moXa7NUl6WZ6YbxKpq+YZGP9
         Rf0s5w7nO6etQVRCVd5Vwaz9R5L7Jn23fKuP6fnLcWiFaKuMEqcRxZ2ntYtLyXS8sUi/
         Vfcu61s68m8ee0qC/cS5Q0xwJZCOF+DRsRDj6RmdGp9iGDX/twhQrEjTI4zjrG69tcJ2
         CHzQ==
X-Gm-Message-State: AOJu0YyJEzrv0D/+RSqssGmRRk9ls+//FquhkX1sdL+OWmnoG1pvTbGU
	sdv8iID0AQanjacAAr8sW7/P5xlYl201tgzXgXewHWOtsLPfAMoPL23peSKIJt7z6NpUU5leiAY
	iqfaAfBY6xh6E7dY50kCBCgWozp9kJ1DBDfprGFY+NicECkwfJ+7fDLJ6B0AqH/7qOKr5L3CaZT
	vOQPs+jZU=
X-Gm-Gg: ASbGncubMCrDPkENWO8mZzhooAkyyULcRZnT08ExFpOpjOCw0SKs/YZWdxUmcF9+dv3
	RuUtyuSwr23zqaQSSQz6CRdWrAzldjHVjzuNmczBbeKQwIgam/iN62qd/ndLrm90/FFdCSFNcSS
	zfX0qpCzr2Q235sEsp53H3RZyHfUurSefAu8op0yBJxWzklLE3O9wZfWkzy5QFAVAIbZBrDPZ8x
	H3Jz5yqxSFEUVG9VUkH/l9EYZKB+Msy9dYYDCI0n8oTjIEvfMRgj4ot7Qe5INFa0sveLoQiodHV
	zo7zxEY6lOWaUSNTR8jjevh3GoDqsQKx/A==
X-Received: by 2002:a17:902:f64a:b0:224:194c:6942 with SMTP id d9443c01a7336-22a8a8b828amr164483965ad.34.1744000259684;
        Sun, 06 Apr 2025 21:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoTBtjgGYyMo8U+tHKN7qfhJYW+OLGU/Ad2psdFbZ7K7/CabhVgATMiQwhPW0bUE1Ii37gcA==
X-Received: by 2002:a17:902:f64a:b0:224:194c:6942 with SMTP id d9443c01a7336-22a8a8b828amr164483705ad.34.1744000259250;
        Sun, 06 Apr 2025 21:30:59 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:58 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/9] gpio: aggregator: expose aggregator created via legacy sysfs to configfs
Date: Mon,  7 Apr 2025 13:30:16 +0900
Message-ID: <20250407043019.4105613-7-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407043019.4105613-1-koichiro.den@canonical.com>
References: <20250407043019.4105613-1-koichiro.den@canonical.com>
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
 drivers/gpio/gpio-aggregator.c | 138 ++++++++++++++++++++++++++++++---
 1 file changed, 126 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 2d8a7019b75e..bea01ebe8cda 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -33,6 +33,7 @@
 #include "dev-sync-probe.h"
 
 #define AGGREGATOR_MAX_GPIOS 512
+#define AGGREGATOR_LEGACY_PREFIX "_sysfs"
 
 /*
  * GPIO Aggregator sysfs interface
@@ -131,6 +132,14 @@ static bool gpio_aggregator_is_active(struct gpio_aggregator *aggr)
 	return aggr->probe_data.pdev && platform_get_drvdata(aggr->probe_data.pdev);
 }
 
+/* Only aggregators created via legacy sysfs can be "activating". */
+static bool gpio_aggregator_is_activating(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return aggr->probe_data.pdev && !platform_get_drvdata(aggr->probe_data.pdev);
+}
+
 static size_t gpio_aggregator_count_lines(struct gpio_aggregator *aggr)
 {
 	lockdep_assert_held(&aggr->lock);
@@ -189,6 +198,30 @@ static void gpio_aggregator_line_del(struct gpio_aggregator *aggr,
 	list_del(&line->entry);
 }
 
+static void gpio_aggregator_free_lines(struct gpio_aggregator *aggr)
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
+			gpio_aggregator_line_del(aggr, line);
+		kfree(line->key);
+		kfree(line->name);
+		kfree(line);
+	}
+}
+
 
 /*
  *  GPIO Forwarder
@@ -702,7 +735,8 @@ gpio_aggregator_line_key_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (gpio_aggregator_is_active(aggr))
+	if (gpio_aggregator_is_activating(aggr) ||
+	    gpio_aggregator_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->key);
@@ -739,7 +773,8 @@ gpio_aggregator_line_name_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (gpio_aggregator_is_active(aggr))
+	if (gpio_aggregator_is_activating(aggr) ||
+	    gpio_aggregator_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->name);
@@ -785,7 +820,8 @@ gpio_aggregator_line_offset_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (gpio_aggregator_is_active(aggr))
+	if (gpio_aggregator_is_activating(aggr) ||
+	    gpio_aggregator_is_active(aggr))
 		return -EBUSY;
 
 	line->offset = offset;
@@ -843,11 +879,12 @@ gpio_aggregator_device_live_store(struct config_item *item, const char *page,
 	if (!try_module_get(THIS_MODULE))
 		return -ENOENT;
 
-	if (live)
+	if (live && !aggr->init_via_sysfs)
 		gpio_aggregator_lockup_configfs(aggr, true);
 
 	scoped_guard(mutex, &aggr->lock) {
-		if (live == gpio_aggregator_is_active(aggr))
+		if (gpio_aggregator_is_activating(aggr) ||
+		    (live == gpio_aggregator_is_active(aggr)))
 			ret = -EPERM;
 		else if (live)
 			ret = gpio_aggregator_activate(aggr);
@@ -859,7 +896,7 @@ gpio_aggregator_device_live_store(struct config_item *item, const char *page,
 	 * Undepend is required only if device disablement (live == 0)
 	 * succeeds or if device enablement (live == 1) fails.
 	 */
-	if (live == !!ret)
+	if (live == !!ret && !aggr->init_via_sysfs)
 		gpio_aggregator_lockup_configfs(aggr, false);
 
 	module_put(THIS_MODULE);
@@ -903,7 +940,7 @@ static void gpio_aggregator_device_release(struct config_item *item)
 	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
 
 	/*
-	 * If the aggregator is active, this code wouldn't be reached,
+	 * At this point, aggr is neither active nor activating,
 	 * so calling gpio_aggregator_deactivate() is always unnecessary.
 	 */
 	gpio_aggregator_free(aggr);
@@ -925,6 +962,15 @@ gpio_aggregator_device_make_group(struct config_group *group, const char *name)
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
 
 	if (gpio_aggregator_is_active(aggr))
@@ -962,6 +1008,14 @@ gpio_aggregator_make_group(struct config_group *group, const char *name)
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
 	ret = gpio_aggregator_alloc(&aggr, 0);
 	if (ret)
@@ -998,6 +1052,8 @@ static struct configfs_subsystem gpio_aggregator_subsys = {
 static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
+	struct gpio_aggregator_line *line;
+	char name[CONFIGFS_ITEM_NAME_LEN];
 	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
@@ -1014,9 +1070,24 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
+			scnprintf(name, sizeof(name), "line%u", n);
+			line = gpio_aggregator_line_alloc(aggr, n, key, -1);
+			if (!line) {
+				error = -ENOMEM;
+				goto err;
+			}
+			config_group_init_type_name(&line->group, name,
+						    &gpio_aggregator_line_type);
+			error = configfs_register_group(&aggr->group,
+							&line->group);
+			if (error)
+				goto err;
+			scoped_guard(mutex, &aggr->lock)
+				gpio_aggregator_line_add(aggr, line);
+
 			error = gpio_aggregator_add_gpio(aggr, key, U16_MAX, &n);
 			if (error)
-				return error;
+				goto err;
 
 			key = offsets;
 			continue;
@@ -1030,9 +1101,24 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
+			scnprintf(name, sizeof(name), "line%u", n);
+			line = gpio_aggregator_line_alloc(aggr, n, key, i);
+			if (!line) {
+				error = -ENOMEM;
+				goto err;
+			}
+			config_group_init_type_name(&line->group, name,
+						    &gpio_aggregator_line_type);
+			error = configfs_register_group(&aggr->group,
+							&line->group);
+			if (error)
+				goto err;
+			scoped_guard(mutex, &aggr->lock)
+				gpio_aggregator_line_add(aggr, line);
+
 			error = gpio_aggregator_add_gpio(aggr, key, i, &n);
 			if (error)
-				return error;
+				goto err;
 		}
 
 		args = next_arg(args, &key, &p);
@@ -1040,15 +1126,20 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
-		return -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	gpio_aggregator_free_lines(aggr);
+	return error;
 }
 
 static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 						const char *buf, size_t count)
 {
+	char name[CONFIGFS_ITEM_NAME_LEN];
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
 	int res;
@@ -1077,10 +1168,25 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 		goto free_table;
 	}
 
-	res = gpio_aggregator_parse(aggr);
+	scnprintf(name, sizeof(name), "%s.%d", AGGREGATOR_LEGACY_PREFIX, aggr->id);
+	config_group_init_type_name(&aggr->group, name, &gpio_aggregator_device_type);
+
+	/*
+	 * Since the device created by sysfs might be toggled via configfs
+	 * 'live' attribute later, this initialization is needed.
+	 */
+	dev_sync_probe_init(&aggr->probe_data);
+
+	/* Expose to configfs */
+	res = configfs_register_group(&gpio_aggregator_subsys.su_group,
+				      &aggr->group);
 	if (res)
 		goto free_dev_id;
 
+	res = gpio_aggregator_parse(aggr);
+	if (res)
+		goto unregister_group;
+
 	gpiod_add_lookup_table(aggr->lookups);
 
 	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
@@ -1095,6 +1201,8 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 
 remove_table:
 	gpiod_remove_lookup_table(aggr->lookups);
+unregister_group:
+	configfs_unregister_group(&aggr->group);
 free_dev_id:
 	kfree(aggr->lookups->dev_id);
 free_table:
@@ -1111,7 +1219,13 @@ static struct driver_attribute driver_attr_gpio_aggregator_new_device =
 
 static void gpio_aggregator_destroy(struct gpio_aggregator *aggr)
 {
-	gpio_aggregator_deactivate(aggr);
+	scoped_guard(mutex, &aggr->lock) {
+		if (gpio_aggregator_is_activating(aggr) ||
+		    gpio_aggregator_is_active(aggr))
+			gpio_aggregator_deactivate(aggr);
+	}
+	gpio_aggregator_free_lines(aggr);
+	configfs_unregister_group(&aggr->group);
 	kfree(aggr);
 }
 
-- 
2.45.2


