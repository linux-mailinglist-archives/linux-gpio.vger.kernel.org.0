Return-Path: <linux-gpio+bounces-17653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1CFA63031
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 17:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE080189AD0D
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 16:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41E82063D6;
	Sat, 15 Mar 2025 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="DEvMm8Aw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2D5205E30
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742056915; cv=none; b=u5DXnhRC9r4uNVaRAlZf6j490O11qCMgozaGtElBOpIJs1nAjP/cxqu5Xs/0AJSxDNlrGIMc9sQnX/v8py7UcE9+5BVWHpORrmejGRKBZhx0L5E4Sy7uzfHkMEMpwBUrXlBuArpv7WaFqFQt4QChtiy9lzRDPayIhHiBM/naWVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742056915; c=relaxed/simple;
	bh=/Z2MAli9EXDhOWQJGX/cq3RhlXJKDrxBGFnuUhIEBNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJta+zCL2H9Hy6CSDSB3IsOJmkZjBsgMBBYUbfZMXebOBqS3iddooR3mPKFcB/kgET3t3lrwg8Sh4ppg4iWSDo1P1wgwqyDFACtWOFt/nbc8aPYPudwgeOI2qDrXJMjkmGN8UtrD1C7/OtdAfvuW4R3HLfE8hk1xbw32cRPFW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=DEvMm8Aw; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 179EE3F2B1
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742056911;
	bh=tGpODGt9i1CwJG7JFJhQeHtJp8NGC2Si4RhlSW04Hrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=DEvMm8AwBTuqXSo5lbzI4FhW9Z7XvCgFiP6HMwphEPPDOzCHvvqS1Kvjv64ZwGfvW
	 nEU8uSeowcfK5CFWId+XjAm3hr1h0+pvCiMnLJl7QzZteZH24BznyT0mI2CFrx39LT
	 SZJqpx4iOHVoB8Oyb0q3KoafYnDDLmrHjL3lFxjJh3ZIPt1R8kfiCbL3mcEelb2DSA
	 idjiIP6skXGw1NrrqVWgNejASMC4Xi2eo+Xorl70f+yTKBmtehAZfJj7V5ZET2pTdo
	 1mE220NXMUFVO3apI3k6Vk1dgsMTY8QLHdWHd7p9S4vl3zKe+5x56hgsNoT+GTiHoS
	 9st/jniqVP5yQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so985621a91.1
        for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 09:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742056909; x=1742661709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGpODGt9i1CwJG7JFJhQeHtJp8NGC2Si4RhlSW04Hrg=;
        b=DJpbgkTRLMsV2fokNFHjqPPKSifc3r2OOU6xeomUqxNYjD41TGug+NAE6/u4bcnX+X
         qTg9unDgINp8LXtnXXFJzryvCFQGpy07hoUhz21EtQyqiiTLySLVJv7dWQ2+/6rOjTWz
         QYORivJslk7dwLDOGcVn3R/wHyuOetgXUxBDDysz5+jWLfrhGtc7QgZcEXWinE53/RIq
         wwziz95xXicvqJ37Dc7HeoXs0E3Yu1K8rJrVjmM3W2jS9oBlTgFM9HKxaxFKeWEQwR7B
         EkXOv13lG/7QvkaboNcgBf7La0ayiN7pKltv75GkU2a0HXFOIA5oIe1CSTBbGvNuSgAh
         Pg+A==
X-Gm-Message-State: AOJu0YxRgDWAgN7HirEQ6wlndzmkzXtYckzhypsj3JMt+/180cdKZ3R8
	K2koRCfSj8RIMnk8iglJPWtb0TVRG41ABcOtC7jGhWnQEBUkK3ri/XmuvnUfzm0b7WCa/B1yFj8
	oyRRLMkud1aAa1CPVBf0sH+vaiNJjK9d6s4T5rFC4ZBhiyM1SSWkWT0bJFhbLkgvIcpe/cqVOBM
	io2Z0F1FM=
