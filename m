Return-Path: <linux-gpio+bounces-16150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA4CA386BC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6558173E84
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97141224AFE;
	Mon, 17 Feb 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="TfyjByHG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F01621CC74
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802974; cv=none; b=nZIStQaZi7bY97OxuI2876am6FLmT9bVVgHt0Hyakc7zXBtDlUmAlgSas87L9tjXvJ/cC7dnfvXkqzW3NLJU4P36qfnwxe1ajGBaGJVa1VC4VdX/IVmvrskSFE3bHozlC4lT8hp0mQQdjc9kYXudMvEHi5zDjZA84V8oQKGuYM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802974; c=relaxed/simple;
	bh=NJOhhLM9jagdTTN67NRrlRQGIjAkkuvzOzST0beJO9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDGkpYKZd/2XR8eBjKsszpCVWo9KMWzOIiI0mbPEYmSIFvUSAw9rfz+cejzlTReXxz8VPnFCyZKvMsNQj/NCx9nsUAQHQwv+UtNwCXKEopIjh6famj6X0V4rPggwYkcLrttq5l/kRy/uJ8PJ2ywu1iPUOv8mrgWVXdxo2lmexAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=TfyjByHG; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A02843F164
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802970;
	bh=Df80Zzm0kWEKoUngHLT3TkabwBuP0/F6cq+enevcDvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=TfyjByHGy/jl8LbSyCjBOp17zT/+EcbficGE/p/k2KFqruhb7L2A8oCQsGmhcQ5qg
	 csuqVHjOxlufncU8JaXPy4f4fgVw/xjAj3R45EVXx+tw26qwIPQx0InkIx21jhw00o
	 LLnA4xcAwKgkTp0Dq/U3wdbN8cBH6tU7GNxcD2eg5GzXDnV25UB3IpGmovvbg8R5/m
	 CsPyLVVlYOQ7+IYAc9OeqJNCu2xstDYe4rjmsq+xeDU2/KqOn9cfGwVS6cFit3HyVF
	 IV0HFFQQ1cdWocDQQClhtTGkIWfKgpgy2HHEqAH8HCfb3ayMYbuhKFmhiXbC8BkKM6
	 B6dmfxlSL9JCQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc1e7efe00so7671739a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802969; x=1740407769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df80Zzm0kWEKoUngHLT3TkabwBuP0/F6cq+enevcDvE=;
        b=CO/GKC6D9BUvIp1FkPK95fTudujoUfm8Bf/EwPXsSq9a1ZATkQOw1hZ/1A7u8/AcIA
         8UqZXx9rZ/FQsWOKjoXtP04J2SYwI2+KR1HQ5I4trml43Gf6yD4HJ2UPn9ucyhUpgq3r
         M3ejApRtUCQSbmQf2VtwEkU0Vk1d58ZocSxZC+35sksiyPdTHVZHFvvO5C6Ad71DyxLj
         FlO4NgoDOY/teqz3WxVEg7oTNfYKVBSTz3M/A9eFp9WTmGFtxbtrQw8v+++NPuH/wCvv
         lW3dAU9faU9slCa7h/69RsMyukv78b0w+UtGyPn1PNxolWh/CpCWY1TE1hF8zZx24sMz
         mcLQ==
X-Gm-Message-State: AOJu0YykhH3gilwBuYS1eRHfUljy6szaOnqfXxvuK+JDEmcFsYeEKPlE
	6t0EOVTNPclt6In+ISoaa7TJFKoBaCMHvrtEx+DSJF7HFnPPuY+377S/h5BSgbOnpgWAgnuRrEy
	jyzvbQWp6tKmrHP+R4P54zEtGLjG0eOK34C22K09Qhw5dtPHR6vMED9+PD8WjXU+hhUuKEJkQff
	oR4bhC39o=
