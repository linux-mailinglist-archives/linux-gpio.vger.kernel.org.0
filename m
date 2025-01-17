Return-Path: <linux-gpio+bounces-14896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7FFA151B3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CEE5188D2F8
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40DA17D366;
	Fri, 17 Jan 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1FTWqSk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380EA14F9FB;
	Fri, 17 Jan 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123795; cv=none; b=u5/P5S9TFIpuzgz8ac+GVVVSSXk9P71+QS9xSi7jFYaPRWvaZeKgdc72iNclZO8n7mRcLeIAwVz+d+0yI/4QYkMHc4upIZ88zPav4Smojus96cBZCWxDhNCDhL+8eERordNgYSR6+C0qTNzX9+JVtTvtMGFp2uZ6luEZSDyz8tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123795; c=relaxed/simple;
	bh=D2w/vGB9780i37uCX7Cl0UyuYW6geZmIxtuEbxUauzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XR9L/OUvMKm+BZfkqYiD+dihWPAYzbtWvyrzxdUKhrVB4Up2W0PzkgqMra+u7hHck3FRa5wvKB9qndV3hyulCQBDbuAer/5CU76M1S32XAYfsjXU9zoUK+qwgr6RxdV9fdOFIh+CoRG6/WCs1bWN6ATXRubZGUvP5TbJph4taS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1FTWqSk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123794; x=1768659794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D2w/vGB9780i37uCX7Cl0UyuYW6geZmIxtuEbxUauzM=;
  b=O1FTWqSkT6NtC36BX56udjqnalQK4Zn5TBY3HTSF6uUw+x42DewSthNX
   24iG5nLs9tKCB1Vm+dBmJcJCQw+K0mSi3Z6p4PB4oSt2Xb18MK1Cx1aU1
   05xROeU77tbctQVwKB5JgjX7Y8SbTgZYNQUpcNYcd8J9gfq4djqFgF3cW
   d2ehMs0oU/exzZdkhdTsDaqCpOV0L4PQaTGbRqU2Co/M3zI2IquR480nm
   sdONETzq6R79KWQE0JKx8XjLEmJ4OWiEddGUQZaBNDpfJfH8rpCNz4F36
   8WngVyMU7QGOpBg+430caUoqI7DVr0TXRnM1D/t31chhQMaCVR6GMa5a5
   Q==;
X-CSE-ConnectionGUID: EbGZQB+wT/yTC3mCoDjsSw==
X-CSE-MsgGUID: 92kMu7UoQUeNMP7rLH5FgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41323661"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41323661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: DreMjXnZQx+VKz1S0sTxaA==
X-CSE-MsgGUID: Ed2mXTjZSoaF95fbDCmUsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143100386"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B39F8581; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 12/16] pinctrl: cy8c95x0: Initialise boolean variable with boolean values
Date: Fri, 17 Jan 2025 16:21:56 +0200
Message-ID: <20250117142304.596106-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'ret' variable in cy8c95x0_irq_handler() is defined as bool,
but is intialised with integers. Avoid implicit castings and
initialise boolean variable with boolean values.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index d29898151a9e..657e9fe40e38 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1075,7 +1075,7 @@ static irqreturn_t cy8c95x0_irq_handler(int irq, void *devid)
 	if (!ret)
 		return IRQ_RETVAL(0);
 
-	ret = 0;
+	ret = false;
 	for_each_set_bit(level, pending, MAX_LINE) {
 		/* Already accounted for 4bit gap in GPort2 */
 		nested_irq = irq_find_mapping(gc->irq.domain, level);
@@ -1094,7 +1094,7 @@ static irqreturn_t cy8c95x0_irq_handler(int irq, void *devid)
 		else
 			handle_nested_irq(nested_irq);
 
-		ret = 1;
+		ret = true;
 	}
 
 	return IRQ_RETVAL(ret);
-- 
2.43.0.rc1.1336.g36b5255a03ac


