Return-Path: <linux-gpio+bounces-11644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E99A4052
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC82B1C244EC
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF95F3EA76;
	Fri, 18 Oct 2024 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7X8SPw3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3991EE007;
	Fri, 18 Oct 2024 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259163; cv=none; b=IEE3/k62+Mt6sY8G4RWr4mc4alsXAlLhX350Qzf5qhPci1tAL0rcQyGtf8SOI+JYbsCBjUlNHOdDfR0E93jKDpf8nBa/4gH2IkjXLWuD4VkAJ505JyPL3uPnz3j4XLczS09ywS4wKZqkY3JwiNS6FLsKVge2cxGd2HK+TaQpQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259163; c=relaxed/simple;
	bh=p+LcWe4Pxmo+7KAiEvXg9Bx598A+WiRwIXC7KBxOeyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvdpnqAc8SejSI6olmrTUPki0hAsOwpcjJ1FA2dq4ghO/BTE+wvY49qb+esIccx6T5E/s4tMuTvelXjBl72tS+xy0NrATIvi4Qus8MhxYZQ4xK0RTTWxEjKknSCTHNuMGaG0e+cp3/Os+SlrCn/bXFbEQ/fqFPRt1H1bR4WSNvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7X8SPw3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729259162; x=1760795162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+LcWe4Pxmo+7KAiEvXg9Bx598A+WiRwIXC7KBxOeyc=;
  b=M7X8SPw3nK/45/NgRt7kYeOqLcHMsUCcEpVZ9szRWTqWGKj4JokRRcUn
   aMVWMm0dRRPrG2zkYwb2xP68PNXGHGi51F5Em8CNd7Iozkc6hpdu+KtDs
   VqfCPQWOGCcbOAutofDkIPXoBkMlTzK6izMD/FvGx68JMeabOjZGysUDD
   63q+BocFD6N/Xhu1L0T/t8L7+DfS/EgUoEjylgvUPeRQEVedi8VGEwWqw
   RiEfTJvks/5FY3Slrv19XParssLK6SsimoMaSSXqUY0ub1A2hTXRp4nM5
   jhdYZlDPUxcZXZ/gX8FMEm9N7Y//WC32SLTKuwZZ78GMSVGx9fwPqZZXJ
   w==;
X-CSE-ConnectionGUID: hxrVn/1wQL2W37j+zmoTeQ==
X-CSE-MsgGUID: C1s2TbVYRzaPQBlNB8jFKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251819"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:45:57 -0700
X-CSE-ConnectionGUID: dUiz5XehTx2TfwBBh2MGSA==
X-CSE-MsgGUID: RkX3tAKsRuSDXKlK9atsuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83936183"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:45:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B1259256; Fri, 18 Oct 2024 16:45:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/4] gpio: xgene-sb: Remove unneeded definitions for properties
Date: Fri, 18 Oct 2024 16:45:00 +0300
Message-ID: <20241018134550.2071101-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
References: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
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


