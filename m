Return-Path: <linux-gpio+bounces-27991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC532C2DF71
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 21:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6AE3BD28B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 20:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022DF29B775;
	Mon,  3 Nov 2025 20:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1V1ObAA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F01F9F70;
	Mon,  3 Nov 2025 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200162; cv=none; b=is48yFYq3S9SoHbCoVObzc4SeWO8bVzKQpri/MkIf1iOnpc1Dx7i/k0nkYzzCOOpJtrRgY9dcTX5l/ZUxfk1B4N0pQXjNGHsehzbR2Rs3J83fk/wLA04XJ2Fg1Oyu7c1BGKyAKwtJ8wCvklhTRYVyZVUT4tyo/B4a6DWCwe506U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200162; c=relaxed/simple;
	bh=n5fqugsKHtS4QTHz1P4zLrXeYU2KtpCo88B+zgvwOX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URKBrys97qHMOSk9CvjhqwZe/QvfX+u2MVm4CZlEMNfozRDVD/bBVX5P0KTDFzVE2udJl4JBhYh9dgzWInWGvEfP1wBu2O13no6KIagJmcTaqS7JnVwl2+OI7xIc51Jj/J0SrNLCIvgtfF4q4qSwrzi+fNciWVBMKlX8i8ayq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1V1ObAA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762200160; x=1793736160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n5fqugsKHtS4QTHz1P4zLrXeYU2KtpCo88B+zgvwOX8=;
  b=j1V1ObAAHL9+phOvQbxt1quzdHzTIZbK9IMxnih/E++auE0UhPwlb8AZ
   Q4/jGQwVJyzBfRPVarCS0owlwfRPWv+4/d6gPl1gtHG4AEYcViC4WwQ4+
   5eAcDNe+TkeZNU6mQ1NWjpgySoa1Hs82/twJdua5W9BQT3UnvIf69QfpP
   uE+4VjbCLrBXQfkAWz492R/IrWlAFpLt57AH9kJBKG5rRLt3neRSBEWLn
   J1ROoclQq57njbcI57OKGN+OGoWMFNEC3HdcuMm9Cn8TDHieDgcvDT55G
   ugWFDUm+eO+XITFuchTAZpLdEXcLSxY/G26L4Bc9OK4+5Zd3cGfIube8o
   A==;
X-CSE-ConnectionGUID: CGHVzidqQ9OthIGtdi5ITg==
X-CSE-MsgGUID: QI0yQ6JmSBy98Xh9sWu2Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64172568"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="64172568"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 12:02:39 -0800
X-CSE-ConnectionGUID: ChVpKzdvRj+14SM7vzeuUg==
X-CSE-MsgGUID: /XihFb64QfmmF+IwIGhGyw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2025 12:02:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 742D496; Mon, 03 Nov 2025 21:02:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/4] pinctrl: baytrail: Unify messages with help of dev_err_probe()
Date: Mon,  3 Nov 2025 20:58:28 +0100
Message-ID: <20251103200235.712436-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
References: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify error messages that might appear during probe phase by
switching to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 5fd107a00ef8..b3a5222a175f 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1498,9 +1498,9 @@ static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
 
 	ret = gpiochip_add_pin_range(chip, dev_name(dev), 0, 0, vg->soc->npins);
 	if (ret)
-		dev_err(dev, "failed to add GPIO pin range\n");
+		return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
 
-	return ret;
+	return 0;
 }
 
 static int byt_gpio_probe(struct intel_pinctrl *vg)
@@ -1548,9 +1548,9 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 
 	ret = devm_gpiochip_add_data(vg->dev, gc, vg);
 	if (ret)
-		dev_err(vg->dev, "failed adding byt-gpio chip\n");
+		return dev_err_probe(vg->dev, ret, "failed to register gpiochip\n");
 
-	return ret;
+	return 0;
 }
 
 static int byt_set_soc_data(struct intel_pinctrl *vg,
@@ -1601,10 +1601,8 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 
 	vg->dev = dev;
 	ret = byt_set_soc_data(vg, soc_data);
-	if (ret) {
-		dev_err(dev, "failed to set soc data\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set soc data\n");
 
 	vg->pctldesc		= byt_pinctrl_desc;
 	vg->pctldesc.name	= dev_name(dev);
@@ -1612,10 +1610,8 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	vg->pctldesc.npins	= vg->soc->npins;
 
 	vg->pctldev = devm_pinctrl_register(dev, &vg->pctldesc, vg);
-	if (IS_ERR(vg->pctldev)) {
-		dev_err(dev, "failed to register pinctrl driver\n");
-		return PTR_ERR(vg->pctldev);
-	}
+	if (IS_ERR(vg->pctldev))
+		return dev_err_probe(dev, PTR_ERR(vg->pctldev), "failed to register pinctrl\n");
 
 	ret = byt_gpio_probe(vg);
 	if (ret)
-- 
2.50.1


