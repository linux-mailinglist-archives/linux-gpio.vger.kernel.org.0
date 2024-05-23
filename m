Return-Path: <linux-gpio+bounces-6587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCC88CCEAB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 10:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A06F1C22365
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 08:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962F313CABE;
	Thu, 23 May 2024 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="PQSYmUWN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE313D51D;
	Thu, 23 May 2024 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716454427; cv=none; b=a7DFlxeAMuP7+WlymmCbr3iK5CUJLsuKv1fnYF22e0fbUX+z48Hmd81UczK5o8ctatmelqVK7oajXrvOkavqidS1Hrb6CK9IM27jykUtbAepifHFLusPMI8CHJ2+gOYZQScGYpuCLWf7I+o9+tZ3TfsWySbKHyKOf7f4GTJbuAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716454427; c=relaxed/simple;
	bh=k0HAz12zOvkCsJQLILBVDEN1wcTZyVSG3UyDqwRrFKg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CQYQ/GiE3OIpMuRzx6NVlKqikp5vvWkzicFpVjZhqdWNkceOnct85lytj3l/+EiMa4pdBKwIq1zvmLF2ymSPjpcXE/3fdiMF0rZAWlgvI16oQo7awJoMSAL9mkSF3BUkqi/d/iHNAM8Sft52wRdxZlI8G79nQPnwYQ25PMBSndE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=PQSYmUWN; arc=none smtp.client-ip=207.171.188.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1716454426; x=1747990426;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9K5MURYfL/6zT+npQ6pyErHYyWlZ1B+V2T0QfJETvmA=;
  b=PQSYmUWNIEWTYRSKLuln7PV15H4JUp7u6pRNSVFTbjvF/GcuJBdMZrwL
   6CWlwgfocVSQZmMa/r8De+UQaUAHjdryW40ztLiierlS+NLfdG46Fh0xz
   49J5h9GBe3FcFM68Ub2cOVzIPg32KkK21J1vrKl0Tpt9h5n2wxAKl6pyx
   M=;
X-IronPort-AV: E=Sophos;i="6.08,182,1712620800"; 
   d="scan'208";a="728345964"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:53:38 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:13312]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.29.8:2525] with esmtp (Farcaster)
 id c420f847-140c-4f0b-810f-c02c9c528928; Thu, 23 May 2024 08:53:36 +0000 (UTC)
X-Farcaster-Flow-ID: c420f847-140c-4f0b-810f-c02c9c528928
Received: from EX19D002EUC002.ant.amazon.com (10.252.51.235) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 23 May 2024 08:53:36 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D002EUC002.ant.amazon.com (10.252.51.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 23 May 2024 08:53:35 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 23 May 2024 08:53:35
 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id 5DD9B20D32; Thu, 23 May 2024 08:53:35 +0000 (UTC)
From: Hagar Hemdan <hagarhem@amazon.com>
To:
CC: Norbert Manthey <nmanthey@amazon.de>, Hagar Hemdan <hagarhem@amazon.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] gpio: prevent potential speculation leaks in gpio_device_get_desc()
Date: Thu, 23 May 2024 08:53:32 +0000
Message-ID: <20240523085332.1801-1-hagarhem@amazon.com>
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

Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
---
v4: removed Fixes commit.
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fa62367ee929..1a9aadd4c803 100644
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
@@ -198,7 +199,7 @@ gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-	return &gdev->descs[hwnum];
+	return &gdev->descs[array_index_nospec(hwnum, gdev->ngpio)];
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_desc);
 
-- 
2.40.1


