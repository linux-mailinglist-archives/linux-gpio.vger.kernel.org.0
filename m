Return-Path: <linux-gpio+bounces-15197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5BA2519E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 04:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99D53A394B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F8C1DA612;
	Mon,  3 Feb 2025 03:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="eblDfehz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889631D88A6
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552376; cv=none; b=pqPegxP3/LZCJqiX4q/Afxgp1eqwVR4buOnELDoVltnDNZclMhYfqXqP2uK1PifRphLX6V/wsCUr+p05MQM3i9m4lINf0KW5oT0AWhmk3hc98i7NWu3itfjS/rTaAaKQiJLTkMbxwGNXBLIBHtQWlLB5BiDnHzZ4Qz4mY7uudX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552376; c=relaxed/simple;
	bh=U6fEqHsDuUdsVMOe9L1E9vnzvA8Wve4zCELAh2CEfW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reZmkawxSfB4HHru5lcFELv7705oVcgcAfO/k2hK1RZy96VKedm0F63bT8G4sFWd7saw2WUOz4IOdvmCUFP/2wLc9OXqmvQrD3cvWPUyiJR7pOafaK/+NCFApk9UcwEPe1b4Z9LVKStrCDaZCkHTXq0+j8OoYOSirm0CYbsolEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=eblDfehz; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 09A863F887
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552373;
	bh=eQvDT9I6qIi3KEVVJ1wodCSAHDsDnsDQuR6xWwKwDIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=eblDfehz4aaYaoDJ9wUxjarN6Z1q0tkOlOEnW05hRNg/r7Y3/ZdUiRdD1h5ep53K5
	 LSrwRpf/QHjUGoab/fX475qqQvTWLiUZFBo+3G53fcSxodnHE1h+QS3Mg5BB9u9Fuk
	 tAlcXOgnq7Ea/tNwRIHWP7v/TGQ8O8s+4pZLQ/ghh/T3hso6NguUfPwJsOTlvYYLPx
	 rSgTLc1AQ/l15noKG85ugZtTp2XdMyt2XcYb2iYucpBhyggVVSziXo6WZ2GswmW9ga
	 /8PdgfgBev/SSveze+rabVz8c4zDzM73XgW3B1an8SeOky65aj5w7lteS/6T58vHJZ
	 Uc4yLjAB0t/cw==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21648c8601cso71528215ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 19:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552371; x=1739157171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQvDT9I6qIi3KEVVJ1wodCSAHDsDnsDQuR6xWwKwDIM=;
        b=FAxTN1+DjKV4S/4CZBHF4xhCgLdv39Ac9CrFRlIThLit6cEIx4P1b3ymU6tZ58Gv2H
         X4sXwO3JzRJ+JZ2ZzX/qLbPIlMIC1vryOrYMHkGzjtb8BVOpTIuER3GUD88Iy9f+d/H4
         j8ewh1V9084dBAbzp5bcx48xfCn16bioSjQIgmFdjucwmee3eOVIyeMyi3BICTlLP7uP
         FSIF0fe89biMXUuxthq0t68Y3JWnh+7GWnqtyKjFCMvj8Dz8/3CRaJmZ1y3+VBbxL7Y7
         8PUbH5oN/T4Q6FbIqEY2XpKKWn+RuZBF6hX+AF8ySEr35JKVdBnEzhscoqAyaeedzOrp
         9Opg==
X-Gm-Message-State: AOJu0Yx8Nm2nX3xq9hx9g1/Z39Lr6u/3Ix191Awb78P3R0blJPqlnl05
	m13uvoHrzHLkRB9/95DbHsw1as4JvNmeNB5nu5vWfL5KEyEF8GJcaQLakDexpOVcK0GZJbmvI3Z
	MEBxyHSEicKvd6SZ1315Bvc24l6mjNfVvTfdplv19zYPZxEnocZ0C3/sM3ibzaYPMDhTxw72h32
	rE2GzrVO8=
X-Gm-Gg: ASbGncuiGnfyL4G9DwjRNLpHkcYY0Y2+5X63erVHBvbY91aMN/Jkt8wj7JTa6LiHkwJ
	zBeHO4xVzbxgIJFPmUNZ0470ZdzC57S5AVBgbfEFJ7BJoTeH7gyC22Nm029vJduxEDQxE6LCzzw
	m6PBYZtCy1itAYTWWKumQWlEH9UMGfT6On0wPbHTmjMVFfaeDtogCQU3kPrCjwkb8zAxA1n5Vfs
	Nf6Pp5LBkPfZmSkDnaNJIfCbgZ4+YQNV36YkwIkGNpZl6QkYAC7gB1GQCFr3jCFOzHmZcY/Eiyn
	bbin
