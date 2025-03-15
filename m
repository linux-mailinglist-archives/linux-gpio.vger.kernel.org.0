Return-Path: <linux-gpio+bounces-17648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02598A63026
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 17:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E13DD189A5CD
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 16:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B40204F77;
	Sat, 15 Mar 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="C1d++y8x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4221F8AE5
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742056907; cv=none; b=HdMFUOhCjkPoC0C98qGWofScpS9RQuEgf4Vjzb+sg+hYHVkYL8iWTdpBw2w1+b+Sl6KMUoI0+PNQGLPB8MQbCfLhRtmztru6r8we/4SJAXhslat86OHuu4dKhIfPe+Hw5bxsJYXgdjg+oK3eGEg8mBS78YEsukZDFXzU3TB2/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742056907; c=relaxed/simple;
	bh=CXXjPitrP+xrfPteKcdz/uPauSvRoyrwwz62x5UXz7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5fgXjwT0kBcMGyIFhkyvGQfXTzbOZZUzD+Ri9aG/din/lOfOiX0mlWdJQQgPqHJz4CayYFYse8Qu5Ak7RIvbZ+Mb7eA9BCyZ8mmWVI6vmJm6guvrvDmNXHxLR2YzHTPXYQggrdlNK/y7PdglIwo9FZKoORupcn8MXyx2BVszpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=C1d++y8x; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DF5DB3F1D1
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742056896;
	bh=82ap22DORRQTX0OBb3Kwtetq95gagD3gpR37XzEzCWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=C1d++y8xYuzqtG3dmg6DHfkvzzU5/UNk85/ziwz48apEufe6rMFvG8RoAsA7zK1b8
	 L/6tSTwfgaDXyL6WZZcIzEeWHqS8tyMBwkLgZJbv761bezZIkt9nSMPKDOjGIUVT8A
	 gXCqPw4BI17UKYrfXcFg1oVLe49yvjDnADJg70wycdL/QJlB/9dFgZxE01Be4JwyTf
	 rdpP6odaBe68v84eIM8O+RC9/wowzLphiL0S32fajifttpBiz3Onetc1W/ZmnWDsIH
	 +zAVwRrMRb2Au6Z5aeFYrWGk5e2uguRNWKd+QH9FddXNeu62sBEF61IFEKBGeMGbiv
	 dJJeASBpNzf3Q==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff68033070so975409a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 09:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742056895; x=1742661695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82ap22DORRQTX0OBb3Kwtetq95gagD3gpR37XzEzCWM=;
        b=ngSto+jTVGv5NUi3Ax0pA0kuPwzRHZIF5XS22u7iFrCk82dFZEQHsV/qypCSl5ztOg
         8vSUNOggsfs4S6B/xh5UVGK6MGuP2nfO3SgK9W+CjFpDJ2LY2CEQ+HEX1erfMShVEZg4
         ggA8pNACOT+GejBGTMHe0w4zM/yg599uGe4Ex4FqtKK8sw8XEReXNtqz6XxNWwZOv1W3
         kw5bwMd85hEBJsbOcxwzkIDX7n0l7jGKq86ALO9fuNr+slm5yw2N8JfvUNNX/lLSiRkA
         9LyfZlw5VrKd1rDFgksVz3BTDtD32Ika8uE+Qai6qLueSx7fSoWBeL6QSiJJ1GAhVvWK
         JJog==
X-Gm-Message-State: AOJu0Yzizs+sZ3gjOZpJ0tEGgEi2JAQOZGYtQKwdTv+wopn17d9cTtJm
	IAtBMIRB0LcM7XBAjkJV6ZfNl/Mm2rtdaBbP+0V5q1/iahjyJ85Wl3p6zwQX9UNon0itNP7vOP+
	5I8xIviI9jwzJLHU8GXbcX17iG8r7RaXfae3aISw3LncDT/1LlV+J/NQvdRaGOyDiMVjuYojq8I
	QIDnlZXvI=
X-Gm-Gg: ASbGncvgTY4yYSVz5s3Yr3r1nQwZD+nTSNEChyu19R1aOFFiQ9MZ8VTcWvPklkVDVhi
	uRFTDyCc4govk+PNR/2qrMq0jzPDhN281oLN3Ht/jwdcib8XSoHoZMtCeZYKJihKBZnzOhckfpp
	IJgU7xT5ft9lTV9CPqfSzXSQzjXFwTH9w4MBspUXQPZqZgMLdfbfE75ud87d7eJRMbbpPbFoChF
	LVcG6MqphwHq6Bf07hin1ct/BVGNXyouzzlFVsWmjleX9qSQYTEsiibuLdZBptezfLjQJsi7uHT
	XSXqiNvdYxHnkmwD
