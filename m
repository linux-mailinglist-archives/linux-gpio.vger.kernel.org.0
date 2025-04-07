Return-Path: <linux-gpio+bounces-18255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B97A7D2EC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3075188DBCF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C82212D62;
	Mon,  7 Apr 2025 04:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="PKBQcJdw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E532222CF
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000259; cv=none; b=fRIDvhZRyR6+P1jh/sOuNJUhhI1jVZcCJsc20YYgmbfbLQXvJz5+DUqlwACZpDIAI8t2BmRRxiT/wjCVSDKNrVYZlhG3Auyb4Fvvj5uwovhHwL/aRHMFMluG0Z1y5k6jQVPjgchV0WM3XvPPW3a/hBuYJkHulgbF2a7OGYbrU+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000259; c=relaxed/simple;
	bh=TbAKJXmX6g7xhJYJocuFyn/R1DEc55FoQ9fLzC8oylM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKfA8kzVIKU/NMd5VkidiUlYwR9OJxNM+5t6zDxJIiANPBCR6l/m2hNuu1UzE9aVxMKU+3FmQFbMiHOwcfG+RpU29XdCytjtLbuu5Ac56rQGk9lIsfnhjrRXyVZl/c4UkM1VcKIYCdSCdgE6jG3rbg+uCGEXGI1aBvNSHpswIYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=PKBQcJdw; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A58723F2C2
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000254;
	bh=olpAErLRuaUJTw8reFG3lTyrFxmkOqkGE5UK7pclqas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=PKBQcJdw0tkRa5gzKWAzX19sW7ScmuyC21FnmjfBE47Bv1WGZTw0Z0Q5XUR1ePGP6
	 7EUL0gYNwINUo95RqKjdpumrczRLl8AEj1/DIVTRwZql3UBW2dUe22KxBopn56MqyH
	 BsmcaJKwp24kPB2Ig48h63X40Hgh2TlDrcTdswScJcPdNa+1sx/f18FfFDiQ8AOueA
	 4H2mCfuvhXqsOItP8T7XzrncKoPxR+CJG0dnAtVdT2til4wSzCC4cgfI/6uB0VRb66
	 16DeWTmQnD2cNTqktFMi2W1HAASV4i+34ZyIg68f4mfqYwa9jt+5FRVO4T70BT7EaM
	 OzEswivOCf42w==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225107fbdc7so33202495ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000253; x=1744605053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olpAErLRuaUJTw8reFG3lTyrFxmkOqkGE5UK7pclqas=;
        b=eErB509fpH2F8KM/wFZDcgQpZJ2LkSNsaUwTjHxCHW5aIfMgXlJmsPtI/DMdHJSZyl
         auUVF1ht3o5o80an/x/8GEb45EOemjZPCpE3cc7BXOG6E0REQ7qFHnee9DmyHaJfwW8+
         7dW1VC1/fHJpoNTCWCFunedy3OpeOmAXfEvp8XSfW2qN4ZR0vIZ7+IKgwoAtxYSM2PQo
         nJSVo0QQtJkYfnrsHsFSQzajZKJ2aeQTe0xYu3yPzKXAitFr3q2MOyMOvcILw/ONrmid
         tFOeio/97BBbwBicCqaE1QEdI23rG8ZE5LwOGPRNg4H2HNjy8cdFVRsh33GOa3lm9baQ
         mXXQ==
X-Gm-Message-State: AOJu0Yxa3z9ZpoN9Bo8Q9OMy/PL3FpARdXhru9aK48mfAhoIRZI2EL/a
	l4cf7MiBHRUzCkYz0JpYvyV91NaBQjMTPuTES3WPUkro4vzkQHZBgAJwqdCFfMhFT8H6IPP+J1m
	raj3AbZNAGMGrR169ZGpgOtzIW/5ZYsAzQdtxB8WZUbjGAVjIExmaX3zkxubsl6T1yKF3n70Su6
	Szgt+MWaQ=
X-Gm-Gg: ASbGncu51ygQtIzpk9bM/mB1imibRK41RWwzQQGyrnDDYlaidHUFWt+LGpntgWhTZ/I
	6pSNMzTWahT+u3F/sbsWI//ryTsh1R/D9bfDpCbsP2LC9GcG01WSItkogtE6V1iMrJ4Q2NwJgiO
	Y214Gx3D/Z5ORaelkRUbUMl4mB2q27Bf09uG8x1FKTnX0hk37DLXTSV0TwihCw64sR9Qhsf/chd
	AawxghQuinMUwuGPFn5PiqtmPCbHyhx1cJTG9E+DT//f2gAvasBQBvAXzNNCDDwMYDEQrqd34uA
	SUsh/nVyxJnU9CEQ4kbi6NPvZ/TjZynPuw==
X-Received: by 2002:a17:903:1b2d:b0:216:7926:8d69 with SMTP id d9443c01a7336-22a8a8dd69emr130201305ad.47.1744000253107;
        Sun, 06 Apr 2025 21:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeDelhsi3pljdEQEJi4TRSqlIHVRt8P+++1nYrhtJHgIUj2n3n/8C4lyr1PQisWmgPh4rxog==
X-Received: by 2002:a17:903:1b2d:b0:216:7926:8d69 with SMTP id d9443c01a7336-22a8a8dd69emr130201035ad.47.1744000252685;
        Sun, 06 Apr 2025 21:30:52 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:52 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/9] gpio: aggregator: add gpio_aggregator_{alloc,free}()
Date: Mon,  7 Apr 2025 13:30:13 +0900
Message-ID: <20250407043019.4105613-4-koichiro.den@canonical.com>
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

Prepare for the upcoming configfs interface. These functions will be
used by both the existing sysfs interface and the new configfs
interface, reducing code duplication.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 58 +++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index ff5cd5eaa550..6f933a76b2b9 100644
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
 
+static int gpio_aggregator_alloc(struct gpio_aggregator **aggr, size_t arg_size)
+{
+	int ret;
+
+	struct gpio_aggregator *new __free(kfree) = kzalloc(
+					sizeof(*new) + arg_size, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	scoped_guard(mutex, &gpio_aggregator_lock)
+		ret = idr_alloc(&gpio_aggregator_idr, new, 0, 0, GFP_KERNEL);
+
+	if (ret < 0)
+		return ret;
+
+	new->id = ret;
+	*aggr = no_free_ptr(new);
+	return 0;
+}
+
+static void gpio_aggregator_free(struct gpio_aggregator *aggr)
+{
+	scoped_guard(mutex, &gpio_aggregator_lock)
+		idr_remove(&gpio_aggregator_idr, aggr->id);
+
+	kfree(aggr);
+}
+
 static int gpio_aggregator_add_gpio(struct gpio_aggregator *aggr,
 				    const char *key, int hwnum, unsigned int *n)
 {
@@ -454,17 +483,15 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
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
+	res = gpio_aggregator_alloc(&aggr, count + 1);
+	if (res)
 		goto put_module;
-	}
 
 	memcpy(aggr->args, buf, count + 1);
 
@@ -475,19 +502,10 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
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
 
 	res = gpio_aggregator_parse(aggr);
@@ -496,7 +514,7 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
+	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -510,14 +528,10 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
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
+	gpio_aggregator_free(aggr);
 put_module:
 	module_put(THIS_MODULE);
 	return res;
-- 
2.45.2


