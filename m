Return-Path: <linux-gpio+bounces-16071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C84A37447
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A81F13A5D31
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 12:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82681917D9;
	Sun, 16 Feb 2025 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="L08MBtwB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61918FC80
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710718; cv=none; b=HAuaJR0Mr3prVnGqLc0PgwlE5sWAUM/O4hfXjs7mSwyE6qiJlsHZ8ouYCuhK5LkOuTkRuJpW8p4uB5H0rTuR+uJ5o7E+CFi4Vkyf+hskKYPHSbwK9QMXzwWH0Io+x/fxRfwLaCsdAAJ0WD6dLuSIQuOSX9YCd/vORarzzMMmpZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710718; c=relaxed/simple;
	bh=SKtk5LGExLk6bdAki5p/BEUv1i+8IBo24wWDS1BWA5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNt1oTSw8lHSqazqNjor4EK8AF7XwJzK1GoOIkibgDPLJW/G7fJAppfRlNlVIe//ayp6YIHOlKHREG2VCgiB0GRahvNP8DjJo523dNY9wBf3nO9uMd/CKKePdfbT6LXPsLLadJjkg6IQaqqWqiROwCYG2PSL18Yr9CTNGo5eGD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=L08MBtwB; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5F2E53F2F0
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710714;
	bh=9/5pkxra7VYfBLz3YJTkR4kouC63TcrGmJ2E28pjOC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=L08MBtwBcUL3xaLBOyN8182ozxsWUPBr338mZ/wJWdgDbgetbpkMdzx6OzyOVxY1E
	 c/6cqrAy+DBUNOrCjBuEVrJ8gju2Iu43DOnQuleiI87TtBjXkNEQj5LwlhDvucrhjB
	 xqTR1DVO6cfwLaxwmh4Db4HSMxSPwruqld064KnbOhaEVpr4MHamVWsINxSy7h3cbe
	 O8c/D31vu8n6VIHuXt/TaQPHXBQYKRLXGOkrsCpYXm27P35QEtKWVLFQ4h1WTLRjmQ
	 RyiuLEwVlNMPvWBUult560/nRgDPHoBW7eR+8Vt1qYI64Muo39rwZ6WWgCQY9wn4Zj
	 mbD3+nGp1F6Wg==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc0bc05b36so11499714a91.3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710712; x=1740315512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/5pkxra7VYfBLz3YJTkR4kouC63TcrGmJ2E28pjOC0=;
        b=EETNYmArOCRxiF7dAPGUZMABGoDBRGmrJmfsDiEz+ZO7rjibJOJdL0fNEMRrxSctzd
         ch5ceDdUoc1jaxrnbiW4LtAdnjmKK16GhCtJXcc7UKREZ9AoE2cHsNrjjFvzWgDQj/bC
         sP7+f8ENc8cCx8ndvR6xeLUqzgC+MjbfhsQTBRy1Bk4v1bYxJ/iIdpJTRPRg3Fp7yyZY
         i1ASJAFUcAf3zAw7J++g0S3h93BFsVg6MQJXMIgiZlb2HdnAQQZkeKMsxeFgJSoqV37M
         keuZcqdpourh2Xh3A54A9xSP1IiLOEu/Q/DSIaeJeejsK+yZlXKeWMlFMNpkh6BYGa0u
         LNRg==
X-Gm-Message-State: AOJu0YyO0M7CUcyz2dkXKtPbBRHEGL0qtZnFwIs50rybvXVoenCJbCNP
	2mpXQeFRKrwFST3+VwzHwon1NWsjJ4wIVeQ7sLw62L671r5WsrBy97HcdaxI2qNrT1FNnEHiMjr
	bsv5ut43sV5ma92gTH9U1ijpEEVouzBI0iloNrvb8H+8Cd9OodAaQCD2QSQR5YUgDE5eoey6t3D
	TRSrYzAa0=
X-Gm-Gg: ASbGncuK9BPuUwB4+ScvlE7HUBJMC5TQDBePjFx3gyZO4B+3iMbtf6lSUwTiVR7432m
	5LfwDJSyfWCsKWplYRuq2K42VWr14/HJjpxqhPIx3KPdKb+ouZ4xBVMUEQ86h4c1jYsC/t38Sxv
	P+2aXSr1xqVnIDfxYxsHXm1n8YPzgz+QikJ0aAmOL0jmOEsk3wTBHFnNJDbuAjLBUaE0mrO1QdE
	66HjIZoBezZBiidkrXOx5wGZkuAgayWp3nuju3d22vmq78I8OUPXQRD2ghv86olAcEljwq2T3MP
	yP5lZw==
X-Received: by 2002:a05:6a20:258b:b0:1ee:668f:4232 with SMTP id adf61e73a8af0-1ee8cbe8181mr9301438637.29.1739710712634;
        Sun, 16 Feb 2025 04:58:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpMqivvwPm0hDtcmUrV8dkJTDpemIr76dzIdEexUvHzP0VmV3hCHaiULKqPm03NeL8sl5Ygw==
X-Received: by 2002:a05:6a20:258b:b0:1ee:668f:4232 with SMTP id adf61e73a8af0-1ee8cbe8181mr9301416637.29.1739710712225;
        Sun, 16 Feb 2025 04:58:32 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:58:31 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] gpio: aggregator: protect driver attr handlers against module unload
Date: Sun, 16 Feb 2025 21:58:05 +0900
Message-ID: <20250216125816.14430-3-koichiro.den@canonical.com>
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
index 570cd1ff8cc2..893cd56de867 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -446,10 +446,15 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
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
 
@@ -488,6 +493,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	}
 
 	aggr->pdev = pdev;
+	module_put(THIS_MODULE);
 	return count;
 
 remove_table:
@@ -502,6 +508,8 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	kfree(aggr->lookups);
 free_ga:
 	kfree(aggr);
+put_module:
+	module_put(THIS_MODULE);
 	return res;
 }
 
@@ -530,13 +538,19 @@ static ssize_t delete_device_store(struct device_driver *driver,
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


