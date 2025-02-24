Return-Path: <linux-gpio+bounces-16504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B546A423F2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6FDB16F690
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137A21C6FE5;
	Mon, 24 Feb 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Es9n6Ud/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54C38DD8
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408006; cv=none; b=TLG9KaHrFBuHh/MwkCrJohVZZRUhENRComBwVaI0zJYm21HHjAnWy+jGzU07+KIY53pftfTG1l3ysf1iejnRKLAAwAX1EwyTaed4mujRW69heKiH0qS0Kf+Ow59TG+A3Y8rGjzXJodNIL/DbZEx01ey2JmDGMr/ZGHI1A0G37Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408006; c=relaxed/simple;
	bh=aLA3ZVDhrDy3RNwYW++kaJn2SQ84AkvFmu6stXF9mto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pz2AZWD4zZyAHOpaAdBPDQLXGAOsvB6RLZ8Q6uMZBqJ12uGTH2swa0lQrlwrUzyk7PbWzusLxT0iLirTH+oBs5PTVn9lMqIsEZQwjdNe1xzLzFSqw+YO+0JsXrMfFddk26DwPcvmojYkzpTK/hVlaUJX/8xd+75z+yU9jUPsgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Es9n6Ud/; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5E6C53F687
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740407514;
	bh=gXHg3uCoBKmQSJJ70+DeTAJMIxaEY0B5wJevniOwqIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Es9n6Ud/A4kQsQg2DEwiQBlyajL1jSzYqH+lK0L2TSc1uYQcvl/lJpn/Rq+uO6r7+
	 7NgicTq7S12r/G5YOda/SJFxZHVAKu2ddz2ekXZgGTv81EaTFiDPHCI1UQIeMVIzSN
	 iMDC5c0JYuXFonop8XlgTZQQSpyo4hk4KuUNMX1olH7BuvTjNNldZnfbQuCJTCLLOv
	 oI9B/VyK7nZbN8MioLd4rRrxHQm6LIaaRN8jwnRJOt1X98uDjgE/P93+tsfTJLVoie
	 aoApBZ+ooh41B+Ex6j4q0xVyJVf07dJLoP9LikyjjpQlWX5swwWefnffrh0Lsfr9sg
	 70Kpsjk0qUAYA==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22114b800f0so19078255ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407510; x=1741012310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXHg3uCoBKmQSJJ70+DeTAJMIxaEY0B5wJevniOwqIM=;
        b=P6z3DStSd4TR1PafmyvozguV6+1iXK3AjHNz7aBPI9pdvBLobqidQxom2ZHVZcqXsd
         MPuJa0G0T/4IpmF4u2pvrcVwRTqGeRkcVo2W7+ywRB622qleVrxOe6QW3P8npq2MsFmL
         EDqxR5H6L7ZqY41NQBhZnwnGy1qKRgzkqSiae+0vPE+OFY3PINaOXJ+NsXmXO9Ga5wHb
         FI8zi+kJYkPh8XlDp0anDqbCSNny4JSHnHLZpdiKt6DULSsUEuUIHKx/9xGER7gdscy9
         FSbb9snMcEea7iBSC2X7/NUOcAIA2dKyPuqh85wFrL8WfMn9eZuvL0YRyUxOlMev80/W
         J0Pw==
X-Gm-Message-State: AOJu0YzyEd5Uf/O2tVpnaQchGZWFsNTpysVhxxzkp/ha5t6uC/+FsL5h
	i7COBs8B9js6wn9onZpJKTwJw42eTcPeJVagbAZ2u/73HZejcE5v3kMEoQdlPga/aySYhiWMmw2
	ZtW0wUAtdGRbREUkXTnMFwawFDGAdwl2dcici2WiaEgy3FCB13QXWnCeU6cLwCOp2j/HatN1eaj
	x+NF15cco=
X-Gm-Gg: ASbGnctgl2LhzOIodSS1RP8soaW6Yt7N0/WDj5//97A4sVQH2CZmzuJaOjz5x79fzLi
	Ccq6kHBALpQhs7Wzs349MzAdfgGF4uj4CZx2TxRAvlp8l/4OuWUWNn8qtpCu9GGs1vMhiCoe61E
	u7bEtCo2Wh5h+7wKojy6FCscbM0sQ/8qzqxAfWf6NMlB7zYmy1g6g6ZvWc0TW/hr3ObRXX1riFY
	nyyRsZ2Aacj/Exy9J9KJsLm9yDl5THQpgEfqVNlzWBiJ5CI0A5YcOSu4bumCOgChaQIjJ6rbt45
	QimCJNwAyt6V7jUo
