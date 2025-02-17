Return-Path: <linux-gpio+bounces-16154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86DA386C5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2A2B160101
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB39224883;
	Mon, 17 Feb 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ptzKx6HZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B822576D
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802988; cv=none; b=cSEEZ7c+5XDM6+8AGRAYyZ0TAK/2O7zsWVxRa4vrRufGKrdighNJv/DlumEbQNrFhV0gnTQgBfqm/W1xaTRZ/Mauy+9Qv43FvJiN9dvYzGKkY2JJm19HNHF0uNyJDuDeE8VttzYbggAFmiKZfVKbLe38bcfTqtzNsCStqg6gvy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802988; c=relaxed/simple;
	bh=lWi8cSb8BfWbLOPOp2GNgU6ysUye4CsGO9grvCFpPc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUNR1lb8pHUGzsfcKWbocFD3FVJaFKESFD20GXfrK/RdgXkRW3sPo4NyxUsI/QNpL5WBE+5k8mtntacHlrS8PR3PC6VzkrwHgyGb3Y0aG6jSc++jJB39E19uT8EhwEzF5IYbQzmksUvGq3DOixke2ZF+ch/YxbPXRFrJai20dFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ptzKx6HZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 921AD3F164
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802982;
	bh=xsxLQ8/cIyaXlfRbTYcIHh/jf9fjXDEfeDZdjuEqzxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=ptzKx6HZldGppnroeGLXiTn8PS3ghUNl6dy9IuEipkmJfIQmjU/zMR8tFYloz1jvK
	 V3cxBkr2koBpwxoKL6/B0ay99NfdJqsEFuyFIyw/9HisiNiuXpMIfeIW8MjiFH9MYL
	 eQVBKdBbsqQ7n58mhLi1X4m3BIMUPFl6/NdWLKTxZBxgqiy9BS1E/BBZPW44XY9NO3
	 aUkAlZDVf6GvkHHHq8QlVvPDIwjp4Fg4n6GUjJENwoiWdwJ2z5Zvu58U5YSDzHoXS1
	 lFaOPAnBFCsfxbYeJ10GNeNaTaVasX3L6AIm7sraHqJZ0T1aNNyf05rZ3eSNalEz8L
	 fLjdmMdlUJlew==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22104619939so66697275ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802978; x=1740407778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsxLQ8/cIyaXlfRbTYcIHh/jf9fjXDEfeDZdjuEqzxg=;
        b=vQZqDPCSpZxFdN9EaI82/YC0dcSC20zZ2WdiMTfMimz8HTQM/sOD40Ufp1Wjb4qJ7F
         N/tqnbxg7ORqFqKUzrs9QPQMM1Cvpfiyi2ehj3oIgQCiaap+v0dcrRUUXLAWG10ckEy3
         1+5IXpZ57M2ilR/1yMAf/sxHYorAmfbfxf7xi2d8wy3vOiaKWiCGUxs88UMLXQB2wJdT
         c8Lh7MUG3LAXmzocXlzCG2u1BwHfCpUgrjZEtg6fYxgqJczp157PJEEuHzkbj4cpbK/A
         yLZJCJMfDVsiWt1t6yWypdqEwPhVLh1DJFPKO5/VIpfVltLXUVnRBqjWCCUcmILbYHh3
         y7iQ==
X-Gm-Message-State: AOJu0YxEGQZj0t/+UDgS6wJGOmqzcH/8N/H+NF4+X8Y/UY9G6xZbnffm
	kuKag8cM1n8VbwF5UrbCU9rDs+ssmSOJZKj7+c0z8QTxPlWgraTG+MrZMoHz6YCkZaD+d4UDTh6
	FF6qQr9TO0Ki0HEkJ6skjQqOT0YDxyotGoXFKn3ZSqjYpFjkXJJRC8/Ookwisa4yQBy0ZrvLmDb
	Ecklhgpj0=
X-Gm-Gg: ASbGnctlVfJCf22NYijbBJLugWZk5HWVkuqdrHP2C1VYacpwQ9wLFuUtAeaonDPNH/m
	vb78zNx6UFH0GX9kDT7eduHkkeLaccnXqfrLmpQXy4pPmBiThhrxjUhGSsyBu5hEwVitL+aAKgG
	CSFUjvp3qM59kepV+xS96LUjmynbK5PQ4EZNu3jsOZKHwb8ee8rjBCDYpYtCWWPsqXruGpeoQHq
	U4SGlZtFOkfrpJ2ClYAEz5WOMor9ylj+D+px7RDvKfsyS/nF4Fip8Q44K6fFlcYdxhhwy1kH1xy
	YN/UqoDiJKJPemuIhejKcAk=
X-Received: by 2002:a17:902:ec8f:b0:215:b45a:6a5e with SMTP id d9443c01a7336-2210403e825mr139126415ad.18.1739802978283;
        Mon, 17 Feb 2025 06:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVcMLmivClQAJruBnXTV2Ja0RMzvZqDr0OO4NPzbiX3VFfWVAnPO/hN3pCcPbQIndpCBTwgw==
