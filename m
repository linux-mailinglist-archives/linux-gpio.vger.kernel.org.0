Return-Path: <linux-gpio+bounces-19803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8716AB0458
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 22:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E8874E4D69
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 20:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2D6288C02;
	Thu,  8 May 2025 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ku5GUimN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3D71946A0;
	Thu,  8 May 2025 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734903; cv=none; b=s1pKgsjj23eF4/3y5zdYV5xhCS1WAWdqzRPGGHVJxdd8tppG65nsD/s6gc8/mKrtkq5jVhC2Z8oDEYFIfY6nhzHhWEf83sBa/xA4IgdAZU5L1kueQHEioMPB4aVaHWCB5zHNaH8SbY701xyYtLnHL8HG5BVnuQMTqvHvqff1gjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734903; c=relaxed/simple;
	bh=ojYjwhOLOLZviFfBkcdSnQqT1nII+khrxJF96hfNsns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vd2WQEjqNG+OEothaoDH6tGUO94f1ECl6FMAeStt2Y4lg+fuO4bnDRa2nwg6DQX9sOpHtHEF6OHetElHAEo/UhjqfDuD5Myz2Fi4gsvNBycpR28OEp6LnyV01F6aGfOeFDQZ3nRNadvqFB25F0DPfoHGkdJD5xgutC6ZQYi1Ujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ku5GUimN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746734902; x=1778270902;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ojYjwhOLOLZviFfBkcdSnQqT1nII+khrxJF96hfNsns=;
  b=ku5GUimNQni+EnZWCt0i7fRORtLe5mXcu5a2e0IwBAINeDZ7e8UwM7Rn
   CTqAJdcWlaz7aIYsdW00bY2j9wFlU6sSKjtC9IvIrk8aqHzfiwuW9KMN3
   t4frlOtTkqfHQpmTDemMZeGr7jB9/+TtWEJdz+NK+d08UTEOZYImEtTx/
   qMYIfX8IiY9cafX7l1ddDpLjOlbcaOOewJ2/8iUmP3ZUXU5c46qeLIVp/
   rJL/SjTPZDvmiddbhOjMoNBLF9rc+bX4BYV8O++3rblvygXFvbX0IYuSL
   Trz2PNn0EEofkV/ZaQDNnloN8fEODi0q55xiqh5FKsP3u/gDdUB8moOud
   Q==;
X-CSE-ConnectionGUID: kr2IJzKRQnWK+nIt12f5qg==
X-CSE-MsgGUID: CI2SzHrHSdm5sVxUQ91yEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59885494"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59885494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 13:08:20 -0700
X-CSE-ConnectionGUID: rb6gG6rWSKuJIC2WZRv6gw==
X-CSE-MsgGUID: qX3cjfo4RcWnQJoo2a0Feg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136283622"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 13:08:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 887A813B; Thu, 08 May 2025 23:08:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: at91: Fix possible out-of-boundary access
Date: Thu,  8 May 2025 23:08:07 +0300
Message-ID: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

at91_gpio_probe() doesn't check that given OF alias is not available or
something went wrong when trying to get it. This might have consequences
when accessing gpio_chips array with that value as an index. Note, that
BUG() can be compiled out and hence won't actually perform the required
checks.

Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-at91.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 442dd8c80b65..6c2727bd55bc 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1822,12 +1822,16 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	struct at91_gpio_chip *at91_chip = NULL;
 	struct gpio_chip *chip;
 	struct pinctrl_gpio_range *range;
+	int alias_idx;
 	int ret = 0;
 	int irq, i;
-	int alias_idx = of_alias_get_id(np, "gpio");
 	uint32_t ngpio;
 	char **names;
 
+	alias_idx = of_alias_get_id(np, "gpio");
+	if (alias_idx < 0)
+		return alias_idx;
+
 	BUG_ON(alias_idx >= ARRAY_SIZE(gpio_chips));
 	if (gpio_chips[alias_idx])
 		return dev_err_probe(dev, -EBUSY, "%d slot is occupied.\n", alias_idx);
-- 
2.47.2