X-Received: by 2002:a17:902:f548:b0:20c:6399:d637 with SMTP id d9443c01a7336-2219ffb5ccdmr233011375ad.40.1740407510335;
        Mon, 24 Feb 2025 06:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Jc0Yqwa4HwDO+K5r64/4KHjkg5DCcC3jCiIDfEPZrnBsn9cR2KGuGUfwAomXtnQycccupA==
X-Received: by 2002:a17:902:f548:b0:20c:6399:d637 with SMTP id d9443c01a7336-2219ffb5ccdmr233011105ad.40.1740407510064;
        Mon, 24 Feb 2025 06:31:50 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:de7b:58db:ab85:24ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d067sm177613895ad.109.2025.02.24.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:31:49 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] gpio: aggregator: add aggr_alloc()/aggr_free()
Date: Mon, 24 Feb 2025 23:31:28 +0900
Message-ID: <20250224143134.3024598-4-koichiro.den@canonical.com>
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

Prepare for the upcoming configfs interface. These functions will be
used by both the existing sysfs interface and the new configfs
interface, reducing code duplication.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 58 +++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 893cd56de867..a93b7d3de929 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -36,12 +36,41 @@
 struct gpio_aggregator {
 	struct gpiod_lookup_table *lookups;
 	struct platform_device *pdev;
+	int id;
 	char args[];
 };
 
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
+static int aggr_alloc(struct gpio_aggregator **aggr, size_t arg_size)
+{
+	struct gpio_aggregator *new __free(kfree) = NULL;
+	int ret;
+
+	new = kzalloc(sizeof(*new) + arg_size, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	mutex_lock(&gpio_aggregator_lock);
+	ret = idr_alloc(&gpio_aggregator_idr, new, 0, 0, GFP_KERNEL);
+	mutex_unlock(&gpio_aggregator_lock);
+	if (ret < 0)
+		return ret;
+
+	new->id = ret;
+	*aggr = no_free_ptr(new);
+	return 0;
+}
+
+static void aggr_free(struct gpio_aggregator *aggr)
+{
+	mutex_lock(&gpio_aggregator_lock);
+	idr_remove(&gpio_aggregator_idr, aggr->id);
+	mutex_unlock(&gpio_aggregator_lock);
+	kfree(aggr);
+}
+
 static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 			 int hwnum, unsigned int *n)
 {
@@ -444,17 +473,15 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 {
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
-	int res, id;
+	int res;
 
 	if (!try_module_get(THIS_MODULE))
 		return -ENOENT;
 
 	/* kernfs guarantees string termination, so count + 1 is safe */
-	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
-	if (!aggr) {
-		res = -ENOMEM;
+	res = aggr_alloc(&aggr, count + 1);
+	if (res)
 		goto put_module;
-	}
 
 	memcpy(aggr->args, buf, count + 1);
 
@@ -465,19 +492,10 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 		goto free_ga;
 	}
 
-	mutex_lock(&gpio_aggregator_lock);
-	id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
-	mutex_unlock(&gpio_aggregator_lock);
-
-	if (id < 0) {
-		res = id;
-		goto free_table;
-	}
-
-	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, aggr->id);
 	if (!aggr->lookups->dev_id) {
 		res = -ENOMEM;
-		goto remove_idr;
+		goto free_table;
 	}
 
 	res = aggr_parse(aggr);
@@ -486,7 +504,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
+	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -500,14 +518,10 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	gpiod_remove_lookup_table(aggr->lookups);
 free_dev_id:
 	kfree(aggr->lookups->dev_id);
-remove_idr:
-	mutex_lock(&gpio_aggregator_lock);
-	idr_remove(&gpio_aggregator_idr, id);
-	mutex_unlock(&gpio_aggregator_lock);
 free_table:
 	kfree(aggr->lookups);
 free_ga:
-	kfree(aggr);
+	aggr_free(aggr);
 put_module:
 	module_put(THIS_MODULE);
 	return res;
-- 
2.45.2


