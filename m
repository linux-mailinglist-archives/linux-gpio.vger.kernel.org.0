Return-Path: <linux-gpio+bounces-35519-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAV4Kz3t62lHTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35519-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 00:22:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B14463CA0
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 00:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64C76300831F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C19C27FD4F;
	Fri, 24 Apr 2026 22:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKa8C61a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA186245012
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777069371; cv=none; b=AYcP0pfhcUVzfAPpbGqrivnI2wyBoVQdg1gn8hySDfuEj0kF97BxMAtjbzW00MFpBmsySfkAtxzY55HYzaED3s+kELWc/GrRubIsd9vqrH/4hofumUY6WL2hDRW8JAWEOSkuVxKxfdzDz/oE5Mc/9qFNtNMnr+fDJfvUC+PIl3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777069371; c=relaxed/simple;
	bh=LKA0yy9RcxNl2whwAN56X8uktnB+GZ7F5MBTwHDkxlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqZynn1+sy03CEU7CuUXKodWJOLJuovvkJW0k/Exxh4BTT87GsUGmJrGoT3HUN1a/BM+YqLKWKm0F4HQvT1TOOayzq0erf3gzIdplOlWArxot53nAkM5H6L7xezE+1Lv+zvCGO8vcHvEXMJGyqfi2x7bEoGmwsXDhFhbJtBKzgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKa8C61a; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6949f3eeaf6so1770097eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 15:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777069369; x=1777674169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMUOlRheR2ZvpjpoFSAfZ9e9X+cDeCX6/i1HLTycI6E=;
        b=WKa8C61agNBwOOzsDH2NcNsz0Cp6kHFM15HcgAeqcmVGbpdq0U42IytZ/s+GZE2QCG
         WSKwgWXFcZPXruJkVDcXeaNOuuV1SCHGRQufoL0e6L1G93z+u4LTgDKYAl/yOzw/yltW
         /4pz/sdSJuhoZumkuAfJb/tPmra8Mgy5dnG6rJZqMWKdGWp+TJI3ROeV7i7RioB6QKtW
         jN7o66vPY6IZMt/HIZ8cL3Mr/8pYqp4CLV6odDWkyaBBNAlvxE0i2RlvmsWeIyQDP7cY
         ABvazn4niDAxKeIAtOvFSGHZ8yRD3XsKSNUDwta2R6m1QjOiyR1BOPK7xbfyfUnsmwyF
         LJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777069369; x=1777674169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMUOlRheR2ZvpjpoFSAfZ9e9X+cDeCX6/i1HLTycI6E=;
        b=XUG0kbd9UNEH3VahUCMY3srAGFo0cT/AA40nbsglBWnxg+dJbkJ471C/+xmQTyTTDD
         n8X3e8x5jrCReCyNMaiWk8wQap7F06b3vSMglsUz86p71VbVmVrIkZ+AANBh7iOU335l
         l+0Tb/kv4sWzNjCXqYipp+yfebZiN5CXROT4xoUjz5dLNzHs2ugl0ZLqB7hTauKdo8kJ
         xVYwb31p33m0YdL3fkEmfvVjXZh4e7KIIezScfcs/dUoXKtZ2I2EfTgwddtXacV37MfA
         WE0vQHlD9pSf8hE02iCykfSVFx8dkxgglm0uClK+lNGWbfg0w76uJJn1tQh38mWKW5QN
         15pw==
X-Gm-Message-State: AOJu0YwmInIKJDFH0IRjYRWGkIsMdHtxu9nS+MVaZLw8sUzk/qSdKaka
	YAUaEebEpycBeeZofZAAaTsNJZ93M7svH4bufEiW4W7AC+20wAzC/Sqy
X-Gm-Gg: AeBDiesjDD8GK0ewzkc5P+sq7F/z9MTmeJxBFzqEApnjsy8exbpjPzXv1jR1aXReohO
	df2gLHl7Sd3BxQVcNy2I3d9uNnORM5Df7MTq1uKHFpyvgCBVWQAi2AEtvdVqKRDOGczGqU8CChj
	dPEj1ybEVt8YpjLYPj4AgFAqSjverii/IzgMIlhugx1Z1OFasbhKujVDrNiWpAuyTlxdccsK8M+
	DPjMVzaK8qA9tWTSr8KlftO2WGxZk/GPvgifkuEdW2mvh2JnOpXmso77R2MKnBZrrSm9enmQYgi
	N88prPKSlCiARoVpZbhjCah1Xrf1xZqtNPc1HyNRZqvmr2pZzlNP+ydtbc1/9+iOIL9thJSOn6p
	Hr6yxCGELK6lxkfw4sfJivWnD+wwJpNbWgXTA5+YbkScuDqjerNvC5VNA8boRn1XJh/J0kqYx0o
	rvHDzmEIROZHUZWas0qDi2//+8NBSCXBfmlsxF43DnVrxeHrJ0HWp2NX5ALJq1xMFD2Dcz
