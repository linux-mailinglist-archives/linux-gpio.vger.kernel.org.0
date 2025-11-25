Return-Path: <linux-gpio+bounces-29063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E2C84900
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 11:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A193A2724
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 10:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F67B2E540C;
	Tue, 25 Nov 2025 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTMcODc7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801B25B311
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067821; cv=none; b=jy+GcLpT1Re3kDsNXOLoKEb39LY9XGLqYkyij9bvV9q4zeCBRZjuNXe+iOM8UwN7yN8Mg933jXHHol6MQGb2sV5WF7QP/Ii4BAVHAoQ+q38FXAQeJtfb4krgFNAimaocGTmcsyrAS+CEYPUZwHWYokuU8iPb9Y9BHBwuszYxpLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067821; c=relaxed/simple;
	bh=xNvwketcWRYCabADOiZoa8PLKGA0a/g8CT80wn2J564=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLlCwUcAWRJoM0jX/rHIiPVKNeBXUYLrCOtRUTNUDjShKCsR5PdYGdOM77RNiOk70DhCIOwq05X4mybXXngXEjJ+3xItwI6ft/RsSHz5QcAkTqNeNJr2eDwYLPltFkfRJQeAzMjgsqOAqDUM3HyajPKjiVhoXVXkO8T2CYY5dCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTMcODc7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764067819; x=1795603819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xNvwketcWRYCabADOiZoa8PLKGA0a/g8CT80wn2J564=;
  b=ZTMcODc7NSyMKmUf0CXaJ0Q1Mt9/7dAt8GqdqaAFTnvlso9HhojHqTjj
   S1tXGEaqw/pMuViHrOKlBgmxbxROp1RTGbUeztrtjVuLgESZfCmMbhmz8
   uKPD9Ow4619+mFzxmArKXLngTb8jOl+2O6+myGQDBp2xgnogVc2Ze++UP
   szgEuJY8y5dgxikWrUwQmS8SjbqXBIM6N6fRWG8MoQE5mA7SruYOFPkXM
   jJPNkzgiOENEE9XPMbe78nKaVZGA1rCWamICwnLW1egl1fzwsJVtcXLBo
   PHLffOJ9yVFlMvZKUxbMNJoFbmU0onAFEBjIo3rZR+vS5FlWDPG+HWKyh
   g==;
X-CSE-ConnectionGUID: g80YB99JRPK5PNwY604rjQ==
X-CSE-MsgGUID: wGZVRnqAT/OIklPaKApwOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91568268"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="91568268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 02:50:18 -0800
X-CSE-ConnectionGUID: QzVOkoMQRWKfEnh269zVyw==
X-CSE-MsgGUID: yaoKLDgNSHCsVHWu5JioBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192689320"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2025 02:50:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id ED96BA0; Tue, 25 Nov 2025 11:50:15 +0100 (CET)
Date: Tue, 25 Nov 2025 11:50:15 +0100
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.19-1
Message-ID: <aSWJ50QtEXukzJgW@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux GPIO  maintainers,

A single patch PR for v6.19-rc1. Was several days in Linux Next
w/o any problems reported. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.19-1

for you to fetch changes up to b2a186cced1199bb2777e229dc37a04d33507c6d:

  gpiolib: acpi: use min() instead of min_t() (2025-11-20 09:08:27 +0100)

----------------------------------------------------------------
intel-gpio for v6.19-1

* Replace min_t() by min() to avoid cutting upper bits and do type checking

gpiolib: acpi: use min() instead of min_t()

----------------------------------------------------------------
David Laight (1):
      gpiolib: acpi: use min() instead of min_t()

 drivers/gpio/gpiolib-acpi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko



