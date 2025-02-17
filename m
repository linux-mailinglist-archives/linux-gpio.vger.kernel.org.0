Return-Path: <linux-gpio+bounces-16149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0775A3869F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF7717A3A18
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFE52248B8;
	Mon, 17 Feb 2025 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="dwtv0Giy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BBF2248A0
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802970; cv=none; b=kEjCFICGvDYDzIid2DQmdxWqm8kx1NS71kzivscdo83+QfqttXxCRB/MwqhE2oWv11wzfPLsXipG2eIY6IqOK3bOPuAALLmRUeSbBCRJc+WFbg36qD47rq6BNYvAB9y/sn2firYZs2MbR6DLAvm/ifmaVudg+vlpfutniXiM7Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802970; c=relaxed/simple;
	bh=aLA3ZVDhrDy3RNwYW++kaJn2SQ84AkvFmu6stXF9mto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPetsZHKLWz8N6nzuEVQ/H7v7qbqk/Fa+iw4BFGDnft0OSMOw29NQvE0Dba44C3WGUqUIkIraJVYsp6rGCiILU6m0xi0rrINn8hgCjAUpKqsYUaVEN0M55sEAKZJfclW3DuO7GHiXPH/n5YpqC8itF/gmW8VKmu5jj7YUxndnqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=dwtv0Giy; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D3EF33F868
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802967;
	bh=gXHg3uCoBKmQSJJ70+DeTAJMIxaEY0B5wJevniOwqIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=dwtv0GiyNsc/tsL6hc3qJT1uU/XMRJv/68dd1mEA1//N6T9WqGrTkgCDtaBF79oc9
	 RIuecyayTjC4bwBhylQ1G4UFte5xNzrerda/bHtud73Fr5VNw7mCOhbWfuf0j+59CI
	 Kd5Va9gZNhpsLJ0X/U/ZpnRP2E9g1i7dEWw4fLr+72leLzoDvGPz0K069Yy561E8qv
	 Ul87dTGoXGMRzUTrGikjf8gwrvBt8GjhLqop4zKouGWqfDEpG+EOKneYsQtK6QLqW1
	 ATkBCRKtSlvOk+bJt9DNSoC40i4bOlzjPf2b25kKWFNkFW18GRSdIEkGt5KQZV++sk
	 12OM+xRXNApCA==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220cd43c75aso152627645ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802966; x=1740407766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXHg3uCoBKmQSJJ70+DeTAJMIxaEY0B5wJevniOwqIM=;
        b=HaaRCtN5LdBbP46nHj/aZcrSSE5Eau+/Y7rKXs072yvR29a2uRl9Q1gEc4/hYdo01a
         XQxqqQOLeaIt/CNM0da2WzEfFdB+gL5FZw/XcBGIpo+t0PkI8sjEURWmQ5/4PffvZ5yY
         OWDhR083/Fz0WBRh7g8nVUZyLprqT/NsDJHfLOMicljp/VIH3hPypxSw5v8isb/x7dXL
         JJectZG3vvRdT2atxYoTHL3Sf2id52kg/faBfWYigcwXiaf05DBJ1UPRugmyHpkoRzCY
         P9uOQoAFV2OBhV8x+7gTTV5QFdV14SZdGy/Rlyd03tn0Y78u1UoeJo4k9XOias0086iX
         GfSQ==
X-Gm-Message-State: AOJu0YyzLEm394EXiXjFRL7IEFeWB0eNTQhS0HYMQmW0CpI0E7Haj1WC
	BXBCaisMYfunZzgqD1sSkHvdo3ItZKKk3RFAq1TP/vWEdKpywuTsg2xILoE1LRbHc6ar5cAOeeC
	j69R4eR+rNGW4bD+dkxe8fgMduB3CSVSowjbxKrbU6znxG2JsHeIcxonm0xrY1+m+GdnlAQq9YX
	NQCJYlTfs=
X-Gm-Gg: ASbGncsjN0/xU+mx9muEvYTsHSxJRowX4SHRGaRvJQwcOrrl3EbO6Oa/A5AsJHihCiR
	/yrvrkGnmjVwDYVtw3vl9iK18TIhshVzq2vML7ItegnmDvk/W4XKCreO/dW7fnXxeGuJlTZCL2K
	Ctd1PrVqG+9oQwjt60BcGxavLaXtJOodIuut7TX7defxkSUdqoOSVZsG3Bq2tqltPsoiRzxaa6P
	omUeSDeR3xHO+z4cJS81lX1Tdlnb3zC7CpwP01OvVWQsxtTcqGY7kVDo2t5tlgXXVjWM/9xrJZt
	pdkRUL8vIvBbSQ4kooEESBw=
X-Received: by 2002:a17:902:d542:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-221040bc31bmr169176295ad.41.1739802965887;
        Mon, 17 Feb 2025 06:36:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCZIJuJa6JJ2WId5wv4vsQnYCm/8htK948V0rYbd/ALkX5nVYWeDQNlPKzKTrGrQrpSd6IAw==
X-Received: by 2002:a17:902:d542:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-221040bc31bmr169175965ad.41.1739802965628;
        Mon, 17 Feb 2025 06:36:05 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:36:05 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/9] gpio: aggregator: add aggr_alloc()/aggr_free()
Date: Mon, 17 Feb 2025 23:35:25 +0900
Message-ID: <20250217143531.541185-4-koichiro.den@canonical.com>
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


