Return-Path: <linux-gpio+bounces-14889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A6A151A5
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 667833A3487
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE90478F34;
	Fri, 17 Jan 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds8ChA0V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51A20B20;
	Fri, 17 Jan 2025 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123791; cv=none; b=YfsZpFKcWysm0//mRB31aZ6bUXTfo9AUff98Rc3ZD91SAnecsl7p6rTtzJeWPrJQpeXlt75wOUA/Ovtffx2snQM4nPdIPrLN/tWBqSe3Ai0dgxr7mgS9YUg7Feh4OxNM8ThuT4UO0ciMWYYViG4YSK8ce0DxOwsKGdwi/8DO1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123791; c=relaxed/simple;
	bh=ObaX/brm+Wu71o72rOPaIkQG9913isA31L8Nsh93Y1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdOLIVRp5/StFezVnV1TGzViQ+mzL718E30DHDpMBkxu5vTWyDPI2POe7VSZvBz0Db/bY3u4UA8HU0OaSW+35CO1wDRwILSb0/xqXGlFD0M18+XneZu45a0wTy0HRU4T2yXfQEHJbfwPjGw03zM/2UUhkAR4ViP6nDHesECdj04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds8ChA0V; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123790; x=1768659790;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ObaX/brm+Wu71o72rOPaIkQG9913isA31L8Nsh93Y1E=;
  b=ds8ChA0VahE6HpDuANlEf7l5/QbvfNQZ6srFDurWSyCq9+rSnvPBaHL8
   c4kuz2xTID6k+5cpkx+73yO9xDCfxdhW95VTnzUBlaLsdTa0matn3AyRe
   +IH9V+xGxxE2pBiTTwZwnjd5MdqivbK/NSVgrHLMvqVKA97NdrshU//pT
   QYOOc8S0yHIE+yY+uC3TdtCq2hoWsWW+mGGi2Z0/5f3zjxpsI7aiOsm71
   FFDx9BoFDT+h6xRaV7DZU6WmbKg0X/cS9g7tZIFZgIvLw3QTeZ2ssUQLt
   90jKBlv6XGVoDhGis7IbagP5eLLbYt60HwvaETm59sRc9JOog6cVbjMTS
   Q==;
X-CSE-ConnectionGUID: JsqvT9ejTaKa2tcAC75Ysg==
X-CSE-MsgGUID: qBLCdNH8S/uoHyt7gGq19A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792817"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792817"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:09 -0800
X-CSE-ConnectionGUID: px3c6aCTQ4uhlDru1f2vFg==
X-CSE-MsgGUID: cLGDraj2SI63XNKuljk+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671220"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1DBFF2F2; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 00/16] pinctrl: cy8c95x0: Bugfixes and cleanups
Date: Fri, 17 Jan 2025 16:21:44 +0200
Message-ID: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This a set of the bugfixes and cleanups I have collected so far while
testing the driver on Intel Galileo Gen 1 last year.

Andy Shevchenko (16):
  pinctrl: cy8c95x0: Respect IRQ trigger settings from firmware
  pinctrl: cy8c95x0: Rename PWMSEL to SELPWM
  pinctrl: cy8c95x0: Enable regmap locking for debug
  pinctrl: cy8c95x0: Fix off-by-one in the regmap range settings
  pinctrl: cy8c95x0: Remove incorrectly set fields in regmap
    configuration
  pinctrl: cy8c95x0: Avoid accessing reserved registers
  pinctrl: cy8c95x0: Use better bitmap APIs where appropriate
  pinctrl: cy8c95x0; Switch to use for_each_set_clump8()
  pinctrl: cy8c95x0: Transform to cy8c95x0_regmap_read_bits()
  pinctrl: cy8c95x0: Remove redundant check in
    cy8c95x0_regmap_update_bits_base()
  pinctrl: cy8c95x0: Replace 'return ret' by 'return 0' in some cases
  pinctrl: cy8c95x0: Initialise boolean variable with boolean values
  pinctrl: cy8c95x0: Get rid of cy8c95x0_pinmux_direction() forward
    declaration
  pinctrl: cy8c95x0: Drop unneeded casting
  pinctrl: cy8c95x0: Separate EEPROM related register definitios
  pinctrl: cy8c95x0: Fix comment style

 drivers/pinctrl/pinctrl-cy8c95x0.c | 235 ++++++++++++++---------------
 1 file changed, 113 insertions(+), 122 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


