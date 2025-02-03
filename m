Return-Path: <linux-gpio+bounces-15271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E06CBA25A98
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FFEC1888C03
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645102063FD;
	Mon,  3 Feb 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6wS6G45"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138A205AD8;
	Mon,  3 Feb 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588518; cv=none; b=O3UxNgJ6yWw0pKGWCfJVb5NVF5bNR2QPZY2ot3/uIpajaumCNuisK8Q61JX0GiImA0I7Pz0zbxov5s9zLA7g/JjpH/jl+i5u7gfPNxi3bMtU6SkJU+15eYTosvZppL+GC2yEWiIx+QoXSgHA6k/MyjW3jWHZhsJjqvdhjHQt6Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588518; c=relaxed/simple;
	bh=dlhC7rJ9n0lI/L8+C6wSGYuSzKu7DPQBQfwHK8wMcwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQbIOAR0P49NMn/PhDuSuKvm/ACYzvECp8Hmd+/NZwq0T5yjsxwyGoG5u3omRmKvSO8BwliJFwTn5a90twAx3b6+Pbw/nHhw32ceDyS7dfO70X9+hOPo/sN2xlIZeM7CBjZ/K5eLTLOXGI6HpFAb5uLrkjm4+vHrp9RMGF7+r2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6wS6G45; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588516; x=1770124516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dlhC7rJ9n0lI/L8+C6wSGYuSzKu7DPQBQfwHK8wMcwQ=;
  b=m6wS6G45VXJC3G9/pewhKjh82p8huAZYByBy1CTmmpex5RryJ3Cxo3LD
   7/VY0xHcj8Rs0Vew+/IaYTwHfFvc6214qLZ7uBDNC9BigPZ+2la8PxPKX
   Wsz9EPTU99SQoyJyXRMS+n1isVEpmMwzxFqYW1aMPVUDj4mW7DbvDArNS
   oAu0nNbSB7yESym1ycpEyhei1jUANDt9bzNorF7+K/ZBDHTxVY5M+DVnb
   SKRFAlIL2ABFznrBjKND2XeIxl2AAfduNQo8vzs9425MHPjWGvDy/XoV0
   42QSXCU0UVBgSUoak4fGbh8v/fUTO7wNKSzLP5CZRfUeY73LX+bUtVayv
   w==;
X-CSE-ConnectionGUID: TbF0+YEvSuioQ/8hibbQUg==
X-CSE-MsgGUID: FOys3ILMTFyJv+a+i20+Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56615967"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56615967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:12 -0800
X-CSE-ConnectionGUID: RwfInn77Ql2jIXx/KRQh2Q==
X-CSE-MsgGUID: FVc0M7a0R7qOCfkSutp3/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110854207"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 05:15:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2FB67775; Mon, 03 Feb 2025 15:15:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 12/14] pinctrl: cy8c95x0: Drop unneeded casting
Date: Mon,  3 Feb 2025 15:10:38 +0200
Message-ID: <20250203131506.3318201-13-andriy.shevchenko@linux.intel.com>
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

The 'arg' variable in cy8c95x0_gpio_get_pincfg() is already type of u16.
No need to cast it, so drop unneeded casting.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index a83a1b13a97f..28374490d47d 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -839,7 +839,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	if (param == PIN_CONFIG_OUTPUT_ENABLE)
 		arg = !arg;
 
-	*config = pinconf_to_config_packed(param, (u16)arg);
+	*config = pinconf_to_config_packed(param, arg);
 	return 0;
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