X-Received: by 2002:a17:902:ec8f:b0:215:b45a:6a5e with SMTP id d9443c01a7336-2210403e825mr139125975ad.18.1739802977690;
        Mon, 17 Feb 2025 06:36:17 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:36:17 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] gpio: aggregator: expose aggregator created via legacy sysfs to configfs
Date: Mon, 17 Feb 2025 23:35:29 +0900
Message-ID: <20250217143531.541185-8-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217143531.541185-1-koichiro.den@canonical.com>
References: <20250217143531.541185-1-koichiro.den@canonical.com>
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
 drivers/gpio/gpio-aggregator.c | 117 +++++++++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 2e993c9a7ce5..8f8793f27211 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -33,6 +33,7 @@
 #include "gpio-pseudo.h"
 
 #define AGGREGATOR_MAX_GPIOS 512
+#define AGGREGATOR_LEGACY_PREFIX "_sysfs"
 
 /*
  * GPIO Aggregator sysfs interface
@@ -131,6 +132,14 @@ static bool aggr_is_active(struct gpio_aggregator *aggr)
 	return aggr->common.pdev && platform_get_drvdata(aggr->common.pdev);
 }
 
+/* Only aggregators created via legacy sysfs can be "activating". */
+static bool aggr_is_activating(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return aggr->common.pdev && !platform_get_drvdata(aggr->common.pdev);
+}
+
 static size_t aggr_count_lines(struct gpio_aggregator *aggr)
 {
 	lockdep_assert_held(&aggr->lock);
@@ -188,6 +197,18 @@ static void aggr_line_del(struct gpio_aggregator *aggr,
 	list_del(&line->entry);
 }
 
+static void aggr_free_lines(struct gpio_aggregator *aggr)
+{
+	struct gpio_aggregator_line *line, *tmp;
+
+	list_for_each_entry_safe(line, tmp, &aggr->list_head, entry) {
+		configfs_unregister_group(&line->group);
+		aggr_line_del(aggr, line);
+		kfree(line->key);
+		kfree(line);
+	}
+}
+
 
 /*
  *  GPIO Forwarder
@@ -687,7 +708,7 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->key);
@@ -724,7 +745,7 @@ gpio_aggr_line_name_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->name);
@@ -772,7 +793,7 @@ gpio_aggr_line_offset_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	line->offset = offset;
@@ -831,11 +852,12 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
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
@@ -847,7 +869,7 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
 	 * Undepend is required only if device disablement (live == 0)
 	 * succeeds or if device enablement (live == 1) fails.
 	 */
-	if (live == !!ret)
+	if (live == !!ret && !aggr->init_via_sysfs)
 		aggr_lockup_configfs(aggr, false);
 
 	module_put(THIS_MODULE);
@@ -893,7 +915,7 @@ static void gpio_aggr_device_release(struct config_item *item)
 	guard(mutex)(&aggr->lock);
 
 	/*
-	 * If the aggregator is active, this code wouldn't be reached,
+	 * At this point, aggr is neither active nor activating,
 	 * so calling aggr_deactivate() is always unnecessary.
 	 */
 	aggr_free(aggr);
@@ -915,6 +937,15 @@ gpio_aggr_device_make_group(struct config_group *group, const char *name)
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
@@ -952,6 +983,14 @@ gpio_aggr_make_group(struct config_group *group, const char *name)
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
@@ -988,6 +1027,8 @@ static struct configfs_subsystem gpio_aggr_subsys = {
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
+	struct gpio_aggregator_line *line;
+	char name[CONFIGFS_ITEM_NAME_LEN];
 	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
@@ -999,14 +1040,29 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 
 	args = next_arg(args, &key, &p);
 	while (*args) {
+		scnprintf(name, sizeof(name), "line%u", n);
+
 		args = next_arg(args, &offsets, &p);
 
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
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
+			aggr_line_add(aggr, line);
+
 			error = aggr_add_gpio(aggr, key, U16_MAX, &n);
 			if (error)
-				return error;
+				goto err;
 
 			key = offsets;
 			continue;
@@ -1020,9 +1076,22 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
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
+			aggr_line_add(aggr, line);
+
 			error = aggr_add_gpio(aggr, key, i, &n);
 			if (error)
-				return error;
+				goto err;
 		}
 
 		args = next_arg(args, &key, &p);
@@ -1030,15 +1099,20 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 
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
@@ -1067,10 +1141,24 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
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
+	pseudo_gpio_init(&aggr->common);
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
@@ -1085,6 +1173,8 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 remove_table:
 	gpiod_remove_lookup_table(aggr->lookups);
+unregister_group:
+	configfs_unregister_group(&aggr->group);
 free_dev_id:
 	kfree(aggr->lookups->dev_id);
 free_table:
@@ -1100,7 +1190,10 @@ static DRIVER_ATTR_WO(new_device);
 
 static void gpio_aggregator_free(struct gpio_aggregator *aggr)
 {
-	aggr_deactivate(aggr);
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
+		aggr_deactivate(aggr);
+	aggr_free_lines(aggr);
+	configfs_unregister_group(&aggr->group);
 	kfree(aggr);
 }
 
-- 
2.45.2


