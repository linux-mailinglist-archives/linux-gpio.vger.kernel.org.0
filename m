Return-Path: <linux-gpio+bounces-16078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D56A37461
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 14:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BCE318939A1
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA719AD90;
	Sun, 16 Feb 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="cFsAa7hx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E972919A288
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710731; cv=none; b=hn7DX1j+APkZCUNp2ZQA/BXI2bT8wJ6WV4zqE0zsP/zmEeW00qGwUwN0V1VO0Av/EqJ/bW63nnYiJD62fP4+zmPQ3z3+p3kqcwqZjl+4NWW6DzE9uAKEAcW2PkfsL+sG9/jNIhS6+M5kQDG4gxsn6VIRCKJ8YrMPTdBA8w4b4Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710731; c=relaxed/simple;
	bh=qqnT84gn7S+HraZ5CVJDXcqJXkGyam0Bt8hN1MkY3TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bY25j++5+M5ejITWWLahdT623LHG4uYM6v9aB/iesAWoKyGc2/cLPPmhClbRzKf2muNQ3jRSDRprm07o94wWz29ULdpPp0yO8DP/g3j+5R70p3vxmnAUfC5ROsXA5pOIrfBFzsrt7FU6j12ij2Juj7I7YwqKn013RNNQb8dIo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=cFsAa7hx; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9A00B3F175
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710728;
	bh=WH64JcRz8MPBFf1546ogFJ11akD0QnrE8MTXmnLnDMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=cFsAa7hxudFEts3UjyjJpQIYgu71hJ7PN0B9VuK3W02o1i9Wajair6N3Cm1u1VVCC
	 gU3ZnlUvt7Au3I7zl0VbYi5F7R1cgcV3TgyoQhRfZHUBwrULGZiPtC5QcYlWnnoOZW
	 HHXujmfHXr3v5yoABwuEt2h14M08oF6B5WkLvY0uGkwPM+uJKSEYG2V3mXDkOua0Dx
	 XKFQHt+IDHZqRPWGdhdZfz1odWoNdmIKo5BRCvy3jXTLOC20L3ggZBXzCB3rf52Pri
	 faPrm5dDjOTuZPdYtbCBGR25QGyKijxFGyZhnE28nAJYube9mhPqL/a/G2mSEZdSVI
	 jgquRIsnb4NCA==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22104619939so39113605ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:58:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710727; x=1740315527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH64JcRz8MPBFf1546ogFJ11akD0QnrE8MTXmnLnDMk=;
        b=J9nr6Eis3X6lBAywlWsxKMy5pU5mzV9pGgnYLvkUEu0I3o54uma0gOUy22K3KqtscM
         aK30irjtuhDVtA6yveZ+xiH9Fqp+YQk6CbeJiN/fN++86GJPgvO/sS/dP5PS/Q2yuHHW
         wQESRmGkyB3rI/TjJ+jz8lxoLsTq7m6ZgrfS9T4+meUNBWVHFQ2uKkxM8EU3F0b6yG5V
         4DP+rkvcOzdeQgHjBqYEGpovHn7mUW5Rw6RZtKDSQLgq6Agu2vNHpZFPQDR04K1/9mfa
         cSrr41HqukGiaaR6RydREEG4KbVYQwALWS7FVqnav0fMSG+y6wmXkCEWenHmYkPGjEIM
         My4Q==
X-Gm-Message-State: AOJu0Yz8sW+HU1ng2fk1JqLAKmrMERu+UdwQwdUCzu8MiS+ZXSu/Sqbr
	kV3BnYvQhfk2HhQnpRHJVjkzxTikvSWP5F9rMwTSIaNFICm0crmMWTRtRquHJxvI6h8aKiy5bqt
	FnI9dQXr4NWBU+hBm765126B73NV2mCnNQ1G6Im7fEvmFFpjLkn/MovkqGC+Xx9i9HbvyMkpzTI
	3XvCXs9t4=
X-Gm-Gg: ASbGncvdh1IkAyeOzowE8bfWRWgypnSYNhf2h9zrKBrd9w+TzKRnLC+LviKPucNc2Ui
	wvALpMn3XrPhqFndKJBknfuWypZUQxnYXjW9JZK0He+Lz5FryDal4hqJ+peUjMsFIPTbhb9kKFs
	P6Yo6ewnJ1aPDghDLcPB5IRLKxs1zod5DyNIWdg0ds5HVIxsqBbqnr1mbnspwi5AlUynu7mEuRt
	uYdmQcNfujKNpQia9Sv0sLFyHBT+Mf2ZDA4yKddKu3RNoUNP9mkZNf8/HdkdtshUoMp7aitsxQF
	karITA==
X-Received: by 2002:a05:6a21:71c5:b0:1ee:ab1f:41a2 with SMTP id adf61e73a8af0-1eeab1f7a48mr1052492637.28.1739710727130;
        Sun, 16 Feb 2025 04:58:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH854gcVlirPEulSVV/z9Wux6mWAG4+D9ei/MpzFkeEIpH39xQJcWJETrmq7a4gCv6UvLpCwQ==
X-Received: by 2002:a05:6a21:71c5:b0:1ee:ab1f:41a2 with SMTP id adf61e73a8af0-1eeab1f7a48mr1052478637.28.1739710726858;
        Sun, 16 Feb 2025 04:58:46 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:58:46 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/13] gpio: aggregator: add aggr_alloc()/aggr_free()
Date: Sun, 16 Feb 2025 21:58:10 +0900
Message-ID: <20250216125816.14430-8-koichiro.den@canonical.com>
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

Prepare for the upcoming configfs interface. These functions will be
used by both the existing sysfs interface and the new configfs
interface, reducing code duplication.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 58 +++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index b24ed963cd9a..6252a686f805 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -38,12 +38,41 @@
 struct gpio_aggregator {
 	struct pseudo_gpio_common common;
 	struct gpiod_lookup_table *lookups;
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
@@ -446,17 +475,15 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
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
 
@@ -467,19 +494,10 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
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
@@ -488,7 +506,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
+	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -502,14 +520,10 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
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


