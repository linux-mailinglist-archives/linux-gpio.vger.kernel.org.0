Return-Path: <linux-gpio+bounces-23205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43EB03990
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 10:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEEF6188ACBB
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 08:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7D523BF96;
	Mon, 14 Jul 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCgiBBie"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1D157A6B
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481625; cv=none; b=ZFBcENIBFUaFO8x4R0T0iyGAlLi3DqiBCT70di/HMaYKnMXPZrduC9gIXnSt/618s8SB8Is1EDSefYjCiQcemL7qX7+0ik38Ivt4RT1k90uqcGHG+WWUAAryR201EfK0mYhAzoSZQiV4ViZdnZOSICGyUN2wOAnpghv3CmWvox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481625; c=relaxed/simple;
	bh=/CjdMCxH+t7eZzUgZZR6OKIB+scw7udT/yylQaArevM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6H+Eoodgnxktd78ajpCYLYYnzI71gF1JKwf10nRtdNEUEHTKlU1WwvbzRd0ygVgjsec465ReVDmcgvWrgRG9eLVeOh+HBKsbSzHSF5MuAKAah6bo9t9mdtYL1iBBRCWvTY47iO3WX/kzV8U9P0QfGyCql8qNCuPM+kI17hVyy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCgiBBie; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752481624; x=1784017624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/CjdMCxH+t7eZzUgZZR6OKIB+scw7udT/yylQaArevM=;
  b=bCgiBBiesmhcOLXwDytv3CSJj3Bm8Ji/V7wiC/l2but5DdHjx0ELFCw7
   7oNrqEIGTzJ1pjLCe2Q4q73Nd7YQ3YMtRr7kdEeyNe5r6X/B5qumketsO
   9zRkrN9VvvSkQQq25dbRL5y2k+qUbmgOPdLz3GF+Z7HDOp0hd4mA2fK9O
   vkJDZygLDm25LFDZhSMfmh++fl+FqF6+wsTkPOmVsFEXmF2+ud734YcwA
   QqqvMzeku74Khfc02YMq6N1INM/cnVbBi0eALYdzBRT7aGzbs68+Fl8/Z
   lag7CpfzDLLFdwYYStKEjXUf2uqS8ldeaR7ho19FKhOIGxj865SwhCfd+
   g==;
X-CSE-ConnectionGUID: PQCTKO80RM+76+UP/MMdcQ==
X-CSE-MsgGUID: eS0K6ccsRWGg4pr7VAXTgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54636291"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="54636291"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:27:03 -0700
X-CSE-ConnectionGUID: LLRZXEM1QBiujCt/0xXAIw==
X-CSE-MsgGUID: arR7AeMsSle8kuJhzSzQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="194078482"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 14 Jul 2025 01:27:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7E7F6152; Mon, 14 Jul 2025 11:27:00 +0300 (EEST)
Date: Mon, 14 Jul 2025 11:27:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.17-1
Message-ID: <aHS_VEcokVeCde2g@black.fi.intel.com>
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

Quite small PR for Intel pin control related drivers. May be applied as
v6.16-rcX or v6.17-rc1 material (up to you). It has been in Linux Next
for a few weeks without any regression reports. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.16-1

for you to fetch changes up to 3b4408038da935be7b1efb7589cc1badb6d10a67:

  pinctrl: intel: fix build warnings about export.h (2025-06-12 15:19:08 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.16-1

* Use new GPIO line value setter callbacks (Bartosz Golaszewski)
* Add missed export.h to the main driver

The following is an automated git shortlog grouped by driver:

baytrail:
 -  use new GPIO line value setter callbacks

cherryview:
 -  use new GPIO line value setter callbacks

intel:
 -  fix build warnings about export.h
 -  use new GPIO line value setter callbacks

lynxpoint:
 -  use new GPIO line value setter callbacks

----------------------------------------------------------------
Andy Shevchenko (2):
      Merge patch series "pinctrl: intel: use new GPIO line value setter callbacks"
      pinctrl: intel: fix build warnings about export.h

Bartosz Golaszewski (4):
      pinctrl: baytrail: use new GPIO line value setter callbacks
      pinctrl: cherryview: use new GPIO line value setter callbacks
      pinctrl: intel: use new GPIO line value setter callbacks
      pinctrl: lynxpoint: use new GPIO line value setter callbacks

 drivers/pinctrl/intel/pinctrl-baytrail.c   |  8 +++++---
 drivers/pinctrl/intel/pinctrl-cherryview.c |  6 ++++--
 drivers/pinctrl/intel/pinctrl-intel.c      | 20 ++++++++++++++------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |  6 ++++--
 4 files changed, 27 insertions(+), 13 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



