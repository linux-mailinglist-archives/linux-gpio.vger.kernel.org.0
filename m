Return-Path: <linux-gpio+bounces-30467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4DD17DCD
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0CE03011EEA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3658F378D93;
	Tue, 13 Jan 2026 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHUGtLnp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BAF25DB1A;
	Tue, 13 Jan 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298857; cv=none; b=DIxUfSDvzcK35JRs6Oh6//O8ZngbUvun8ZliLqwuabx2JOh+sRcElzisZ8AQmXIzVdDmuNNmaBsMI6ymOHerGs0WfF3qaFuIR+4Inl24k4fSqYV0FAnK8tJr4HdQl1TmB0LEonH2yQUeF4wEiiykPRQ1Nm/KljJm4ItyMEUP+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298857; c=relaxed/simple;
	bh=a3wyVQX9VfrZOoQ24ydYE/0wvn+51dq9qtMZFhI2N2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=izvm7jcdQdXseAyfQe5i6RinrVywdiaFD7E1+3b1r5PB0RwiCPXwCCl6jW+WZFTouBIsofygrbMMMeFeTt6L+oZKyFi78MOYWHFd7sgXCUSQb2MBuQ8UDKuttaFflkXNYpC1ZlFWNgjYQn0+wNbCKBGaePsbplKsLalRXLvzsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHUGtLnp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298856; x=1799834856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a3wyVQX9VfrZOoQ24ydYE/0wvn+51dq9qtMZFhI2N2w=;
  b=JHUGtLnpzlq5Qp/+jkKqtppJtvqxvqA/EIJqksDJjezIIXUZQpiihC5o
   5VwfmhZxDTIKDVctvmk5Pa2noRw1YsrMrs2VSHBilytVf/Ue+Qd/CE+Or
   aqDQWCtLuRBW/1Z6HiL3a54Z41IMKlMU+f1szs6PkoFYNcLNgE90B/cOx
   jQpMtCqOXmfTesDkfXM5O2rmq0wxBiTzMAZ4zgMs7RBDx6A9eg73wys5Y
   x7SWDZLCnVbkAKDXbN7e1e8UU/niQ9pEJRGWUryCS1UFuFvsbhUoGMfaG
   y8Jf5i4UKV9poAIE+hTZu9XkWXWXMGCBpl4k6RZjx74OtpRwghRKxN9bZ
   g==;
X-CSE-ConnectionGUID: AUZJ0CFuTKeyKNEEXLLeTw==
X-CSE-MsgGUID: X9p0Wk1DSsWggxy5Rj2o+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73422874"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73422874"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:07:35 -0800
X-CSE-ConnectionGUID: 14U/Wii+QV+t0yFwvKKBqA==
X-CSE-MsgGUID: 1YnmCpKbQJeOK/kcX6F51g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204154417"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 02:07:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5FC4898; Tue, 13 Jan 2026 11:07:32 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: lynxpoint: Convert to use intel_gpio_add_pin_ranges()
Date: Tue, 13 Jan 2026 11:07:26 +0100
Message-ID: <20260113100726.136695-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver is ready to use intel_gpio_add_pin_ranges() directly instead of
custom approach. Convert it now.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 27 +++++++++--------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 1565eefdd4bf..e9233c12e824 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -29,10 +29,12 @@
 
 #include "pinctrl-intel.h"
 
-#define COMMUNITY(p, n)			\
+#define LPTLP_COMMUNITY(p, n, g)	\
 	{				\
 		.pin_base	= (p),	\
 		.npins		= (n),	\
+		.gpps = (g),		\
+		.ngpps = ARRAY_SIZE(g),	\
 	}
 
 static const struct pinctrl_pin_desc lptlp_pins[] = {
@@ -133,8 +135,14 @@ static const struct pinctrl_pin_desc lptlp_pins[] = {
 	PINCTRL_PIN(94, "GP94_UART0_CTSB"),
 };
 
+static const struct intel_padgroup lptlp_gpps[] = {
+	INTEL_GPP(0, 0, 31, 0),
+	INTEL_GPP(1, 32, 63, 32),
+	INTEL_GPP(2, 64, 94, 64),
+};
+
 static const struct intel_community lptlp_communities[] = {
-	COMMUNITY(0, 95),
+	LPTLP_COMMUNITY(0, 95, lptlp_gpps),
 };
 
 static const struct intel_pinctrl_soc_data lptlp_soc_data = {
@@ -692,19 +700,6 @@ static int lp_gpio_irq_init_hw(struct gpio_chip *chip)
 	return 0;
 }
 
-static int lp_gpio_add_pin_ranges(struct gpio_chip *chip)
-{
-	struct intel_pinctrl *lg = gpiochip_get_data(chip);
-	struct device *dev = lg->dev;
-	int ret;
-
-	ret = gpiochip_add_pin_range(chip, dev_name(dev), 0, 0, lg->soc->npins);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
-
-	return 0;
-}
-
 static int lp_gpio_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc;
@@ -777,7 +772,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->base = -1;
 	gc->ngpio = LP_NUM_GPIO;
 	gc->can_sleep = false;
-	gc->add_pin_ranges = lp_gpio_add_pin_ranges;
+	gc->add_pin_ranges = intel_gpio_add_pin_ranges;
 	gc->parent = dev;
 
 	/* set up interrupts  */
-- 
2.50.1


