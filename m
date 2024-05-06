Return-Path: <linux-gpio+bounces-6128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3078BCA47
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 11:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE06F28362B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 09:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9E61422B7;
	Mon,  6 May 2024 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwW2NZn4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6801422A8
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714986608; cv=none; b=DQWL1NEOQBg9qXJrgJ/Z+pExC2sAx0jwWFLtcrakP0M7qDGyKQtEDcMWZ4mqJTKhUkepqbgQ8yTf4P2RMJULYjQTfK3A9wBr7aN6u43/ixcGmcdbWnKX5T4r+9d560QW73dfG5EepcezZv1DBQUSg/KQM60agkSsakAAuTQZjQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714986608; c=relaxed/simple;
	bh=G6fZLidzP76T/d3COLwajnBynuq4XbNM+oMRVBICoNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q1J5XfLwxR6nYXbIEYQZ0mmPn7jF4zP6njIVpRwcm1VG4oqFbGYV0OpIsgjeKGmycrSD0PWYTRIVrzplpHefeO3gto2LINsIiGc3FajZIFipUmA1Z9kpXmoi8jrco1qWpJ+RjOKSAvCzKCTvO9HP5y6c/phLvxnvsQP5HopHLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwW2NZn4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714986607; x=1746522607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6fZLidzP76T/d3COLwajnBynuq4XbNM+oMRVBICoNo=;
  b=QwW2NZn49ma78ielKCWTxg9fGILmgovChgok/fqD7XW07O/ztlTubQ2M
   3J187EDhz2hYBRe38gM+ieY5WH7isfjZJM7KuKOsIDi6H4oCiHn+2kovd
   Bo/XxZTPx0yaY1Y0VLbdbPWzVjKcjmp5jS7+9+yoXC0VpokpAqZVPOoBB
   CTHJOpjZyClZYz5sg3vhDJxTQoG/G21NpvqDvBeSikNDWb6EO+22wbebb
   0ywvya2SrO82FISrZmp951O7oCQsOWm6rWcJk8AihkJegzVcWmKcrkl/f
   /uF5EJeUFiEk1IdqHlwZl3klPvbyYuoF/hNO8m0qTaUkmq5Fqor9pNs1K
   A==;
X-CSE-ConnectionGUID: w6sx7HFgTzS8OYpamolbSA==
X-CSE-MsgGUID: wQo9SqE3SdKfft9RION7Zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21278014"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="21278014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:10:07 -0700
X-CSE-ConnectionGUID: QSAG4NIjS8ywO8bATglr0Q==
X-CSE-MsgGUID: rkLkGUAIQL2mjEcJc2MOhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="58986314"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2024 02:10:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1A2D52AAF; Mon, 06 May 2024 11:31:47 +0300 (EEST)
Date: Mon, 6 May 2024 11:31:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.10-1
Message-ID: <ZjiVc8DKWkNF7-oL@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux GPIO  maintainers,

A set of updates regarding to GPIO ACPI library and a few Intel GPIO drivers.
The lot has been in LInux Next for a few weeks without reported problems.
Please, pull for v6.10-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit ace0ebe5c98d66889f19e0f30e2518d0c58d0e04:

  gpio: crystalcove: Use -ENOTSUPP consistently (2024-04-05 20:12:39 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.10-1

for you to fetch changes up to ecc4b1418e2399753af7ef304d01f45e8e942286:

  gpio: Add Intel Granite Rapids-D vGPIO driver (2024-04-25 14:57:28 +0300)

----------------------------------------------------------------
intel-gpio for v6.10-1

* New driver for vGPIO controller on Intel Granite Rapids-D
* Update ACPI GPIO library to unify the IRQ code path
* Better GPIO IRQ line labeling for ACPI
* Switched Intel SCH driver to use "mapped" I/O accessors

The following is an automated git shortlog grouped by driver:

Add Intel Granite Rapids-D vGPIO driver:
 - Add Intel Granite Rapids-D vGPIO driver

crystalcove:
 -  Use -ENOTSUPP consistently

gpiolib:
 -  acpi: Set label for IRQ only lines
 -  acpi: Add fwnode name to the GPIO interrupt label
 -  acpi: Pass con_id instead of property into acpi_dev_gpio_irq_get_by()
 -  acpi: Move acpi_can_fallback_to_crs() out of __acpi_find_gpio()
 -  acpi: Simplify error handling in __acpi_find_gpio()
 -  acpi: Extract __acpi_find_gpio() helper
 -  acpi: Check for errors first in acpi_find_gpio()
 -  acpi: Remove never true check in acpi_get_gpiod_by_index()

sch:
 -  Utilise temporary variable for struct device
 -  Switch to memory mapped IO accessors

wcove:
 -  Use -ENOTSUPP consistently

----------------------------------------------------------------
Aapo Vienamo (1):
      gpio: Add Intel Granite Rapids-D vGPIO driver

Andy Shevchenko (10):
      gpiolib: acpi: Remove never true check in acpi_get_gpiod_by_index()
      gpiolib: acpi: Check for errors first in acpi_find_gpio()
      gpio: sch: Switch to memory mapped IO accessors
      gpio: sch: Utilise temporary variable for struct device
      gpiolib: acpi: Extract __acpi_find_gpio() helper
      gpiolib: acpi: Simplify error handling in __acpi_find_gpio()
      gpiolib: acpi: Move acpi_can_fallback_to_crs() out of __acpi_find_gpio()
      gpiolib: acpi: Pass con_id instead of property into acpi_dev_gpio_irq_get_by()
      gpiolib: acpi: Add fwnode name to the GPIO interrupt label
      gpiolib: acpi: Set label for IRQ only lines

 MAINTAINERS                                        |   1 +
 drivers/gpio/Kconfig                               |  18 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-graniterapids.c                  | 383 +++++++++++++++++++++
 drivers/gpio/gpio-pca953x.c                        |   2 +-
 drivers/gpio/gpio-sch.c                            |  35 +-
 drivers/gpio/gpiolib-acpi.c                        |  65 ++--
 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c |   2 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |   2 +-
 include/linux/acpi.h                               |   8 +-
 10 files changed, 468 insertions(+), 49 deletions(-)
 create mode 100644 drivers/gpio/gpio-graniterapids.c

-- 
With Best Regards,
Andy Shevchenko



