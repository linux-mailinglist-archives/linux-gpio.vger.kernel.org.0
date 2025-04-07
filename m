Return-Path: <linux-gpio+bounces-18253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41FA7D2E8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F344D3AD295
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A32A221F38;
	Mon,  7 Apr 2025 04:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fMzQk41s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19319341F
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000254; cv=none; b=keVUDsbTh997Uimaujid+15PQhLdUNeiXb2eCBQ8WtNJccoTyWiPPuoiVxwQulpIMoujVVWEVc0G7IcvUX+vKQWyszrLYxHSLqWfXB8sBx+LNvnKvmhQACmXj3LB5BykPanraCVGh1afCTgPw8+VH5LmVANRypRCTqW88oj2bsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000254; c=relaxed/simple;
	bh=QKzGBY006K35i0VUre3m/YXkXfWXlIbWjW5345Q28Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GplSkOyvSOnuLOZuaEwt1jt2TanMWvyDrdRKnKhsV8WoyXiTFnjGZ1luv8DcODOIUC/Onrm5zLzJMif9VJ19F898l2+6smMhn9SY5nZFcr/qABgX7TdluQRmeaDXBQXL8JIsVShs6W6TNI2X+1YUxy+sw55wYVTH3VMJHh0pVME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fMzQk41s; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E0A43F471
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000250;
	bh=gYD77nW/waFXgRcL7RZiNMF3p8f4KzCk7t7Ss3jccwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fMzQk41swGRDZD0MT87hwrqv1i54OXC/JJllHQjlkze4HE84L8ygzSgyQrI8S7eAE
	 w8os78ofofQfec13yMiCqlLI239LFTb9OuJinjD+2ct7PkadCoUIl99nQy9wA81Zy5
	 pO7u6NJ+WamF+BNgyDmK2GWQC3S1x/D/hIaqw4hFTzgmkeGrDiZEvYl027fWOE7sca
	 VIbEccG9Kc1nuPP1l7lyFpGR3F0PiwpD2gPXGnz4wDLems4W79DpDl9ZoLgmMB+XAs
	 3noBlKl2TCxLMfmGpiZKx8UINdAqbvFy0TNh/dXuCxfgAJ37TSA+bnUYyOcn+sh49B
	 PFtlWKoNYt+wQ==
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af51d92201fso4560404a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000249; x=1744605049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYD77nW/waFXgRcL7RZiNMF3p8f4KzCk7t7Ss3jccwc=;
        b=wsUk5KiCW/Gzd+EWbdeRwf6UGNB+7nd33m7z++0lOBoYxF1e+zpe5QBlzRn3SuDuVR
         xoif6RSqXzAwf473RNHaxqzBTkFSf/ogQoohXCx/helXZaCL0byRrPNbE6baAWc5yqK3
         hi96dQh9Og9PegUsdulkz1TTJXIw6yqMBGMNISJ69CZjBjtL/tbqQKga0Gx3pMR4canQ
         8j/3j3nLAtceo1Ggm8z7flcnFGCRP5oZYEmFoi+xr02gkOQAMBAKksnyqPismm+RfTjA
         m+VnyxSPyS6oBjjPF/Uw4o98kwLlwUe07jlomhOr3KQiVT7e/VYEpM8v/QTDTvD0Es2X
         zxXw==
X-Gm-Message-State: AOJu0YwYg9/UgKkGIVA4W7xEis7+/Xy5iW3N0bOpZ6z5RVJkTILSLvm5
	Tbw+Fb3G22x5I5tpfhFquVAPTJYYBlHwHSUy2S2nCCX0nu7NWJQeQ3buroI50cRAVHliUIVqbpO
	l4IHmZ5bcl75RJ+2NCQnJw4KnG1+ofD37zcjW6c/4k9SIiOEy+NVjitDUC3OG79fQckL6s6/79i
	jXfPHIcdE=
