Return-Path: <linux-gpio+bounces-14185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E539FB9BD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 07:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4435C188540D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 06:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A28617B50F;
	Tue, 24 Dec 2024 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="p/uTPPVv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8AD15575C
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020905; cv=none; b=UArTzWy+gkF1ztmLMA8OWSzFkZT05upO0+hynMX8WGvlGXQIfPms2JJAL03nakiLwED/xlfyZfAgC/NX+2DabY5xz3BY04AAQf4TAHl1SRawFJeXq0kASPP/9tfBKN6xxDFvI9u1o/5q1GMK0vbYNtGysb4WSDH1JUgOl+mBnpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020905; c=relaxed/simple;
	bh=cMvDG0BueSdf+zIzu9X8jCotHQSn0EUGYP+uv29jHzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JgaWfLn1zWhrIc0zZ7n9P+QVKswfkMAdUZAmHanKFxuurqlHuSfYyCH2jd0dvhpCgBq80cV6Fat263H96EXFtbI+iSHbj7Eox1dqZz25DFptZUN7tPpA4hB66gP3ygsPZnQlLtwaxpKU47Ekfp5fW4YiN+aNU9wOXrVOKtnxWPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=p/uTPPVv; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 828F33FA4F
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735020513;
	bh=bvUHNb8XemzT0n3pS2sxj6xTXk/hDt3GgdHjNnvpT8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=p/uTPPVvYPYo6XRC16m2ZeXxECkusBA0KzGt3s3SwXkC9pHKA724T8lSaaimErdem
	 Epkk3zoJwb71o2hicGuXOwMatorkPsI2RoQN09GL0/L4AoWxwLbqbW9VLRotVdnKOj
	 es8YzHqcNzQjhLRXSjf5jOThYN6aVxWyUpi9ZjE60l8myIVjXRfZgFo+QiR44G6YxI
	 jJ5vmN7JtIaF36PmrWRe+5VyHhcmGbhI/bXN3VUocs5vnTHmihGvmUJWrUx/IjU5pL
	 UnDfHJinJ767G4EnmIvReM4bKsjAy88GzUW2LPEmJaCcMUtUye68iSCtkIXwpXl0sg
	 +ySPO9XsoLQNA==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21681a2c0d5so41317385ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2024 22:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735020512; x=1735625312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvUHNb8XemzT0n3pS2sxj6xTXk/hDt3GgdHjNnvpT8o=;
        b=n+jhKNneHS7T/d1yObEOOSTN/0Gu0NKxFbKLmV9wPCDcvSwmpy39i7GVsHc2c4mVwK
         6jEx2CdFGJJxrPRfx0kiIjKRepj6hVvoiKF2KNL64Eb6XG0jg0TcVgbMO+eagGLiDYyD
         t7KYh5AGiPyUroS9xwhIcfvrBmVd87EMDGhNRawTJNMzqlKk7gZ9+85A3zelZPqolPGV
         9y0KHIMpwTd+XDlrxHPF/fvUk45j/VDLbpaVGLLQTefrG4EHf3cXbtx1Ep8vf1jBtyBo
         q1mq1XnVJUxwsDTgKGA6fSo/sfmV1Q21k3nUDxXNaslrMAllUB9h92KDzvKpyaPimZ6W
         0EhA==
X-Gm-Message-State: AOJu0YwQRMhAUxN9kw4mgPLJwjXejCs138bnmtjvWudKFx/sG0hTOIvi
	KFHSfIJS52x781reuvj4IGdG7UrEsf8ahEoHG6zBfvm0lkImjbLVeLWNddVRxPa52bhEt4tGzPZ
	hUGsXvvBtpE2CypMvjRYJYCsSq4aAvm4W0NZMtEv2W9hD6gmsZeMfvckTKlLwLECEcxALFA87UE
	8R2d6ZvhY=
