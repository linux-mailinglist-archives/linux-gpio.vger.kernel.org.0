Return-Path: <linux-gpio+bounces-30468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA9D17E1E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2280301144F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295A33876D1;
	Tue, 13 Jan 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6zKl0Oh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136F3624B9;
	Tue, 13 Jan 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298861; cv=none; b=Fcevqe7mlMd4d2h1JOJTQgPJiGCVyliWrjv17KAs2eanGpwT7Rdo/WJOObmbrKhps02+RllcLUgyOKXDZh22rCW3pu5oVUTzd0h7ZVob9JSSe4f3x9nqQhFAk7y7J2+MdnyIcQrNA/7ixi2X92Ii80PlOYqETrqIu8HuL6BG5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298861; c=relaxed/simple;
	bh=OtHPx15v0/p/SDbppnl7pmTAPWytZXtnK/c6UjIL80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfJloi55+UbBlJ3aJ+8tCe55mwBt7dNJsrtWgJzRVS5f4Ib7dzM1SDYJFFXaTOgYZJIlgao64zZ7ff4RZr831W72t5YkB8HxuoayOfgCo+GZG6ZTAaFhvOfmxzpoqshiu/3HTvtI0qSUdrrRYsNBhPDLdF3lGfdwt52LaJ4iFQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6zKl0Oh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298860; x=1799834860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OtHPx15v0/p/SDbppnl7pmTAPWytZXtnK/c6UjIL80Y=;
  b=i6zKl0Ohtl5+XKuQ6+duwxYQDGAYO0ULgys4IiY2s9meBHdN5wYcalp4
   Pt7woNtrFal2x775KZ492TUZM8waj6VaTrd6edvgviq/oq7PVKuZY1liL
   gQxhV7UaxBEYQxC1nRuP1P9I1pFvDwjMkh+4Z7fhCP8z/qjSoC+2J9gaM
   +IspYhRB/u+IwNsn2hVGB+/ZDHho5wryB8yX/r05PrINsB0/ZU7UWU87W
   7U72M0ApCcXcb5No3KUBCbQCeS16MTU6MENS5D0sOxcY95611Ip4cLy97
   1EaoBJS8TMEAqaxPboawXrhKLG/POXSLX7jWmulltHpnbfA4+tbQprVeY
   A==;
X-CSE-ConnectionGUID: FbMvNhwgQk6+yqbcyTCiXg==
X-CSE-MsgGUID: 9PumUGd8RNaRErQz9bUczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73422885"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73422885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:07:40 -0800
X-CSE-ConnectionGUID: VnqVCtQ+TBKVeMxT5vOR9w==
X-CSE-MsgGUID: 6ThgJ99xTaarc8Tmf+0K+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204154435"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 02:07:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2273A98; Tue, 13 Jan 2026 11:07:38 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: baytrail: Convert to use intel_gpio_add_pin_ranges()
Date: Tue, 13 Jan 2026 11:07:34 +0100
Message-ID: <20260113100734.136729-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-baytrail.c | 41 +++++++++++++-----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index b3a5222a175f..663cb4e9a5fb 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -101,10 +101,12 @@ struct intel_pad_context {
 	u32 val;
 };
 
-#define COMMUNITY(p, n, map)		\
+#define BYT_COMMUNITY(p, n, g, map)	\
 	{				\
 		.pin_base	= (p),	\
 		.npins		= (n),	\
+		.gpps = (g),		\
+		.ngpps = ARRAY_SIZE(g),	\
 		.pad_map	= (map),\
 	}
 
@@ -360,8 +362,15 @@ static const struct intel_function byt_score_functions[] = {
 	FUNCTION("gpio", byt_score_gpio_groups),
 };
 
+static const struct intel_padgroup byt_score_gpps[] = {
+	INTEL_GPP(0, 0, 31, 0),
+	INTEL_GPP(1, 32, 63, 32),
+	INTEL_GPP(2, 64, 95, 64),
+	INTEL_GPP(3, 96, 101, 96),
+};
+
 static const struct intel_community byt_score_communities[] = {
-	COMMUNITY(0, BYT_NGPIO_SCORE, byt_score_pins_map),
+	BYT_COMMUNITY(0, 102, byt_score_gpps, byt_score_pins_map),
 };
 
 static const struct intel_pinctrl_soc_data byt_score_soc_data = {
@@ -483,8 +492,13 @@ static const struct intel_function byt_sus_functions[] = {
 	FUNCTION("pmu_clk", byt_sus_pmu_clk_groups),
 };
 
+static const struct intel_padgroup byt_sus_gpps[] = {
+	INTEL_GPP(0, 0, 31, 0),
+	INTEL_GPP(1, 32, 43, 32),
+};
+
 static const struct intel_community byt_sus_communities[] = {
-	COMMUNITY(0, BYT_NGPIO_SUS, byt_sus_pins_map),
+	BYT_COMMUNITY(0, 44, byt_sus_gpps, byt_sus_pins_map),
 };
 
 static const struct intel_pinctrl_soc_data byt_sus_soc_data = {
@@ -536,8 +550,12 @@ static const unsigned int byt_ncore_pins_map[BYT_NGPIO_NCORE] = {
 	3, 6, 10, 13, 2, 5, 9, 7,
 };
 
+static const struct intel_padgroup byt_ncore_gpps[] = {
+	INTEL_GPP(0, 0, 27, 0),
+};
+
 static const struct intel_community byt_ncore_communities[] = {
-	COMMUNITY(0, BYT_NGPIO_NCORE, byt_ncore_pins_map),
+	BYT_COMMUNITY(0, 28, byt_ncore_gpps, byt_ncore_pins_map),
 };
 
 static const struct intel_pinctrl_soc_data byt_ncore_soc_data = {
@@ -1490,19 +1508,6 @@ static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 	return 0;
 }
 
-static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
-{
-	struct intel_pinctrl *vg = gpiochip_get_data(chip);
-	struct device *dev = vg->dev;
-	int ret;
-
-	ret = gpiochip_add_pin_range(chip, dev_name(dev), 0, 0, vg->soc->npins);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
-
-	return 0;
-}
-
 static int byt_gpio_probe(struct intel_pinctrl *vg)
 {
 	struct platform_device *pdev = to_platform_device(vg->dev);
@@ -1515,7 +1520,7 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 	gc->label	= dev_name(vg->dev);
 	gc->base	= -1;
 	gc->can_sleep	= false;
-	gc->add_pin_ranges = byt_gpio_add_pin_ranges;
+	gc->add_pin_ranges = intel_gpio_add_pin_ranges;
 	gc->parent	= vg->dev;
 	gc->ngpio	= vg->soc->npins;
 
-- 
2.50.1


