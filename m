Return-Path: <linux-gpio+bounces-6421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C18C8302
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 11:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B0B1F23165
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 09:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BBC1DA58;
	Fri, 17 May 2024 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="WD/OW2C+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0484E1EB26;
	Fri, 17 May 2024 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.49.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715936982; cv=none; b=m7+FNXEtWY6keyOdVek/oGdG9RgBbsnlGPFE/hlqOh8qWGkKCTRJMAHVpwh20oqyQ+ah34S9JvjUWHlmNxQkR0mH+dujdBFfZvpuMw0Kf9a/qS4DA2Ve8j8l9xCCssYyPSaJGm0O+5xBdj6+taI4HYXElM73q3zvePSpZZK2Eyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715936982; c=relaxed/simple;
	bh=tniEtfsi5V9FE9TVnUHbY0dOa1eHuV1iWAmiiFrBCIw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OKBCSksYjSNGMIAHYyXs4VG6Ws8058Pt+YAF4Ri+0ZOgzuxatwKGMxqcjeIQ7ghlyCiJ6LndHtqxXifvpb0D/vAhN4aQKrwOffPzWViofJIWnbN1YO7Phwx2PwudXj3Sppymsf0sO6nDbbLRgYH7Vd/Lx0DVx5dqaGacLn8W/xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=WD/OW2C+; arc=none smtp.client-ip=52.95.49.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715936981; x=1747472981;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5Ba8ICHWwdNpQ0y5aYfPooTOCldSdI7hhNa1Qp6LBI8=;
  b=WD/OW2C+MLjw+xB9yYXfdO7mnHm1xU79MgsyNb8+B6Wqmut3bIyB7118
   ZBOcJQ6p7bF1C+SJ0yEJfUN4CKPUCMJLy9UWp8KUP5La+RtaRzVk6hcCX
   JoHWDTR5/L5+pC0dtN67EcZEDfdz66MA9rYQMuPYWUgSGiuk5H21XUtj/
   Y=;
X-IronPort-AV: E=Sophos;i="6.08,167,1712620800"; 
   d="scan'208";a="407387397"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 09:09:38 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.43.254:33542]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.18.108:2525] with esmtp (Farcaster)
 id 304138a9-3ff4-49f5-942a-3d354180ede7; Fri, 17 May 2024 09:09:36 +0000 (UTC)
X-Farcaster-Flow-ID: 304138a9-3ff4-49f5-942a-3d354180ede7
Received: from EX19D002EUC004.ant.amazon.com (10.252.51.230) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 17 May 2024 09:09:36 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D002EUC004.ant.amazon.com (10.252.51.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 17 May 2024 09:09:36 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 17 May 2024 09:09:36
 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id CF60F20C24; Fri, 17 May 2024 09:09:35 +0000 (UTC)
From: Hagar Hemdan <hagarhem@amazon.com>
To:
CC: Norbert Manthey <nmanthey@amazon.de>, Hagar Hemdan <hagarhem@amazon.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] gpio: prevent potential speculation leaks in gpio_device_get_desc()
Date: Fri, 17 May 2024 09:09:04 +0000
Message-ID: <20240517090904.22812-1-hagarhem@amazon.com>
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
"using array_index_nospec" to mitigate any possibility of speculative
information leaks.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
---
v2: call array_index_nospec() after the bounds check. 
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fa50db0c3605..b58e4fe78cec 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -17,6 +17,7 @@
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/seq_file.h>
@@ -201,7 +202,7 @@ gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-	return &gdev->descs[hwnum];
+	return &gdev->descs[array_index_nospec(hwnum, gdev->ngpio)];
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_desc);
 
-- 
2.40.1


