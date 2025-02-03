Return-Path: <linux-gpio+bounces-15264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C47A25A8A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173541888599
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BD1205514;
	Mon,  3 Feb 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdutfJgh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1A9204F6B;
	Mon,  3 Feb 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588514; cv=none; b=s+LixVWHxsmd2WqsKXmo8/MWi2ozcj1JWadjJ/HsP6AwaxzDHAMSXPN/NdRyWbZ9a52DiYl1O6Iww4W2OJPO9LgLSCFyK/ydevjFU9V/OmMV63x9fsVMc0GssHhjXrgDx6l8jGSN1uHcs3xecAAohgmD6nHXYnGeImMqkAd9Cs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588514; c=relaxed/simple;
	bh=Q0/S8TSgZBYEkgZoPIN2kR87KNDL6jD9XN+ig6b6CMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJWLisi1EF/bd/YlrwSw+R3JN82q8I2dWUPkI1WibOb5pUqoVar8tn5ZGmzkIQHvK2gbJqThgMAftZ2OvvNy/RX3v4sn7f8qOOygf2DydeCA+0/XFaMSjgqMlpbE/q8C6aTZronUeRAOXGWxMLt6+Uf+1JoPvYL8lb0rfYezjZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdutfJgh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588513; x=1770124513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q0/S8TSgZBYEkgZoPIN2kR87KNDL6jD9XN+ig6b6CMM=;
  b=CdutfJgh3c1k/qAHR2yzLXVIvzSbwK2p8aSxzWaEQTYC/dL8wVfHwrHZ
   7dUobCMgx6bOSycLsUNDwjFLV5xjd73WRALfSipY+ePGji4vI7mToIA5c
   1h/lOlJH+QNt8JfqWo21sZOIck+rAUS24YQk4Xn1x0ZTKSEaFXPKIhbcD
   bIgJkFAMH5WCfzYKz6UyBo9NXKsNMYUBFX9CbBkpAJjWutyrrI32LhMdy
   A9gqoBsHR24pyjZ23vr5itIcxN8SL7II9Bj8ryXvdE9xGabEC+N8oS+ow
   +34XNwTqKZmNf1s/TOV5d/wqk2VaLFnvgq9XdTARlJ+8Ig1sjY96hUqM1
   A==;
X-CSE-ConnectionGUID: LD3KWczBRUyjImmVf6CrDQ==
X-CSE-MsgGUID: Mrf5g5b5Q9ejlCxUHFmADA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56615943"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56615943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:10 -0800
X-CSE-ConnectionGUID: EbRW1W/6SOCdPY2nDthn7Q==
X-CSE-MsgGUID: ovprlQnATziF9hK7thOL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110854189"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 05:15:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9A68A23F; Mon, 03 Feb 2025 15:15:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 00/14] pinctrl: cy8c95x0: Bugfixes and cleanups
Date: Mon,  3 Feb 2025 15:10:26 +0200
Message-ID: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
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

Patches 1-2 are kinda important fixes, patch 3 is half-half, it helps
a lot when debugging, patch 4 is semantically a fix, but can wait.
The rest is number of refactoring and cleaning up changes.

Changelog v2:
- dropped wrong patch (Patrick)
- reshuffled fixes from most important to less important (Linus)
- rebased on top of v6.14-rc1

Andy Shevchenko (14):
  pinctrl: cy8c95x0: Fix off-by-one in the regmap range settings
  pinctrl: cy8c95x0: Avoid accessing reserved registers
  pinctrl: cy8c95x0: Enable regmap locking for debug
  pinctrl: cy8c95x0: Rename PWMSEL to SELPWM
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

 drivers/pinctrl/pinctrl-cy8c95x0.c | 231 ++++++++++++++---------------
 1 file changed, 112 insertions(+), 119 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