X-Received: by 2002:a17:902:e84b:b0:215:b087:5d62 with SMTP id d9443c01a7336-21dd7deec73mr329853495ad.36.1738552371130;
        Sun, 02 Feb 2025 19:12:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZwxZJDa9lhc3DtX2c9/0Y/XXsToTPF3wSKg/veEbtxBCWuGSeuvImIo4eqsvLkLd/6lyQiw==
X-Received: by 2002:a17:902:e84b:b0:215:b087:5d62 with SMTP id d9443c01a7336-21dd7deec73mr329853145ad.36.1738552370682;
        Sun, 02 Feb 2025 19:12:50 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:50 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] gpio: aggregator: expoose aggregator created via legacy sysfs to configfs
Date: Mon,  3 Feb 2025 12:12:11 +0900
Message-ID: <20250203031213.399914-9-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose settings for aggregators created using the sysfs 'new_device'
interface to configfs. Once written to 'new_device', an "_auto.<N>" path
appears in the configfs regardless of whether the probe succeeds.
Consequently, users can no longer use that prefix for custom GPIO
aggregator names. The 'live' attribute changes to 1 when the probe
succeeds and the GPIO forwarder is instantiated.

Note that the aggregator device created via sysfs is asynchrnous, i.e.
writing into 'new_device' returns without waiting for probe completion,
and the probe may succeed, fail, or eventually succeed via deferred
probe. Thus, the 'live' attribute may change from 0 to 1 asynchronously
without notice. So, editting key/offset/name while it's waiting for
deferred probe is prohibited.

The configfs auto-generation relies on create_default_group(), which
inherently prohibits rmdir(2). To align with the limitation, this commit
also prohibits mkdir(2) for them. When users want to change the number
of lines for an aggregator initialized via 'new_device', they need to
tear down the device using 'delete_device' and reconfigure it from
scratch. This does not break previous behaviour; users of legacy sysfs
interface simply gain additional almost read-only configfs exposure.

Still, users can write into 'live' attribute to toggle the device unless
it's waiting for deferred probe. So once probe succeeds, they can
deactivate it in the same manner as the devices initialized via
configfs.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 174 +++++++++++++++++++++++++++++----
 1 file changed, 157 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d5fd9fe58164..e101b78ad524 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -32,6 +32,7 @@
 #include <linux/gpio/machine.h>
 
 #define AGGREGATOR_MAX_GPIOS 512
+#define AGGREGATOR_LEGACY_PREFIX "_auto"
 
 /*
  * GPIO Aggregator sysfs interface
@@ -52,6 +53,8 @@ struct gpio_aggregator {
 	/* List of gpio_aggregator_line. Always added in order */
 	struct list_head list_head;
 
+	/* used by legacy sysfs interface only */
+	bool init_via_sysfs;
 	char args[];
 };
 
@@ -73,6 +76,10 @@ struct gpio_aggregator_line {
 	enum gpio_lookup_flags flags;
 };
 
+struct gpio_aggregator_pdev_meta {
+	bool init_via_sysfs;
+};
+
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
@@ -127,6 +134,14 @@ static bool aggr_is_active(struct gpio_aggregator *aggr)
 	return !!aggr->pdev && platform_get_drvdata(aggr->pdev);
 }
 
