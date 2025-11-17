Return-Path: <linux-gpio+bounces-28567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D4C62D21
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D1A236021A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C2031BCB7;
	Mon, 17 Nov 2025 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfl7nfpD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C5F3191DE;
	Mon, 17 Nov 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366314; cv=none; b=TZcd16nziqzkRqaJdIPhC4S+RaWCov/4WnRBnJD1JaCZjLIYhxQn0bba01uHF+m4n5/FzEGQGDlGq8YY1EiUwFTIr8dQZ/Q002Fcf5ctzH2/XoVUcisUL3nVO38LQfUkdAje7H4EzbhG8MvUuXcN13l8zls0i1r1e3ahOVs0zUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366314; c=relaxed/simple;
	bh=rftrJ2X86gEUzI36HaO4SUpjCvgCe3dPfNpIAFurNo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djHXT2FpzFqpQTX4BXmz7dS/0y/J4ErHpxD/+1eRysCmUT/Oq/c6iX5dmGMyi2RTlLFYNTZ5vZG0meR/qnbG0QTgBp3HKbA9ZFCqUB3XvXXuX8dyYh1qWGXDMyjRE8kaZbLH94hIu5UXT3JYZtfXfRsOoSpOV1BUKd5H206ejvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfl7nfpD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763366313; x=1794902313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rftrJ2X86gEUzI36HaO4SUpjCvgCe3dPfNpIAFurNo0=;
  b=hfl7nfpDihuMFATc3uxf1IiWUadBjyxu1s91lNWiuXd+8pZtW0aFMUEh
   7jB024yjffgtaebgCE2NdrWRxMDiRc6bzSYAacy2C2vmaw6LfhVftRqmm
   CBBliguwLv1+mVPzJwW5PjqenUpOM6YKVaL422YgmhImFY8wS8xaEHDVi
   WslWjJGkp51CwdcVttThc9WB54xFLRwf3OWKNu55UHM6+SVhDLqmik6gU
   uWUcQ8Jss7Cfs/MUVkcQ2a4NTjfPdsVQtNO1cuL8eztUmqMmDOhjvz6xE
   PHhDqcCwAbdriFwlOL3WvlooUJ//TVXbEOkOM+N6fDoiHpHEMtKLv2Lh9
   Q==;
X-CSE-ConnectionGUID: uRWufIVsTqKQbvQjptjWpw==
X-CSE-MsgGUID: Jo49P1/8Tw6R2zlteIqyPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65392689"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65392689"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:58:30 -0800
X-CSE-ConnectionGUID: XVHwo46cTgG51gOBdvSkkA==
X-CSE-MsgGUID: igiB89QrQri9VyLEqnw+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190169887"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2025 23:58:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 08B509A; Mon, 17 Nov 2025 08:58:27 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 3/3] pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()
Date: Mon, 17 Nov 2025 08:57:01 +0100
Message-ID: <20251117075826.3332299-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 9c353e1ebe4a..d72e50486370 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1511,24 +1511,6 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 	return 0;
 }
 
-static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
-{
-	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
-	struct device *dev = pctrl->dev;
-	const struct intel_community *community = &pctrl->communities[0];
-	const struct intel_padgroup *gpp;
-	int ret, i;
-
-	for (i = 0; i < community->ngpps; i++) {
-		gpp = &community->gpps[i];
-		ret = gpiochip_add_pin_range(chip, dev_name(dev), gpp->base, gpp->base, gpp->size);
-		if (ret)
-			return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
-	}
-
-	return 0;
-}
-
 static int chv_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
 	const struct intel_community *community = &pctrl->communities[0];
@@ -1542,7 +1524,7 @@ static int chv_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 
 	chip->ngpio = pctrl->soc->pins[pctrl->soc->npins - 1].number + 1;
 	chip->label = dev_name(dev);
-	chip->add_pin_ranges = chv_gpio_add_pin_ranges;
+	chip->add_pin_ranges = intel_gpio_add_pin_ranges;
 	chip->parent = dev;
 	chip->base = -1;
 
-- 
2.50.1


