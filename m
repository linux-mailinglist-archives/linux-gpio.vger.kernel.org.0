Return-Path: <linux-gpio+bounces-6426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B919E8C8499
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 12:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ADDD1F23FE4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 10:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3532E40F;
	Fri, 17 May 2024 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="cbZ8dS/o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B7200D2;
	Fri, 17 May 2024 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.190.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715940764; cv=none; b=Z8GbfHgKyXa8TWNJE1i8GvkXDzUsXwVIFIrMiTuO57rC3c8uRnAbjjDj2b7ndfXH3WIUqZbivOw92xe+fGM/UQ2uf9035UEKwOknjlLNUB5gL3YqI9HAooa1e8iSqLxA3Vof/3FE993NY+wAiySE6yQ4vsY3m3XM16hrCkxtkGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715940764; c=relaxed/simple;
	bh=DNCDM6IxkJLGGSLYqPfZ1r8XHL+hCpAHIncnxjbHTj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XRDXDcm7EXRc+/H+t4ehPjHEeJ5zJAfwAVvmsYz+CDpnv5p76YksGkLpAuPvz09R31E3l4t+33ChgOtuSulzus6ftbLvKcQ/N2teFQwsshP6RBJ0BTWP3gl1wfXrtfm8g0UlEUlyBDhdpmm5p4B/WHOLQp7XewNIhaZAzIyyFhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=cbZ8dS/o; arc=none smtp.client-ip=207.171.190.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715940764; x=1747476764;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DdDjU8RAWsRCjt4a0p8GXfqvpw/fXzr4zK/kj9NVBs0=;
  b=cbZ8dS/o3XOfgEmbr9hyYLdpOy/oLlyKpf4tUCw7zK89ZcVxaKfLaK1a
   YjP4K7nS/owvkDejz7V10czzDtnVaVLhQ//qkEtF9uN6d12TkPoINYx+5
   vvt9fdXgdFkA9F7NTl2lf3gtK1wH9xHAwyqL8sRbmI+MwXgVcbOL+vNKh
   E=;
X-IronPort-AV: E=Sophos;i="6.08,167,1712620800"; 
   d="scan'208";a="345036791"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 10:12:38 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:33278]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.12.108:2525] with esmtp (Farcaster)
 id d0dc88c3-ff31-469a-bfb3-2ca9871ee2a6; Fri, 17 May 2024 10:12:36 +0000 (UTC)
X-Farcaster-Flow-ID: d0dc88c3-ff31-469a-bfb3-2ca9871ee2a6
Received: from EX19D002EUA004.ant.amazon.com (10.252.50.181) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 17 May 2024 10:12:35 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D002EUA004.ant.amazon.com (10.252.50.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 17 May 2024 10:12:35 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 17 May 2024 10:12:35
 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id EE56320C24; Fri, 17 May 2024 10:12:34 +0000 (UTC)
From: Hagar Hemdan <hagarhem@amazon.com>
To:
CC: Norbert Manthey <nmanthey@amazon.de>, Hagar Hemdan <hagarhem@amazon.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] gpio: prevent potential speculation leaks in gpio_device_get_desc()
Date: Fri, 17 May 2024 10:12:27 +0000
Message-ID: <20240517101227.12118-1-hagarhem@amazon.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Userspace may trigger a speculative read of an address outside the gpio
descriptor array.
Users can do that by calling gpio_ioctl() with an offset out of range.
Offset is copied from user and then used as an array index to get
the gpio descriptor without sanitization in gpio_device_get_desc().

This change ensures that the offset is sanitized by using
array_index_nospec() to mitigate any possibility of speculative
information leaks.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
---
v3: update the commit mesg
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