X-Received: by 2002:a05:6a00:18a3:b0:736:57cb:f2aa with SMTP id d2e1a72fcca58-737223b756dmr6781979b3a.13.1742056895272;
        Sat, 15 Mar 2025 09:41:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXPeNwzj5+JJOIIiToGLUpE6fZd83ok5TeonsA3qTr3u41t5dDANyAsspOj3sjMjW2QSIZ6A==
X-Received: by 2002:a05:6a00:18a3:b0:736:57cb:f2aa with SMTP id d2e1a72fcca58-737223b756dmr6781960b3a.13.1742056894873;
        Sat, 15 Mar 2025 09:41:34 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:83e6:3590:3498:db44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155e3a9sm4637104b3a.71.2025.03.15.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 09:41:34 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/9] gpio: aggregator: protect driver attr handlers against module unload
Date: Sun, 16 Mar 2025 01:41:15 +0900
Message-ID: <20250315164123.1855142-2-koichiro.den@canonical.com>
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

Both new_device_store and delete_device_store touch module global
resources (e.g. gpio_aggregator_lock). To prevent race conditions with
module unload, a reference needs to be held.

Add try_module_get() in these handlers.

For new_device_store, this eliminates what appears to be the most dangerous
scenario: if an id is allocated from gpio_aggregator_idr but
platform_device_register has not yet been called or completed, a concurrent
module unload could fail to unregister/delete the device, leaving behind a
dangling platform device/GPIO forwarder. This can result in various issues.
The following simple reproducer demonstrates these problems:

  #!/bin/bash
  while :; do
    # note: whether 'gpiochip0 0' exists or not does not matter.
    echo 'gpiochip0 0' > /sys/bus/platform/drivers/gpio-aggregator/new_device
  done &
  while :; do
    modprobe gpio-aggregator
    modprobe -r gpio-aggregator
  done &
  wait

  Starting with the following warning, several kinds of warnings will appear
  and the system may become unstable:

  ------------[ cut here ]------------
  list_del corruption, ffff888103e2e980->next is LIST_POISON1 (dead000000000100)
  WARNING: CPU: 1 PID: 1327 at lib/list_debug.c:56 __list_del_entry_valid_or_report+0xa3/0x120
  [...]
  RIP: 0010:__list_del_entry_valid_or_report+0xa3/0x120
  [...]
  Call Trace:
   <TASK>
   ? __list_del_entry_valid_or_report+0xa3/0x120
   ? __warn.cold+0x93/0xf2
   ? __list_del_entry_valid_or_report+0xa3/0x120
   ? report_bug+0xe6/0x170
   ? __irq_work_queue_local+0x39/0xe0
   ? handle_bug+0x58/0x90
   ? exc_invalid_op+0x13/0x60
   ? asm_exc_invalid_op+0x16/0x20
   ? __list_del_entry_valid_or_report+0xa3/0x120
   gpiod_remove_lookup_table+0x22/0x60
   new_device_store+0x315/0x350 [gpio_aggregator]
   kernfs_fop_write_iter+0x137/0x1f0
   vfs_write+0x262/0x430
   ksys_write+0x60/0xd0
   do_syscall_64+0x6c/0x180
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   [...]
   </TASK>
  ---[ end trace 0000000000000000 ]---

Fixes: 828546e24280 ("gpio: Add GPIO Aggregator")
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index e799599a06a1..d232ea865356 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -119,10 +119,15 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	struct platform_device *pdev;
 	int res, id;
 
+	if (!try_module_get(THIS_MODULE))
+		return -ENOENT;
+
 	/* kernfs guarantees string termination, so count + 1 is safe */
 	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
-	if (!aggr)
-		return -ENOMEM;
+	if (!aggr) {
+		res = -ENOMEM;
+		goto put_module;
+	}
 
 	memcpy(aggr->args, buf, count + 1);
 
@@ -161,6 +166,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	}
 
 	aggr->pdev = pdev;
+	module_put(THIS_MODULE);
 	return count;
 
 remove_table:
@@ -175,6 +181,8 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	kfree(aggr->lookups);
 free_ga:
 	kfree(aggr);
+put_module:
+	module_put(THIS_MODULE);
 	return res;
 }
 
@@ -203,13 +211,19 @@ static ssize_t delete_device_store(struct device_driver *driver,
 	if (error)
 		return error;
 
+	if (!try_module_get(THIS_MODULE))
+		return -ENOENT;
+
 	mutex_lock(&gpio_aggregator_lock);
 	aggr = idr_remove(&gpio_aggregator_idr, id);
 	mutex_unlock(&gpio_aggregator_lock);
-	if (!aggr)
+	if (!aggr) {
+		module_put(THIS_MODULE);
 		return -ENOENT;
+	}
 
 	gpio_aggregator_free(aggr);
+	module_put(THIS_MODULE);
 	return count;
 }
 static DRIVER_ATTR_WO(delete_device);
-- 
2.45.2


