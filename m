Return-Path: <linux-gpio+bounces-16147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C801A386B8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1403B281C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EAC2236F0;
	Mon, 17 Feb 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="MV+UwdEA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8EF223302
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802966; cv=none; b=WntoKD6FYtaRjuoz/7tpE1Y2rOiaJtAWB3fMsR0jJDrJALJpCRcFS+KBKEQGvzFGj5BGXO7MCoC87pC2mV7+gW1MpoMt+Kv+jMIjczYAPHtEayTrYeJ4ubXhIm+Y9/blYKSSDlmVceU4Se0Dehdhfq96FiN4idmZi6TJPrD+G64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802966; c=relaxed/simple;
	bh=d0seFRCbsm6obDyggndTpMQD/bofnkskpXmGDrRtX50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox0+iu8eGHlEhhahdWIQG9LoBWQDWIDt4MXbjn1f16oQdk8p4/khuxgPs9xy1ETevJ4ogB8id5jn89MBr93eoF09Pquheb6ag0pS5g/mu9mli1afQMq0vC03zpJOoACwOTHS2BulmF3LykDLs36KerSehAB2arj4oVFYPy19On4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=MV+UwdEA; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 558613FA53
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802962;
	bh=DFCOc2ChWOWoHT2jvhggwm0YHMFaUQk1iMuzmg5CkXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=MV+UwdEAiO67a51qlUkN7QYMJgyHKuzChZWAdhkEYM6yVLyGiqI5dEbB48M2rinLV
	 /57QSdCJ6VKHwT/PPESt0XcLeUMdlFUWekRQViKsc6zwO7bECwaXflCfu6aQYk/PUa
	 wcvgZ91ax2CjxBmjqnYAg+tqSs1QnGRH1JeMos9OAwL0RJA9BzqRA8jmr4ju6cA8/D
	 HkmdNnhrEQDT9Uju5eo5mtfpnz5Tey+zRZoUmfgDLE3IkCHfN13ZM/binJqusT2RKw
	 80ZXzXOktE7CVQHYEmVGwHLkP0nTOkJh9iTpqgpyrVXWp1/PmPVGdmNJXsPJGJXW4s
	 vb/o8laqICLYw==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc1a4c14d4so8208125a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802961; x=1740407761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFCOc2ChWOWoHT2jvhggwm0YHMFaUQk1iMuzmg5CkXY=;
        b=U/amCvVNJEPUAaZRpeU0TuWIvHzodnQ0dR1fGdXGM3otUifC6tZUAu/VKLXzd0Lpo7
         1GQB4IsVe2D+eew+yVzP2H4u9I1a6qPMMoYiRGxOSvMkF9kcxAlzjt112LBZIFlX38ug
         yBhYG4TUIlePoow5m55uE7vI4oPct81PQiyjn6ktGFNSdAeu70TrMPmDASqxPOiJ47d2
         ql9LazXdiy25FJ8Gu01AowU6HiUk8lHGsPq0qLiOYPD9yxr35pyYCtt/zpKmtttAxvje
         77AuYY0A3ogXBmZqCUjCQj5g0FXLmmZ6P+Nb97eH3tpc1Qr3QBG7KcAZJcRVfLAE3xZX
         pSlg==
X-Gm-Message-State: AOJu0YxsHzpj886lp/vGUxWD/H0ETcBHkNjuaT9tnX6rqvCKiZuNfur6
	3iunt/e1geCG27Y2pCimekKrJp9f75OhYEz6qLNmoqPi7vc82NvhD0WsVi8C2TPW38K5Sdc3Q2B
	rjabK+TmO/v1B4QrLTqoFGC/SwhnfEuy5KXmgUPSMglhT8ZrLbetjcuReRwHGPZ9nQpkN4++VSs
	YjhgmxKYg=
X-Gm-Gg: ASbGnctQz0CzVMxtUvpeqA7rdswBJWcA2Zc+gqmPH7r8a8NyexEaP5wdRh+qGFDDjoU
	r/6IrwSNytDiRi+vBR9MCQZxG3svp+TfjnTX+lFf5x3B8X0EG+6L5eqwO5QYuTY6qgavtKaqvhM
	w89K0sMypKLKRlDOPFInJWhzgJg0ae2vZYqBEJHUPT0xOA7CS7Vx1t7H27jHmJEJgfnCDHiqC5W
	mqK+Q00uXg1QqmkhpwBUwaJJE33Fd/Qd0ZPWUcLfLkH52Nu5Ait5ZN6X20zqkIe2Xo3gwPQfJir
	QNIQiRiRszLJeeTcizy4Jcc=
X-Received: by 2002:a17:90b:2f86:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-2fc40d14c6emr16850262a91.7.1739802960775;
        Mon, 17 Feb 2025 06:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWwPHNmmXaHJ5chrpk4ksWCsVxcXmVulahEqAC+Tsa1D6AEEkUl9TS6Xitb3nCoTWjymM1cQ==
X-Received: by 2002:a17:90b:2f86:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-2fc40d14c6emr16850227a91.7.1739802960423;
        Mon, 17 Feb 2025 06:36:00 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:36:00 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/9] gpio: aggregator: protect driver attr handlers against module unload
Date: Mon, 17 Feb 2025 23:35:23 +0900
Message-ID: <20250217143531.541185-2-koichiro.den@canonical.com>
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
index 65f41cc3eafc..d668ddb2e81d 100644
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