X-Gm-Gg: ASbGncu78gnQWFaOoSIspX3G/3R1NgqmUtUvKey8owTAOdOyt7fxd22osOaPLdeNic6
	h0O0+lUcE9RY75AsZhFwv5ZeCgwIqHJ1UhQ0kKF190UnBXuQbaBIdnKCDtotRFlS0+bQxwNJIxY
	mqLXdostaUaWLdJ6A4dCKJ9YZSqc5jk3uGDSDRUEU4m1/8Y3XkY9XCIp1CmFSISuKcfdJ9rYVRe
	MU7XB8cucN8HeqpdTXRzo87AsEHkfmtamEEHACDfIIP6RZlCqOjS2RsZelHxJONlH/iWrZ9xPE0
	pm7dw4g1PwqCBegjoIGWeXLTw3j2luzCFw==
X-Received: by 2002:a17:902:d491:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22a95573902mr122824845ad.38.1744000248659;
        Sun, 06 Apr 2025 21:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRt1TZZiQKo9HcnEyiDo2yBUyjoUApiYat4HpGVsubxyL9kQHP3eAQ5W3KlqnK1ubECzk5qg==
X-Received: by 2002:a17:902:d491:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22a95573902mr122824555ad.38.1744000248309;
        Sun, 06 Apr 2025 21:30:48 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:48 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] gpio: aggregator: reorder functions to prepare for configfs introduction
Date: Mon,  7 Apr 2025 13:30:11 +0900
Message-ID: <20250407043019.4105613-2-koichiro.den@canonical.com>
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

Reorder functions in drivers/gpio/gpio-aggregator.c to prepare for the
configfs-based interface additions in subsequent commits. Arrange the
code so that the configfs implementations will appear above the existing
sysfs-specific code, since the latter will partly depend on the configfs
interface implementations when it starts to expose the settings to
configfs.

The order in drivers/gpio/gpio-aggregator.c will be as follows:

* Basic gpio_aggregator/gpio_aggregator_line representations
* Common utility functions
* GPIO Forwarder implementations
* Configfs interface implementations
* Sysfs interface implementations
* Platform device implementations
* Module init/exit implementations

This separate commit ensures a clean diff for the subsequent commits.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 380 +++++++++++++++++----------------
 1 file changed, 192 insertions(+), 188 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d232ea865356..e026deb4ac64 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -61,194 +61,6 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 	return 0;
 }
 
