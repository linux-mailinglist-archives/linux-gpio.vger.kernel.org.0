Return-Path: <linux-gpio+bounces-18257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1EA7D2EF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 542CB188DDF2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339C6223302;
	Mon,  7 Apr 2025 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="H6zaf1jH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD9222585
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000263; cv=none; b=CmVzCqr3FHrU+r/odR5V7+2qwO04VsBpgmkeJp7TuhLu5sxG7qdmR4f+tCi1wCArHxjNtcGraDq+h9YsJ/YgZsqMfSqrfK2/j6s65CLpOa1Z3IE4Gjs0tdQdzXYL9jsS7Jl1cq1r3qoQdeEu6dfiuaV65wdQsdtcGZMWPvvskUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000263; c=relaxed/simple;
	bh=lB984tfDAhyeELYOhlZPQDtI7dyD54w4UolKF76kaYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnCyPqQKdzuZn+iI5BVlXEQzbiYpxvaljzNnafaO6xElc0pd88VjRlrkwLE/aIqqD3mh4XsJ0mlodQO5vwZ1bpAnPuDBzoQYyFlnvoyUu3lVNNpTwhDI4vpyeVaflk1Plwm7agaW3Y7eH9SDMUI0unqWMvvvCVUniogEQYgf24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=H6zaf1jH; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A34A83F0F8
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000257;
	bh=nUAokXMdm3M+aYaYztUvZ9QujIN2UHQZPTxR18O4/do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=H6zaf1jHyq9whs08wO0vS6ZyIIJlRUTk+CTkd703WRBxJ48xWpPDbo+1ob4VH1PRA
	 0pVKUUhjMvBOcuGJuRJVWKnGXeVF9scg+DNpJGIAghJJoXk2u7pzFDbhHZlpbn+da0
	 cRidHZ7YjmIVZayUDdz8ZsnTIM18W0WDsx/yAlUOlTwEewOcMmTIingvQJ3/yajWeh
	 RED5i4eIm4oVJ7NKQ94KpZgfF/5Y55TCli+BO0r/w9neBIl1RrUloct/BOBGCU9NKJ
	 FWaxdt3Mvr74LF7G0EH4JssSOKpgcfMfA4HrEzLZ0NfdmYrim3KJjpIVjYY4+W/AQW
	 poHc0h/ibDHTA==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2255ae39f8fso53103735ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000256; x=1744605056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUAokXMdm3M+aYaYztUvZ9QujIN2UHQZPTxR18O4/do=;
        b=fuACgS4hBhVLVdBm3B6QuJW/m1aTs/gowz6QilmuLGgF3mezT4XMX9Y6jM8fsxE4CD
         TPF1/+33N7YuG9UT1soy2j+lUmXpzz3vt5pvIO4GVj6nykiDzgGDVyc/cIQMzcvc+iXz
         tgMXa+T6FktqkLwrDil6ekhqVm3Ioh/Wk00OYRnEMqbBdLSlcfcWGkYzSn2KYvu/Ml0C
         i4BV26jkfXzP//MY6weBSRqfvOsnswV3ZDQOTLGFibF7G3Fmh8Oqoi658jE59YqPT1eA
         1y6VYqfFB8V9QhXTISCoZ3OAwVyngu/n4m5imveVKktNI2/4sLtfdW9JAjkymB10Qfft
         PD1w==
X-Gm-Message-State: AOJu0YzLodWvCr7iH+hYSxItdaBrpMKcaSpwnHlQUARqM5+Yi5Lz5S6j
	HgAol7DKoOF5d1H3Se28FWc4GQLPc5w83wvK7AuxDnOD0XxH9Tl7+uO7DvvXrVMokI82O/KT2DZ
	h9aOhIEovTMr6onsD8r/6hmIXN98lJNy5wv4OzJiufLEzNmwXoMrunnDvffcPcmMuXiM6iWX26X
	jxnFp0o7o=
