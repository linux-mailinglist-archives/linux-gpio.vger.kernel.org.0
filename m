Return-Path: <linux-gpio+bounces-6365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE38C5608
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 14:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B71281B4C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 12:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705F548CF2;
	Tue, 14 May 2024 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="TB1hUabf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE675225A8;
	Tue, 14 May 2024 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.21.196.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715689617; cv=none; b=f5s9VATRDI2eZSaBG0Ar27xXXH/PcFFsHTttLGyd83VgcrbX/Eefg1jHF8qmXVytHnFIC2RC0uc7Sf828kPF4LlxNOU+sKX8rRwaHpQAWoO2WO3ovU70wtIY931kXD5nopM/wBbtHJXFRWjbIAptQHW7OMny/f2UgGs8Ya0KCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715689617; c=relaxed/simple;
	bh=xU1lG+LaTVYlDzKuYpkmb+8guhxZCCniE7IDWhABdcc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LUzwBjwEhnMcMVBw4CGKKei/ZLXBq/rk4potqs1YKTip6LAT9NbyrIXapOkkNzqQ5gGauj0dzd/F6kdcV0E6eAlxNRLOQMZgL22EaOUxqYeHRpyXMAJb+YJsMmE7pSWVyGnW7FJHMsyhS3EgQTUxQoUUTzUwH9E6zyzdbQuRQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=TB1hUabf; arc=none smtp.client-ip=72.21.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715689616; x=1747225616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jZ0aIN73vHSEd/w0f15GiiFOLZHUFBfpeWf82hZw6m8=;
  b=TB1hUabfEMQWWWkY7MDUZt6vuCG9lhBXMqXoImr/Z60/35aBT1/Fur/6
   kqrMQEFAv2gpbK0U30Eu5oAAHNC9uPvDS8d8DUvhFW7LrKYmORofdDBTd
   wgqIuIEhJWDPY/NKILgkrSmRFtiHzDdr6Jki8oNgWLxQftRC+VNLfW60d
   w=;
X-IronPort-AV: E=Sophos;i="6.08,159,1712620800"; 
   d="scan'208";a="401038834"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 12:26:52 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.17.79:16153]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.23.178:2525] with esmtp (Farcaster)
 id d2bd624b-9d24-4d18-9f3a-ab99477b65da; Tue, 14 May 2024 12:26:51 +0000 (UTC)
X-Farcaster-Flow-ID: d2bd624b-9d24-4d18-9f3a-ab99477b65da
Received: from EX19D002EUC003.ant.amazon.com (10.252.51.218) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 May 2024 12:26:50 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D002EUC003.ant.amazon.com (10.252.51.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 May 2024 12:26:49 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Tue, 14 May 2024 12:26:49
 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id BBB5620AC2; Tue, 14 May 2024 12:26:48 +0000 (UTC)
From: Hagar Hemdan <hagarhem@amazon.com>
To:
CC: Norbert Manthey <nmanthey@amazon.de>, Hagar Hemdan <hagarhem@amazon.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] gpio: prevent potential speculation leaks in gpio_device_get_desc()
Date: Tue, 14 May 2024 12:26:01 +0000
Message-ID: <20240514122601.15261-1-hagarhem@amazon.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Users can call the gpio_ioctl() interface to get information about gpio
chip lines.
Lines on the chip are identified by an offset in the range
of [0,chip.lines).
Offset is copied from user and then used as an array index to get
the gpio descriptor without sanitization.

This change ensures that the offset is sanitized by
using "array_index_nospec" to mitigate any possibility of speculative
information leaks.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
---
Only compile tested, no access to HW.
---
 drivers/gpio/gpiolib-cdev.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9dad67ea2597..215c03e6808f 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -20,6 +20,7 @@
 #include <linux/kfifo.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/nospec.h>
 #include <linux/overflow.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
@@ -2170,7 +2171,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	lflags = eventreq.handleflags;
 	eflags = eventreq.eventflags;
 
-	desc = gpio_device_get_desc(gdev, offset);
+	desc = gpio_device_get_desc(gdev,
+				array_index_nospec(offset, gdev->ngpio));
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
@@ -2477,7 +2479,8 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
 		return -EFAULT;
 
 	/* this doubles as a range check on line_offset */
-	desc = gpio_device_get_desc(cdev->gdev, lineinfo.line_offset);
+	desc = gpio_device_get_desc(cdev->gdev,
+				array_index_nospec(lineinfo.line_offset, cdev->gdev->ngpio));
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
@@ -2514,7 +2517,8 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
 		return -EINVAL;
 
-	desc = gpio_device_get_desc(cdev->gdev, lineinfo.offset);
+	desc = gpio_device_get_desc(cdev->gdev,
+				array_index_nospec(lineinfo.offset, cdev->gdev->ngpio));
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
-- 
2.40.1


