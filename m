Return-Path: <linux-gpio+bounces-11639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD19A403C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 199B11C21456
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BA7202650;
	Fri, 18 Oct 2024 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbiwEaOr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B740202F6E;
	Fri, 18 Oct 2024 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258899; cv=none; b=CCmHCEnAkk6PXeOiVhnC0/GdRG/kMmYLrYCtUWKlGeKmJMacNLjZ3Jkv9QaGKwd8759cx+JLvQEovzhwPN7O31Z2ABwG4HWuS+2p6MRwzKsLCA0eobAXbWlrAcFluth7N7srhOfKS7TnhUVdYWRDOwH806ARHmWlhPpfuQ/NjFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258899; c=relaxed/simple;
	bh=p+LcWe4Pxmo+7KAiEvXg9Bx598A+WiRwIXC7KBxOeyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkhWk4LIFDPr5rasZpTseHKWEbPZQGOhXUX9GlMgODVH7s1s75/ZNAtyWKD22vwH/jeaS3Ek9LyIVefsc9rBVfqkgL+/0XOiS4PwxH+5oNyUvwwZJS18DfHxgtj2VppXK9OBV5iIZzpQc/m6JkcfBssBiffk7faaUio4Klgl8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbiwEaOr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729258898; x=1760794898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+LcWe4Pxmo+7KAiEvXg9Bx598A+WiRwIXC7KBxOeyc=;
  b=BbiwEaOr+d8WJOHBnNxUQ5qzJZOGeASNVQLb+Pc9Cbl0MlQI9s79Ytwc
   1Hy9JaDoGG1GyiYgyYX+aISTE98n2XIJAGIijZJCSwTJORUNiM3+dKa3S
   q9uZQ8T6+csDeGH9CDLKBbSdJf1Omh4tGRmPrCyEEXFe6pvzFH0tyGfP4
   5U9O+0PZzjL09PsWzrFL7O3yJUa9lBO/n52pszTExaBemIdQwrdLlzjo0
   IGFNrA8aIRZd5cQEexR6cWlAPM3IxFEF/v+rqCIHiAzn0LubpQSsgJUqp
   NyYRJT/i4xS3JmirmnWc+96x9hoqxSsvXwIfqC+Pvi5ePAnkZjoMckR5Z
   g==;
X-CSE-ConnectionGUID: 9ee6BAucSG6M7q1z0hRXLQ==
X-CSE-MsgGUID: 5S3Ln1WNQnu1aYhomFhWKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251461"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:41:33 -0700
X-CSE-ConnectionGUID: ZsxW+LyIR0qVZ4VDwo2zXg==
X-CSE-MsgGUID: Ksh33eSHQY2jVhg2YK4KLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83935284"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:41:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 12235343; Fri, 18 Oct 2024 16:41:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/4] gpio: xgene-sb: Remove unneeded definitions for properties
Date: Fri, 18 Oct 2024 16:32:32 +0300
Message-ID: <20241018134129.2058068-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
References: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are three definitions for the property names. Remove them as:
1) each of them is only used once;
2) in all cases the definition is longer than the value.

In the result code is better and grepping on the property immediately
gets the function in which is being used which helps to guess the type
of the value.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xgene-sb.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 836fcf1c82fe..ae592528001d 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -17,11 +17,6 @@
 
 #include "gpiolib-acpi.h"
 
-/* Common property names */
-#define XGENE_NIRQ_PROPERTY		"apm,nr-irqs"
-#define XGENE_NGPIO_PROPERTY		"apm,nr-gpios"
-#define XGENE_IRQ_START_PROPERTY	"apm,irq-start"
-
 #define XGENE_DFLT_MAX_NGPIO		22
 #define XGENE_DFLT_MAX_NIRQ		6
 #define XGENE_DFLT_IRQ_START_PIN	8
@@ -252,18 +247,17 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 
 	/* Retrieve start irq pin, use default if property not found */
 	priv->irq_start = XGENE_DFLT_IRQ_START_PIN;
-	if (!device_property_read_u32(&pdev->dev,
-					XGENE_IRQ_START_PROPERTY, &val32))
+	if (!device_property_read_u32(&pdev->dev, "apm,irq-start", &val32))
 		priv->irq_start = val32;
 
 	/* Retrieve number irqs, use default if property not found */
 	priv->nirq = XGENE_DFLT_MAX_NIRQ;
-	if (!device_property_read_u32(&pdev->dev, XGENE_NIRQ_PROPERTY, &val32))
+	if (!device_property_read_u32(&pdev->dev, "apm,nr-irqs", &val32))
 		priv->nirq = val32;
 
 	/* Retrieve number gpio, use default if property not found */
 	priv->gc.ngpio = XGENE_DFLT_MAX_NGPIO;
-	if (!device_property_read_u32(&pdev->dev, XGENE_NGPIO_PROPERTY, &val32))
+	if (!device_property_read_u32(&pdev->dev, "apm,nr-gpios", &val32))
 		priv->gc.ngpio = val32;
 
 	dev_info(&pdev->dev, "Support %d gpios, %d irqs start from pin %d\n",
-- 
2.43.0.rc1.1336.g36b5255a03ac


