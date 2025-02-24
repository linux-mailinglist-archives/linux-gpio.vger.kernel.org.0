Return-Path: <linux-gpio+bounces-16500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA030A4233C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EBA18906B5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049D92561B7;
	Mon, 24 Feb 2025 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LDLAWPrI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F932561B3
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407528; cv=none; b=K8X8zmXJU0MN9nCW59BRkcPVfSjfvPNokZwsmmLjn6mSlpl26S2dfZZW9v1LMrnWa0uaRRUZMzbOEM0PidKg1qgYwpsn97uZIKTI0FnaDyNSVsmqzpt3Ro9ghQ8RlHtZEY5Rt2U8j7GriVfmnop31DzsMlRCMG3Caql01+6fVEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407528; c=relaxed/simple;
	bh=4s+EGUr1VD7j68xpApegchInpDypgfcVa8lQczlc0W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKq/yE6aH/Vr6zZbNKJCPC4fPh09tIsfNX1z7UXI4MfHDGCTsU7b9GA+G5ryPnvNapYI0BjJJX//T8t9lihmAg3mKRdvhkbDulnIzfQ724Kh4OEQaNVIs/GdKu1OXDgDbuePS7ug5t0fv7NrupdfFH1/Vx1B4WQOL+SxznH4edk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LDLAWPrI; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B547D41977
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740407523;
	bh=dCqB03ZRHWaC4arbzPu/PsCG9rGmiexjce2IhlWSXfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LDLAWPrIc4boPraQEI+ZG0vmoC1twVE3cIs+06B5Agi1GFqfv4zVDs0/py8lg0lGA
	 nZkbDyOUN/95uJCh+ZaZ5gRSLq0vVfdBor6FdGQV2SX+CCfblRyFc02QbS3SC9pMSE
	 vszrW6lttjcuYokVApN3oSXN0Orj6PwKY+NqpCkwCJClIppj8AKJwZGJWLkIbcOekI
	 4SvJMsJXemf364jpE16eVkzkEScAvT/qjeS58I9Ip+XbvlFfWIaECAvI7ADWdf8+nU
	 bbK0k/K443C3UYQtF8dkybV4IBhpv5MTqYNuOgn5idYGbPD5LnnYNwtamCw6ZCjS5e
	 GEQ4mbrURLlCQ==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2210305535bso146419855ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407521; x=1741012321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCqB03ZRHWaC4arbzPu/PsCG9rGmiexjce2IhlWSXfM=;
        b=XcZXybBlsd6IntDjzrUTUJjEeJs27XlRaSY9oLq2BMF/+UdiZdqhWp4ygnFSx5LDwN
         lWNT/YB9tY9Y8qPWSfJEMKTkR29tHv1DtyIkmnovVEVb3BavTMEJDjXxlf4hR3MDBPNh
         zS5XggfqlhiQNRGSd3KFfHesZYDfXgdMoxdp4+w5gPFhrIn+O2wotYvd6/QHULgMva4x
         LVUl+3mCEMqaigBHDTD4P7qDl39FxUjmnUbeyRhUBOtxAzFmlflXkQJre4tb5IsW9kD2
         xzeuqPAfbYD+AKi3pdFtbUtZWLM++NULkD5063sDhcvr1EA0CfF9H2OiyjTd4Z3MYrnA
         ckHQ==
X-Gm-Message-State: AOJu0YwiaQd1JotOUF6EzerTj9KxG/lnzag02V8KKjp2Jmh1qn+2B169
	kPSdfoNoSwjU5jaG4IVNgUS0CpFkg0Z1IPLN67s0GEQCPgMRaMxjQlBI5LzCQrczGK7XUS0UNnG
	nVjniwIBxuTLmQcW+/5tDiNbLLnTx9TciqNF4jePDikK1T+A1HPpdP5MGwJUIvyHms+esJbbvAk
	nK4JP4UUI=
X-Gm-Gg: ASbGnct4ftLXHsCSTCgzrRbEtI0MBOfDag+h2QYf7oMJH8qkuno9YjIkPkHsaN6O1nL
	VT7IAe8vqiDhasSLsbOU1T5BD2Nb9pK+3iad7p8sswYX/RPC3botyL3BLGO3Wa2BDMPkUCCEiZk
	tMmefX+1iaST+5Vcioae32ZZjg2dv6ORrtOOUbRoq9yns61OnWvEkgKpZIL/MEi0Skwyyqi6wG3
	Yu4BF1g2WxKvdscVQivbFsNtGb95Z6dm0TBBV00M+6SmbE/CjLvprcEFYScNEAQtmYXqeTWp3KU
	rtv1KJH5wtadLplz
X-Received: by 2002:a17:903:22cc:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-221a1195022mr196437185ad.50.1740407521271;
        Mon, 24 Feb 2025 06:32:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzmmDIpDz01ZcZkwYhJ6KIm6ze5u/aIDvurrAZl++4KbI6uYsymKW0myqu6x9oVMuYI0yX5A==
X-Received: by 2002:a17:903:22cc:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-221a1195022mr196436875ad.50.1740407520844;
        Mon, 24 Feb 2025 06:32:00 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:de7b:58db:ab85:24ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d067sm177613895ad.109.2025.02.24.06.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:32:00 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/9] gpio: aggregator: expose aggregator created via legacy sysfs to configfs
Date: Mon, 24 Feb 2025 23:31:32 +0900
Message-ID: <20250224143134.3024598-8-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250224143134.3024598-1-koichiro.den@canonical.com>
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
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
index 0c30153ce9ab..6b0e42774b86 100644
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