X-Gm-Gg: ASbGncsO8ZPD3Wk8/0MDXVR6GrZksOGMjFKpDJ/aBsW3nfBlf9Zs5B0ScYX/szY3Hcn
	FYOuR4I8P4IHPbwuQ3FxVa/pPzGP+ejDM2MxhfzuNbvSdj6p4xJL7tWOqT56E4N+Drkwk8++gYx
	WoVV4HcAzMpN/RjNtAcLSoBQrR7lrxc7RC7Y2avchHNScQD+u92/fCC+iqBl2RcvxaOpUpQTBHH
	WS+7faeoS1mueKQwCCTPB7q4EthdC8ArsBRejFOnPdgVxEFF2LFvHm1a8qvZ+KHjUmrEk3zucyY
	wDm4PamSF+DWbvIJTu1IpVPbziVm3yUUWw==
X-Received: by 2002:a17:903:3ba8:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22a89a3fa0dmr171385795ad.8.1744000255814;
        Sun, 06 Apr 2025 21:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSj9kmZOKANGNLr/EkSCa2AVcQH1/OMyViFWwuu0o2MUob2tqc4aQFfvW1NHpOX1PZBBouGA==
X-Received: by 2002:a17:903:3ba8:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22a89a3fa0dmr171385315ad.8.1744000255036;
        Sun, 06 Apr 2025 21:30:55 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:54 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/9] gpio: aggregator: introduce basic configfs interface
Date: Mon,  7 Apr 2025 13:30:14 +0900
Message-ID: <20250407043019.4105613-5-koichiro.den@canonical.com>
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
  /config/gpio-aggregator/<name-of-your-choice>/<lineY>/name

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

Also, via configfs, custom GPIO line name can be set like this:

  cd /sys/kernel/config/gpio-aggregator/<custom-name>
  echo "abc"         > line1/name

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig           |   2 +
 drivers/gpio/gpio-aggregator.c | 638 ++++++++++++++++++++++++++++++++-
 2 files changed, 628 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f2c39bbff83a..12b29866f8fd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1869,6 +1869,8 @@ menu "Virtual GPIO drivers"
 
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
+	select CONFIGFS_FS
+	select DEV_SYNC_PROBE
 	help
 	  Say yes here to enable the GPIO Aggregator, which provides a way to
 	  aggregate existing GPIO lines into a new virtual GPIO chip.
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 6f933a76b2b9..d1c837f00ffe 100644
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
 
+#include "dev-sync-probe.h"
+
 #define AGGREGATOR_MAX_GPIOS 512
 
 /*
@@ -34,12 +39,38 @@
  */
 
 struct gpio_aggregator {
+	struct dev_sync_probe_data probe_data;
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
+	/* Custom name for the virtual line */
+	const char *name;
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
 
@@ -59,6 +90,8 @@ static int gpio_aggregator_alloc(struct gpio_aggregator **aggr, size_t arg_size)
 		return ret;
 
 	new->id = ret;
+	INIT_LIST_HEAD(&new->list_head);
+	mutex_init(&new->lock);
 	*aggr = no_free_ptr(new);
 	return 0;
 }
@@ -68,6 +101,7 @@ static void gpio_aggregator_free(struct gpio_aggregator *aggr)
 	scoped_guard(mutex, &gpio_aggregator_lock)
 		idr_remove(&gpio_aggregator_idr, aggr->id);
 
+	mutex_destroy(&aggr->lock);
 	kfree(aggr);
 }
 
@@ -90,6 +124,71 @@ static int gpio_aggregator_add_gpio(struct gpio_aggregator *aggr,
 	return 0;
 }
 