X-Received: by 2002:a05:6820:4b91:b0:694:9bfe:950b with SMTP id 006d021491bc7-6949bfe9fa8mr8206752eaf.26.1777069368574;
        Fri, 24 Apr 2026 15:22:48 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42c16b64a83sm14370514fac.18.2026.04.24.15.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 15:22:48 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: sim: Replace sprintf() with sysfs_emit()
Date: Fri, 24 Apr 2026 17:22:47 -0500
Message-ID: <20260424222247.37295-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 51B14463CA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35519-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Replace sprintf() function calls with sysfs_emit() in the configfs show
callbacks. This will help harden the driver and will bring the driver
up-to-date with more modern functions.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/gpio/gpio-sim.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 13b87c8e6d0c..f1059f1dc25c 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -697,9 +697,9 @@ static ssize_t gpio_sim_device_config_dev_name_show(struct config_item *item,
 
 	pdev = dev->probe_data.pdev;
 	if (pdev)
-		return sprintf(page, "%s\n", dev_name(&pdev->dev));
+		return sysfs_emit(page, "%s\n", dev_name(&pdev->dev));
 
-	return sprintf(page, "gpio-sim.%d\n", dev->id);
+	return sysfs_emit(page, "gpio-sim.%d\n", dev->id);
 }
 
 CONFIGFS_ATTR_RO(gpio_sim_device_config_, dev_name);
@@ -713,7 +713,7 @@ gpio_sim_device_config_live_show(struct config_item *item, char *page)
 	scoped_guard(mutex, &dev->lock)
 		live = gpio_sim_device_is_live(dev);
 
-	return sprintf(page, "%c\n", live ? '1' : '0');
+	return sysfs_emit(page, "%c\n", live ? '1' : '0');
 }
 
 static unsigned int gpio_sim_get_line_names_size(struct gpio_sim_bank *bank)
@@ -1094,7 +1094,7 @@ static int gpio_sim_emit_chip_name(struct device *dev, void *data)
 		return 0;
 
 	if (device_match_fwnode(dev, ctx->swnode))
-		return sprintf(ctx->page, "%s\n", dev_name(dev));
+		return sysfs_emit(ctx->page, "%s\n", dev_name(dev));
 
 	return 0;
 }
@@ -1112,7 +1112,7 @@ static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
 		return device_for_each_child(&dev->probe_data.pdev->dev, &ctx,
 					     gpio_sim_emit_chip_name);
 
-	return sprintf(page, "none\n");
+	return sysfs_emit(page, "none\n");
 }
 
 CONFIGFS_ATTR_RO(gpio_sim_bank_config_, chip_name);
@@ -1125,7 +1125,7 @@ gpio_sim_bank_config_label_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%s\n", bank->label ?: "");
+	return sysfs_emit(page, "%s\n", bank->label ?: "");
 }
 
 static ssize_t gpio_sim_bank_config_label_store(struct config_item *item,
@@ -1160,7 +1160,7 @@ gpio_sim_bank_config_num_lines_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%u\n", bank->num_lines);
+	return sysfs_emit(page, "%u\n", bank->num_lines);
 }
 
 static ssize_t
@@ -1206,7 +1206,7 @@ gpio_sim_line_config_name_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%s\n", line->name ?: "");
+	return sysfs_emit(page, "%s\n", line->name ?: "");
 }
 
 static ssize_t gpio_sim_line_config_name_store(struct config_item *item,
@@ -1241,7 +1241,7 @@ gpio_sim_line_config_valid_show(struct config_item *item, char *page)
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%c\n", line->valid ? '1' : '0');
+	return sysfs_emit(page, "%c\n", line->valid ? '1' : '0');
 }
 
 static ssize_t gpio_sim_line_config_valid_store(struct config_item *item,
@@ -1279,7 +1279,7 @@ static ssize_t gpio_sim_hog_config_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	return sprintf(page, "%s\n", hog->name ?: "");
+	return sysfs_emit(page, "%s\n", hog->name ?: "");
 }
 
 static ssize_t gpio_sim_hog_config_name_store(struct config_item *item,
@@ -1333,7 +1333,7 @@ static ssize_t gpio_sim_hog_config_direction_show(struct config_item *item,
 		return -EINVAL;
 	}
 
-	return sprintf(page, "%s\n", repr);
+	return sysfs_emit(page, "%s\n", repr);
 }
 
 static ssize_t
-- 
2.53.0


