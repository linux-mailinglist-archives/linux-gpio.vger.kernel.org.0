Return-Path: <linux-gpio+bounces-18259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95AA7D2F4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C50E188E02B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF732236FA;
	Mon,  7 Apr 2025 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="iLwcuMku"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35536223329
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000266; cv=none; b=ADWTEh7v/Wkqt50biIAtyMbQqPaE5w6IX4CiWSnARmapZPAyQ/+AMoloJUsHMGcP6JZU0n59+UVemenMapAMLGDF9fRvsxlK3JvdC7VKVrzJBZAqEbnvox+mlCG/TP+RcWJFkcI97K+sowfLjvaPkttAa/LB3LkAB/kaO1Es8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000266; c=relaxed/simple;
	bh=5hW1x0h0BI/1kFl0MGB9PENf/p3rDflku5UUTYWUgwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSGdi39w5OF0maYLPYrylqvLDfK7rpqJYkCaitLhzRicjcc3A417zRvhF69Jyndr1CYM8bouTjygKew3fE9tUShOGpbU8LLq4ob66Z5bUgNVXQ9O0qGHL3Ef9S5TuZSVVNbgKXvs5+Fx8HmKxQ/6hcslYw3UsBf8FW1qhto8RV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=iLwcuMku; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 61BEB3F13F
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000263;
	bh=ibKGlo6h6Vsh/r+V4NevFZFzzB1WsTKuG5wixnUQ0uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=iLwcuMkuRGmEOtrOs+pPpW7Ow7Gw3T/yG7UDuotDIyCFbd2R4STBmO/Eh4sF3LFyQ
	 CzWqaH6HczmBXFnv47EA/4DIfVeSuBOss7uN7vyQ9AgybxkYqXJsJtf9Sz/JWD7ODc
	 PLBk+jYD9W42hXMOnILksNIijJM7TAGxBLqYj/9MSKIl9pb1SDhE/EqHv9N0VP23N3
	 wrk7/zHrCDRYmU4HKvWyx4jCNsbuJaPNSId0vEs1lNRtEbh+wg2DPi2OOmrJZ5jpVQ
	 vaWMhFGFGpsvYyPNX4v4gH2v/LBpSNzQb7eZa6c4sFgbzd91Dgc5uRDv87dFl8H31b
	 b/52zchmDgxnw==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227ea16b03dso56751675ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000262; x=1744605062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibKGlo6h6Vsh/r+V4NevFZFzzB1WsTKuG5wixnUQ0uE=;
        b=ccwSS4vtrLBQbcmIShxXaTSi6N/9NzqC6QCC0b+EYJ3OcI0g3bpi76842VoKH44j7E
         6/PFvJ3sRc+5TN3lGcAQL5D0tQ7iJf5qPm02kkaGLHSx0DVdrE2OaCW1aBtu+dEiG/f0
         NRciYRPP9v59F0gowGCr9lUPKBJ2Jm3LT8PqOdB5zq8tH2hLBqNcpemjYyZe/bsiDjkh
         BQub+3aE8I1nuuPJB9u39jSRiOPmZL3BXljKe1er2VpVjXwrwP5kk4lZ+6B1lFgQfRsp
         iX5+6nQ12FyI3SnWOwNNP3jsIwv1zVFarJObNK7L9rhRomqxXzKsliy9mdhCuOXyPaV+
         EycQ==
X-Gm-Message-State: AOJu0YwROr8Jq8FnxzneurPNkPrdd1B0LIIRCS9jWHViWmhyxnbtsuUt
	TGHFv1k8AijqKTYdP5DG8uvqmbaEFRMlwwHXucHx81Pv+aWCe0KeFeSU8u2ih7zdOE4p0cyqwYW
	q7grisi4xacE8NhQSn6vgQy0UKLOUc9Cphynz4mtvy/fA7DkLHK90nG0og/fTcCiZNBxPNVQY8m
	TcrhxQMEo=
X-Gm-Gg: ASbGnctfftm1GI4QMYGT+AnKyNhW6Nky3ojz3WHkxh6SZ1XHlLE1TSINlp/rk+Xiubv
	5zAfkd/nT+nXNSLYSJ7Z4/69Olpai658lj8LR/TMU7dxxKi37BS0BWjFi7ScT6um4g5sdKmZc5Q
	E4q+vJxQ/bA1GEvW9oDqbNWGy7aHDbaFBB7BzQGQn+L40OuGvfMb12uC4axFiDcHxtenqie3psB
	lJbuJ9/uQQWv7HDOpawjhgQkDQfK+xgOTn3rWYt5xI6HSpHOxL2wZlaytHEHdeunPlVYnutJUU2
	nVWAaQLVWmmgCOye8YkZpSvt/ygWPWPyGA==
X-Received: by 2002:a17:902:d50e:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22a8a05524fmr151180785ad.15.1744000261817;
        Sun, 06 Apr 2025 21:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+bu3wJwF3+o72OVyEJz8tYU76qPXcw9JGAY3si2m0Y9uGwevcahFZ2tnrq1WiHt6WtsfzhQ==
X-Received: by 2002:a17:902:d50e:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22a8a05524fmr151180585ad.15.1744000261512;
        Sun, 06 Apr 2025 21:31:01 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:31:01 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/9] gpio: aggregator: cancel deferred probe for devices created via configfs
Date: Mon,  7 Apr 2025 13:30:17 +0900
Message-ID: <20250407043019.4105613-8-koichiro.den@canonical.com>
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
index bea01ebe8cda..d6010331a4c0 100644
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
 
@@ -1139,6 +1143,7 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 						const char *buf, size_t count)
 {
+	struct gpio_aggregator_pdev_meta meta = { .init_via_sysfs = true };
 	char name[CONFIGFS_ITEM_NAME_LEN];
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
@@ -1189,7 +1194,7 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
+	pdev = platform_device_register_data(NULL, DRV_NAME, aggr->id, &meta, sizeof(meta));
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -1276,14 +1281,15 @@ static struct attribute *gpio_aggregator_attrs[] = {
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
@@ -1297,10 +1303,28 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
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