X-Gm-Gg: ASbGncvKJ1Cpdwr+6fqKdC0z0Xn7HWN2lodKgwySyjCSZq45bpiAxHfi6w9UQvE4dmn
	5L65oVlkjahcGYAskuYGfNhLNV5eWlofzzcu4pFs8qlb6SvqYtSE4fFB9CRXxTep3oJ+QYMhm2u
	ll1qSlnHvF0WTJWOYsTAMjIGawkXJeTWYX6juEEnS78LuJ/J183dCiqASII/wNTLToakfRAv91t
	NIjeEXnJFLUrcnxRDSVkaaPvdKtRSAyzsfohnxfA6mZEjRgjb3ZzTyM923WX8dysqQ8wv+MeKP9
	SFV7NBeUE06lwHpd0rmq41E=
X-Received: by 2002:a17:90b:1e46:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-2fc40d14e35mr14720591a91.5.1739802968780;
        Mon, 17 Feb 2025 06:36:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOlOx2UpXCGlKx/OugLik7O241OJG1jR7d+OkOyOXlwVsrTKouk/mybnFP1KKUQ/ZXBq4Ryg==
X-Received: by 2002:a17:90b:1e46:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-2fc40d14e35mr14720548a91.5.1739802968229;
        Mon, 17 Feb 2025 06:36:08 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:36:07 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] gpio: aggregator: introduce basic configfs interface
Date: Mon, 17 Feb 2025 23:35:26 +0900
Message-ID: <20250217143531.541185-5-koichiro.den@canonical.com>
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

The existing sysfs 'new_device' interface has several limitations:
* No way to determine when GPIO aggregator creation is complete.
* No way to retrieve errors when creating a GPIO aggregator.
* No way to trace a GPIO line of an aggregator back to its
  corresponding physical device.
* The 'new_device' echo does not indicate which virtual gpiochip<N>
  was created.
* No way to assign names to GPIO lines exported through an aggregator.

Introduce the new configfs interface for gpio-aggregator to address
these limitations. It provides a more streamlined, modern, and
extensible configuration method. For backward compatibility, the
'new_device' interface and its behavior is retained for now.

This commit implements basic functionalities:

  /config/gpio-aggregator/<name-of-your-choice>/
  /config/gpio-aggregator/<name-of-your-choice>/live
  /config/gpio-aggregator/<name-of-your-choice>/dev_name
  /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
  /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
  /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset

Basic setup flow is:
1. Create a directory for a GPIO aggregator.
2. Create subdirectories for each line you want to instantiate.
3. In each line directory, configure the key and offset.
   The key/offset semantics are as follows:
   * If offset is >= 0:
     - key specifies the name of the chip this GPIO belongs to
     - offset specifies the line offset within that chip.
   * If offset is <0:
     - key needs to specify the GPIO line name.
4. Return to the aggregator's root directory and write '1' to the live
   attribute.

For example, the command in the existing kernel doc:

  echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device

is equivalent to:

  mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
  # Change <custom-name> to name of your choice (e.g. "aggr0")
  cd /sys/kernel/config/gpio-aggregator/<custom-name>
  mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
  echo e6052000.gpio > line0/key
  echo 19            > line0/offset
  echo e6050000.gpio > line1/key
  echo 20            > line1/offset
  echo e6050000.gpio > line2/key
  echo 21            > line2/offset
  echo 1             > live

The corresponding gpio_device id can be identified as follows:

  cd /sys/kernel/config/gpio-aggregator/<custom-name>
  ls -d /sys/devices/platform/`cat dev_name`/gpiochip*

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig           |   2 +
 drivers/gpio/gpio-aggregator.c | 546 ++++++++++++++++++++++++++++++++-
 2 files changed, 538 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d8fede07149f..591244e6cd4e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1871,6 +1871,8 @@ menu "Virtual GPIO drivers"
 
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
+	select CONFIGFS_FS
+	select GPIO_PSEUDO
 	help
 	  Say yes here to enable the GPIO Aggregator, which provides a way to
 	  aggregate existing GPIO lines into a new virtual GPIO chip.
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index a93b7d3de929..ec102453817b 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -9,10 +9,13 @@
 
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
+#include <linux/configfs.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -27,6 +30,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 
+#include "gpio-pseudo.h"
+
 #define AGGREGATOR_MAX_GPIOS 512
 
 /*
@@ -34,12 +39,36 @@
  */
 
 struct gpio_aggregator {
+	struct pseudo_gpio_common common;
+	struct config_group group;
 	struct gpiod_lookup_table *lookups;
-	struct platform_device *pdev;
+	struct mutex lock;
 	int id;
+
+	/* List of gpio_aggregator_line. Always added in order */
+	struct list_head list_head;
+
+	/* used by legacy sysfs interface only */
+	bool init_via_sysfs;
 	char args[];
 };
 
