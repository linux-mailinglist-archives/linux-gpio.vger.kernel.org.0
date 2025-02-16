Return-Path: <linux-gpio+bounces-16081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BE8A3745C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 14:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A498E3AF87F
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF27019DF5F;
	Sun, 16 Feb 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="mr5ZnzxU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C74193429
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710738; cv=none; b=j3YtHlw6OfcnqrPoL2pz63pjl+Z1pMEwp1yrUAPzD1AuAGkuMv/85WDMNWn0zEn2PuRiAX1qkKKG5YWzZ24QwRI2xH2ESRPiELyy/RUVV38rScOmw+TRcIj1n0kBRh/kSdeAZTyOJE6t4HNGvXeJ4XHm5MYXCBmhiqpXyGeXq6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710738; c=relaxed/simple;
	bh=uxdDc8NwSSoU/KhYSVoLNE3SLLqdDtG3WoHdkVTCuPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7xHlvn20qhoElsQ1TNquxX5LXoDk/qSCjLmBfULy/8Z2bCx/+wxPksqH0ujrHqWZb7rDF5+0LJJp2h65eXZGL4e9k8l+4eLhrIHLLFQKFjC9WT/USKX07WF0qE3DWrr14jEt5jFS+g7cwDoY56Ke6uj9IzmyK8Ou80ZcSr9ff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=mr5ZnzxU; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 466613F302
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710734;
	bh=v4sbOHRoeQS1MOSALsPLtSJ65COLeoaPvTmtbuEu58k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mr5ZnzxU+GxcELfh4cg+MAKjOHcpaoD8lYrtXjB4Yw9AXSywbyEry3ihuoQMD3u4B
	 fo+4pMKTiVcu3mIFX0/vrcJ4XOsI6Qt6Mb87hfXgYNmfVShWnrieBzu1Qg+pzBdoPT
	 yWnw58sB0oC4SDAfr2YqurBqGyek80AyCH7YGtI8j7IU/KmzuraL2DD2juRJHXXsLo
	 2CZOk1C1ruoP4vgDoRHp+l4roAK8L+bfSyYeUwtS2GO9p5oL77IeXbJ7m3ATLdqRpJ
	 CJW0ppzkD8+eNqi0eTghXetjSEsGfXbkByuzVl0k43NYkkdQy7qOHNKpyuTdOAhxfx
	 HYOWe3OfoEqTg==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2210305535bso47794525ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710732; x=1740315532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4sbOHRoeQS1MOSALsPLtSJ65COLeoaPvTmtbuEu58k=;
        b=p/Q+YYBWKGx4tMKjghfN3GbkLgDCcWdCFY/bHSbRh2RPrFS4CPF+k5mO/KBz0sGNa8
         /E8n0ouH8B6Tgir5udrk3mALiEbVnu/lTE2LAhRPnGjMwigkwBLpM6DXVjHQpmzW+s5h
         Y0SGgAQlKojRQVBu1+JIfNNWaAIKsypdkmSyEgFPREs9AJn/7iM1X5e/9XV2g2GnfeCZ
         wuuvvssA6RuBIQmm/J376jkza7cKwRevMhnjcRs0RtXy+tbWUy4aRYYoVnqki5Kg4s+S
         wNRAfg+aZ7IV1qpnxXE6c9vuKY12+UOhZCjI4pJUdFVVgtfrGiQga9m3JdL2l7BTARra
         SWHw==
X-Gm-Message-State: AOJu0Yz4BWCGYlVVmnAcui0Lc8AYHAp9gQ1Rl4U6nxDqpLOReSfJ74d1
	QWwDhCfdE7tvxNQZ9xh4WRUPna7hQanmuaB/HwJ18VGgh+sDvbZGemwlvIjR/9l/Qy8EN4uQL6t
	3mJ5xD7a8LP7Rt8C3wYKlHEf2YRZRceYqXdbYU9iaHMNITyJipwn5dg7GnRWOwVEfmAaOc4GRSu
	20aynswf8=
X-Gm-Gg: ASbGncsf90gR7LHMI40JI2XzdNDekdlFNB/qA9Dxosl4dDUwdyWAxM3TE4e+d3FZean
	gqZMyxngngn1NJj/09l5rO7GDBMVpQBo5/jY1+/Q22XV+7CukpP/rcEXTibW4om1q7+lrWQvX20
	D9QAthhufKMKkN+ILogzkQSuMhAu3DcsYsg7IFxLEMPXy5HZIJt+UBlWBbdkUjhuwjB/sCaZGWx
	PdwuDQyqqyikdGO4wuJgMhVszP0k2B6XXUMOD3Fgwn3QRala+ZOD5U22VRRnDM6yKk7aWJpZ4iU
	lu7zCg==
X-Received: by 2002:a05:6a21:6182:b0:1ee:7714:50 with SMTP id adf61e73a8af0-1ee8cb0e872mr8693881637.5.1739710732665;
        Sun, 16 Feb 2025 04:58:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETzXxsVanjAhXHVIrho5GeRODi5T05ultUcs3mcWlJEertTezQ6W5MIqTT3OooQDM45eE3tQ==
