Return-Path: <linux-gpio+bounces-18254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F4A7D2EA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17168169C4E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86432222BE;
	Mon,  7 Apr 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="k3y/qy4p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CDE221F26
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000256; cv=none; b=JX745g/A8+tYXpFzUcRNWDl5RAxSb5ahTwjRe7FFnTfRXuH0DYHRaCHNOIfUn4Cy6Mz8Ve9xuhwtY7+nRfgZphCDrU+QG43bu9sEv3PVbAzziSelExx4AQyvQrb2fGX1tfIQc5nnEyBNpbpjrv2FlbfP0R2M3JTbVkMQE0j9Ees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000256; c=relaxed/simple;
	bh=PF2bzENyixS725vuRFQYOE0EHw2Blz1UgA3yYSWEqBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3XvPPw3ukAZM4hR7/aZEV1m1YNM11RwolI/FijNSfI1fiW1EANlfAgH5sovQsD8FtRsgZvtnE2gUcRHY3783GPMyKPGfi70P5e6LeD4zYFBhux/rJJNweE1fojy5NNUiMLxfugvLSxYj8A+ir9BQXmgOtmJb5DRlpV+6GG3Pg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=k3y/qy4p; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7C8FB3F476
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000252;
	bh=qMmf8wsuaV2g3eTzKbfqc83zqOBY3dNWVYTFEe1i+UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=k3y/qy4pg9PYawuAqdOjsS8SAPqy7VZMLM62doww/RyNLngIFMAA7Uxvlb8Sk7Eus
	 /fNEC/pT5nuYJ25EGthFw4f+B+oMS1281p2DvNXMgr7ME2tHBY5uSukLfoHr2qhjfm
	 7aOKxOXXPTBYar8SwRSQHRnKy/dfTQuqlwPSirrffzAVdJSf+TEi54TXxf7buyILbv
	 s+WhhouNHGb7Z5YTGs98tQYtOWSLbJDyOf98LSDbeJ0Yaqb11kWyT5r1gMBzDojLgt
	 AC9vXeF1uVid0+rs8ohFx3KkzlaxC+JS9gZqI9qc5c9BqFVx9mvC3WKlivPLTTD1oi
	 fF2OykIYkc5uQ==
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af53a6bc0b6so1456400a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000251; x=1744605051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMmf8wsuaV2g3eTzKbfqc83zqOBY3dNWVYTFEe1i+UA=;
        b=PbooEcv2V5a04lqk9HGWWsc9zxzQoy7xBjwcC5iMCoXl0J/SLFvaEkhbW86BdajcRe
         oF2SDJdp9kv2EhYH9NltJR/zTCjkwhh507CcH8sd15jEy3/FjbdW2h7fN7aUD38U5KXF
         kuuaLddlocLcoQktaJ6f8qsgiWRUO79OY6ufmEws7Jo+9c2XPFbcpBnMq5DjLLZ+KdeJ
         Vg22Zs/q2H7ADES7ssWwt128uig54ido2TYp7NGHrFYfszF6pjw4YTFaNVRUYW5496Sb
         1BJfjyCBY8xu7h65TE/BorGGed2jHokWHaMC8VCBdrDZ3jFwxkHr3Lv64YlG2y44p4mi
         A8fA==
X-Gm-Message-State: AOJu0Yw/Kdh0xjHA7LHMRqgTQPUkkSoRmo2yA8pQFAaKJUXCg8rXgmXx
	Z/TxnxX3/jC3bc3GEiFwVR9gj5sNAuT6K72du+E3HShubEh0XZbvHOJcw4AtAFVSXcNrLvclhXK
	++qnaAUKCrkcttRp4UMmvNTSEmLVbK6kTXLhdCULSJkoXUisoukSRtflYQo6VsHNq+2JuSepkNl
	0R+mO4U5w=
X-Gm-Gg: ASbGncuUil7xEuTdTOFiIbvIfA6fW1asWxfl9DbgdQGZThZH09T0ccmzA1MlL3+U5UF
	RLUv9R/aIoE+URAQbe8qp3Acj/bz8vsEMrBD7D27WOF2XJyvDuEGGOBvxppv/7pX44s5nt0JKTo
	DOPkwdf0V5I/IfeHJQ10xdVJMztUu5rRhvfPSOMzcuNxNMzFS0SW11iX5XOt6XQ7nBBZOfhgVX7
	0OEXXl4QxQjPXTZyqf8IBg5lOFIo8DEsicFB7xWMpgo41LAMiLOhX15mUBIdtH1DYrWj6lHesJj
	/SiNMD6cAp8MENL9EAt5gEmx5sMRZRWlGg==
