Return-Path: <linux-gpio+bounces-16153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC15A386AF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076C81885640
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72B6223328;
	Mon, 17 Feb 2025 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="DOE7aMFC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E4C225415
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802985; cv=none; b=cXuPHRi+Wee/BsiymaberVw9BTi3Nhlb4erqfI8nGhA5SUw5uAIDG9u3aWLVMni8y30gLbLEvU9506lP4sDvgBgxuauesem5jZtYiwnJUxEFBLsJBzTNFzPrZiwE9G/A9KaAodly7Mys2cuF34+/skMd6DpF5bpa0bzPewgu5kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802985; c=relaxed/simple;
	bh=uxdDc8NwSSoU/KhYSVoLNE3SLLqdDtG3WoHdkVTCuPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgaqHvLPOVjGzwWu9+dgHv+7jaRYzM/HV1gy6tNIx9i17u8A2P9KuYXlbGJ8twg0a4sIloOi81ATuuKDjlI6PLoZ4VZrfOicaNl3NtdDIZvJ0jgDXBlt0qFxzOU0Ng8n7nGSpd9bFlm44RQQdmpZH1Dn2UEX2abPN+Xav+wg3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=DOE7aMFC; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D58203F84C
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802975;
	bh=v4sbOHRoeQS1MOSALsPLtSJ65COLeoaPvTmtbuEu58k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=DOE7aMFC/2UBE51wK5xkcllk38NYaS8NkY8Jz69QyOBK9mQ0L2WRSVtKnHnXS9Sj/
	 9adYN6H6wL9Dq4Dbbg9TMxoYRk7+wwG3WmoHtOwhCmXPyE3KDLmxOY8RG0xTcy+CpH
	 R0kyrR9q/Ju/l5MBjcv3wkThvkL252PxJhY9t7KE+xmJg46JQHTqxNzzxlNkw06goG
	 mThkHYkcptWwwPDVPQxndRHxrcJtMEQVDzF5HSydzMpVGhfaBNQjOF+/xLpGNPby4X
	 8XWaR3Xn8wPzIGjx+0y9dyp6qO4xDDPhdFmZcQOB5jjuNLapMNtcNyhPEDwxOKtrIr
	 kqhKUbFNjUAjQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fbfa786a1aso14003459a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802973; x=1740407773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4sbOHRoeQS1MOSALsPLtSJ65COLeoaPvTmtbuEu58k=;
        b=HHwyutiHxjVTT2yMMA7mDvuUuvbDUf7/e+CZwHyFHvRPt3lmE9cYJCLW+JaT0wsGA+
         5klVQatPjaa9XrqwVCzZmIClDEYLUDK6NBlZLT0Btt/SymWFgTL6Nm8zO6fikvAQxne8
         132lkmJj8HeUn1fN6vjYiQEDKXWGAnW1fT1QsRXaRzGfpRGKboMmFXH1gEDmedEgk5mR
         IXDZh1Qj02WXTiZo/rGRIkkkQpGjKqWteiRh9wFXc+IahJZKG4XCX8MQP4BrN6u63E8J
         /kt57xJKsHiGQ5L6AYTXt9x0Ahyv3VbrpfSOVuBpj/MwUMjmpVecfAXtVpISKMjjmKya
         ahpQ==
X-Gm-Message-State: AOJu0YyWGK6eVDHb50mwk9Orj/rD+H+E6Jy+OLhgbHQOBIeHZkFsq0ZQ
	8YUpsMnEuHd1f+tCQKvmqAU8idD0lOjnDi5zbcmXvMUftwoZz9+0dXJE1KzKtFtDFol/v3cZEqf
	CGY+WbVs+VKqpBa9rojFJMdIeNQ4nP4+9QGoTCixW8fBCAZmyjwXzOXb21JRSBshwZJT9fLMmO/
	x1eUtmbUo=
X-Gm-Gg: ASbGncuWqaZrccZW8gsIUvSw3fFFnXx1DZpIfo4El4ftD9NJbXLapXNWZGJyfELJq4J
	v8fIHK6rKTwD+pzM65NrmQDZVI1XzaBF7Nlohqy9CYxA8wPKZP76c66PsWuXfl7m8MzsVNzzH53
	D5Lij1cBiwSpud4GhWnq0jS5b/7TtSdZIpMeAuR/pjJGl/dUzvtU4wLIXHN112/4ayeFzLp4YFV
	5Pa8qVPjukUsAPuyZH28z0yFZM/D9awMkAZBP4IRZu9oZ7IZrd+DaOavCyHjKA/Oy/Iz9t4QukA
	lcQbBX7sztdnMVthB9dF66I=
X-Received: by 2002:a17:90b:2fc3:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2fc40f21c49mr14264471a91.19.1739802973318;
        Mon, 17 Feb 2025 06:36:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/i6ZhPeP35hWJ24mm/LIhcXbBPRykLdefs72sMWFjgXDC7lFQiPxRDAVbpwrRAEzufAxZDw==
X-Received: by 2002:a17:90b:2fc3:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2fc40f21c49mr14264311a91.19.1739802971508;
        Mon, 17 Feb 2025 06:36:11 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:36:11 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/9] gpio: aggregator: add 'name' attribute for custom GPIO line names
Date: Mon, 17 Feb 2025 23:35:27 +0900
Message-ID: <20250217143531.541185-6-koichiro.den@canonical.com>
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


