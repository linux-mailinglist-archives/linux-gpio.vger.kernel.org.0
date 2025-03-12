Return-Path: <linux-gpio+bounces-17488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE51A5D9CB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B24189C7A0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83FF23AE95;
	Wed, 12 Mar 2025 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fo8fYdXw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D131323BFA9
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741772713; cv=none; b=Ziui1YkVvF2lQgktLosN1vP7beUFd/pOWWf5LaBl8HOvNIc/XjFF4Yyd0isUeZjYTecMWtMQQrY8vNMRhWqdBzl6dQHPuHD83g+tn8gkovoZnuKRyBEVD+Ws5e8JnylVMQf6+9BmSCmDZNQSxmEIWaSuU4sq8tqJzWGAk/8Wq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741772713; c=relaxed/simple;
	bh=GI3+tHirpIJcTSJgxDUrd/qzuJ2XhQ+4ZfZtXpmp238=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f7LRZGlHLt9a1BZB9y4KhoWcfSKsBws1pA3/7BEFr+vXaDBDgy6oLCvbdbcBnTI3cOgsoQue7+Yt3GEZ7g0tQb4+7AX2fbcywSEzXYshR+IgvrkuaudoMeD5A4NuMdRPa9IFkMQsx24lT3mOUAwsF/LuMQZT5tBf8ok/MrLTAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fo8fYdXw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741772712; x=1773308712;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GI3+tHirpIJcTSJgxDUrd/qzuJ2XhQ+4ZfZtXpmp238=;
  b=fo8fYdXwZPP4MJZOeYvnE3yA/feWJMyS/9FIQ6dLBS5Z8wJzj7Rmvdxj
   5vq3T3op0Ruz7K/7d3y0jehCzzOxSRyWDMew73SHfy0XLhUbF59J+rvOa
   kXnHakEUEXD/mZ3UMHZ5B9KaUrRdXY+++Qu8CUaVYP0EvA0Cmzz4Fzsk5
   TRIvE+8W/uBNZSJgLbG+hJYDaK1BIpdEmZ4Bm/MeEsKzaZo+7BVAIvUTt
   U6galq+j8m7X/7q5zjcyCPnEd9UeAvbKqQ2FLNtmqzQpDNWD9taMf2f4J
   cUJl3cJjfn0wHnSkOgkjmuZfuk4qDMGBMvNdNyVTVy75CpJHZE836quux
   g==;
X-CSE-ConnectionGUID: enzHHHs+RtiEhPRGUSJgJw==
X-CSE-MsgGUID: HLKmZlSlSwW27/lYNHW3cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42009659"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42009659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:45:11 -0700
X-CSE-ConnectionGUID: kG6LIeXFSXudjflSe33qeQ==
X-CSE-MsgGUID: lKbuFwH0QNm6IGa6SVgJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120535769"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 12 Mar 2025 02:45:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AFFED1F2; Wed, 12 Mar 2025 11:45:07 +0200 (EET)
Date: Wed, 12 Mar 2025 11:45:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.15-1
Message-ID: <Z9FXo5qO8RCZCKzk@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux pin control  maintainers,

A batch of the updates to the Intel pin control driver. Due to driver core
changes some other subsystem drivers were touched and the respective
maintainers provided needed tags. The changes were in Linux Next for a few
weeks without any problems reported. Please, pull for v6.15-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.15-1

for you to fetch changes up to 0ee2261d08aa21a7327f145cbf1bfb6ac2205c7d:

  pinctrl: intel: drop repeated config dependency (2025-03-03 16:20:51 +0200)

----------------------------------------------------------------
intel-pinctrl for v6.15-1

* Introduce devm_kmemdup_array() and convert Intel pin control drivers
* Update PWM handling for the cases when it's provided by Intel pin control
* Miscellaneous fixes, updates, and cleanups

The following is an automated git shortlog grouped by driver:

baytrail:
 -  copy communities using devm_kmemdup_array()
 -  Use dedicated helpers for chained IRQ handlers

cherryview:
 -  use devm_kmemdup_array()

devres:
 -  Introduce devm_kmemdup_array()

driver core:
 -  Split devres APIs to device/devres.h

