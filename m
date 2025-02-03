Return-Path: <linux-gpio+bounces-15194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5481A25198
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 04:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8143A3800
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F82D1917F4;
	Mon,  3 Feb 2025 03:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="teGmnVyR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF5156880
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552368; cv=none; b=hokx/hs8psDNVpd+sy+KS+hWQkP5a6ypWQcgTEjkCF8RVw2r58DVa09srGxwvtFwpyb66WFVs+fYv1/hiYTuCJ+gphuTGX4FK0qafCFw3SJ4bAULYioINAAQXkq+KycoXJWBFILJN7V5ZwWOOL7XIuVxMDZpqacqNn6gDDKFMLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552368; c=relaxed/simple;
	bh=zJZCZlVW5x8JMAih7JUvfHXh5728lqQKD+q8IupG77Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bR0l23HefbdIpoAalSGY6/9EtZMJS6h8/LQUFOWN84f5ctTFSm5Qq0kzccEGOQX7cea6syi0ZS3sm9h4zMY76jxxLwUftQqd2EP1E802uHADvnjI7WkYRVeiuecfSTm4KzVg3xFav8PQ/uWVO/jW3oxOT9uAjfefWqLdmkVNjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=teGmnVyR; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C43F03F84C
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552364;
	bh=xk38bDYHKHen2qoXgY/zg30zCGh3ffB/t1hQmz87YKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=teGmnVyRGNZR5rSZdqTDIp2HEh56ctycfq2JDYGhgvqUwcvsdx4o+KFamAL2eCklg
	 Su7jEZWGSC63iYdaZwBtMst6Zp5N8xj0GPxdRhdSb3B7JI5cApVuHS13SYw28H3078
	 yV+Dx/sGnzbYcCQNhM9faGo7bT8xjUwxL988rdgwbYg6vZ9Ya3H+gBABUy4IttxMr5
	 6jQ/mX4QObQt8Pvp91oiZBMYQEGGlD1bXYlHRSqy/2vdKNqwWGTBSRSvvkJEGL1PgZ
	 69fO/digb6X7O4MOET5bj9SQX63zu6731ReDNGouzFd/UU/sPFcaw5b3Jg1gSdfetN
	 ysz5ps7TiCsLQ==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so11313312a91.3
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 19:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552362; x=1739157162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xk38bDYHKHen2qoXgY/zg30zCGh3ffB/t1hQmz87YKc=;
        b=NV4VJHKL3H3UZnLRpssofOl2/kLSVFCwU4D1nYeaCV5fEF63m3UUhXl7pHOZDBPeQP
         xa+TGRbp2EDEz3awxbKx3/lLK+9n58RZ5w+jCISQRdR05KJrrqqvQB7A7a71jQ2eaSlV
         OBz2n5TkFp1kG1JgnDFxkmxG/oE4KP7/iBfJnfEz9xBj3jy6GQ+71pw73rxQqKml5vKx
         S5TZE3dP9G53xKUMEH38eQwiH9AGhAEsNKoyaxgXI53Er/ocTimqaIPP/2Jqmq02Afc5
         mrOriYCoGLJ0iCLimrWB8U06pyMD/oGqrZHZCXcUkkFkB8iNemzTl/uETjrbva0fxMhE
         S8Fw==
X-Gm-Message-State: AOJu0YxafGOiasfJtHmG9NdmpCD2qxu1EnfZpQTuHyJCls5+dZXpujTW
	+OTAorboulAlrC4uAfQ0UMmR0Xm1SUj9OlEUtEs+CqAI2+2BnvEcnal58GAaXYQ/YGGrJI1R/h9
	TNS5Q2265NDiEXYfC3mAMMydDt1zUhsu9iT0NpQd1oeFk87dMadHn4WkbXtam4L1GZdDhCFsDux
	11vGFzJ7A=