+static bool gpio_aggregator_is_active(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return aggr->probe_data.pdev && platform_get_drvdata(aggr->probe_data.pdev);
+}
+
+static size_t gpio_aggregator_count_lines(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return list_count_nodes(&aggr->list_head);
+}
+
+static struct gpio_aggregator_line *
+gpio_aggregator_line_alloc(struct gpio_aggregator *parent, unsigned int idx,
+			   char *key, int offset)
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
+static void gpio_aggregator_line_add(struct gpio_aggregator *aggr,
+				     struct gpio_aggregator_line *line)
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
+static void gpio_aggregator_line_del(struct gpio_aggregator *aggr,
+				     struct gpio_aggregator_line *line)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	list_del(&line->entry);
+}
+
 
 /*
  *  GPIO Forwarder
@@ -424,6 +523,475 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
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
+static struct fwnode_handle *
+gpio_aggregator_make_device_sw_node(struct gpio_aggregator *aggr)
+{
+	struct property_entry properties[2];
+	struct gpio_aggregator_line *line;
+	size_t num_lines;
+	int n = 0;
+
+	memset(properties, 0, sizeof(properties));
+
+	num_lines = gpio_aggregator_count_lines(aggr);
+	if (num_lines == 0)
+		return NULL;
+
+	const char **line_names __free(kfree) = kcalloc(
+				num_lines, sizeof(*line_names), GFP_KERNEL);
+	if (!line_names)
+		return ERR_PTR(-ENOMEM);
+
+	/* The list is always sorted as new elements are inserted in order. */
+	list_for_each_entry(line, &aggr->list_head, entry)
+		line_names[n++] = line->name ?: "";
+
+	properties[0] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
+					"gpio-line-names",
+					line_names, num_lines);
+
+	return fwnode_create_software_node(properties, NULL);
+}
+
+static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
+{
+	struct platform_device_info pdevinfo;
+	struct gpio_aggregator_line *line;
+	struct fwnode_handle *swnode;
+	unsigned int n = 0;
+	int ret = 0;
+
+	if (gpio_aggregator_count_lines(aggr) == 0)
+		return -EINVAL;
+
+	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
+				GFP_KERNEL);
+	if (!aggr->lookups)
+		return -ENOMEM;
+
+	swnode = gpio_aggregator_make_device_sw_node(aggr);
+	if (IS_ERR(swnode))
+		goto err_remove_lookups;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.name = DRV_NAME;
+	pdevinfo.id = aggr->id;
+	pdevinfo.fwnode = swnode;
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
+			goto err_remove_swnode;
+		}
+
+		if (line->offset < 0)
+			ret = gpio_aggregator_add_gpio(aggr, line->key,
+						       U16_MAX, &n);
+		else
+			ret = gpio_aggregator_add_gpio(aggr, line->key,
+						       line->offset, &n);
+		if (ret)
+			goto err_remove_swnode;
+	}
+
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, aggr->id);
+	if (!aggr->lookups->dev_id) {
+		ret = -ENOMEM;
+		goto err_remove_swnode;
+	}
+
+	gpiod_add_lookup_table(aggr->lookups);
+
+	ret = dev_sync_probe_register(&aggr->probe_data, &pdevinfo);
+	if (ret)
+		goto err_remove_lookup_table;
+
+	return 0;
+
+err_remove_lookup_table:
+	kfree(aggr->lookups->dev_id);
+	gpiod_remove_lookup_table(aggr->lookups);
+err_remove_swnode:
+	fwnode_remove_software_node(swnode);
+err_remove_lookups:
+	kfree(aggr->lookups);
+
+	return ret;
+}
+
+static void gpio_aggregator_deactivate(struct gpio_aggregator *aggr)
+{
+	dev_sync_probe_unregister(&aggr->probe_data);
+	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
+	kfree(aggr->lookups);
+}
+
+static void gpio_aggregator_lockup_configfs(struct gpio_aggregator *aggr,
+					    bool lock)
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
+gpio_aggregator_line_key_show(struct config_item *item, char *page)
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
+gpio_aggregator_line_key_store(struct config_item *item, const char *page,
+			       size_t count)
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
+	if (gpio_aggregator_is_active(aggr))
+		return -EBUSY;
+
+	kfree(line->key);
+	line->key = no_free_ptr(key);
+
+	return count;
+}
+CONFIGFS_ATTR(gpio_aggregator_line_, key);
+
+static ssize_t
+gpio_aggregator_line_name_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sysfs_emit(page, "%s\n", line->name ?: "");
+}
+
+static ssize_t
+gpio_aggregator_line_name_store(struct config_item *item, const char *page,
+				size_t count)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	char *name __free(kfree) = kstrndup(skip_spaces(page), count,
+					    GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	strim(name);
+
+	guard(mutex)(&aggr->lock);
+
+	if (gpio_aggregator_is_active(aggr))
+		return -EBUSY;
+
+	kfree(line->name);
+	line->name = no_free_ptr(name);
+
+	return count;
+}
+CONFIGFS_ATTR(gpio_aggregator_line_, name);
+
+static ssize_t
+gpio_aggregator_line_offset_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sysfs_emit(page, "%d\n", line->offset);
+}
+
+static ssize_t
+gpio_aggregator_line_offset_store(struct config_item *item, const char *page,
+				  size_t count)
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
+	if (gpio_aggregator_is_active(aggr))
+		return -EBUSY;
+
+	line->offset = offset;
+
+	return count;
+}
+CONFIGFS_ATTR(gpio_aggregator_line_, offset);
+
+static struct configfs_attribute *gpio_aggregator_line_attrs[] = {
+	&gpio_aggregator_line_attr_key,
+	&gpio_aggregator_line_attr_name,
+	&gpio_aggregator_line_attr_offset,
+	NULL
+};
+
+static ssize_t
+gpio_aggregator_device_dev_name_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	struct platform_device *pdev;
+
+	guard(mutex)(&aggr->lock);
+
+	pdev = aggr->probe_data.pdev;
+	if (pdev)
+		return sysfs_emit(page, "%s\n", dev_name(&pdev->dev));
+
+	return sysfs_emit(page, "%s.%d\n", DRV_NAME, aggr->id);
+}
+CONFIGFS_ATTR_RO(gpio_aggregator_device_, dev_name);
+
+static ssize_t
+gpio_aggregator_device_live_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+
+	guard(mutex)(&aggr->lock);
+
+	return sysfs_emit(page, "%c\n",
+			  gpio_aggregator_is_active(aggr) ? '1' : '0');
+}
+
+static ssize_t
+gpio_aggregator_device_live_store(struct config_item *item, const char *page,
+				  size_t count)
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
+		gpio_aggregator_lockup_configfs(aggr, true);
+
+	scoped_guard(mutex, &aggr->lock) {
+		if (live == gpio_aggregator_is_active(aggr))
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
+	module_put(THIS_MODULE);
+
+	return ret ?: count;
+}
+CONFIGFS_ATTR(gpio_aggregator_device_, live);
+
+static struct configfs_attribute *gpio_aggregator_device_attrs[] = {
+	&gpio_aggregator_device_attr_dev_name,
+	&gpio_aggregator_device_attr_live,
+	NULL
+};
+
+static void
+gpio_aggregator_line_release(struct config_item *item)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	gpio_aggregator_line_del(aggr, line);
+	kfree(line->key);
+	kfree(line->name);
+	kfree(line);
+}
+
+static struct configfs_item_operations gpio_aggregator_line_item_ops = {
+	.release	= gpio_aggregator_line_release,
+};
+
+static const struct config_item_type gpio_aggregator_line_type = {
+	.ct_item_ops	= &gpio_aggregator_line_item_ops,
+	.ct_attrs	= gpio_aggregator_line_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void gpio_aggregator_device_release(struct config_item *item)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+
+	/*
+	 * If the aggregator is active, this code wouldn't be reached,
+	 * so calling gpio_aggregator_deactivate() is always unnecessary.
+	 */
+	gpio_aggregator_free(aggr);
+}
+
+static struct configfs_item_operations gpio_aggregator_device_item_ops = {
+	.release	= gpio_aggregator_device_release,
+};
+
+static struct config_group *
+gpio_aggregator_device_make_group(struct config_group *group, const char *name)
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
+	if (gpio_aggregator_is_active(aggr))
+		return ERR_PTR(-EBUSY);
+
+	list_for_each_entry(line, &aggr->list_head, entry)
+		if (line->idx == idx)
+			return ERR_PTR(-EINVAL);
+
+	line = gpio_aggregator_line_alloc(aggr, idx, NULL, -1);
+	if (!line)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&line->group, name, &gpio_aggregator_line_type);
+
+	gpio_aggregator_line_add(aggr, line);
+
+	return &line->group;
+}
+
+static struct configfs_group_operations gpio_aggregator_device_group_ops = {
+	.make_group	= gpio_aggregator_device_make_group,
+};
+
+static const struct config_item_type gpio_aggregator_device_type = {
+	.ct_group_ops	= &gpio_aggregator_device_group_ops,
+	.ct_item_ops	= &gpio_aggregator_device_item_ops,
+	.ct_attrs	= gpio_aggregator_device_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_aggregator_make_group(struct config_group *group, const char *name)
+{
+	struct gpio_aggregator *aggr;
+	int ret;
+
+	/* arg space is unneeded */
+	ret = gpio_aggregator_alloc(&aggr, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	config_group_init_type_name(&aggr->group, name, &gpio_aggregator_device_type);
+	dev_sync_probe_init(&aggr->probe_data);
+
+	return &aggr->group;
+}
+
+static struct configfs_group_operations gpio_aggregator_group_ops = {
+	.make_group	= gpio_aggregator_make_group,
+};
+
+static const struct config_item_type gpio_aggregator_type = {
+	.ct_group_ops	= &gpio_aggregator_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem gpio_aggregator_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf	= DRV_NAME,
+			.ci_type	= &gpio_aggregator_type,
+		},
+	},
+};
+
+
 /*
  * Sysfs interface
  */
