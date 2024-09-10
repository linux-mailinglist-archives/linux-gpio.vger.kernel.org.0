Return-Path: <linux-gpio+bounces-9931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BD1972C1E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 10:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 784E21C23E90
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 08:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A61517E004;
	Tue, 10 Sep 2024 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbexHhyN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DF136344
	for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2024 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725956898; cv=none; b=Q33HgaiYQT4cZVfMFVp/ymwrDHzpKYIG7K3B7PgFns1oIn+DsLRakeLgF/xrC/S4Fcn9QWhwNq2jYfH37q+zH/ciTqu4HVGIUNupov0+RKxS+tGrFNSrwuvNNDrFfOAX8ITQd8U3X30ud8DeGzGJVHEStbaKh20f79eTsElOfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725956898; c=relaxed/simple;
	bh=8imfunuhxTYfoLScmxU+j53/bK6zeCbrtX5PrD7EC8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tivcs9eHXmI2qKS/XPfnYq4+A77ma+fepxGOqgoe1vqrYVPb6rAZA04jk9Fz2SjpDV+EM1YQA5LKYGqydiXcZme+CW/NZVpE1HcHlagE9zewOl594MUfE94kNwMJ3MIOLnIRSmbGuSXvLxfAwpRRvMOUCsMlgDP8bDxJmDoOeRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbexHhyN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725956896; x=1757492896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8imfunuhxTYfoLScmxU+j53/bK6zeCbrtX5PrD7EC8A=;
  b=QbexHhyNJ1aeyi+uOMrQyVEOaHTt+9HvkCAAl6F53RFsLoV3oaAC1miy
   QmfapZag7FoIYoS6gNIHRbqEoRRL7RwCqoV4iZoYfmz8xPINOkQMeZXfa
   HeEWICvCQu8JlQSH/EBT25xUaeqd1j5uQZxDxaGB6TbjkZgFHXfcOi/oy
   B2Yfd0PyoWeyrUfsIB6sUhS2otxPTbsRPX0tdXD3fLEZIpblik2ZSvAbv
   PS61uv5ziz86AlBA0VHJ4H9xgNMUwMm8spFH2SorlAjbJJb+b0gJESUBi
   cumWdLghjRDORNmLOPO0q7W2gRQ41PMIDPH+b280rt5CWNYR2mXTX+gKN
   A==;
X-CSE-ConnectionGUID: LoLrq1V1Rjy49lCxroxL7Q==
X-CSE-MsgGUID: 1AwpmiRbTOaIbPdkFEi3eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24556363"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24556363"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 01:28:15 -0700
X-CSE-ConnectionGUID: djlQ/o9aTsqGXqUqd5CYvQ==
X-CSE-MsgGUID: q/+TMKmuQcCe4Ooj8utAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66747720"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2024 01:28:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 65C8B20B; Tue, 10 Sep 2024 11:28:13 +0300 (EEST)
Date: Tue, 10 Sep 2024 11:28:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.12-1
Message-ID: <ZuADHfjPOZCV_osO@black.fi.intel.com>
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

Not so big update to the Intel pin control drivers for the next cycle. No
problems were reported for one or more weeks that patches reside in Linux Next.
Please, pull for v6.12.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.12-1

for you to fetch changes up to 1652e95b17d5666375949524c708afef2574a01e:

  pinctrl: intel: Constify struct intel_pinctrl parameter (2024-09-05 18:09:28 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.12-1

* Enable High Impedance pin configuration support for Intel pin control
* Miscellaneous small improvements here and there

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Drop duplicate return statement

intel:
 -  Constify struct intel_pinctrl parameter
 -  Inline intel_gpio_community_irq_handler()
 -  Introduce for_each_intel_gpio_group() helper et al.
 -  Constify intel_get_community() returned object
 -  Implement high impedance support
 -  Add __intel_gpio_get_direction() helper
 -  Refactor __intel_gpio_set_direction() to be more useful
 -  Move debounce validation out of the lock

----------------------------------------------------------------
Andy Shevchenko (9):
      pinctrl: intel: Move debounce validation out of the lock
      pinctrl: intel: Refactor __intel_gpio_set_direction() to be more useful
      pinctrl: intel: Add __intel_gpio_get_direction() helper
      pinctrl: intel: Implement high impedance support
      pinctrl: intel: Constify intel_get_community() returned object
      pinctrl: intel: Introduce for_each_intel_gpio_group() helper et al.
      pinctrl: intel: Inline intel_gpio_community_irq_handler()
      pinctrl: baytrail: Drop duplicate return statement
      pinctrl: intel: Constify struct intel_pinctrl parameter

 drivers/pinctrl/intel/pinctrl-baytrail.c  |   7 +-
 drivers/pinctrl/intel/pinctrl-intel.c     | 326 +++++++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-intel.h     |   3 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c |   2 +-
 4 files changed, 190 insertions(+), 148 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



