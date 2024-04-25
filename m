Return-Path: <linux-gpio+bounces-5846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E768B20C9
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 13:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A79C1F26353
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 11:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B9412AAF3;
	Thu, 25 Apr 2024 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMkt8iyI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA72AEF1
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714046160; cv=none; b=sGI19wqY8s+DFGNUz2IKD0x5ESoFjXSOFC6ROVofHiU0JEO3gCf0suKB7YU9zd+LsJrU3PkjmNw9yroFZyWQQPS4z1j+LKMGo6lgbeZ43WVhuKVYoh4MGrdL0Y84DxXbtw6Q83Z932NpQdLKJ8SHo6i6BDC9FyIcWSf3Af78qek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714046160; c=relaxed/simple;
	bh=r3pRjxpIZHmEpRbogQ4vWIVk3Y5dqkyWL3sFWRuM1BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zmn9u6SU0GutgXEXE4qNXoTMFWfd3YZy08vHtbMSZA76bPB2l6Ii1QOGalwKdB7FPD5Muk1kQL42KT+Yg4a2zEE1YKL6/iI5v+4y9p5mUwvvSgo/JlKmXCsiVHDGNYbDbhw1/QUNJxc01eo5El83YJBFQVTQXFnov4N9z+hnIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMkt8iyI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714046159; x=1745582159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3pRjxpIZHmEpRbogQ4vWIVk3Y5dqkyWL3sFWRuM1BM=;
  b=cMkt8iyIZYur2iktfUGTRHUo45vFigL1CrHbGSN4DISOwEIn/XMhOfxq
   tRg3Y4Mc1Sidz5oRCIORm60dVKNLuG1Kq2SEfnHCrzLYLDqxwCN70x3iD
   RyYGotAzzOvybq337CAqk/wDeKLXiZTgs34f7VSvolFgB9pGsSeEGnw03
   f6w51Z+tmTVSsWFv0euLtmfQxu/BegPjN1++2LkDDoXcLp/Hh3/7XPfPq
   v6Quiie/BRXTJwQWCFvzUaf3K+R5LyZYBJp47oUuIa25v608lS00wEO+h
   MDsh9MU+Rmeqd2wHK1CBe6Tgxn5Ahq/33nBRJzj/N9BUjhKZZMCr7ntSU
   A==;
X-CSE-ConnectionGUID: svMaqlgMRiqBflYsy3KquQ==
X-CSE-MsgGUID: Au6zgJjCQOWgyNCQSRreaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9550791"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9550791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 04:55:58 -0700
X-CSE-ConnectionGUID: S6SsojVrQB2C+mUiR0bPhQ==
X-CSE-MsgGUID: JAA9MIA9R1qMlaqVXp9qPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="25673704"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2024 04:55:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CE7BF288; Thu, 25 Apr 2024 14:55:55 +0300 (EEST)
Date: Thu, 25 Apr 2024 14:55:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.9-2
Message-ID: <ZipEyyjM955f7ABy@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux GPIO  maintainers,

One small fix for long-standing non-critical issue in Intel Tangier driver
for v6.9-rcX. The change was tested on Intel Edison platform along with the
Linux Next for a few weeks w/o issues reported. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit ace0ebe5c98d66889f19e0f30e2518d0c58d0e04:

  gpio: crystalcove: Use -ENOTSUPP consistently (2024-04-05 20:12:39 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.9-2

for you to fetch changes up to 7d045025a24b6336d444d359bd4312f351d017f9:

  gpio: tangier: Use correct type for the IRQ chip data (2024-04-12 23:41:05 +0300)

----------------------------------------------------------------
intel-gpio for v6.9-2

* Make data pointer dereference robust in Intel Tangier driver

The following is an automated git shortlog grouped by driver:

tangier:
 -  Use correct type for the IRQ chip data

----------------------------------------------------------------
Andy Shevchenko (1):
      gpio: tangier: Use correct type for the IRQ chip data

 drivers/gpio/gpio-tangier.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



