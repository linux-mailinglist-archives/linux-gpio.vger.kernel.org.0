Return-Path: <linux-gpio+bounces-16498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B5A42336
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D225418955B7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5F8254866;
	Mon, 24 Feb 2025 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="a2N0wkjA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033C518A95E
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407523; cv=none; b=AjroW8dnJJRgM1+FTTGYaNmEg4ujLpn679mjFVbLNhIlbXKoxcT7LL5DRq0xIVw1Z40BTFWxflS68lGAKiE8WdZjDnlpmKB+jFstXEBjB45hSIP//gn1uehnZ7AXkLZQLxbyjI4aEKAZyahjuF9xPBgA6vzx/Diegu9E0gZvUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407523; c=relaxed/simple;
	bh=6Gyl110JbYdihAYM2SUbMgymN9mBHUq84cqx4t8+pc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpGQrV/Db3G0rYB5Z8ZJz1LDsyeve60BzmYZrGu97zhedbPYM3gt44E5jk9dMcJSE1bObTuj/T+RAO65s7uu0kjG/eAqN/oRTTmL+yjb1aFEsbkwB96wiPLjOh2dZFhK0wspc0yrv9AzE1P6vlkrQ+5Qg0Y4ckI7Key6s3xMnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=a2N0wkjA; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DB2DF41974
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740407518;
	bh=LdY3nx85rePW3A+dk/au845fHolTzm+G2Y4AdyKBUzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=a2N0wkjA5CQMxxaL3Pk2HJzIhIKmlkkps7i5sJXDQQgqpR8ylQAKUAQg89Xo8GriN
	 0nHbwvAsEzh1WCkRmXxR3oaYu5l8Nd1/xL7kf2uqXtUJH3PQ1ysfVCaqNAs4cCEfyA
	 M2SwmGs/M4YNNUkHy3K9ybwxFI9KE7/Uxjax2mlz1nNEMLrZV3xUj6YvuCp0Pr/V3M
	 tmUTNT/vyBVEZQXnJCoh4SwHd1kYJYmxJLKyOHq6EUhXBNUtPd7GyXM7y6pku0ps4I
	 Vwfwv4CVUVm8NzR6I72q0Hhcfy3sco5ruVJgrgAsStNGXmdcX4xU34Ih5xz59iNEjw
	 hyyzSDmMdNg6w==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2217a4bfcc7so93103835ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407516; x=1741012316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdY3nx85rePW3A+dk/au845fHolTzm+G2Y4AdyKBUzA=;
        b=G3YiY/AhKxy8JxLtSv6c5hJlkDQGBvJLVXzNNbYPTc4Yxpw4reo8F+nqkUwpIvPPn1
         +CpfcYjMJsmsQ4SIwOIjNWR/iRqRWsFSTYdlAH8A/NbT5doj6eGxVT/CuhWeJd9tsJEy
         vaG0uoa/bVkjLdD1Uq6KnrzBoXaIfM3oYCfSs9h0gxJoV03+ANAIytKATg1DfYYPX1z8
         JlAGADIYPzM8FMPmFgJlsJY/vL3wqRQBIzmlreIW6bVC9UbXVh8yMAzqAEDNUHRFL3d6
         5rAoc/DhLUrUbEUNj/H9g+NQ4cYdphztuYJIPfaJyRT/W6+5r/VNA3FW6a+TCc8cFFLr
         SJwA==
X-Gm-Message-State: AOJu0YxMAn89uiJPSARMCsxYGo0o3xyVh041B57I4+a5FGyfh2MxGgqe
	Lj6htkGo1z/p/qgsVz3BCYTixLNIiwXEQ+i4bFg5nddr3XakJoQ+HfoK52nRdcJ/So0qcqVO0MV
	s34fm/Wze4Lhvou93z6Ovg0G6LkQRa9Kz5NbPq895HQ8YocyNw+FfHwjokqB/0srZ3x3mnhcjyN
	8HHilQ+JA=
X-Gm-Gg: ASbGnctyPa9N8qIMvpSDJIm4tLsG6b21izQUfl6V6axHAhoBbzAPO4uaAtoNv9VBNkg
	QELcCX/DVmL3Ekbr3SpxycZQTzLYV0qCeWK6fzfoKNZQDV2fE2+W1QGs+n5e823dtsTGeSBBxWx
	O6GsxQ4AFUddcI/wDf8zHg8Y5EX5gzs+4QukElLM6peYWTnFqqgD27X2pF2EdDIEQts/i3/kKfU
	xaCck7tkyNx8Nj6BW7GLZdkLu9wCehRy+cZMTEzNKG+G7gKi/YHZIvplrRp+WP0+usezW+I3sQt
	foJyvNK6zepg3Q0V
X-Received: by 2002:a17:902:cf08:b0:216:2259:a4bd with SMTP id d9443c01a7336-221a11d9943mr202075965ad.52.1740407515974;
        Mon, 24 Feb 2025 06:31:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDrnpjPTVLJ/YSrOknLqoJmom5nEs79o3mBqMphBn5r+iJdJuZqgc4D6vTNMJ+DUW+6HFKrQ==
X-Received: by 2002:a17:902:cf08:b0:216:2259:a4bd with SMTP id d9443c01a7336-221a11d9943mr202075685ad.52.1740407515545;
        Mon, 24 Feb 2025 06:31:55 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:de7b:58db:ab85:24ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d067sm177613895ad.109.2025.02.24.06.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:31:55 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/9] gpio: aggregator: add 'name' attribute for custom GPIO line names
Date: Mon, 24 Feb 2025 23:31:30 +0900
Message-ID: <20250224143134.3024598-6-koichiro.den@canonical.com>
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

Previously, there was no way to assign names to GPIO lines exported
through the aggregator when the device was created via sysfs.

Allow users to set custom line names via a 'name' attribute and
expose them using swnode.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 84 ++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 0edb177bd816..e6d455089a27 100644
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


