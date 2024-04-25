Return-Path: <linux-gpio+bounces-5848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89F8B2171
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 14:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F9731C214BC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 12:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AABD12BF04;
	Thu, 25 Apr 2024 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmo3LgmY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF871BF40
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714047252; cv=none; b=k9oal7Bc1QzoMhshNQI0ZKt9xkqMjmOA5YHOtCRFOA03duqBeazrit4oghGJx5S/7MAbbg8rFsG3ULTXxlC+txsgr7BHXpmybTtAGhHv0eknsz8WQpm2TvGa/8tn4C0pjY53fRHw6GC7jGNTgs3Az+elxaIihiER+8+obLgx2mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714047252; c=relaxed/simple;
	bh=KBbfK9UGu7+VNfRoRvfkH4PfRil6jW5CwZaoqM4aJDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HFuTKt7zJrEeLABwg0alKxBtu3E8CuBcUgfmUeNdfmu0I7B6xOVe/mkEq9EdaHerYSo4+enPeOrFWm9gZY1UvKt4neRJctCrw/zn69sQ1PR53gdIPVw7cNLgmb0GQFvy5l3iaLU5BgL8ivT+PCg4w51qG7KX2Bf51VUbJRUuiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmo3LgmY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714047251; x=1745583251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBbfK9UGu7+VNfRoRvfkH4PfRil6jW5CwZaoqM4aJDE=;
  b=Cmo3LgmYVpTxd3wp16q9/b2IOyKahl75RQiheKnoGDUt57X78B8lJd8I
   e87wCqI4Sgycy3x470UJPrKhyZsitwQ7Ev0ippuybmACa0IlqNUgqf7Ho
   XqYWc8nGFDBFkQB4uizUQ8687EbHka+A+1ZX39Hl4HN1OoTDZN9BxF2N1
   97ZrJIHbtSlWsSo1eZ4QXQpTv2xlqwgDzeh86OXBX3UrxHTofxzEpWF4a
   vwQVlosoL0Dx/l46DcPX6P3VHI7Vk3ncIg3TNsC2k5/VrGsI9hSwHzXRa
   1KRn/AecCbwcgjv+Df0xv+TSP/eYvMVRRbFD4/S5aZkhS4CTMUTGiApvb
   w==;
X-CSE-ConnectionGUID: JUPj2vZYQ+OhtM9K3y0Ytw==
X-CSE-MsgGUID: 9C7rzwDuSoGZOwxGNDleMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32219759"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="32219759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 05:14:10 -0700
X-CSE-ConnectionGUID: JC/uSOOPSRmbm9qURHW53Q==
X-CSE-MsgGUID: DjvfmHHDRJaYrp3TDv0IVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="25142531"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 25 Apr 2024 05:14:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 80261288; Thu, 25 Apr 2024 15:14:06 +0300 (EEST)
Date: Thu, 25 Apr 2024 15:14:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.9-1
Message-ID: <ZipJDvhxihtpiCgN@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux pin control  maintainers,

A couple of GPIO mode fixes for Intel Bay Trail from Hans. This was a few weeks
in Linux Next without issues reported. Please, pull for v6.9-rcX.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.9-1

for you to fetch changes up to 5d10a157ebe02ac9b8abacfd529f8b045e8aa41b:

  pinctrl: baytrail: Add pinconf group for uart3 (2024-04-08 17:54:48 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.9-1

* Correct GPIO selection and add UART3 pins for Intel Bay Trail

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Add pinconf group for uart3
 -  Fix selecting gpio pinctrl state

----------------------------------------------------------------
Hans de Goede (2):
      pinctrl: baytrail: Fix selecting gpio pinctrl state
      pinctrl: baytrail: Add pinconf group for uart3

 drivers/pinctrl/intel/pinctrl-baytrail.c | 78 +++++++++++++++++---------------
 drivers/pinctrl/intel/pinctrl-intel.h    |  4 ++
 2 files changed, 45 insertions(+), 37 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



