Return-Path: <linux-gpio+bounces-12661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD89C024A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 11:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4908E2838FB
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 10:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F05F1EBA12;
	Thu,  7 Nov 2024 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqzFA0uj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676318A95A
	for <linux-gpio@vger.kernel.org>; Thu,  7 Nov 2024 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975172; cv=none; b=OmR6ionGR18syBEvvrZXvHUSkWkjMcqE1opBNVZmjIumxoR1epScqfkg5hdGpeiwMItVCF95omDKO539vxyu2n060rvHgIeZCdkZWYQlI1CQkHuZftwjwl2ZFfOokRH5Gy2FPNtwfkjjYd0e3M7gf2pvoWJ36fFoWNgkj51Odn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975172; c=relaxed/simple;
	bh=aU7LlpVjSmpIN1Zey0HWt9FjTxP3LIdr1XJ8jP94kgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ft4+rtLxnwSaTglmy1KkNolUMjkWkUXlKUUeB2FMFyTtVqnv0b3XPUbGOuDOzkuA3RcUDyLWwbsNEPX9UbL8xTJZlJzEpHKiyfy6uyYTznWuj3E4Yj/WX+IT1ocW9OHH+aFMc/3w2xOWNzqd+3q073hZTNQTZCvhnxWweFU3ZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqzFA0uj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730975169; x=1762511169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aU7LlpVjSmpIN1Zey0HWt9FjTxP3LIdr1XJ8jP94kgU=;
  b=LqzFA0ujVvLMvsSqOr+DL6Y+A/g8aYhGXtOfgY+O/S5IRO5yfoLTzwSY
   u8UWGXW9BgaydoG6/nvstKF1YcEzLgsAoYEg1k4Wlbw8w0fto+Y3/fo2c
   gUgi4prNnr0l4DU6WtgVlW/rGcocuEYUk3cSfh3iVuYVK8Kq1aZP2i6F7
   8cgXPAUDNtCbvzn81eMtAcx+6ZwtFkh7cs5DHAVqP2hm0yZ/7uxhhR47E
   uz6M/InvJ93mAtpF/y5Yn5owDSEF8hiCo+ZHUgraLRq62FFG2G2N1fHeX
   dvsdVgh7G5Ix9fKHZx+IMqBotif71Fp7hFco7v/gQKn6Rwo2pa1v6UZSo
   A==;
X-CSE-ConnectionGUID: SRcbxdpKTFGfXSIw4j3UbQ==
X-CSE-MsgGUID: eZ5C0HSlRqO1E9inr62bdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53368459"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53368459"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:26:08 -0800
X-CSE-ConnectionGUID: WwpK7DXVRfmhJTh4+8Ce8g==
X-CSE-MsgGUID: i9fleUyZRzG9kOncqzUtjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85208236"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2024 02:26:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 802ED60D; Thu, 07 Nov 2024 12:26:06 +0200 (EET)
Date: Thu, 7 Nov 2024 12:26:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.13-2
Message-ID: <20241107102606.GN275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

This is an updated Intel pinctrl pull request, now based on v6.12-rc1.
Please pull for v6.13 merge window.

Thanks!

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.13-2

for you to fetch changes up to c6235c426d2ac78ab843a55cb1556b0f43175d9e:

  pinctrl: elkhartlake: Add support for DSW community (2024-11-05 07:48:58 +0200)

----------------------------------------------------------------
intel-pinctrl for v6.13-2

This includes following Intel pinctrl changes for v6.13 merge window:

  - Expose DSW community on Elkhart Lake.
  - Elaborate in the code comment the pull bias settings.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: intel: Add a human readable decoder for pull bias values
      pinctrl: elkhartlake: Add support for DSW community

 drivers/pinctrl/intel/pinctrl-elkhartlake.c | 38 +++++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c       | 12 +++++++++
 2 files changed, 50 insertions(+)