-static int aggr_parse(struct gpio_aggregator *aggr)
-{
-	char *args = skip_spaces(aggr->args);
-	char *name, *offsets, *p;
-	unsigned int i, n = 0;
-	int error = 0;
-
-	unsigned long *bitmap __free(bitmap) =
-			bitmap_alloc(AGGREGATOR_MAX_GPIOS, GFP_KERNEL);
-	if (!bitmap)
-		return -ENOMEM;
-
-	args = next_arg(args, &name, &p);
-	while (*args) {
-		args = next_arg(args, &offsets, &p);
-
-		p = get_options(offsets, 0, &error);
-		if (error == 0 || *p) {
-			/* Named GPIO line */
-			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
-			if (error)
-				return error;
-
-			name = offsets;
-			continue;
-		}
-
-		/* GPIO chip + offset(s) */
-		error = bitmap_parselist(offsets, bitmap, AGGREGATOR_MAX_GPIOS);
-		if (error) {
-			pr_err("Cannot parse %s: %d\n", offsets, error);
-			return error;
-		}
-
-		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-			error = aggr_add_gpio(aggr, name, i, &n);
-			if (error)
-				return error;
-		}
-
-		args = next_arg(args, &name, &p);
-	}
-
-	if (!n) {
-		pr_err("No GPIOs specified\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static ssize_t new_device_store(struct device_driver *driver, const char *buf,
-				size_t count)
-{
-	struct gpio_aggregator *aggr;
-	struct platform_device *pdev;
-	int res, id;
-
-	if (!try_module_get(THIS_MODULE))
-		return -ENOENT;
-
-	/* kernfs guarantees string termination, so count + 1 is safe */
-	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
-	if (!aggr) {
-		res = -ENOMEM;
-		goto put_module;
-	}
-
-	memcpy(aggr->args, buf, count + 1);
-
-	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
-				GFP_KERNEL);
-	if (!aggr->lookups) {
-		res = -ENOMEM;
-		goto free_ga;
-	}
-
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
-	if (!aggr->lookups->dev_id) {
-		res = -ENOMEM;
-		goto remove_idr;
-	}
-
-	res = aggr_parse(aggr);
-	if (res)
-		goto free_dev_id;
-
-	gpiod_add_lookup_table(aggr->lookups);
-
-	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
-	if (IS_ERR(pdev)) {
-		res = PTR_ERR(pdev);
-		goto remove_table;
-	}
-
-	aggr->pdev = pdev;
-	module_put(THIS_MODULE);
-	return count;
-
-remove_table:
-	gpiod_remove_lookup_table(aggr->lookups);
-free_dev_id:
-	kfree(aggr->lookups->dev_id);
-remove_idr:
-	mutex_lock(&gpio_aggregator_lock);
-	idr_remove(&gpio_aggregator_idr, id);
-	mutex_unlock(&gpio_aggregator_lock);
-free_table:
-	kfree(aggr->lookups);
-free_ga:
-	kfree(aggr);
-put_module:
-	module_put(THIS_MODULE);
-	return res;
-}
-
-static DRIVER_ATTR_WO(new_device);
-
-static void gpio_aggregator_free(struct gpio_aggregator *aggr)
-{
-	platform_device_unregister(aggr->pdev);
-	gpiod_remove_lookup_table(aggr->lookups);
-	kfree(aggr->lookups->dev_id);
-	kfree(aggr->lookups);
-	kfree(aggr);
-}
-
-static ssize_t delete_device_store(struct device_driver *driver,
-				   const char *buf, size_t count)
-{
-	struct gpio_aggregator *aggr;
-	unsigned int id;
-	int error;
-
-	if (!str_has_prefix(buf, DRV_NAME "."))
-		return -EINVAL;
-
-	error = kstrtouint(buf + strlen(DRV_NAME "."), 10, &id);
-	if (error)
-		return error;
-
-	if (!try_module_get(THIS_MODULE))
-		return -ENOENT;
-
-	mutex_lock(&gpio_aggregator_lock);
-	aggr = idr_remove(&gpio_aggregator_idr, id);
-	mutex_unlock(&gpio_aggregator_lock);
-	if (!aggr) {
-		module_put(THIS_MODULE);
-		return -ENOENT;
-	}
-
-	gpio_aggregator_free(aggr);
-	module_put(THIS_MODULE);
-	return count;
-}
-static DRIVER_ATTR_WO(delete_device);
-
-static struct attribute *gpio_aggregator_attrs[] = {
-	&driver_attr_new_device.attr,
-	&driver_attr_delete_device.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(gpio_aggregator);
-
-static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
-{
-	gpio_aggregator_free(p);
-	return 0;
-}
-
-static void __exit gpio_aggregator_remove_all(void)
-{
-	mutex_lock(&gpio_aggregator_lock);
-	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
-	idr_destroy(&gpio_aggregator_idr);
-	mutex_unlock(&gpio_aggregator_lock);
-}
-
 
 /*
  *  GPIO Forwarder
@@ -583,6 +395,184 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 }
 
 
+/*
+ * Sysfs interface
+ */
+static int aggr_parse(struct gpio_aggregator *aggr)
+{
+	char *args = skip_spaces(aggr->args);
+	char *name, *offsets, *p;
+	unsigned int i, n = 0;
+	int error = 0;
+
+	unsigned long *bitmap __free(bitmap) =
+			bitmap_alloc(AGGREGATOR_MAX_GPIOS, GFP_KERNEL);
+	if (!bitmap)
+		return -ENOMEM;
+
+	args = next_arg(args, &name, &p);
+	while (*args) {
+		args = next_arg(args, &offsets, &p);
+
+		p = get_options(offsets, 0, &error);
+		if (error == 0 || *p) {
+			/* Named GPIO line */
+			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
+			if (error)
+				return error;
+
+			name = offsets;
+			continue;
+		}
+
+		/* GPIO chip + offset(s) */
+		error = bitmap_parselist(offsets, bitmap, AGGREGATOR_MAX_GPIOS);
+		if (error) {
+			pr_err("Cannot parse %s: %d\n", offsets, error);
+			return error;
+		}
+
+		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
+			error = aggr_add_gpio(aggr, name, i, &n);
+			if (error)
+				return error;
+		}
+
+		args = next_arg(args, &name, &p);
+	}
+
+	if (!n) {
+		pr_err("No GPIOs specified\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t new_device_store(struct device_driver *driver, const char *buf,
+				size_t count)
+{
+	struct gpio_aggregator *aggr;
+	struct platform_device *pdev;
+	int res, id;
+
+	if (!try_module_get(THIS_MODULE))
+		return -ENOENT;
+
+	/* kernfs guarantees string termination, so count + 1 is safe */
+	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
+	if (!aggr) {
+		res = -ENOMEM;
+		goto put_module;
+	}
+
+	memcpy(aggr->args, buf, count + 1);
+
+	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
+				GFP_KERNEL);
+	if (!aggr->lookups) {
+		res = -ENOMEM;
+		goto free_ga;
+	}
+
+	mutex_lock(&gpio_aggregator_lock);
+	id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
+	mutex_unlock(&gpio_aggregator_lock);
+
+	if (id < 0) {
+		res = id;
+		goto free_table;
+	}
+
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
+	if (!aggr->lookups->dev_id) {
+		res = -ENOMEM;
+		goto remove_idr;
+	}
+
+	res = aggr_parse(aggr);
+	if (res)
+		goto free_dev_id;
+
+	gpiod_add_lookup_table(aggr->lookups);
+
+	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
+	if (IS_ERR(pdev)) {
+		res = PTR_ERR(pdev);
+		goto remove_table;
+	}
+
+	aggr->pdev = pdev;
+	module_put(THIS_MODULE);
+	return count;
+
+remove_table:
+	gpiod_remove_lookup_table(aggr->lookups);
+free_dev_id:
+	kfree(aggr->lookups->dev_id);
+remove_idr:
+	mutex_lock(&gpio_aggregator_lock);
+	idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+free_table:
+	kfree(aggr->lookups);
+free_ga:
+	kfree(aggr);
+put_module:
+	module_put(THIS_MODULE);
+	return res;
+}
+
+static DRIVER_ATTR_WO(new_device);
+
+static void gpio_aggregator_free(struct gpio_aggregator *aggr)
+{
+	platform_device_unregister(aggr->pdev);
+	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
+	kfree(aggr->lookups);
+	kfree(aggr);
+}
+
+static ssize_t delete_device_store(struct device_driver *driver,
+				   const char *buf, size_t count)
+{
+	struct gpio_aggregator *aggr;
+	unsigned int id;
+	int error;
+
+	if (!str_has_prefix(buf, DRV_NAME "."))
+		return -EINVAL;
+
+	error = kstrtouint(buf + strlen(DRV_NAME "."), 10, &id);
+	if (error)
+		return error;
+
+	if (!try_module_get(THIS_MODULE))
+		return -ENOENT;
+
+	mutex_lock(&gpio_aggregator_lock);
+	aggr = idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+	if (!aggr) {
+		module_put(THIS_MODULE);
+		return -ENOENT;
+	}
+
+	gpio_aggregator_free(aggr);
+	module_put(THIS_MODULE);
+	return count;
+}
+static DRIVER_ATTR_WO(delete_device);
+
+static struct attribute *gpio_aggregator_attrs[] = {
+	&driver_attr_new_device.attr,
+	&driver_attr_delete_device.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(gpio_aggregator);
+
+
 /*
  *  GPIO Aggregator platform device
  */
@@ -640,6 +630,20 @@ static struct platform_driver gpio_aggregator_driver = {
 	},
 };
 
+static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
+{
+	gpio_aggregator_free(p);
+	return 0;
+}
+
+static void __exit gpio_aggregator_remove_all(void)
+{
+	mutex_lock(&gpio_aggregator_lock);
+	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
+	idr_destroy(&gpio_aggregator_idr);
+	mutex_unlock(&gpio_aggregator_lock);
+}
+
 static int __init gpio_aggregator_init(void)
 {
 	return platform_driver_register(&gpio_aggregator_driver);
-- 
2.45.2


