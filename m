Return-Path: <linux-gpio+bounces-16152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7FA386AE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE120188B6D2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B776C225409;
	Mon, 17 Feb 2025 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="OVivuy09"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3407223328
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802985; cv=none; b=TZBrObyKzpVTQP8pZJGvHJ2GqRWJFVqBpyjhHmbgu421hmxrp0WlcmLGIZ3R+66CF6/AUqnlgFr0cyfvAnscWt9ali873HciDhm2REG1E61I2ERrC+J3jJODQcC515tkQuEGSpYnRPdfbc1JbYiKxExOvT9CnC+yFhxg7yJhwYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802985; c=relaxed/simple;
	bh=uvDPPe/zh18N6hlSUI3RGzfNlPtrpvVYWv/tx+FGhgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP+C9W5h3F8fxAkUsex7tqoQvjd/BsQEsA8xKtn30skn+xiD9DmpznN2GjA+M4SHCRQ8mjAL9xLUxo8p8to/BkL4tdhQ96FHqHwbVrATP5afsSbXwAhskCt2fr7I9Nk+wFiG6DObgwHAjI2PMoRyYyfXvp3YMioi59BuTRqgOoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=OVivuy09; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 60FBC3F868
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802982;
	bh=dSs/jDBsvmuiaXfkwHoPbsWqaGsAOzbJ2wNat8FrzKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=OVivuy09Kvjrx8PO5VKwi08Hr1W40lr/OL7KftZ0bAK60SG7gNSTJFfwQawMZ9ERh
	 9/lrPN7doX211iDw9Wvgy+1H9Fx6ygG2vdnJxNjJW11TZ/z7sHUH+WYGJw8wzh7p0D
	 j/uExB8lrAACcsG7hIzwpLV1+sS/zRVrXNs2GJW70k3BFX093GjvOB5Rz1e74RlPbS
	 36HXeak+OODx8H97KPti7vYzfBtjBxkmA3US6dJu2Cqr/PrsEayvUIDwaZCld9CfWu
	 QBuNTBqLtdlWB95bI3X2bGTPkAstBD6bBfy7r8DWvbBM2dOyisvjrDYrTcqK2EzH/H
	 4tdsGomCyEEIw==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc4dc34291so3231219a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802981; x=1740407781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSs/jDBsvmuiaXfkwHoPbsWqaGsAOzbJ2wNat8FrzKA=;
        b=P8T3ooAI66DEoxTXIHSbmFqTcYKxA7igCXnYp9yVM4BUZ796dzFc8Y2V1+QKx6lFC1
         pAn6HUClbAMNO7y0w7S1oWvwC0yKB0VyupYbjw9QMlKYoXuig9bC5GiYyquSl55L+ggg
         IC845OYqz+ubs17CFDxvQ3TzVVK/gQhw3wFUkhy3sCjPfM62jOoK4xFlLGn0kV5/bZQN
         XvdpA0g+d1ePT6B7DQXbrK4QkrND2GlSkgR7wLuudU5TVuxkWB0zNNzxaahb9dL5dJ0a
         Y3MK+xUnmnpvP2NaoUPfN0ApHXBRxt1K4/rSpGJNxh1YDH4zhbJEPtkChEaMWUcJ3dCF
         uLBw==
X-Gm-Message-State: AOJu0YzmlFJcN3Kl/2f94s9HlIPnsCBzF4EjQQqzfhXlHYmWGeb+Gf4O
	mmHJzMsZGD4wTFelvBmy8YTGVMe0jb7wQ0CuXHV4AjHSRon2nLuiCzsLnzOJiKQP16ugRd45mpv
	JYadrjQKPmMHg3izcLwL3NvP0+QPWPWrzRvK7Ew/+zj96T1RPN5MOc4XrNiclLoDr8hOgZggu/X
	WK0yCYUGk=
X-Gm-Gg: ASbGncvdbis/F1qIL3WtPGLYBNEfpdnSjoJuOxmNbeW1BR++XrrWYhej0gRYXh0AGIw
	vfMC4Hc24Hv5wrLmkgbr/8MIjxZUcQA5eby2iB/4PKfTWKHUEFs9+uFFAHWbf288YZ8SgL2ZKTc
	rHXT7/u0l6waSWHIsMobc7TCxr01sZT+WhfpICItGF5febhnCwE3JS+6+endWgJL97FIpAH+s31
	fHN2wzvDx59nSO7POONyhTr4Wb7BG39YHDf9ZiN1FKXFRX5Ov2676EFcT3WXf4UMjMNkMgUJqYq
	QUHkNJsVd3ZeRuN4ADkRwzE=
X-Received: by 2002:a17:90b:4d87:b0:2fa:1e3e:9be7 with SMTP id 98e67ed59e1d1-2fc40d131d9mr14472031a91.5.1739802980716;
        Mon, 17 Feb 2025 06:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw+izIBre53WvTTJHTp6m7C6QdXU/8idflMKHMYSzPd2m/IGL+jZNFSFLKI+SWsJNHweAuOQ==
X-Received: by 2002:a17:90b:4d87:b0:2fa:1e3e:9be7 with SMTP id 98e67ed59e1d1-2fc40d131d9mr14471996a91.5.1739802980395;
        Mon, 17 Feb 2025 06:36:20 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:36:20 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] gpio: aggregator: cancel deferred probe for devices created via configfs
Date: Mon, 17 Feb 2025 23:35:30 +0900
Message-ID: <20250217143531.541185-9-koichiro.den@canonical.com>
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
index 8f8793f27211..f6beb9f41b9a 100644
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
 
@@ -1112,6 +1116,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 				size_t count)
 {
+	struct gpio_aggregator_pdev_meta meta = { .init_via_sysfs = true };
 	char name[CONFIGFS_ITEM_NAME_LEN];
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
@@ -1161,7 +1166,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
+	pdev = platform_device_register_data(NULL, DRV_NAME, aggr->id, &meta, sizeof(meta));
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -1242,14 +1247,15 @@ static struct attribute *gpio_aggregator_attrs[] = {
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
@@ -1263,10 +1269,28 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
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


