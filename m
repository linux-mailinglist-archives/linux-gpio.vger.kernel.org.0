Return-Path: <linux-gpio+bounces-10786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0B98ED00
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 12:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E57C01C2149B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685C514D29A;
	Thu,  3 Oct 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N++T/D2j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F714AD1A
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727951500; cv=none; b=UikwM6bcV0UiWG/LfARM2RHgzmaO6szdtqcABqoxm4+ItRmwwnCVwHL6qPfZBcIVFo65N0ZZ7Cix0YcQmlmsKfLQ4LIzLnYZl4Q/ArQLCRH1oYczjerZWlTEQdkU+O+i00vpbu3ahOJZNXlYYXF9ms/TNN4pWtfH2Wki7NfD+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727951500; c=relaxed/simple;
	bh=+NoFAFfTzrQ3a4D38EgrJa8JvvaQ6dItVSdD8EQ+PXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQQOfkTiXqrQXZJ/CaU8i/22fzPUZUNgNlrlhfJrXDYHONWXPejvkOY3hQf95kmdto2GZZfRVxNj1QbCNyP6UO07Q5ocMLvOafgIqylGq+Ky4EQHbgJLI1/Cuk0Q2u/a3mhVklHl+8FDm814OVV+KBubi6VakArOELebp4QXiSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N++T/D2j; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727951498; x=1759487498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+NoFAFfTzrQ3a4D38EgrJa8JvvaQ6dItVSdD8EQ+PXE=;
  b=N++T/D2jHGA60MNPqjn/icT9Au8GPZHolnRFrAZAxdqgQFOB1KAZULTd
   Y1lQuzT1tu8W/4BZdbdTRdnXUkX3rWXwTb7dwPnqer0sKukivj2BQMXuw
   C+PyRuUDlxUeDREVO8daNoxd6CS2EFE58kQwX4/YurrLaLgdjg1DtfJzt
   BReDJJPK0px/38C2AN8yqTnooWVVVVA2W5BB+3GqSS1wRytHtMNvZMKur
   n+8rxAkzkpy1CA7WElFvUoF04eVseF2/8xntymgibAxKucIfjORW0NGBg
   iJkYJQhWxala0fxhnxgd8dKGSk8Fxt0KNmvTArtqaA8jGZ6SNPlihKVGA
   w==;
X-CSE-ConnectionGUID: Y0uXej+yQMKPXa1CzNQ3Lw==
X-CSE-MsgGUID: qUuuOcssS8yEXVF7k7Gv9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27270467"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27270467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:31:32 -0700
X-CSE-ConnectionGUID: zgjxM21kSnCU5PpdwTcw3w==
X-CSE-MsgGUID: c8zF4+7cSg6lY19/cexlWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="73895061"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2024 03:31:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A64B61E5; Thu, 03 Oct 2024 13:31:29 +0300 (EEST)
Date: Thu, 3 Oct 2024 13:31:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.12-2
Message-ID: <Zv5yge2cDdVC4Hzb@black.fi.intel.com>
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

Fixes for Intel pin control platform driver are provided and new SoC is added
to the list of supported. The last patch hasn't been in Linux Next, but it won't
break anything at all as this is pure one line text description. Please, pull
for v6.12-rcX.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.12-2

for you to fetch changes up to 37756257093bf1bda0bb034f4f1bd3219c7b2a40:

  pinctrl: intel: platform: Add Panther Lake to the list of supported (2024-10-03 13:14:31 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.12-2

Fixes a few issues with Intel pin control platform driver:
* fix missing reference counter drop of fwnode on error path
* replace comma by semicolon to follow the kernel style
* add Panther Lake to the list of supported devices

The following is an automated git shortlog grouped by driver:

intel:
 -  platform: Add Panther Lake to the list of supported
 -  platform: use semicolon instead of comma in ncommunities assignment
 -  platform: fix error path in device_for_each_child_node()

----------------------------------------------------------------
Andy Shevchenko (2):
      Merge patch series "pinctrl: intel: platform: fix error path in device_for_each_child_node()"
      pinctrl: intel: platform: Add Panther Lake to the list of supported

Javier Carrasco (2):
      pinctrl: intel: platform: fix error path in device_for_each_child_node()
      pinctrl: intel: platform: use semicolon instead of comma in ncommunities assignment

 drivers/pinctrl/intel/Kconfig                  | 1 +
 drivers/pinctrl/intel/pinctrl-intel-platform.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



