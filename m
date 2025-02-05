Return-Path: <linux-gpio+bounces-15388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FEA2894D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 12:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD0363A4688
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 11:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F90822B8A8;
	Wed,  5 Feb 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be0Pq/ma"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF622A7EF;
	Wed,  5 Feb 2025 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754982; cv=none; b=EJ7LTgS9jbTWBpa3Ndz985Fm5PgFHUyz0n0zhXX59ARX9cfBj+KeorMKr9NKJCe9qoBTr+S9mhAsBrtMfne9Z5famSHrWgeDZROEjB19NdCeznJXft7nwBHiRlq5eRUkBdLuLTM09CNsaKBF8jyenHGotzJ98B/p+8N2ul5nmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754982; c=relaxed/simple;
	bh=Zg4CXwqpT5G7TRoRn6pGkMYWE2aidbzifflMeNWqaew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JM/EuW1C4YmS7ssvlttMdRKvo+phcQ1Z4RcsEMcKq7aIF3f4WTdU1NJXDDJwyI87vLxKls5rW94dZcT6Rvb5QbAS/hpsgbHVNeuUprWII5x8GHl6t3FE0wGI4L16QlD7oCqYpzuOgejrXhvp7xctLexiwZoJYd0UkOlDLxSAbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be0Pq/ma; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738754980; x=1770290980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zg4CXwqpT5G7TRoRn6pGkMYWE2aidbzifflMeNWqaew=;
  b=Be0Pq/ma1PyxBf/xb5pZ+/mSl0CfkHI99pSYNXHqJFcj8e0q5il/mgI3
   BOjWEU50XW0ysYAJaZ9p3N+qXciTeURmNhieBVgm4dZEyqyiWVhiYRlZq
   Q1ir1LT048eB7x9eapFMOSaDwlHLdIkxiSWMQ1HEBkNTjqXSiHl+xlqlK
   CwwvgnFcHwwG2Sr5ef+DD+sDzLg8Opr9Nt4bJ3/he0ErVTsPnagnuWh19
   zbk6eTrHsSddmF/H3xH14XsX5Q2ZgvLPcRSYExtq6YQbV9vpM3qAQR2IF
   MA2MjZbepK9nyHul+UV+lq+gOP6FYDvmQ4jULOdDoHsyqo3u2gtVFK5Ux
   Q==;
X-CSE-ConnectionGUID: +LHtaIyJQPyTNtucUOPhdw==
X-CSE-MsgGUID: aCpkuQRDTqa+8JcyiwEdoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61785535"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="61785535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:29:40 -0800
X-CSE-ConnectionGUID: T+ewD1r1QpGvqH7Wh+ynXw==
X-CSE-MsgGUID: pbocRj04RXCyFpsKJFSr3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148079338"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 05 Feb 2025 03:29:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 17946399; Wed, 05 Feb 2025 13:29:36 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v1 1/1] gpiolib: Even more opportunities to use str_high_low() helper
Date: Wed,  5 Feb 2025 13:29:36 +0200
Message-ID: <20250205112936.575493-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The one of previous changes modified the library code to use
helpers from string_choices.h. Nevertheless it misses more
opportunities to convert the code. Here is the second part
of the conversion.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2a58b84766f8..98fba0c392ea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4721,10 +4721,10 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 		return ret;
 	}
 
-	gpiod_dbg(desc, "hogged as %s%s\n",
+	gpiod_dbg(desc, "hogged as %s/%s\n",
 		(dflags & GPIOD_FLAGS_BIT_DIR_OUT) ? "output" : "input",
 		(dflags & GPIOD_FLAGS_BIT_DIR_OUT) ?
-		  (dflags & GPIOD_FLAGS_BIT_DIR_VAL) ? "/high" : "/low" : "");
+		  str_high_low(dflags & GPIOD_FLAGS_BIT_DIR_VAL) : "?");
 
 	return 0;
 }
-- 
2.43.0.rc1.1336.g36b5255a03ac


