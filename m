Return-Path: <linux-gpio+bounces-24886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2268B33A42
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005B718981A1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148CC2C08CD;
	Mon, 25 Aug 2025 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAeMfNQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F8282EB;
	Mon, 25 Aug 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113181; cv=none; b=kXtwu5cJ2nvsqSRZWtLDy2zxaXmvIIYEevfe12cSsxi2x5vtFB9DDO7OlTr95uAgg8TCOk35U2ihemvqzik5h4XjEdaApmpRkEtx/A5dVDIVV4dvdPv7zX/JmISwJ4+rpQVNCnsR4sZj4fBfjTID0qiBKFYxKIEWzlLkSSG2Rvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113181; c=relaxed/simple;
	bh=QGG3NNlk9OGBVg03phJ4sNiqWVIhxi8fTuW6G22kXqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikg8goonPxDl2YT088y1rsE/vpt9CxelZ7mVnQp22G3XZFQBCua9z66kfh2gj9RGE7JWCEQ7Sts/cGJbul+lo8EPNb+yLai29OGCXb/Ak4VDWIr1/RZjtYzLF+G22Z4+kbyFiHv/kiZt0JnO9txSJOluCRr5l9BBAkdnY1vzYts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAeMfNQS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756113180; x=1787649180;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QGG3NNlk9OGBVg03phJ4sNiqWVIhxi8fTuW6G22kXqo=;
  b=CAeMfNQSa9+W7Jb5T9GLpC2A3HM6ZIHNBO6QkhTgWLruC/BtN7JghYcV
   9fjtqgvgb1prMXPsd8R69Tm4dsskpz0gA+AML9uD+YZK4AMUnBG8LfOVY
   nncW156z11XdfOmYqc8ZXt3FqWGp49iNRxFzZCmdNBDs4wPAQOieq89TJ
   IqEJkrAMXHF8HoIrCFa2ZU34MmTOZpM9jscaBaLffvx3YcBjS4DhrZ+40
   v9RwPW/sh9Hcm+ep8YhE+gvLL/e0xfKF2ESAZr68aSuB8J6aIKzzn3LPy
   SVuD50px8oL5uj2stRXVCqSXXlDpkYXMM0/mphXoNQi6woi03X5dr8Koq
   g==;
X-CSE-ConnectionGUID: kYQ7Zi/9RyeUssB9QDub8g==
X-CSE-MsgGUID: pzFbCii7SsShJ0676J82qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58466036"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58466036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:12:59 -0700
X-CSE-ConnectionGUID: 9YGFqjHoSzKUXwjuOv1mFw==
X-CSE-MsgGUID: bddS08ZcRGq2Jk6rQJbzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="170071189"
Received: from junjie-nuc.bj.intel.com ([10.238.156.181])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:12:57 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Junjie Cao <junjie.cao@intel.com>
Subject: [PATCH] gpio: timberdale: fix off-by-one in IRQ type boundary check
Date: Mon, 25 Aug 2025 17:08:50 +0800
Message-ID: <20250825090850.127163-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

timbgpio_irq_type() currently accepts offset == ngpio, violating
gpiolib's [0..ngpio-1] contract. This can lead to undefined behavior
when computing '1 << offset', and it is also inconsistent with users
that iterate with for_each_set_bit(..., ngpio).

Tighten the upper bound to reject offset == ngpio. No functional change
for in-range offsets.

Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 drivers/gpio/gpio-timberdale.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 679e27f00ff6..f488939dd00a 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -137,7 +137,7 @@ static int timbgpio_irq_type(struct irq_data *d, unsigned trigger)
 	u32 ver;
 	int ret = 0;
 
-	if (offset < 0 || offset > tgpio->gpio.ngpio)
+	if (offset < 0 || offset >= tgpio->gpio.ngpio)
 		return -EINVAL;
 
 	ver = ioread32(tgpio->membase + TGPIO_VER);
-- 
2.43.0