X-Gm-Gg: ASbGnctrqcfVghzmwZyKcgYOLkbN3iKNKorb0ONzhXtrnKLPvDH1GhMmhw7H8Io+dQP
	lSGnsrllGxYC9ratGfVfjcu9k4LyCdzQ0OibPalpFWu4nKqXv7RUNo9f/CMEMcP4GudheRCm1Ih
	NEmnw5GW05BuARl+eLdFq8Y7Ig9E6inn1CbmMU+xQLW14Wnl+34MUrTbB5F/u9qm1jk8qC/btH9
	/nko36hGCJK6Sd1iT++8o1OHzXwcYHGZEnt4jCKQN/jn3rKiOrnTNwp6A==
X-Received: by 2002:a17:902:dac6:b0:216:59d4:40e7 with SMTP id d9443c01a7336-219e6f25e08mr151410365ad.55.1735020512088;
        Mon, 23 Dec 2024 22:08:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOAv7tCbuJma5e2bZ7olmLZeIwdxAhJgDLtIE55BW4oJwBp6hpQcck5nq7sQNTozUTn6LFfw==
X-Received: by 2002:a17:902:dac6:b0:216:59d4:40e7 with SMTP id d9443c01a7336-219e6f25e08mr151410225ad.55.1735020511776;
        Mon, 23 Dec 2024 22:08:31 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:7315:8eec:aecb:29a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02a8csm82262235ad.269.2024.12.23.22.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:08:31 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] gpio: virtuser: lock up configfs that an instantiated device depends on
Date: Tue, 24 Dec 2024 15:08:18 +0900
Message-ID: <20241224060819.1492472-4-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241224060819.1492472-1-koichiro.den@canonical.com>
References: <20241224060819.1492472-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once a virtuser device is instantiated and actively used, allowing rmdir
for its configfs serves no purpose and can be confusing. Userspace
interacts with the virtual consumer at arbitrary times, meaning it
depends on its existance.

Make the subsystem itself depend on the configfs entry for a virtuser
device while it is in active use.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-virtuser.c | 49 ++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index c9700c1e4126..45b8f192f860 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1533,6 +1533,32 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
 	kfree(dev->lookup_table);
 }
 
+static void
+gpio_virtuser_device_lockup_configfs(struct gpio_virtuser_device *dev, bool lock)
+{
+	struct gpio_virtuser_lookup_entry *entry;
+	struct gpio_virtuser_lookup *lookup;
+	struct configfs_subsystem *subsys;
+
+	subsys = dev->group.cg_subsys;
+
+	/*
+	 * The device only needs to depend on leaf lookup entries. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	list_for_each_entry(lookup, &dev->lookup_list, siblings) {
+		list_for_each_entry(entry, &lookup->entry_list, siblings) {
+			if (lock)
+				WARN_ON(configfs_depend_item_unlocked(
+						subsys, &entry->group.cg_item));
+			else
+				configfs_undepend_item_unlocked(
+						&entry->group.cg_item);
+		}
+	}
+}
+
 static ssize_t
 gpio_virtuser_device_config_live_store(struct config_item *item,
 				       const char *page, size_t count)
@@ -1545,15 +1571,24 @@ gpio_virtuser_device_config_live_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	guard(mutex)(&dev->lock);
+	if (live)
+		gpio_virtuser_device_lockup_configfs(dev, true);
 
-	if (live == gpio_virtuser_device_is_live(dev))
-		return -EPERM;
+	scoped_guard(mutex, &dev->lock) {
+		if (live == gpio_virtuser_device_is_live(dev))
+			ret = -EPERM;
+		else if (live)
+			ret = gpio_virtuser_device_activate(dev);
+		else
+			gpio_virtuser_device_deactivate(dev);
+	}
 
-	if (live)
-		ret = gpio_virtuser_device_activate(dev);
-	else
-		gpio_virtuser_device_deactivate(dev);
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		gpio_virtuser_device_lockup_configfs(dev, false);
 
 	return ret ?: count;
 }
-- 
2.43.0


