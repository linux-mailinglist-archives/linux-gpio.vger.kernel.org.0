Return-Path: <linux-gpio+bounces-16077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E836A37451
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 14:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8024A3AF69E
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 12:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDB019ABBB;
	Sun, 16 Feb 2025 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="W7vVdxDZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05AD1922E0
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710730; cv=none; b=DODeusIj98qRHn9AcmoPcohvwqg0Ly9yxSo768gODTB/nOKKxm5KmzCSILm0w/L5VxyoLbCuwYupthz3kt18biHKa57ypuBd9oNgP3BV5m0hWLONLlavFuMXqrkaNjb0MSl4SNN0iJeZxLXorw8h9CpJHdzzhJalOjw7YhYr4iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710730; c=relaxed/simple;
	bh=gaGxbWoVq59TTDiq4cJd0eCsgnEJQWKB3/3FfvlvZ5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZgBLXcxlVOqteZwcsz+5CzkgwCQxBxZU1Kn3FfYCUrRnNrOOfz5ImxoQYcLXAOke4Bwbecg0F1VU9hzf+zeMNBqtJLihIWvPtDpKx1ugR9BQoqt8Xm/C77O6B4NF9kb2zaPuxRoKh0f0nOcPmoLtN+xgjo/2Cj77mGfiscDypok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=W7vVdxDZ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2B99E3F2BC
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710727;
	bh=iZPn8FzJi1wBDhT5MKcLY0VoABjKA3JgOf2KFRB4x/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=W7vVdxDZzg/3v+FEy3Aa24IGgiaSYe96RCAxPe4+lWq2Dn8JDWsnxU8HZzHEbkfZ+
	 YzZS7qkWolJcA+AmXqn2qQQG1SyesQUYPTUqxQLN6IH32UGyTk18camn+b3/eHmne3
	 627rKwKiN5EwY9R1yK0FjzIINFArH6KCNM1l86ASxeojcGjYDt1Qsj2XOFcJfYGjAx
	 JQUca3a0WNcc7xnYriAVbbvx6smhOt38de3xis+MVEbPF0WvcJI4uTqZPjmbJ2tO6L
	 yTY/yK/LiE59ILn52B2o4RkwXF/uOUfb2lCd2mPSkactOYrGDqttVfDxs+YW2Xyic1
	 92BXRcZPmweSw==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso11518800a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710724; x=1740315524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZPn8FzJi1wBDhT5MKcLY0VoABjKA3JgOf2KFRB4x/o=;
        b=hXvZjn/nhroJoNjkTDb8y8R90rgSsQXtP2Xqeh76QgxXtWypcqIPayi4wEx6fSMd3V
         gIT+fNUSndRLJFJAKlC0Juy85R3kSYNJQTICOCpZP63nicoOMS07oFVYZoF100uWIUKQ
         OQLPWHusttmwI9pDxdzCp51AhZ6KJbdn8gT9chVULeyIhU4ec9m1jF7xSOKyFqa6IcfM
         bo0AjXUgAPi2yGJLgBovsoy7Bd1Ggh3Rc/0AYDI+28MbJs4gMWVM/TFNhm952fR6Whir
         8+3e/+Jg7sAWWugMxvm1ig+WnaOAw/HL9w2mKsebCa44NaM9TJy4hU9V9WqwaLNjtRn6
         hgPg==
X-Gm-Message-State: AOJu0YzBilF5dAPMbGpVl35v+uEGQEz1Lnruog/sMNyz4z7tQb8gKwCa
	wUkBkGZH0Phu23GhdNym7ceWtANoRrfCKcaf4EMbhCT0/ENl7MGuEZ6RGO5Hm4HvGWZMDsPyUF9
	OTKopa1UzytT1rzzz3FA4XovOQJ6XJKsXzMRe38xrMwYHoDfnbQEM1zGFDwcg8cDNBXisy99aPy
	0a6Jw4UVs=
X-Gm-Gg: ASbGnctwyfAwzTYdPYOABrMgS3qn/laGmUXWpr4uuk2vmX+enHkrQvzBXwA/6xGEz6Q
	cxfnh2D+flLathsvceIffG+qRAxKeyyHf552Ep178n6bhT+k1uLTcYJc1NHdOEVeCeg26aoOCz7
	C7ttA9ox3dvll5im3HSQb3S9AouKgGR/nDXeJGr9e84AShb7X3eY0OPbQu3XfRN+8u7m74pi1OS
	VUJiEhryo6Cj4T8QI3h37qPWsyrjQZJsstDsj+nWdV143k1ggb/5bBrQSjxK1if7H6+C2gzbTzM
	SdEnbg==
X-Received: by 2002:a05:6a21:4014:b0:1e4:8fdd:8c77 with SMTP id adf61e73a8af0-1ee8caab5bcmr12234120637.8.1739710724265;
        Sun, 16 Feb 2025 04:58:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfRPYv58J7W+79MK/Q30Fi4lENg4yHxG8EDlpAXCIOHoz6Soxw8W0XJQto3mMp1Ii5Vz+npw==
X-Received: by 2002:a05:6a21:4014:b0:1e4:8fdd:8c77 with SMTP id adf61e73a8af0-1ee8caab5bcmr12234095637.8.1739710724000;
        Sun, 16 Feb 2025 04:58:44 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:58:43 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/13] gpio: aggregator: convert to use gpio-pseudo utilities
Date: Sun, 16 Feb 2025 21:58:09 +0900
Message-ID: <20250216125816.14430-7-koichiro.den@canonical.com>
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

Update gpio-aggregator to use the new gpio-pseudo helper functions.

Note that the current sysfs interface for gpio-aggregator does not wait
for probe completion when creating a platform device. This change brings
no immediate benefit but prepares for a later commit introducing
configfs that shares this mechanism.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig           | 1 +
 drivers/gpio/gpio-aggregator.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d8fede07149f..8b9ffe17426e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1871,6 +1871,7 @@ menu "Virtual GPIO drivers"
 
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
+	select GPIO_PSEUDO
 	help
 	  Say yes here to enable the GPIO Aggregator, which provides a way to
 	  aggregate existing GPIO lines into a new virtual GPIO chip.
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 893cd56de867..b24ed963cd9a 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -27,6 +27,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 
+#include "gpio-pseudo.h"
+
 #define AGGREGATOR_MAX_GPIOS 512
 
 /*
@@ -34,8 +36,8 @@
  */
 
 struct gpio_aggregator {
+	struct pseudo_gpio_common common;
 	struct gpiod_lookup_table *lookups;
-	struct platform_device *pdev;
 	char args[];
 };
 
@@ -492,7 +494,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 		goto remove_table;
 	}
 
-	aggr->pdev = pdev;
+	aggr->common.pdev = pdev;
 	module_put(THIS_MODULE);
 	return count;
 
@@ -517,7 +519,7 @@ static DRIVER_ATTR_WO(new_device);
 
 static void gpio_aggregator_free(struct gpio_aggregator *aggr)
 {
-	platform_device_unregister(aggr->pdev);
+	platform_device_unregister(aggr->common.pdev);
 	gpiod_remove_lookup_table(aggr->lookups);
 	kfree(aggr->lookups->dev_id);
 	kfree(aggr->lookups);
-- 
2.45.2