+/* Only aggregators created via legacy sysfs can be "activating". */
+static bool aggr_is_activating(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return !!aggr->pdev && !platform_get_drvdata(aggr->pdev);
+}
+
 static size_t aggr_count_lines(struct gpio_aggregator *aggr)
 {
 	lockdep_assert_held(&aggr->lock);
@@ -186,6 +201,25 @@ static void aggr_line_del(struct gpio_aggregator *aggr,
 	list_del(&line->entry);
 }
 
+static void aggr_unregister_lines(struct gpio_aggregator *aggr)
+{
+	struct gpio_aggregator_line *line;
+
+	list_for_each_entry(line, &aggr->list_head, entry)
+		configfs_unregister_group(&line->group);
+}
+
+static void aggr_free_lines(struct gpio_aggregator *aggr)
+{
+	struct gpio_aggregator_line *line, *tmp;
+
+	list_for_each_entry_safe(line, tmp, &aggr->list_head, entry) {
+		aggr_line_del(aggr, line);
+		kfree(line->key);
+		kfree(line);
+	}
+}
+
 
 /*
  *  GPIO Forwarder
@@ -447,6 +481,7 @@ static int gpiochip_fwd_line_names(struct device *dev, const char **names, int l
  *         This array must contain @ngpios entries, and must not be deallocated
  *         before the forwarder has been destroyed again.
  * @features: Bitwise ORed features as defined with FWD_FEATURE_*.
+ * @init_via_sysfs: True if the creation is done via legacy sysfs interface.
  *
  * This function creates a new gpiochip, which forwards all GPIO operations to
  * the passed GPIO descriptors.
@@ -457,7 +492,8 @@ static int gpiochip_fwd_line_names(struct device *dev, const char **names, int l
 static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 						unsigned int ngpios,
 						struct gpio_desc *descs[],
-						unsigned long features)
+						unsigned long features,
+						bool init_via_sysfs)
 {
 	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
@@ -473,7 +509,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 
 	chip = &fwd->chip;
 
-	if (!dev_of_node(dev)) {
+	if (!dev_of_node(dev) && !init_via_sysfs) {
 		line_names = devm_kcalloc(dev, sizeof(*line_names), ngpios, GFP_KERNEL);
 		if (!line_names)
 			return ERR_PTR(-ENOMEM);
@@ -516,7 +552,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	chip->ngpio = ngpios;
 	fwd->descs = descs;
 
-	if (!dev_of_node(dev))
+	if (!dev_of_node(dev) && !init_via_sysfs)
 		chip->names = line_names;
 
 	if (chip->can_sleep)
@@ -734,7 +770,7 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->key);
@@ -772,7 +808,7 @@ gpio_aggr_line_name_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	kfree(line->name);
@@ -821,7 +857,7 @@ gpio_aggr_line_offset_store(struct config_item *item, const char *page,
 
 	guard(mutex)(&aggr->lock);
 
-	if (aggr_is_active(aggr))
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
 		return -EBUSY;
 
 	line->offset = offset;
@@ -879,11 +915,12 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
 	if (ret)
 		return ret;
 
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
@@ -895,7 +932,7 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
 	 * Undepend is required only if device disablement (live == 0)
 	 * succeeds or if device enablement (live == 1) fails.
 	 */
-	if (live == !!ret)
+	if (live == !!ret && !aggr->init_via_sysfs)
 		aggr_lockup_configfs(aggr, false);
 
 	return ret ?: count;
@@ -963,6 +1000,15 @@ gpio_aggr_device_make_group(struct config_group *group, const char *name)
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
@@ -1002,6 +1048,14 @@ gpio_aggr_make_group(struct config_group *group, const char *name)
 	if (!aggr)
 		return ERR_PTR(-ENOMEM);
 
+	/*
+	 * "_auto" prefix is reserved for auto-generated config group
+	 * for devices create via legacy sysfs interface.
+	 */
+	if (strncmp(name, AGGREGATOR_LEGACY_PREFIX,
+		    sizeof(AGGREGATOR_LEGACY_PREFIX)) == 0)
+		return ERR_PTR(-EINVAL);
+
 	mutex_lock(&gpio_aggregator_lock);
 	aggr->id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
 	mutex_unlock(&gpio_aggregator_lock);
@@ -1044,6 +1098,8 @@ static struct configfs_subsystem gpio_aggr_subsys = {
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
+	struct gpio_aggregator_line *line;
+	char name[CONFIGFS_ITEM_NAME_LEN];
 	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
@@ -1055,14 +1111,29 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 
 	args = next_arg(args, &key, &p);
 	while (*args) {
+		scnprintf(name, CONFIGFS_ITEM_NAME_LEN, "line%u", n);
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
@@ -1076,9 +1147,22 @@ static int aggr_parse(struct gpio_aggregator *aggr)
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
@@ -1086,21 +1170,35 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
-		return -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	aggr_unregister_lines(aggr);
+	aggr_free_lines(aggr);
+	return error;
 }
 
 static void aggr_free(struct gpio_aggregator *aggr)
 {
-	aggr_deactivate(aggr);
+	if (aggr_is_active(aggr))
+		aggr_deactivate(aggr);
+
+	aggr_unregister_lines(aggr);
+	aggr_free_lines(aggr);
+	configfs_unregister_group(&aggr->group);
+	mutex_destroy(&aggr->lock);
+	idr_remove(&gpio_aggregator_idr, aggr->id);
 	kfree(aggr);
 }
 
 static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 				size_t count)
 {
+	struct gpio_aggregator_pdev_meta meta;
+	char name[CONFIGFS_ITEM_NAME_LEN];
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
 	int res, id;
@@ -1112,6 +1210,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 	memcpy(aggr->args, buf, count + 1);
 
+	aggr->init_via_sysfs = true;
 	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
 				GFP_KERNEL);
 	if (!aggr->lookups) {
@@ -1128,10 +1227,22 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 		goto free_table;
 	}
 
+	scnprintf(name, CONFIGFS_ITEM_NAME_LEN,
+		  "%s.%d", AGGREGATOR_LEGACY_PREFIX, id);
+	INIT_LIST_HEAD(&aggr->list_head);
+	mutex_init(&aggr->lock);
+	config_group_init_type_name(&aggr->group, name, &gpio_aggr_device_type);
+	init_completion(&aggr->probe_completion);
+
+	/* Expose to configfs */
+	res = configfs_register_group(&gpio_aggr_subsys.su_group, &aggr->group);
+	if (res)
+		goto remove_idr;
+
 	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
 	if (!aggr->lookups->dev_id) {
 		res = -ENOMEM;
-		goto remove_idr;
+		goto unregister_group;
 	}
 
 	res = aggr_parse(aggr);
@@ -1140,7 +1251,9 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
+	meta.init_via_sysfs = true;
+
+	pdev = platform_device_register_data(NULL, DRV_NAME, id, &meta, sizeof(meta));
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -1153,6 +1266,8 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	gpiod_remove_lookup_table(aggr->lookups);
 free_dev_id:
 	kfree(aggr->lookups->dev_id);
+unregister_group:
+	configfs_unregister_group(&aggr->group);
 remove_idr:
 	mutex_lock(&gpio_aggregator_lock);
 	idr_remove(&gpio_aggregator_idr, id);
@@ -1205,7 +1320,9 @@ ATTRIBUTE_GROUPS(gpio_aggregator);
 
 static int gpio_aggregator_probe(struct platform_device *pdev)
 {
+	struct gpio_aggregator_pdev_meta *meta;
 	struct device *dev = &pdev->dev;
+	bool init_via_sysfs = false;
 	struct gpio_desc **descs;
 	struct gpiochip_fwd *fwd;
 	unsigned long features;
@@ -1219,6 +1336,10 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 	if (!descs)
 		return -ENOMEM;
 
+	meta = dev_get_platdata(&pdev->dev);
+	if (meta && meta->init_via_sysfs)
+		init_via_sysfs = true;
+
 	for (i = 0; i < n; i++) {
 		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
 		if (IS_ERR(descs[i]))
@@ -1226,7 +1347,7 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
-	fwd = gpiochip_fwd_create(dev, n, descs, features);
+	fwd = gpiochip_fwd_create(dev, n, descs, features, init_via_sysfs);
 	if (IS_ERR(fwd))
 		return PTR_ERR(fwd);
 
@@ -1258,7 +1379,26 @@ static struct platform_driver gpio_aggregator_driver = {
 
 static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
 {
-	aggr_free(p);
+	/*
+	 * There should be no aggregator created via configfs, as their
+	 * presence would prevent module unloading.
+	 */
+	struct gpio_aggregator *aggr = (struct gpio_aggregator *)p;
+
+	/*
+	 * For aggregators created via legacy sysfs, some may have been
+	 * deactivated via configfs or may be pending a deferred probe.
+	 * In either case, they need to be deactivated.
+	 */
+	if (aggr_is_activating(aggr) || aggr_is_active(aggr))
+		aggr_deactivate(aggr);
+
+	/*
+	 * No need to call aggr_unregister_lines() since
+	 * configfs_unregister_subsystem() has already been invoked.
+	 */
+	aggr_free_lines(aggr);
+	kfree(aggr);
 	return 0;
 }
 
-- 
2.45.2


