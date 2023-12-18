Return-Path: <linux-gpio+bounces-1615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C42BD817081
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 14:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783DB1F214AD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 13:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3188C129EC6;
	Mon, 18 Dec 2023 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ei54f5qm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EA2129EC1
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906321; x=1734442321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPrQotCcI7GSQ9XbSrD0dWqoNAq5A/koTlmnGV42xvM=;
  b=ei54f5qmAAd+pbxbgYR0BL8dH4vYWRP2GkRgdmvzsz6gfapPhOoek5Wh
   Irg0jjRZT30x+WCI3V4t6qglMcuFvrWlnIMsfSbAcRHBnLwD8aWG4IGPd
   hb6nw9wAR3tlJMr77pJg4di4qOVnHgORnkmBSZzogGEjq6SZagvLHt6X6
   bvA8WEQOsGUyQVFtFYTQ5rsAFp57w/+ChreduHHTbx5hvhodCXIddtxE4
   5FRPIPQBwAdaP2OwaU6QNq230ECA0MPU195MDSqpZymSehfnCllzQhICY
   ogvtzdgCJCp8a98WW3t9pqmSyB+D0Uz3aQjAa/Ci85X7Dau8cazFJ1bSW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2358476"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2358476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="725326436"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="725326436"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 18 Dec 2023 05:31:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B551D387; Mon, 18 Dec 2023 15:31:56 +0200 (EET)
Date: Mon, 18 Dec 2023 15:31:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.8-1
Message-ID: <ZYBJzHyrI92KiPSP@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux GPIO  maintainers,

A small set of cleanups for the Tangier family of drivers. 
Has been a while in Linux Next without any error reported.
Please, pull for v6.8-rc1.


Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.8-1

for you to fetch changes up to 92fc925f838660eec25862a7fa7e6ef79d22f3ea:

  gpio: tangier: simplify locking using cleanup helpers (2023-11-20 13:33:31 +0200)

----------------------------------------------------------------
intel-gpio for v6.8-1

* Use RAII for locking in the Tangier family of drivers (Raag)
* Update Tangier family of drivers to use new PM helpers (Raag)

The following is an automated git shortlog grouped by driver:

elkhartlake:
 -  reuse pm_ops from Intel Tangier driver

tangier:
 -  simplify locking using cleanup helpers
 -  unexport suspend/resume handles
 -  use EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper

----------------------------------------------------------------
Andy Shevchenko (1):
      Merge patch series "Use the standard _PM_OPS() export macro in Intel Tangier GPIO driver"

Raag Jadav (4):
      gpio: tangier: use EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper
      gpio: elkhartlake: reuse pm_ops from Intel Tangier driver
      gpio: tangier: unexport suspend/resume handles
      gpio: tangier: simplify locking using cleanup helpers

 drivers/gpio/gpio-elkhartlake.c | 14 +--------
 drivers/gpio/gpio-tangier.c     | 63 +++++++++++++----------------------------
 drivers/gpio/gpio-tangier.h     |  4 +--
 3 files changed, 22 insertions(+), 59 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