+struct gpio_aggregator_line {
+	struct config_group group;
+	struct gpio_aggregator *parent;
+	struct list_head entry;
+
+	/* Line index within the aggregator device */
+	unsigned int idx;
+
+	/* GPIO chip label or line name */
+	const char *key;
+	/* Can be negative to indicate lookup by line name */
+	int offset;
+
+	enum gpio_lookup_flags flags;
+};
+
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
@@ -59,6 +88,8 @@ static int aggr_alloc(struct gpio_aggregator **aggr, size_t arg_size)
 		return ret;
 
 	new->id = ret;
+	INIT_LIST_HEAD(&new->list_head);
+	mutex_init(&new->lock);
 	*aggr = no_free_ptr(new);
 	return 0;
 }
@@ -68,6 +99,7 @@ static void aggr_free(struct gpio_aggregator *aggr)
 	mutex_lock(&gpio_aggregator_lock);
 	idr_remove(&gpio_aggregator_idr, aggr->id);
 	mutex_unlock(&gpio_aggregator_lock);
+	mutex_destroy(&aggr->lock);
 	kfree(aggr);
 }
 
@@ -90,6 +122,70 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 	return 0;
 }
 
+static bool aggr_is_active(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return aggr->common.pdev && platform_get_drvdata(aggr->common.pdev);
+}
+
+static size_t aggr_count_lines(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return list_count_nodes(&aggr->list_head);
+}
+
+static struct gpio_aggregator_line *aggr_line_alloc(
+		struct gpio_aggregator *parent, unsigned int idx, char *key, int offset)
+{
+	struct gpio_aggregator_line *line;
+
+	line = kzalloc(sizeof(*line), GFP_KERNEL);
+	if (!line)
+		return ERR_PTR(-ENOMEM);
+
+	if (key) {
+		line->key = kstrdup(key, GFP_KERNEL);
+		if (!line->key) {
+			kfree(line);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	line->flags = GPIO_LOOKUP_FLAGS_DEFAULT;
+	line->parent = parent;
+	line->idx = idx;
+	line->offset = offset;
+	INIT_LIST_HEAD(&line->entry);
+
+	return line;
+}
+
+static void aggr_line_add(struct gpio_aggregator *aggr,
+			  struct gpio_aggregator_line *line)
+{
+	struct gpio_aggregator_line *tmp;
+
+	lockdep_assert_held(&aggr->lock);
+
+	list_for_each_entry(tmp, &aggr->list_head, entry) {
+		if (tmp->idx > line->idx) {
+			list_add_tail(&line->entry, &tmp->entry);
+			return;
+		}
+	}
+	list_add_tail(&line->entry, &aggr->list_head);
+}
+
+static void aggr_line_del(struct gpio_aggregator *aggr,
+			  struct gpio_aggregator_line *line)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	list_del(&line->entry);
+}
+
 
 /*
  *  GPIO Forwarder
@@ -414,6 +510,400 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 }
 
 
+/*
+ * Configfs interface
+ */
+
+static struct gpio_aggregator *
+to_gpio_aggregator(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_aggregator, group);
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
+static int aggr_activate(struct gpio_aggregator *aggr)
+{
+	struct platform_device_info pdevinfo;
+	struct gpio_aggregator_line *line;
+	unsigned int n = 0;
+	int ret = 0;
+
+	if (aggr_count_lines(aggr) == 0)
+		return -EINVAL;
+
+	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
+				GFP_KERNEL);
+	if (!aggr->lookups)
+		return -ENOMEM;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.name = DRV_NAME;
+	pdevinfo.id = aggr->id;
+
+	/* The list is always sorted as new elements are inserted in order. */
+	list_for_each_entry(line, &aggr->list_head, entry) {
+		/*
+		 * - Either GPIO chip label or line name must be configured
+		 *   (i.e. line->key must be non-NULL)
+		 * - Line directories must be named with sequential numeric
+		 *   suffixes starting from 0. (i.e. ./line0, ./line1, ...)
+		 */
+		if (!line->key || line->idx != n) {
+			ret = -EINVAL;
+			goto err_remove_lookups;
+		}
+
+		if (line->offset < 0)
+			ret = aggr_add_gpio(aggr, line->key, U16_MAX, &n);
+		else
+			ret = aggr_add_gpio(aggr, line->key, line->offset, &n);
+		if (ret)
+			goto err_remove_lookups;
+	}
+
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, aggr->id);
+	if (!aggr->lookups->dev_id) {
+		ret = -ENOMEM;
+		goto err_remove_lookups;
+	}
+
+	gpiod_add_lookup_table(aggr->lookups);
+
+	ret = pseudo_gpio_register(&aggr->common, &pdevinfo);
+	if (ret)
+		goto err_remove_lookup_table;
+
+	return 0;
+
+err_remove_lookup_table:
+	kfree(aggr->lookups->dev_id);
+	gpiod_remove_lookup_table(aggr->lookups);
+err_remove_lookups:
+	kfree(aggr->lookups);
+
+	return ret;
+}
+
+static void aggr_deactivate(struct gpio_aggregator *aggr)
+{
+	pseudo_gpio_unregister(&aggr->common);
+	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
+	kfree(aggr->lookups);
+}
+
+static void aggr_lockup_configfs(struct gpio_aggregator *aggr, bool lock)
+{
+	struct configfs_subsystem *subsys = aggr->group.cg_subsys;
+	struct gpio_aggregator_line *line;
+
+	/*
+	 * The device only needs to depend on leaf lines. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	list_for_each_entry(line, &aggr->list_head, entry) {
+		if (lock)
+			configfs_depend_item_unlocked(
+					subsys, &line->group.cg_item);
+		else
+			configfs_undepend_item_unlocked(
+					&line->group.cg_item);
+	}
+}
+
+static ssize_t
+gpio_aggr_line_key_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sysfs_emit(page, "%s\n", line->key ?: "");
+}
+
+static ssize_t
+gpio_aggr_line_key_store(struct config_item *item, const char *page,
+			 size_t count)
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
+	if (aggr_is_active(aggr))
+		return -EBUSY;
+
+	kfree(line->key);
+	line->key = no_free_ptr(key);
+
+	return count;
+}
+CONFIGFS_ATTR(gpio_aggr_line_, key);
+
+static ssize_t
+gpio_aggr_line_offset_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+	unsigned int offset;
+
+	scoped_guard(mutex, &aggr->lock)
+		offset = line->offset;
+
+	return sysfs_emit(page, "%d\n", offset);
+}
+
+static ssize_t
+gpio_aggr_line_offset_store(struct config_item *item, const char *page,
+			    size_t count)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+	int offset, ret;
+
+	ret = kstrtoint(page, 0, &offset);
+	if (ret)
+		return ret;
+
+	/*
+	 * When offset == -1, 'key' represents a line name to lookup.
+	 * When 0 <= offset < 65535, 'key' represents the label of the chip with
+	 * the 'offset' value representing the line within that chip.
+	 *
+	 * GPIOLIB uses the U16_MAX value to indicate lookup by line name so
+	 * the greatest offset we can accept is (U16_MAX - 1).
+	 */
+	if (offset > (U16_MAX - 1) || offset < -1)
+		return -EINVAL;
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		return -EBUSY;
+
+	line->offset = offset;
+
+	return count;
+}
+CONFIGFS_ATTR(gpio_aggr_line_, offset);
+
+static struct configfs_attribute *gpio_aggr_line_attrs[] = {
+	&gpio_aggr_line_attr_key,
+	&gpio_aggr_line_attr_offset,
+	NULL
+};
+
+static ssize_t
+gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	struct platform_device *pdev;
+
+	guard(mutex)(&aggr->lock);
+
+	pdev = aggr->common.pdev;
+	if (pdev)
+		return sysfs_emit(page, "%s\n", dev_name(&pdev->dev));
+
+	return sysfs_emit(page, "%s.%d\n", DRV_NAME, aggr->id);
+}
+CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
+
+static ssize_t
+gpio_aggr_device_live_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	bool active;
+
+	scoped_guard(mutex, &aggr->lock)
+		active = aggr_is_active(aggr);
+
+	return sysfs_emit(page, "%c\n", active ? '1' : '0');
+}
+
+static ssize_t
+gpio_aggr_device_live_store(struct config_item *item, const char *page,
+			    size_t count)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	int ret = 0;
+	bool live;
+
+	ret = kstrtobool(page, &live);
+	if (ret)
+		return ret;
+
+	if (!try_module_get(THIS_MODULE))
+		return -ENOENT;
+
+	if (live)
+		aggr_lockup_configfs(aggr, true);
+
+	scoped_guard(mutex, &aggr->lock) {
+		if (live == aggr_is_active(aggr))
+			ret = -EPERM;
+		else if (live)
+			ret = aggr_activate(aggr);
+		else
+			aggr_deactivate(aggr);
+	}
+
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		aggr_lockup_configfs(aggr, false);
+
+	module_put(THIS_MODULE);
+
+	return ret ?: count;
+}
+CONFIGFS_ATTR(gpio_aggr_device_, live);
+
+static struct configfs_attribute *gpio_aggr_device_attrs[] = {
+	&gpio_aggr_device_attr_dev_name,
+	&gpio_aggr_device_attr_live,
+	NULL
+};
+
+static void
+gpio_aggr_line_release(struct config_item *item)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	aggr_line_del(aggr, line);
+	kfree(line->key);
+	kfree(line);
+}
+
+static struct configfs_item_operations gpio_aggr_line_item_ops = {
+	.release	= gpio_aggr_line_release,
+};
+
+static const struct config_item_type gpio_aggr_line_type = {
+	.ct_item_ops	= &gpio_aggr_line_item_ops,
+	.ct_attrs	= gpio_aggr_line_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void gpio_aggr_device_release(struct config_item *item)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+
+	guard(mutex)(&aggr->lock);
+
+	/*
+	 * If the aggregator is active, this code wouldn't be reached,
+	 * so calling aggr_deactivate() is always unnecessary.
+	 */
+	aggr_free(aggr);
+}
+
+static struct configfs_item_operations gpio_aggr_device_item_ops = {
+	.release	= gpio_aggr_device_release,
+};
+
+static struct config_group *
+gpio_aggr_device_make_group(struct config_group *group, const char *name)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(&group->cg_item);
+	struct gpio_aggregator_line *line;
+	unsigned int idx;
+	int ret, nchar;
+
+	ret = sscanf(name, "line%u%n", &idx, &nchar);
+	if (ret != 1 || nchar != strlen(name))
+		return ERR_PTR(-EINVAL);
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		return ERR_PTR(-EBUSY);
+
+	list_for_each_entry(line, &aggr->list_head, entry)
+		if (line->idx == idx)
+			return ERR_PTR(-EINVAL);
+
+	line = aggr_line_alloc(aggr, idx, NULL, -1);
+	if (!line)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&line->group, name, &gpio_aggr_line_type);
+
+	aggr_line_add(aggr, line);
+
+	return &line->group;
+}
+
+static struct configfs_group_operations gpio_aggr_device_group_ops = {
+	.make_group	= gpio_aggr_device_make_group,
+};
+
+static const struct config_item_type gpio_aggr_device_type = {
+	.ct_group_ops	= &gpio_aggr_device_group_ops,
+	.ct_item_ops	= &gpio_aggr_device_item_ops,
+	.ct_attrs	= gpio_aggr_device_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_aggr_make_group(struct config_group *group, const char *name)
+{
+	struct gpio_aggregator *aggr;
+	int ret;
+
+	/* arg space is unneeded */
+	ret = aggr_alloc(&aggr, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	config_group_init_type_name(&aggr->group, name, &gpio_aggr_device_type);
+	pseudo_gpio_init(&aggr->common);
+
+	return &aggr->group;
+}
+
+static struct configfs_group_operations gpio_aggr_group_ops = {
+	.make_group	= gpio_aggr_make_group,
+};
+
+static const struct config_item_type gpio_aggr_type = {
+	.ct_group_ops	= &gpio_aggr_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem gpio_aggr_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf	= DRV_NAME,
+			.ci_type	= &gpio_aggr_type,
+		},
+	},
+};
+
+
 /*
  * Sysfs interface
  */