X-Received: by 2002:a17:902:e842:b0:224:c46:d167 with SMTP id d9443c01a7336-22a9552acdemr101661835ad.16.1744000250899;
        Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiLDy5RBiDIAPrY/hDRGYzyILeWDPk5r2DHuhwaOj5ikPWcDHSqAyhxm5S1PqpppxhOfeQgQ==
X-Received: by 2002:a17:902:e842:b0:224:c46:d167 with SMTP id d9443c01a7336-22a9552acdemr101661535ad.16.1744000250532;
        Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/9] gpio: aggregator: unify function naming
Date: Mon,  7 Apr 2025 13:30:12 +0900
Message-ID: <20250407043019.4105613-3-koichiro.den@canonical.com>
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

Unify function names to use gpio_aggregator_ prefix (except GPIO
forwarder implementations, which remain unchanged in subsequent
commits). While at it, rename the pre-existing gpio_aggregator_free() to
gpio_aggregator_destory(), since that name will be used by new
alloc/free functions introduced in the next commit, for which the name
is more appropriate.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 37 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index e026deb4ac64..ff5cd5eaa550 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -42,8 +42,8 @@ struct gpio_aggregator {
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
-static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
-			 int hwnum, unsigned int *n)
+static int gpio_aggregator_add_gpio(struct gpio_aggregator *aggr,
+				    const char *key, int hwnum, unsigned int *n)
 {
 	struct gpiod_lookup_table *lookups;
 
@@ -398,7 +398,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 /*
  * Sysfs interface
  */
-static int aggr_parse(struct gpio_aggregator *aggr)
+static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
 	char *name, *offsets, *p;
@@ -417,7 +417,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
-			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
+			error = gpio_aggregator_add_gpio(aggr, name, U16_MAX, &n);
 			if (error)
 				return error;
 
@@ -433,7 +433,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-			error = aggr_add_gpio(aggr, name, i, &n);
+			error = gpio_aggregator_add_gpio(aggr, name, i, &n);
 			if (error)
 				return error;
 		}
@@ -449,8 +449,8 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 	return 0;
 }
 
-static ssize_t new_device_store(struct device_driver *driver, const char *buf,
-				size_t count)
+static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
+						const char *buf, size_t count)
 {
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
@@ -490,7 +490,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 		goto remove_idr;
 	}
 
-	res = aggr_parse(aggr);
+	res = gpio_aggregator_parse(aggr);
 	if (res)
 		goto free_dev_id;
 
@@ -523,9 +523,10 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	return res;
 }
 
-static DRIVER_ATTR_WO(new_device);
+static struct driver_attribute driver_attr_gpio_aggregator_new_device =
+	__ATTR(new_device, 0200, NULL, gpio_aggregator_new_device_store);
 
-static void gpio_aggregator_free(struct gpio_aggregator *aggr)
+static void gpio_aggregator_destroy(struct gpio_aggregator *aggr)
 {
 	platform_device_unregister(aggr->pdev);
 	gpiod_remove_lookup_table(aggr->lookups);
@@ -534,8 +535,8 @@ static void gpio_aggregator_free(struct gpio_aggregator *aggr)
 	kfree(aggr);
 }
 
-static ssize_t delete_device_store(struct device_driver *driver,
-				   const char *buf, size_t count)
+static ssize_t gpio_aggregator_delete_device_store(struct device_driver *driver,
+						   const char *buf, size_t count)
 {
 	struct gpio_aggregator *aggr;
 	unsigned int id;
@@ -559,15 +560,17 @@ static ssize_t delete_device_store(struct device_driver *driver,
 		return -ENOENT;
 	}
 
-	gpio_aggregator_free(aggr);
+	gpio_aggregator_destroy(aggr);
 	module_put(THIS_MODULE);
 	return count;
 }
-static DRIVER_ATTR_WO(delete_device);
+
+static struct driver_attribute driver_attr_gpio_aggregator_delete_device =
+	__ATTR(delete_device, 0200, NULL, gpio_aggregator_delete_device_store);
 
 static struct attribute *gpio_aggregator_attrs[] = {
-	&driver_attr_new_device.attr,
-	&driver_attr_delete_device.attr,
+	&driver_attr_gpio_aggregator_new_device.attr,
+	&driver_attr_gpio_aggregator_delete_device.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
@@ -632,7 +635,7 @@ static struct platform_driver gpio_aggregator_driver = {
 
 static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
 {
-	gpio_aggregator_free(p);
+	gpio_aggregator_destroy(p);
 	return 0;
 }
 
-- 
2.45.2


