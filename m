Return-Path: <linux-gpio+bounces-29064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63659C84A36
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 12:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6568A4E1446
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 11:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D153101C9;
	Tue, 25 Nov 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ao4SKUwC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D432EE607
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068931; cv=none; b=QOcdWyLARNK08LVTExygi3Rk8bodOxIO6U53o9y5kdcVtk954utDYmmNBcVkhFaPES8Pih5JiFF8dRwYL8mVrTSrhI9ZQ5pfWpNaKqlRylf0/lLG4i27IvPp/igY+YET9bEesZOmm0Vy0T2NNUkTL/pMeYqjlotvK9f6f96sd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068931; c=relaxed/simple;
	bh=zyBhxbc2EgUqjcFbHYYu+L6SiinmVgNN79gDfC4tlmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jn52ExyWzTwU4JlhSVmFAvWWYtLf0weXD/5b6dqBzaAo8aIbzssbUjQ3ypBpodQUrt7IhH29SHLYTimZRn3rrN9KHIUSgF+4LIHlq9h6ve82c9LfG+4alIFwQk6T2EXPO5sdsPx6CaL+Q1LqF0ttzz/kiOZrkUXmAW9PtsNo3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ao4SKUwC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764068930; x=1795604930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zyBhxbc2EgUqjcFbHYYu+L6SiinmVgNN79gDfC4tlmI=;
  b=ao4SKUwC47ETxkRbCT+MXWpV3zUVOIxG3zpaHc3Pi8RwYp1OcTXWjaix
   BzPd2WoU/ChM+tKM3MTSvnryVegv1bH5DEXiasqMFnV72H5HfxF0X1hRs
   Os3W4dK1FGRM2xsZR7fcBC10ILt0B5MXl2njoXeEET7e9VrdLUWCjIX2h
   pB2Uglw1jqd+/xh1IHSRMuwOczZb7ZxEsOc0ShfaNSAgnAqz+K5JpVNBK
   7rMfW5mjkfMRbX2cLlWXgY92yTEjXfPg5fUPHD2DVdkeJVCoAgektDHqn
   Z3ZjGpRbGmYDewtJiTzNUL6kv2pVPPmJkwc9cRj+sYSfwenc5bpUzPC0L
   Q==;
X-CSE-ConnectionGUID: wubIwPrwSmmPKE8DsaBEWQ==
X-CSE-MsgGUID: fFd5v3N0SemB/XJjEn6DpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91569957"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="91569957"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:08:49 -0800
X-CSE-ConnectionGUID: M1eScFASRCqYITMFRXS0dw==
X-CSE-MsgGUID: KLisfExOQOuIr0WUaPF42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192847125"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2025 03:08:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CEC7EA0; Tue, 25 Nov 2025 12:08:46 +0100 (CET)
Date: Tue, 25 Nov 2025 12:08:46 +0100
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.19-1
Message-ID: <aSWOPtM70PtydVLg@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux pin control  maintainers,

A medium clean up of the Intel pin control drivers. Has been for a few weeks
in Linux Next w.o. any problem reported. Please, pull for v6.19-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.19-1

for you to fetch changes up to 8daf70e6aa4118fa71a9eb5f361f1a29567e12ed:

  Merge patch series "pinctrl: intel: Export intel_gpio_add_pin_ranges() and use it" (2025-11-18 15:14:06 +0100)

----------------------------------------------------------------
intel-pinctrl for v6.19-1

* Add and use common macro INTEL_GPP() to avoid duplication
* Export intel_gpio_add_pin_ranges() and reuse it instead of custom copies
* Unify error messages with help of dev_err_probe()

----------------------------------------------------------------
Andy Shevchenko (26):
      pinctrl: baytrail: Unify messages with help of dev_err_probe()
      pinctrl: cherryview: Unify messages with help of dev_err_probe()
      pinctrl: intel: Unify messages with help of dev_err_probe()
      pinctrl: lynxpoint: Unify messages with help of dev_err_probe()
      pinctrl: tangier: Unify messages with help of dev_err_probe()
      Merge patch series "pinctrl: intel: Unify error messages"
      pinctrl: intel: Introduce INTEL_GPP() macro
      pinctrl: alderlake: Switch to INTEL_GPP() macro
      pinctrl: cannonlake: Switch to INTEL_GPP() macro
      pinctrl: icelake: Switch to INTEL_GPP() macro
      pinctrl: jasperlake: Switch to INTEL_GPP() macro
      pinctrl: lakefield: Switch to INTEL_GPP() macro
      pinctrl: meteorlake: Switch to INTEL_GPP() macro
      pinctrl: meteorpoint: Switch to INTEL_GPP() macro
      pinctrl: tigerlake: Switch to INTEL_GPP() macro
      pinctrl: sunrisepoint: Switch to INTEL_GPP() macro
      Merge patch series "pinctrl: intel: Consolidate struct intel_padgroup initialisers"
      pinctrl: cedarfork: Switch to INTEL_GPP() macro
      pinctrl: denverton: Switch to INTEL_GPP() macro
      pinctrl: emmitsburg: Switch to INTEL_GPP() macro
      pinctrl: cherryview: Switch to INTEL_GPP() macro
      pinctrl: elkhartlake: Switch to INTEL_GPP() macro
      Merge patch series "pinctrl: intel: Convert the rest to use INTEL_GPP()"
      pinctrl: intel: Export intel_gpio_add_pin_ranges()
      pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()
      Merge patch series "pinctrl: intel: Export intel_gpio_add_pin_ranges() and use it"

 drivers/pinctrl/intel/pinctrl-alderlake.c    | 68 ++++++++++------------
 drivers/pinctrl/intel/pinctrl-baytrail.c     | 20 +++----
 drivers/pinctrl/intel/pinctrl-cannonlake.c   | 68 ++++++++++------------
 drivers/pinctrl/intel/pinctrl-cedarfork.c    | 37 +++++-------
 drivers/pinctrl/intel/pinctrl-cherryview.c   | 86 +++++++++-------------------
 drivers/pinctrl/intel/pinctrl-denverton.c    | 21 +++----
 drivers/pinctrl/intel/pinctrl-elkhartlake.c  | 43 ++++++--------
 drivers/pinctrl/intel/pinctrl-emmitsburg.c   | 33 +++++------
 drivers/pinctrl/intel/pinctrl-icelake.c      | 60 +++++++++----------
 drivers/pinctrl/intel/pinctrl-intel.c        | 36 ++++++------
 drivers/pinctrl/intel/pinctrl-intel.h        | 11 ++++
 drivers/pinctrl/intel/pinctrl-jasperlake.c   | 34 +++++------
 drivers/pinctrl/intel/pinctrl-lakefield.c    | 26 +++------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 28 ++++-----
 drivers/pinctrl/intel/pinctrl-meteorlake.c   | 54 ++++++++---------
 drivers/pinctrl/intel/pinctrl-meteorpoint.c  | 46 ++++++---------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 26 +++------
 drivers/pinctrl/intel/pinctrl-tangier.c      |  3 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c    | 70 ++++++++++------------
 19 files changed, 319 insertions(+), 451 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