X-Gm-Gg: ASbGnct8zV2TNAwgbh/v2hqCSQlN6BqqwifUaLAmOQc8OK9cRMEzOI97aH98/Uye2Nj
	Zz96Ynbd26gx9EhZ5x1fBsL3AlXNKG+SGxY+wHAOkenFn236JFFwZYhw16O7e9vcQ+DTWYOTEeG
	/lPGvcjWSoYLJMD/DDNqApisOLRw61TbJQ5LGwcLTgAnhAUvtpA1LNw28KO53tlfWsvuJ1SFN9M
	zRbbOq7GB4vM+bFOCX+dKLa90bGDZ2lADVkhHSTIXF2cGZZaN0K0b3FRR+QMOMy2fQZgomSVUka
	1w2vpgsZIWJaRagY
X-Received: by 2002:a05:6a20:8c9e:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-1f5c13227c6mr6406195637.39.1742056909507;
        Sat, 15 Mar 2025 09:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZOBLI0X8SyCatv7tcjBCLoHnb+mWe3/KR563fonVBZeCW2KmMW/mdZPHgtvnuvOh9i5z4+Q==
X-Received: by 2002:a05:6a20:8c9e:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-1f5c13227c6mr6406179637.39.1742056909207;
        Sat, 15 Mar 2025 09:41:49 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:83e6:3590:3498:db44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155e3a9sm4637104b3a.71.2025.03.15.09.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 09:41:48 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/9] gpio: aggregator: cancel deferred probe for devices created via configfs
Date: Sun, 16 Mar 2025 01:41:21 +0900
Message-ID: <20250315164123.1855142-8-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250315164123.1855142-1-koichiro.den@canonical.com>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For aggregators initialized via configfs, write 1 to 'live' waits for
probe completion and returns an error if the probe fails, unlike the
legacy sysfs interface, which is asynchronous.

Since users control the liveness of the aggregator device and might be
editing configurations while 'live' is 0, deferred probing is both
unnatural and unsafe.

Cancel deferred probe for purely configfs-based aggregators when probe
fails.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index de693182070c..89c78d145cbd 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -72,6 +72,10 @@ struct gpio_aggregator_line {
 	enum gpio_lookup_flags flags;
 };
 
+struct gpio_aggregator_pdev_meta {
+	bool init_via_sysfs;
+};
+
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
@@ -1134,6 +1138,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 				size_t count)
 {
+	struct gpio_aggregator_pdev_meta meta = { .init_via_sysfs = true };
 	char name[CONFIGFS_ITEM_NAME_LEN];
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
@@ -1183,7 +1188,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
+	pdev = platform_device_register_data(NULL, DRV_NAME, aggr->id, &meta, sizeof(meta));
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -1266,14 +1271,15 @@ static struct attribute *gpio_aggregator_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
 
-
 /*
  *  GPIO Aggregator platform device
  */
 
 static int gpio_aggregator_probe(struct platform_device *pdev)
 {
+	struct gpio_aggregator_pdev_meta *meta;
 	struct device *dev = &pdev->dev;
+	bool init_via_sysfs = false;
 	struct gpio_desc **descs;
 	struct gpiochip_fwd *fwd;
 	unsigned long features;
@@ -1287,10 +1293,28 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 	if (!descs)
 		return -ENOMEM;
 
+	meta = dev_get_platdata(&pdev->dev);
+	if (meta && meta->init_via_sysfs)
+		init_via_sysfs = true;
+
 	for (i = 0; i < n; i++) {
 		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
-		if (IS_ERR(descs[i]))
+		if (IS_ERR(descs[i])) {
+			/*
+			 * Deferred probing is not suitable when the aggregator
+			 * is created via configfs. They should just retry later
+			 * whenever they like. For device creation via sysfs,
+			 * error is propagated without overriding for backward
+			 * compatibility. .prevent_deferred_probe is kept unset
+			 * for other cases.
+			 */
+			if (!init_via_sysfs && !dev_of_node(dev) &&
+			    descs[i] == ERR_PTR(-EPROBE_DEFER)) {
+				pr_warn("Deferred probe canceled for creation via configfs.\n");
+				return -ENODEV;
+			}
 			return PTR_ERR(descs[i]);
+		}
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
-- 
2.45.2


