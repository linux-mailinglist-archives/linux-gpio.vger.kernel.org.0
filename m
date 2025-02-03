Return-Path: <linux-gpio+bounces-15261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E17EA25A87
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20C473A69B9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8145204F7F;
	Mon,  3 Feb 2025 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9TnG7eu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5352036E1;
	Mon,  3 Feb 2025 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588512; cv=none; b=LFnp4sr5wBsGj/0BdopiMknQO8ycHAluz5pDUDsglplpi0CJp7mVjnr9hYNVhfB56EGGIcBjQ2AJCeZwcQhBojGxiLuCu1Efd2yvIiZPKhUwBhW11YQFWl0izCPHexfwezZVgtxG8V06ZnlYkkSV6tD8fWNCr68jPxHVIZ1/nuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588512; c=relaxed/simple;
	bh=qdhAxd1SxrCHuOZUxamDhWd3yhc2qTWzYWxEB7vVBHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqTETrWw+uYDeblITY7jdSqBUGZ7Zyfi8zK74FWeeZ7d3zz4yMZbUFhUYypUDxCmmetMJD793MqPvQ7pg0FNO16Yeu8ptMFPD1B6dViKpjPf3+YF+DirjY+sZXG8qCISK/TkJfVF6OuwSoG3cKSYNhye3EnC5mlMtDeW0yxTgXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9TnG7eu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588511; x=1770124511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qdhAxd1SxrCHuOZUxamDhWd3yhc2qTWzYWxEB7vVBHM=;
  b=Y9TnG7euhFJ/kvYbVCvq+QsQkOYstKojDshkwuWUtIenMSDpu992SSD/
   5Qd1Ttpl8PUMDRiJZzXs/mlHI6oofQ/pI0cKK69ccBr6UFnQ935FcN2nM
   0X8CRpLjB13e/GsRtHbnBp5hAgp2/Lg53TsJQjZxJYeWZaMUA9zfKOb2Y
   Ss6g1id0xVZEf6eSC9naGIQQov4mhUkB6or1pGZSUgKJEEvfdvIkOIE8b
   jmcDjNaophmOyMIv2+o906fj/zhLt7RrMlBEBYLZT7xTEFDshYdF5gl0j
   GIvSakGdWJ789prDLZ5MM2Qd0kXzFhHrLkUbtexLcSKqnDGuKC93EaIkG
   A==;
X-CSE-ConnectionGUID: 1ZLXNL1LRSSgUxNiiPHtsA==
X-CSE-MsgGUID: siuPeR9kQWeOlanY+qmINw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56615939"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56615939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:10 -0800
X-CSE-ConnectionGUID: TvbQ+AgkTWCB7f7WakKKnw==
X-CSE-MsgGUID: LPn3M4xJQpWhmsFKI9BXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110854188"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 05:15:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AC8F0214; Mon, 03 Feb 2025 15:15:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 01/14] pinctrl: cy8c95x0: Fix off-by-one in the regmap range settings
Date: Mon,  3 Feb 2025 15:10:27 +0200
Message-ID: <20250203131506.3318201-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The range_max is inclusive, so we need to use the number of
the last accessible register address.

Fixes: 8670de9fae49 ("pinctrl: cy8c95x0: Use regmap ranges")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 825bd1e528b5..cda9e1b6fed6 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1438,15 +1438,15 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	switch (chip->tpin) {
 	case 20:
 		strscpy(chip->name, cy8c95x0_id[0].name);
-		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 3 * MUXED_STRIDE;
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 3 * MUXED_STRIDE - 1;
 		break;
 	case 40:
 		strscpy(chip->name, cy8c95x0_id[1].name);
-		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 6 * MUXED_STRIDE;
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 6 * MUXED_STRIDE - 1;
 		break;
 	case 60:
 		strscpy(chip->name, cy8c95x0_id[2].name);
-		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 8 * MUXED_STRIDE;
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 8 * MUXED_STRIDE - 1;
 		break;
 	default:
 		return -ENODEV;
-- 
2.43.0.rc1.1336.g36b5255a03ac