X-Gm-Gg: ASbGncusiGyMDbbdXDzchW+bWeupXD6/47AGuQb6BWASiolDrujhAAdNpYzJFeEvKc5
	9enKR6Af1m10ZQ3yoKsyPQ4LFU2nv2L2eQRT3aWF1dFiNV8qaeUm/z9kIFblhrssticXQmdB1vQ
	YQdU+GMTQk7VerEE4sbN/M62WJVhcBzoVQbg6txQWQoDd9w+mbnk7r13lkT2SBw/VPuUjaYWKlZ
	8KqYvmA5vIe+l/+OdNN6dVKFUt2uyzOozgXW8OAAQ4vFM90uQuun4RXLQvvsFDUpsdT17w7SHTW
	RYsd
X-Received: by 2002:a17:90b:5245:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2f83abaf3f2mr32900284a91.7.1738552362634;
        Sun, 02 Feb 2025 19:12:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL5amk7wG7X7fEbtisp9SfGtA8Ih1squ46R2AOCgOEoiTF0V3njAVE3SOBt2yrFziBLR0N0Q==
X-Received: by 2002:a17:90b:5245:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2f83abaf3f2mr32900259a91.7.1738552362361;
        Sun, 02 Feb 2025 19:12:42 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:42 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] gpio: aggregator: expose custom line names to forwarder gpio_chip
Date: Mon,  3 Feb 2025 12:12:08 +0900
Message-ID: <20250203031213.399914-6-koichiro.den@canonical.com>
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

Previously, GPIO lines in the aggregator had empty names. Now that the
configfs interface supports custom names, update the GPIO forwarder to
use them.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 71 ++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 3263d99bfe69..268b9b580ada 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -425,6 +425,20 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 }
 #endif	/* !CONFIG_OF_GPIO */
 
+static int gpiochip_fwd_line_names(struct device *dev, const char **names, int len)
+{
+	int num = device_property_string_array_count(dev, "gpio-line-names");
+	if (!num)
+		return 0;
+	if (num > len) {
+		pr_warn("gpio-line-names contains %d lines while %d expected",
+			num, len);
+		num = len;
+	}
+	return device_property_read_string_array(dev, "gpio-line-names",
+						 names, num);
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -447,6 +461,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 {
 	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
+	const char **line_names;
 	struct gpio_chip *chip;
 	unsigned int i;
 	int error;
@@ -458,6 +473,16 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 
 	chip = &fwd->chip;
 
+	if (!dev_of_node(dev)) {
+		line_names = devm_kcalloc(dev, sizeof(*line_names), ngpios, GFP_KERNEL);
+		if (!line_names)
+			return ERR_PTR(-ENOMEM);
+
+		error = gpiochip_fwd_line_names(dev, line_names, ngpios);
+		if (error < 0)
+			return ERR_PTR(-ENOMEM);
+	}
+
 	/*
 	 * If any of the GPIO lines are sleeping, then the entire forwarder
 	 * will be sleeping.
@@ -491,6 +516,9 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	chip->ngpio = ngpios;
 	fwd->descs = descs;
 
+	if (!dev_of_node(dev))
+		chip->names = line_names;
+
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
 	else
@@ -530,10 +558,40 @@ to_gpio_aggregator_line(struct config_item *item)
 	return container_of(group, struct gpio_aggregator_line, group);
 }
 
+static struct fwnode_handle *aggr_make_device_swnode(struct gpio_aggregator *aggr)
+{
+	char **line_names __free(kfree) = NULL;
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
 	struct platform_device *pdev;
 	unsigned int n = 0;
 	int ret = 0;
@@ -546,9 +604,14 @@ static int aggr_activate(struct gpio_aggregator *aggr)
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
@@ -560,7 +623,7 @@ static int aggr_activate(struct gpio_aggregator *aggr)
 		 */
 		if (!line->key || line->idx != n) {
 			ret = -EINVAL;
-			goto err_remove_lookups;
+			goto err_remove_swnode;
 		}
 
 		if (line->offset < 0)
@@ -568,13 +631,13 @@ static int aggr_activate(struct gpio_aggregator *aggr)
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
@@ -607,6 +670,8 @@ static int aggr_activate(struct gpio_aggregator *aggr)
 err_remove_lookup_table:
 	kfree(aggr->lookups->dev_id);
 	gpiod_remove_lookup_table(aggr->lookups);
+err_remove_swnode:
+	fwnode_remove_software_node(swnode);
 err_remove_lookups:
 	kfree(aggr->lookups);
 
-- 
2.45.2


