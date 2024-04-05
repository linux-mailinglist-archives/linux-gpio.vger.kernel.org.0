Return-Path: <linux-gpio+bounces-5133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0DC89A3D2
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Apr 2024 20:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8D51F22BC7
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Apr 2024 18:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C7C171E4E;
	Fri,  5 Apr 2024 18:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFMmrggK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BA0171666
	for <linux-gpio@vger.kernel.org>; Fri,  5 Apr 2024 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712340174; cv=none; b=Z2eQ7bgTUUOv4JoaFSMo1NAOz3zUpO2R9CVvQBh1THYgLOp3VZbgSdKxa+ex9LuhAVZdo7cYTXdQSELGmOeguEWsijgZ/yGFVGpoponf5NJgaEaEGDS0HUUxqNMyB9KNSjKl4vCEn+fuVhyiKozUSusFSpcN6XciYk7j0VYqgoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712340174; c=relaxed/simple;
	bh=AWBr/BR3WY/lRHF3ZYiAOG2gdvh9pncxoWbHSCnbDMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OdOx3ESOfoiySSuC5YbJszigMXEVWOD3gKKB3RQgg09+z/A77TmGJHNRvcidiPeTBjuVRlbLz3M3GVvUhyVkCQg6T0w6FF53ABXcldMOQ1Ole0w4Neq1K/cuXsRmSnAum4g8XcoAS3+dYXHDdWfr4SgOlOcUeJub3RZMSpWabPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFMmrggK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712340172; x=1743876172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AWBr/BR3WY/lRHF3ZYiAOG2gdvh9pncxoWbHSCnbDMg=;
  b=nFMmrggKo7BkT/nfSuFEtF6i0M8ehNppnjVrSA5O5d9GglOVNyJb6iRw
   Eb2s7Jqf1ynOmh0FPkAo7yikQOvmp53rxa0H7Vw8qcxj2BN/z6QLb3z9t
   CdKARce2rJfU7Hub2T57rnQkJYwMAhNoF68eVbJiFGIW12mzEUpdyJ5zv
   dNBtjn7rHbUUahF9tekpD/ONFWDdEhLS//cyaBtMB3lKfNx52mlrMu7RU
   VbjPMIdOuIuWZWYckaXoPj4tbCIIR6fJOP3S7UR7oI3h9uZYemjgA9eQX
   lVPMvKtiAWSh0neQYya8wwmdobK7knUPkhRFJ2YTYJW48WEGX48aeJpw1
   w==;
X-CSE-ConnectionGUID: xiriPV1HQOWSphMChMHBQQ==
X-CSE-MsgGUID: pU71PJEIT9+bTnHVgXcLIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7913996"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7913996"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 11:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="937088073"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="937088073"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2024 11:02:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AED3B3E5; Fri,  5 Apr 2024 21:02:48 +0300 (EEST)
Date: Fri, 5 Apr 2024 21:02:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.9-1
Message-ID: <ZhA8yEWemLejQ_BK@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux GPIO  maintainers,

Fix error codes in couple of drivers, so all the internal check will work
correctly. Please, pull for v6.9-rcX.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.9-1

for you to fetch changes up to ace0ebe5c98d66889f19e0f30e2518d0c58d0e04:

  gpio: crystalcove: Use -ENOTSUPP consistently (2024-04-05 20:12:39 +0300)

----------------------------------------------------------------
intel-gpio for v6.9-1

* Fix returned code in the error path in Intel PMIC GPIO drivers

The following is an automated git shortlog grouped by driver:

crystalcove:
 -  Use -ENOTSUPP consistently

wcove:
 -  Use -ENOTSUPP consistently

----------------------------------------------------------------
Andy Shevchenko (2):
      gpio: wcove: Use -ENOTSUPP consistently
      gpio: crystalcove: Use -ENOTSUPP consistently

 drivers/gpio/gpio-crystalcove.c | 2 +-
 drivers/gpio/gpio-wcove.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



