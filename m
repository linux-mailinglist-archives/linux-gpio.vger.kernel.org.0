Return-Path: <linux-gpio+bounces-20414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BAABF03D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2008C171AE9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193125393D;
	Wed, 21 May 2025 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpmYmNzk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09623506E
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820549; cv=none; b=kGlWfgdYVS1k+PlP5cCM5t6fnxhnFTircodtF7OBNtAU94JbQh6R5nRm6TkdlJL9lTTYdxV+vdUKH8gBgrtCE96kmZIDjbGsiMkKJnVmjgaiKMDee3Bqz3yOqUDTJXxGti4ePJkfM3v2Ab0cDUTOOH5pvB0EKM5qNEdYpt3g7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820549; c=relaxed/simple;
	bh=liQNIRFnZ03NjSzs9BkHVZcd5if+lO0YZ2c1Vi0Sapw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUyxNzAwnpbomIIz6mqpzgGZvm3cc7IrRCr0mZWImW0k/zwNOmTocJXstk0+y0zF0JqPVK8ywSi6MNNizOAOUxuUDmxcI3yqqXIqYy95qe+Gl7DFu6uQI4f2cc45DFzpwWfpMRVlE8W3AxRVXs7rmVhTWPNsTZCTIndJjhe/syA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpmYmNzk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747820548; x=1779356548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=liQNIRFnZ03NjSzs9BkHVZcd5if+lO0YZ2c1Vi0Sapw=;
  b=fpmYmNzknnsYJlWvZIF1A/Nobd+okmPedWMzMIF/PM2JZzdvd1WrHkpB
   xQ00aihOs71PFWPfAmKFfQYXxtKH/nziO594xphBOC78txCLLlRlalEpT
   u6ll4cSZHLO2DmoNT+lugOXdYSn850ypoprurztI14+zVU/ffvcGn36Ot
   tKAmfD6hMRE0DVDUO7ADUr2kxczFG/1tOaefTsjDaQDzdHub67V1k0aaA
   1Et/NqVTig+T1H57HG7kStxUZrhto4FFbfay8lFfEQLAL+68Lzw5PB1VV
   aSi/k3fM9xhfA3jkk5llFRLKZDoxPHSPwklFUKdM5j/J7Xj4hOjyPcEFw
   g==;
X-CSE-ConnectionGUID: 7nydsJyLSRe9OaynGTL+yQ==
X-CSE-MsgGUID: s90SJ4TfRCCTTyR1+UpFGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37411002"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="37411002"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:42:27 -0700
X-CSE-ConnectionGUID: NoeErKcNQYWdGpdtW1jOBQ==
X-CSE-MsgGUID: 5kGXsfBhTVyUbHjl77KOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139894445"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2025 02:42:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8E0E368; Wed, 21 May 2025 12:42:24 +0300 (EEST)
Date: Wed, 21 May 2025 12:42:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.16-1 (take 2)
Message-ID: <aC2gABILEj1yRCxF@black.fi.intel.com>
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

The GPIO ACPI code rework is in this PR. The patches are in Linux Next
for at least a few days. However, one regression was reported and fixed
immediately, which becomes the last patch in the PR. It wasn't in Linux Next
since there was no Linux Next on this week. Nonetheless, Randy Dunlap tested
it independently, that's why I include it into PR (without this the checkpatch
and make htmldocs warn).

Please, pull for v6.16-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.16-1

for you to fetch changes up to ec0c0aab15243bbc6140a7cedd01e2dd9ad19878:

  gpiolib-acpi: Update file references in the Documentation and MAINTAINERS (2025-05-21 12:25:24 +0300)

----------------------------------------------------------------
intel-gpio for v6.16-1

* Split GPIO ACPI quirks to its own file
* Refactored GPIO ACPI library to shrink the code

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Update file references in the Documentation and MAINTAINERS
 -  acpi: Move quirks to a separate file
 -  acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
 -  acpi: Handle deferred list via new API
 -  acpi: Make sure we fill struct acpi_gpio_info
 -  acpi: Switch to use enum in acpi_gpio_in_ignore_list()
 -  acpi: Use temporary variable for struct acpi_gpio_info
 -  acpi: Deduplicate some code in __acpi_find_gpio()
 -  acpi: Reuse struct acpi_gpio_params in struct acpi_gpio_lookup
 -  acpi: Rename par to params for better readability
 -  acpi: Reduce memory footprint for struct acpi_gpio_params
 -  acpi: Remove index parameter from acpi_gpio_property_lookup()
 -  acpi: Improve struct acpi_gpio_info memory footprint

----------------------------------------------------------------
Andy Shevchenko (16):
      gpiolib: acpi: Improve struct acpi_gpio_info memory footprint
      gpiolib: acpi: Remove index parameter from acpi_gpio_property_lookup()
      gpiolib: acpi: Reduce memory footprint for struct acpi_gpio_params
      gpiolib: acpi: Rename par to params for better readability
      gpiolib: acpi: Reuse struct acpi_gpio_params in struct acpi_gpio_lookup
      gpiolib: acpi: Deduplicate some code in __acpi_find_gpio()
      Merge patch series "gpiolib: acpi: Refactor to shrink the code by ~8%"
      gpiolib: acpi: Use temporary variable for struct acpi_gpio_info
      gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
      gpiolib: acpi: Make sure we fill struct acpi_gpio_info
      gpiolib: acpi: Handle deferred list via new API
      Merge patch series "gpiolib: acpi: Fix missing info filling"
      gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
      gpiolib: acpi: Move quirks to a separate file
      Merge patch series "gpiolib: acpi: Split quirks to its own file"
      gpiolib-acpi: Update file references in the Documentation and MAINTAINERS

 Documentation/driver-api/gpio/index.rst            |   2 +-
 .../translations/zh_CN/driver-api/gpio/index.rst   |   2 +-
 MAINTAINERS                                        |   2 +-
 drivers/gpio/Makefile                              |   1 +
 .../gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c}   | 522 ++++-----------------
 drivers/gpio/gpiolib-acpi-quirks.c                 | 363 ++++++++++++++
 drivers/gpio/gpiolib-acpi.h                        |  15 +
 drivers/platform/x86/intel/int0002_vgpio.c         |   2 +-
 include/linux/gpio/consumer.h                      |   2 +-
 9 files changed, 486 insertions(+), 425 deletions(-)
 rename drivers/gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c} (72%)
 create mode 100644 drivers/gpio/gpiolib-acpi-quirks.c

-- 
With Best Regards,
Andy Shevchenko



