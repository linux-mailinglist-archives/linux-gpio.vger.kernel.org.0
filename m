Return-Path: <linux-gpio+bounces-28661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEAAC6968D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 84FC43660FF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B62C354AC6;
	Tue, 18 Nov 2025 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjOYhETl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A0303CA8;
	Tue, 18 Nov 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469293; cv=none; b=ZeQ4zPxebL1xvwNQCnkzOBszfXppmwHj27KAtaz8Z88sGWBBPJCvoyi2GTnlZXoKLko4HmGrFNOCqZxp0PPccSlh8erebatWIRm4Gwmea4UosP2iba4tMUBKym0tPJt70xrCMtlyd81LVuNRDCgBssuSoCo48Pqbo2/44kKKyFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469293; c=relaxed/simple;
	bh=XUMQb8dzE3Z0DHQDItyXJu/Lfou2F5O8AUqKyQvr6MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsavQlIoy/M4WigE8uTW3nhkc3Abnal64KUERe+5Md6T95OaszzGpvnH8QPOLYCwPgh6dbcoqdyPdU0psgoJBC+cbUWz3d7Th3zCbPvjUpcusHW6amVEsQg2QB3r2eUFzRmwCn5qMCqlrJ3alTLp9I313tO0uHp7xZ0eIuWHigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjOYhETl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763469291; x=1795005291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XUMQb8dzE3Z0DHQDItyXJu/Lfou2F5O8AUqKyQvr6MU=;
  b=bjOYhETlphZJH4FSUb4OVrjIS8ECgETZweT4+t0ucsvtgNlVvkCpVmvx
   LdS2Q1FvgzEwn5p+b/klniLkTMn5DMH3AgszvXEsngV2d1zDFqnEFtr1M
   fibqzGvSC6MtblfxcdOefyn6iAQMLByosEoDM488De2nqbTvhXWSxoIHy
   OoYbpDUTJxuq5ipu1g64Lkltx3aFKSwJDrdDkDG9wJ2MNnqXowehiQM8F
   /A9RkBtvQDDwBD8T7m8C1DYl1/Q3vstQ7G0U5SuS0q5QGGHsVe5XrqDJK
   fx0wEZxdo/Ph65Oxj3vwptqf9A96Ih1pqm6fc6VggAM+cL3rTw3sosIV3
   A==;
X-CSE-ConnectionGUID: aTHWnELsQ7OUNZ2wWWOKPA==
X-CSE-MsgGUID: P8pNQzwkTLW9PFk7VXS3VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65369104"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65369104"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:34:51 -0800
X-CSE-ConnectionGUID: rQ+mSJDJTkGMBhD0EQKK+g==
X-CSE-MsgGUID: kkdiTCj0TealLXPFFPe8Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191186716"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2025 04:34:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5B23D9A; Tue, 18 Nov 2025 13:34:48 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 2/2] pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()
Date: Tue, 18 Nov 2025 13:34:02 +0100
Message-ID: <20251118123444.1217863-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251118123444.1217863-1-andriy.shevchenko@linux.intel.com>
References: <20251118123444.1217863-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver is ready to use intel_gpio_add_pin_ranges() directly instead of
custom approach. Convert it now.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
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