err.h:
 -  move IOMEM_ERR_PTR() to err.h

iio:
 -  adc: xilinx-xadc-core: use devm_kmemdup_array()
 -  imu: st_lsm9ds0: Replace device.h with what is needed

input:
 -  ipaq-micro-keys: use devm_kmemdup_array()
 -  sparse-keymap: use devm_kmemdup_array()

intel:
 -  drop repeated config dependency
 -  copy communities using devm_kmemdup_array()
 -  Fix wrong bypass assignment in intel_pinctrl_probe_pwm()
 -  Import PWM_LPSS namespace for devm_pwm_lpss_probe()

lynxpoint:
 -  Use dedicated helpers for chained IRQ handlers

MAINTAINERS:
 -  Add pin control and GPIO to the Intel MID record

pwm:
 -  lpss: Clarify the bypass member semantics in struct pwm_lpss_boardinfo
 -  lpss: Actually use a module namespace by defining the namespace earlier

pxa2xx:
 -  use devm_kmemdup_array()

tangier:
 -  use devm_kmemdup_array()

----------------------------------------------------------------
Andy Shevchenko (9):
      pinctrl: baytrail: Use dedicated helpers for chained IRQ handlers
      pinctrl: lynxpoint: Use dedicated helpers for chained IRQ handlers
      MAINTAINERS: Add pin control and GPIO to the Intel MID record
      pwm: lpss: Clarify the bypass member semantics in struct pwm_lpss_boardinfo
      pinctrl: intel: Fix wrong bypass assignment in intel_pinctrl_probe_pwm()
      driver core: Split devres APIs to device/devres.h
      iio: imu: st_lsm9ds0: Replace device.h with what is needed
      Merge patch series "Split devres APIs to device/devres.h and introduce devm_kmemdup_array()"
      Merge tag 'ib-devres-iio-input-pinctrl-v6.15' into intel/pinctrl

Raag Jadav (11):
      err.h: move IOMEM_ERR_PTR() to err.h
      devres: Introduce devm_kmemdup_array()
      pinctrl: intel: copy communities using devm_kmemdup_array()
      pinctrl: baytrail: copy communities using devm_kmemdup_array()
      pinctrl: cherryview: use devm_kmemdup_array()
      pinctrl: tangier: use devm_kmemdup_array()
      pinctrl: pxa2xx: use devm_kmemdup_array()
      iio: adc: xilinx-xadc-core: use devm_kmemdup_array()
      input: sparse-keymap: use devm_kmemdup_array()
      input: ipaq-micro-keys: use devm_kmemdup_array()
      pinctrl: intel: drop repeated config dependency

Uwe Kleine-König (2):
      pinctrl: intel: Import PWM_LPSS namespace for devm_pwm_lpss_probe()
      pwm: lpss: Actually use a module namespace by defining the namespace earlier

 MAINTAINERS                                 |   7 ++
 drivers/iio/adc/xilinx-xadc-core.c          |   4 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c |   2 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c |   2 +-
 drivers/input/keyboard/ipaq-micro-keys.c    |   5 +-
 drivers/input/sparse-keymap.c               |   3 +-
 drivers/pinctrl/intel/Kconfig               |   2 -
 drivers/pinctrl/intel/pinctrl-baytrail.c    |  11 +--
 drivers/pinctrl/intel/pinctrl-cherryview.c  |   5 +-
 drivers/pinctrl/intel/pinctrl-intel.c       |   8 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c   |   5 +-
 drivers/pinctrl/intel/pinctrl-tangier.c     |   5 +-
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c        |   8 +-
 drivers/pwm/pwm-lpss.c                      |   4 +-
 include/linux/device.h                      | 119 +------------------------
 include/linux/device/devres.h               | 129 ++++++++++++++++++++++++++++
 include/linux/err.h                         |   3 +
 include/linux/io.h                          |   2 -
 include/linux/platform_data/x86/pwm-lpss.h  |  33 ++++++-
 19 files changed, 200 insertions(+), 157 deletions(-)
 create mode 100644 include/linux/device/devres.h

-- 
With Best Regards,
Andy Shevchenko



