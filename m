Return-Path: <linux-gpio+bounces-12444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2166E9B8F15
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C185C1F22F3E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 10:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9655918660C;
	Fri,  1 Nov 2024 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoawJgJt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66612189B8E
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456515; cv=none; b=mnDHrPAILRQ6vB3ih3eE9kipmp3igB8nreq+CZb/6nwePjmQbSyHs5+6rysmcQr4rIfEPGu7t2uLm2bDNFhRgnnuxJIqgTHhfdZk0erMLXBk9az8RfiYzQM3po16YXF8mo5cMUH/ZbiviKY+V9Zrm5iw0+azu6XIpBNmWTQoqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456515; c=relaxed/simple;
	bh=DHlg4aB+Ghf2j6so3ed2FEq2x7Xpqss7RPjGRqk/H70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7qQmVFNg74Hr1O84QcdaU2qD53jCYMBa5ruq8BfCqSQB+FlOEQLIIdp1/TTTaoXuYfpwUHViA5ITkx5VArXDvQo7opqJRVC9vwHWfpFXI0wQD2/P4VBnMlY7CGwoiXnbwWuI+MT/Me2nOMFQ4fgb/2Sg5uZA0V+d/0ptNnOjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoawJgJt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730456514; x=1761992514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHlg4aB+Ghf2j6so3ed2FEq2x7Xpqss7RPjGRqk/H70=;
  b=CoawJgJtD46uoWves7B/KIkeQPOtCxE1PooR1Fm6W+0XzVndXk5fPKKc
   F+G/q/fy4BrjNDHKYy0xQfsVMUyi+zlen0KafGbSqQfAgUzDbupNALNWn
   8EjGEdFaWJAVqqIL7rfwN1No/BwUJMG3CxXRktwD8+t193Lqoa4Ve394C
   Ax3+RuN2g5sLWUFnBt4Qq23JHlha2nmAfELEuLFRDFPOM0k9bXOKmh2ho
   LbQXS2Z/l1wkpZ6PS3aPmzjUBFd4JvDihsr74s4zz5I27Gpxf0swGBkTx
   1sNHZH0HMbWf+tV6zy78/82YqDBTufkchjXP0a8vWY70jr02Xlof5C86v
   g==;
X-CSE-ConnectionGUID: hZ9oCW4UST2h4t/egiAUKA==
X-CSE-MsgGUID: +nYPlu/oSFqeoeEM2jh/Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29637323"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="29637323"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:21:53 -0700
X-CSE-ConnectionGUID: z1dLeJ8FQVmE+Vf/bx2ApA==
X-CSE-MsgGUID: aRqGx8ObQ5mCUYDRT/8TPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87714355"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 03:21:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E4FEA1AC; Fri, 01 Nov 2024 12:21:49 +0200 (EET)
Date: Fri, 1 Nov 2024 12:21:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.13-1
Message-ID: <ZySrvXpFANlXrnh2@black.fi.intel.com>
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

One of the tiniest PR for Intel pin control drivers, only two changes there
which were in the Linux Next for some time without reported issues. Please,
pull for v6.13-rc1 (next cycle).

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.13-1

for you to fetch changes up to ffe624c4130f902bc519b8201a1cb4ef1e6bb05c:

  pinctrl: elkhartlake: Add support for DSW community (2024-10-28 19:06:54 +0200)

----------------------------------------------------------------
intel-pinctrl for v6.13-1

* Expose DSW community on Elkhart Lake
* Elaborate in the code comment the pull bias settings

The following is an automated git shortlog grouped by driver:

elkhartlake:
 -  Add support for DSW community

intel:
 -  Add a human readable decoder for pull bias values

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: intel: Add a human readable decoder for pull bias values
      pinctrl: elkhartlake: Add support for DSW community

 drivers/pinctrl/intel/pinctrl-elkhartlake.c | 38 +++++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c       | 12 +++++++++
 2 files changed, 50 insertions(+)

-- 
With Best Regards,
Andy Shevchenko