@@ -495,6 +1063,7 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 
 	memcpy(aggr->args, buf, count + 1);
 
+	aggr->init_via_sysfs = true;
 	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
 				GFP_KERNEL);
 	if (!aggr->lookups) {
@@ -520,7 +1089,7 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 		goto remove_table;
 	}
 
-	aggr->pdev = pdev;
+	aggr->probe_data.pdev = pdev;
 	module_put(THIS_MODULE);
 	return count;
 
@@ -542,10 +1111,7 @@ static struct driver_attribute driver_attr_gpio_aggregator_new_device =
 
 static void gpio_aggregator_destroy(struct gpio_aggregator *aggr)
 {
-	platform_device_unregister(aggr->pdev);
-	gpiod_remove_lookup_table(aggr->lookups);
-	kfree(aggr->lookups->dev_id);
-	kfree(aggr->lookups);
+	gpio_aggregator_deactivate(aggr);
 	kfree(aggr);
 }
 
@@ -567,12 +1133,19 @@ static ssize_t gpio_aggregator_delete_device_store(struct device_driver *driver,
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
 
 	gpio_aggregator_destroy(aggr);
 	module_put(THIS_MODULE);
@@ -649,21 +1222,61 @@ static struct platform_driver gpio_aggregator_driver = {
 
 static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
 {
+	/*
+	 * There should be no aggregator created via configfs, as their
+	 * presence would prevent module unloading.
+	 */
 	gpio_aggregator_destroy(p);
 	return 0;
 }
 
 static void __exit gpio_aggregator_remove_all(void)
 {
-	mutex_lock(&gpio_aggregator_lock);
+	/*
+	 * Configfs callbacks acquire gpio_aggregator_lock when accessing
+	 * gpio_aggregator_idr, so to prevent lock inversion deadlock, we
+	 * cannot protect idr_for_each invocation here with
+	 * gpio_aggregator_lock, as gpio_aggregator_idr_remove() accesses
+	 * configfs groups. Fortunately, the new_device/delete_device path
+	 * and the module unload path are mutually exclusive, thanks to an
+	 * explicit try_module_get inside of those driver attr handlers.
+	 * Also, when we reach here, no configfs entries present or being
+	 * created. Therefore, no need to protect with gpio_aggregator_lock
+	 * below.
+	 */
 	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
 	idr_destroy(&gpio_aggregator_idr);
-	mutex_unlock(&gpio_aggregator_lock);
 }
 
 static int __init gpio_aggregator_init(void)
 {
-	return platform_driver_register(&gpio_aggregator_driver);
+	int ret = 0;
+
+	config_group_init(&gpio_aggregator_subsys.su_group);
+	mutex_init(&gpio_aggregator_subsys.su_mutex);
+	ret = configfs_register_subsystem(&gpio_aggregator_subsys);
+	if (ret) {
+		pr_err("Failed to register the '%s' configfs subsystem: %d\n",
+		       gpio_aggregator_subsys.su_group.cg_item.ci_namebuf, ret);
+		mutex_destroy(&gpio_aggregator_subsys.su_mutex);
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
+		mutex_destroy(&gpio_aggregator_subsys.su_mutex);
+		configfs_unregister_subsystem(&gpio_aggregator_subsys);
+	}
+
+	return ret;
 }
 module_init(gpio_aggregator_init);
 
@@ -671,6 +1284,7 @@ static void __exit gpio_aggregator_exit(void)
 {
 	gpio_aggregator_remove_all();
 	platform_driver_unregister(&gpio_aggregator_driver);
+	configfs_unregister_subsystem(&gpio_aggregator_subsys);
 }
 module_exit(gpio_aggregator_exit);
 
-- 
2.45.2


