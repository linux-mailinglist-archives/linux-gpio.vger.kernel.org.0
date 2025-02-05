Return-Path: <linux-gpio+bounces-15372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856AA28700
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949CF162F21
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E2E22A7FA;
	Wed,  5 Feb 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bikAaGDF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF082288CA;
	Wed,  5 Feb 2025 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749171; cv=none; b=dSYhEcByW6Z0Ht5RKwqshlnR3B74sQx8CzFbk97DhEkixiuVKfSJNa6XDAahO5QB8Ir3mHBRh4VZHPfUhNvaO8D4jaXRpVJQpMclwFGNrtKsZwJTed4vUZoT3lUFvyvAGjWhDo3tt3r7zuSONpxAvFQ0PbuHSRhUMpfQO7SEukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749171; c=relaxed/simple;
	bh=hhzKzOgFFnHiHjGi4wrMR9k3ED3JIoBxTB0KuuapJNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5NVOhpg2kIzrlSEYw1yxyD1VdD8cWPeMj2ZPEYrhKkQes97cNz/BMBbsqIUPr/AeXS+qS1bPQwrJifr/5iUeq9gG4shNSTWbfyghNhanaTeCqFwXPK7fhMR+qymVU+FFL2y1UclkPWfjvQgwpD9ICI+OEQY7c4H7u0Uwtg4p+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bikAaGDF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749169; x=1770285169;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hhzKzOgFFnHiHjGi4wrMR9k3ED3JIoBxTB0KuuapJNE=;
  b=bikAaGDFM1AMXWqXta5nYFLZ3kZcRvD443iipL45er0+z8QImw6Iypo0
   MFSkLDaYlU/++QcRGPgqC1eTd1TF6iuMjMWDOfgArN9MuroGIDD6BHo4P
   V3yNxnTrY6D7bUiUan+cweJY/+jIcSdbEROaPWXgI5V7R9AWtIVtGL6CB
   mSLj+IxkhGLvS+Sqi9pg89MWqv1G1k1LWl4EarB+k6evsfLTCtLo1E0J0
   1HRu5ut23m3C3fEGbzdwC+H6Oh8NEiWpBqo3ChAQM7cGEjFUkRTHJAAgS
   nPFm93ogHf+Fi51yXhe3CXBZIiwtkw7Eim75N0JvNuGzTbNA6ltsPfFzn
   w==;
X-CSE-ConnectionGUID: pcwbnZfFTkyZ3wKU6dDBfA==
X-CSE-MsgGUID: aX8VfO63RC+BO/fUygYLkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38512583"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38512583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:48 -0800
X-CSE-ConnectionGUID: lJEAHZT3SxOULu47fFvYLg==
X-CSE-MsgGUID: jx33O25dT1a5mCYOAHnioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141744546"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 01:52:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 905AE353; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 00/10] pinctrl: cy8c95x0: Clean up series
Date: Wed,  5 Feb 2025 11:51:10 +0200
Message-ID: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This a set of the cleanups I have collected so far while testing
the driver on Intel Galileo Gen 1 last year.

Changelog v3:
- fixed a typo in patch 1
- dropped applied patches

Changelog v2:
- dropped wrong patch (Patrick)
- reshuffled fixes from most important to less important (Linus)
- rebased on top of v6.14-rc1

Andy Shevchenko (10):
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

 drivers/pinctrl/pinctrl-cy8c95x0.c | 191 +++++++++++++----------------
 1 file changed, 88 insertions(+), 103 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


