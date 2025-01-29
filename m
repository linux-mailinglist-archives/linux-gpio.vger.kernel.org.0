Return-Path: <linux-gpio+bounces-15089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C67DA21FB5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 15:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E7B188521C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 14:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05591DE2CF;
	Wed, 29 Jan 2025 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr7dj8HB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83681DBB3A;
	Wed, 29 Jan 2025 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162324; cv=none; b=NuUDz+mYfRbxxT3eQzH9mTKSCWfg9hT+1InFlCVlFPcuwxpM5FSjiemqOnGppo0GkcBHPHYmVzme3QWC/VSoL+yNc87TnnYHi9OOP4OpvqIgTGAsfxe7+3O6vkuVA86SR5WrK1448mMz6U/Hk69kO0wTTrbPIx8vPjVzCMAikFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162324; c=relaxed/simple;
	bh=NRorMT7Ai4NWgV9s2kkQDmqPzFKKDlNb2YMIg1z9kyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ic15aMScKd7OW0jDOy94oKI49GORqp7jCRNMQp328Um0njz5w4JPD1MVU6i3COJau9tdUuPRmcKCFkHRWwwNYsCjTXNXJNe68CvwRkhUeH1mjBGJqF7wK64nqtyAc+NJj9U31F8GSHk4Rs90vrhjCsgEOkwZLDx0Grd/DfadCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr7dj8HB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738162324; x=1769698324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NRorMT7Ai4NWgV9s2kkQDmqPzFKKDlNb2YMIg1z9kyM=;
  b=kr7dj8HB/+pIlUKjiftqmWw21XwK+yn2E938pCZL6HdFila3IpNQAWxk
   QswKGCFwV70g0gOzlZvcppYmzTPYcG8C3YdMWv9sOkYVk66VnTl+MtOes
   XNqNHd/xJAKKxjggWh2QSIkLOBBU6q6GQpDN0zTHQ3iuwPa7y7wHuZYDh
   qolSGTwM0Q42bBth0fRJiic8IDLx49AFXmB75IZwMXMsV1lha/+d7dgMZ
   1UeNIWcvQo2I7xMQJSUziexCPuh4yQRBWjasnGp6fdIUpbs24/BEy2dx0
   Dg5/9WvxOm21+YfvMY+FNAGYC7XdHL/gQrN2Gh+DKnnP/lH88nE3A60qO
   g==;
X-CSE-ConnectionGUID: 7iVFST7LTDucAhOH1VozvQ==
X-CSE-MsgGUID: v5ttux5tQnS5K7f5gp/YWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49660533"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="49660533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 06:52:01 -0800
X-CSE-ConnectionGUID: lbWWjpKJTnqhP3rh3vpbmQ==
X-CSE-MsgGUID: 4lkE05J8T2ariGqkIBaEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="109032394"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2025 06:51:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A817F325; Wed, 29 Jan 2025 16:51:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/2] pinctrl: baytrail: Use dedicated helpers for chained IRQ handlers
Date: Wed, 29 Jan 2025 16:49:39 +0200
Message-ID: <20250129145155.1746876-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com>
References: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of relying on the fact that the parent IRQ chip supports
fasteoi mode and calling the respective callback at the end of
the interrupt handler, surround it with enter and exit helpers
for chained IRQ handlers which will consider all possible cases.

This in particular unifies how GPIO drivers handle IRQ.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 7340dc20349c..c4458ac539ff 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1355,6 +1355,8 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 	void __iomem *reg;
 	unsigned long pending;
 
+	chained_irq_enter(chip, desc);
+
 	/* check from GPIO controller which pin triggered the interrupt */
 	for (base = 0; base < vg->chip.ngpio; base += 32) {
 		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
@@ -1369,7 +1371,8 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 		for_each_set_bit(pin, &pending, 32)
 			generic_handle_domain_irq(vg->chip.irq.domain, base + pin);
 	}
-	chip->irq_eoi(data);
+
+	chained_irq_exit(chip, desc);
 }
 
 static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 conf0)
-- 
2.43.0.rc1.1336.g36b5255a03ac


