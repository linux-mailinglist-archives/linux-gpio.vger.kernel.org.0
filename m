Return-Path: <linux-gpio+bounces-15376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE4EA28709
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6CC169574
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00C422B5B6;
	Wed,  5 Feb 2025 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FO7JsVOq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E9422A7F7;
	Wed,  5 Feb 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749176; cv=none; b=XuqOsw8s4B5VleadVo59zlpKzMWQoOOlgGtw+CQP9ZPGKUPFCU0UzGGJxlDnUkCb4C8kB+skH+aIzFfVfNSL3YsUVNQETayU/iiSQCQixQF6402lmyT/jrOjtwfPzyjRrFDmSqopTn+tDEmI4hNMDt0nGBdo4z42A7VhPtqTZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749176; c=relaxed/simple;
	bh=FAWGBV/902TKRkCoeAgWBC7ktaoSHLd/quSF9HPzNa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5SfBeofx7l7PQdyl64XuzUNlFYr8wJLH5dSdn0zlStA4jkJT2KIA26lV1Mm+XGee20FIHiWYE7AbpuKyC8qidusNJFL/dwjIHiUQEjZ19fpzTW99N6SchQVe+v+dVdGsNSSwPdE3WtAPtrrsIV4xdzbLuuRAWv+QDPt2GLesjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FO7JsVOq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749171; x=1770285171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FAWGBV/902TKRkCoeAgWBC7ktaoSHLd/quSF9HPzNa8=;
  b=FO7JsVOqwqEVHoNPk66Cu3yyF6igNU4Ha+yiorMWslq0tPMbNUeYPE97
   4IRgeu6nVeptmVIsvW9rkNBLyUIelCV1ORl2uGxSZJ7OK5+yofOMRRQtY
   kdrWU5n8MA2O27JKQYNb61EbB8qZTOFOS3EAYfavuyMdxPALupmoEa5+C
   bYaFe6OtCddU+21hA+RROQAH1T7EvUfq5nkqdk0RkxBCsGPyhX1BrwQ6k
   EDGlYRwb1WntsnZSyNr03FnwmwTpq2csq03Ll0/81o4M3jHzfLB2+PuzI
   uNJrGzJaboISETbnn8+wgjUPuANXKE9Rl9wxqZ66yzijAfqmjYwPAiKrX
   g==;
X-CSE-ConnectionGUID: cLTuO0jCSTqor+8kOGOUwQ==
X-CSE-MsgGUID: rgzAmvOsRuqOPLO3jkpOdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38512592"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38512592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:51 -0800
X-CSE-ConnectionGUID: +2Doz2KhS2ucDQf96nLBeA==
X-CSE-MsgGUID: WR5q4L4kSmCge2Wizv+91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141744569"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 01:52:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0216A5F0; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 08/10] pinctrl: cy8c95x0: Drop unneeded casting
Date: Wed,  5 Feb 2025 11:51:18 +0200
Message-ID: <20250205095243.512292-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
References: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
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
index 3f2bdaea58b4..4b683401cae1 100644
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