X-Received: by 2002:a05:6a21:6182:b0:1ee:7714:50 with SMTP id adf61e73a8af0-1ee8cb0e872mr8693857637.5.1739710732350;
        Sun, 16 Feb 2025 04:58:52 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:58:52 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/13] gpio: aggregator: add 'name' attribute for custom GPIO line names
Date: Sun, 16 Feb 2025 21:58:12 +0900
Message-ID: <20250216125816.14430-10-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250216125816.14430-1-koichiro.den@canonical.com>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, there was no way to assign names to GPIO lines exported
through the aggregator when the device was created via sysfs.

Allow users to set custom line names via a 'name' attribute and
expose them using swnode.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 84 ++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index ec102453817b..692d90246674 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -61,6 +61,8 @@ struct gpio_aggregator_line {
 	/* Line index within the aggregator device */
 	unsigned int idx;
 
+	/* Custom name for the virtual line */
+	const char *name;
 	/* GPIO chip label or line name */
 	const char *key;
 	/* Can be negative to indicate lookup by line name */
@@ -530,10 +532,40 @@ to_gpio_aggregator_line(struct config_item *item)
 	return container_of(group, struct gpio_aggregator_line, group);
 }
 
+static struct fwnode_handle *aggr_make_device_swnode(struct gpio_aggregator *aggr)
+{
+	const char **line_names __free(kfree) = NULL;
+	struct property_entry properties[2];
+	struct gpio_aggregator_line *line;
+	size_t num_lines;
+	int n = 0;
+
+	memset(properties, 0, sizeof(properties));
+
+	num_lines = aggr_count_lines(aggr);
+	if (num_lines == 0)
+		return NULL;
+
+	line_names = kcalloc(num_lines, sizeof(*line_names), GFP_KERNEL);
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
 static int aggr_activate(struct gpio_aggregator *aggr)
 {
 	struct platform_device_info pdevinfo;
 	struct gpio_aggregator_line *line;
+	struct fwnode_handle *swnode;
 	unsigned int n = 0;
 	int ret = 0;
 
@@ -545,9 +577,14 @@ static int aggr_activate(struct gpio_aggregator *aggr)
 	if (!aggr->lookups)
 		return -ENOMEM;
 
+	swnode = aggr_make_device_swnode(aggr);
+	if (IS_ERR(swnode))
+		goto err_remove_lookups;
+
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.name = DRV_NAME;
 	pdevinfo.id = aggr->id;
+	pdevinfo.fwnode = swnode;
 
 	/* The list is always sorted as new elements are inserted in order. */
 	list_for_each_entry(line, &aggr->list_head, entry) {
@@ -559,7 +596,7 @@ static int aggr_activate(struct gpio_aggregator *aggr)
 		 */
 		if (!line->key || line->idx != n) {
 			ret = -EINVAL;
-			goto err_remove_lookups;
+			goto err_remove_swnode;
 		}
 
 		if (line->offset < 0)
@@ -567,13 +604,13 @@ static int aggr_activate(struct gpio_aggregator *aggr)
 		else
 			ret = aggr_add_gpio(aggr, line->key, line->offset, &n);
 		if (ret)
-			goto err_remove_lookups;
+			goto err_remove_swnode;
 	}
 
 	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, aggr->id);
 	if (!aggr->lookups->dev_id) {
 		ret = -ENOMEM;
-		goto err_remove_lookups;
+		goto err_remove_swnode;
 	}
 
 	gpiod_add_lookup_table(aggr->lookups);
@@ -587,6 +624,8 @@ static int aggr_activate(struct gpio_aggregator *aggr)
 err_remove_lookup_table:
 	kfree(aggr->lookups->dev_id);
 	gpiod_remove_lookup_table(aggr->lookups);
+err_remove_swnode:
+	fwnode_remove_software_node(swnode);
 err_remove_lookups:
 	kfree(aggr->lookups);
 
@@ -658,6 +697,43 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
 }
 CONFIGFS_ATTR(gpio_aggr_line_, key);
 
+static ssize_t
+gpio_aggr_line_name_show(struct config_item *item, char *page)
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
+gpio_aggr_line_name_store(struct config_item *item, const char *page,
+			  size_t count)
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
+	if (aggr_is_active(aggr))
+		return -EBUSY;
+
+	kfree(line->name);
+	line->name = no_free_ptr(name);
+
+	return count;
+}
+CONFIGFS_ATTR(gpio_aggr_line_, name);
+
 static ssize_t
 gpio_aggr_line_offset_show(struct config_item *item, char *page)
 {
@@ -707,6 +783,7 @@ CONFIGFS_ATTR(gpio_aggr_line_, offset);
 
 static struct configfs_attribute *gpio_aggr_line_attrs[] = {
 	&gpio_aggr_line_attr_key,
+	&gpio_aggr_line_attr_name,
 	&gpio_aggr_line_attr_offset,
 	NULL
 };
@@ -795,6 +872,7 @@ gpio_aggr_line_release(struct config_item *item)
 
 	aggr_line_del(aggr, line);
 	kfree(line->key);
+	kfree(line->name);
 	kfree(line);
 }
 
-- 
2.45.2


