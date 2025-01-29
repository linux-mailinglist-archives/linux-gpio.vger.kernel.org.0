Return-Path: <linux-gpio+bounces-15088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C045AA21FB2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 15:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4FB43A322C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC541DDA17;
	Wed, 29 Jan 2025 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO0rKouB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9821DA0E0;
	Wed, 29 Jan 2025 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162323; cv=none; b=kK6jTU4/ZbKNh1J4iLzlMHEAehWanKxgo/D8iWly8Nu9c6vNJGA52yqphgN2cVCjH8WxVBIHKqFZS0N4JMOiF/88UE7FoGHx1Bv/mZDCFtA9fkBtslXCdCL6J2RHEA8Yof5m/lgxkVm/NjuK9Zx9M1uz/AB+DcsRlXl2TVchElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162323; c=relaxed/simple;
	bh=wXVNh7DQEQoTXiNwv7qR3Jv7wD33BNQa0hfgNcZRC/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1Rm+RrzmRWId5nB+nDl6dQQMTvk6We5M+ZI2jqodCXBh1Ui0gn3uvcJlma3fZgrzLorvj8wqsPY2fx9MUpbaeobsRA9MHNNiiUV81A6yFR9GxB810lGTB7GlW6ayYkrKS6gfcVOMDiE5AzUlJ6mqf5V47hqNTu4n9s/WiPUXP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO0rKouB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738162321; x=1769698321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wXVNh7DQEQoTXiNwv7qR3Jv7wD33BNQa0hfgNcZRC/M=;
  b=EO0rKouBFbTUjchBXJ99IEfA2io9hQVllSkBtQAf4fBs3YwfOz09FfV9
   8tgHm/292YsgPPR5VlHNy+VHQwO1L2Haa3EuVh/ZBhwble9Db47CbW90L
   eSy0i63nhcY9+YSEPBtfpcggcJt8JDwHo/keypxi2/eat0/V4RgHo4WhQ
   /RV+5WMLJS9Hn6bCSeDk6cDjKWEYS9ABfjDUKwnC1Ge0YUi/trOrdbBBU
   KLOPfF7eeWmZt7Kyn8aqSomjOoBBPX6+G/3NIgyEd1i7qblKTbvdrFwiX
   eFPnTvsNfKEpyXGyJhrVew35ASlF1/SgFiDvLvjXNsVr5PysTrXndq9Fj
   w==;
X-CSE-ConnectionGUID: REevOgmCQiCNhq4EfKA30g==
X-CSE-MsgGUID: brASXF7sQwOtA4RjI54+DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37922624"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="37922624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 06:52:01 -0800
X-CSE-ConnectionGUID: aAt798I0Tlefj6oRO7cJ9g==
X-CSE-MsgGUID: FSOXVPP/SV24I394++C/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139919499"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2025 06:51:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 13A1F3A4; Wed, 29 Jan 2025 16:51:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/2] pinctrl: lynxpoint: Use dedicated helpers for chained IRQ handlers
Date: Wed, 29 Jan 2025 16:49:40 +0200
Message-ID: <20250129145155.1746876-3-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index cc5ede17c383..ac5459a4c63e 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -549,6 +549,8 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 	unsigned long pending;
 	u32 base, pin;
 
+	chained_irq_enter(chip, desc);
+
 	/* check from GPIO controller which pin triggered the interrupt */
 	for (base = 0; base < lg->chip.ngpio; base += 32) {
 		reg = lp_gpio_reg(&lg->chip, base, LP_INT_STAT);
@@ -560,7 +562,8 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 		for_each_set_bit(pin, &pending, 32)
 			generic_handle_domain_irq(lg->chip.irq.domain, base + pin);
 	}
-	chip->irq_eoi(data);
+
+	chained_irq_exit(chip, desc);
 }
 
 static void lp_irq_ack(struct irq_data *d)
-- 
2.43.0.rc1.1336.g36b5255a03ac