@@ -485,6 +975,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 	memcpy(aggr->args, buf, count + 1);
 
+	aggr->init_via_sysfs = true;
 	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
 				GFP_KERNEL);
 	if (!aggr->lookups) {
@@ -510,7 +1001,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 		goto remove_table;
 	}
 
-	aggr->pdev = pdev;
+	aggr->common.pdev = pdev;
 	module_put(THIS_MODULE);
 	return count;
 
@@ -531,10 +1022,7 @@ static DRIVER_ATTR_WO(new_device);
 
 static void gpio_aggregator_free(struct gpio_aggregator *aggr)
 {
-	platform_device_unregister(aggr->pdev);
-	gpiod_remove_lookup_table(aggr->lookups);
-	kfree(aggr->lookups->dev_id);
-	kfree(aggr->lookups);
+	aggr_deactivate(aggr);
 	kfree(aggr);
 }
 
@@ -556,12 +1044,19 @@ static ssize_t delete_device_store(struct device_driver *driver,
 		return -ENOENT;
 
 	mutex_lock(&gpio_aggregator_lock);
-	aggr = idr_remove(&gpio_aggregator_idr, id);
-	mutex_unlock(&gpio_aggregator_lock);
-	if (!aggr) {
+	aggr = idr_find(&gpio_aggregator_idr, id);
+	/*
+	 * For simplicity, devices created via configfs cannot be deleted
+	 * via sysfs.
+	 */
+	if (aggr && aggr->init_via_sysfs)
+		idr_remove(&gpio_aggregator_idr, id);
+	else {
+		mutex_unlock(&gpio_aggregator_lock);
 		module_put(THIS_MODULE);
 		return -ENOENT;
 	}
+	mutex_unlock(&gpio_aggregator_lock);
 
 	gpio_aggregator_free(aggr);
 	module_put(THIS_MODULE);
@@ -636,6 +1131,10 @@ static struct platform_driver gpio_aggregator_driver = {
 
 static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
 {
+	/*
+	 * There should be no aggregator created via configfs, as their
+	 * presence would prevent module unloading.
+	 */
 	gpio_aggregator_free(p);
 	return 0;
 }
@@ -650,7 +1149,33 @@ static void __exit gpio_aggregator_remove_all(void)
 
 static int __init gpio_aggregator_init(void)
 {
-	return platform_driver_register(&gpio_aggregator_driver);
+	int ret = 0;
+
+	config_group_init(&gpio_aggr_subsys.su_group);
+	mutex_init(&gpio_aggr_subsys.su_mutex);
+	ret = configfs_register_subsystem(&gpio_aggr_subsys);
+	if (ret) {
+		pr_err("Failed to register the '%s' configfs subsystem: %d\n",
+		       gpio_aggr_subsys.su_group.cg_item.ci_namebuf, ret);
+		mutex_destroy(&gpio_aggr_subsys.su_mutex);
+		return ret;
+	}
+
+	/*
+	 * CAVEAT: This must occur after configfs registration. Otherwise,
+	 * a race condition could arise: driver attribute groups might be
+	 * exposed and accessed by users before configfs registration
+	 * completes. new_device_store() does not expect a partially
+	 * initialized configfs state.
+	 */
+	ret = platform_driver_register(&gpio_aggregator_driver);
+	if (ret) {
+		pr_err("Failed to register the platform driver: %d\n", ret);
+		mutex_destroy(&gpio_aggr_subsys.su_mutex);
+		configfs_unregister_subsystem(&gpio_aggr_subsys);
+	}
+
+	return ret;
 }
 module_init(gpio_aggregator_init);
 
@@ -658,6 +1183,7 @@ static void __exit gpio_aggregator_exit(void)
 {
 	gpio_aggregator_remove_all();
 	platform_driver_unregister(&gpio_aggregator_driver);
+	configfs_unregister_subsystem(&gpio_aggr_subsys);
 }
 module_exit(gpio_aggregator_exit);
 
-- 
2.45.2


