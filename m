Return-Path: <linux-gpio+bounces-20362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666DABE3FA
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 066104C5700
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 19:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C159258CE3;
	Tue, 20 May 2025 19:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR3uDEuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC91DB15F
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 19:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770319; cv=none; b=qQZWKBAdLsSBe6wepwsZuAKs2oTOlz9ublZUJM+xaKIXYdBNM6q995p2WCzJ4zWo11axYrCPFjo7a8CXRCREGMRhXNWXlIkltT3qJHjzv4mUtxO+iNjnFUf3pGp4Y6MLzUD2Ks6NwZC14watKrXM9SWYe4BDecfKildHjRoIKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770319; c=relaxed/simple;
	bh=Qhfo3zoLbGbc2gQmC9rSSD4QUD+Q+XF8/R68u1x6rmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+sZygIUjS/NGRmx41fhiDWff1BYpXMxd8gHLEZuPQ0qJ0IhXJyBXH66cFysKUbhJ+5e9v2l+NbsO44ln2pBtmJZ4f4kPUy26iczPlj1zDTRKoS4l7nALyyd6NAOVCBLKmDrEgVY6onE/seuk3/zSbbDCvMMAcJIfBOHc/be3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR3uDEuZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747770318; x=1779306318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qhfo3zoLbGbc2gQmC9rSSD4QUD+Q+XF8/R68u1x6rmU=;
  b=TR3uDEuZKEtHucXLFaNIV1JOv87udsOhZRdLfDqSiYdpPSd5w8AZxp05
   XnthRJ/XUhONO41JoTD6nMsqn3GLE86gPsoBymjZxDCFvWFJ6HyEzOLxW
   aO5M4xM2UKEKA410iB49S/XDhjIroMsSOOYnfBBgUBiignaF/yxNOqMNN
   vYsuedX/UrmBuBT5Hl3rx2tt5Jw0LZa9L3C9ZvELzlA1IF4YfOEFXbOJN
   uNjieHXrMjwFf/AHZ4dJA9eKG2DHmKoy6tseRjw4d9p6nWykUgxDaBOZ+
   tZ/bzCXo0IKvgl7/QYrZQ5VLHR/dfPx2g8WHL2nKdyCpUE3+P5+kqsTFd
   g==;
X-CSE-ConnectionGUID: BRrVG/MuQVWL0u4UWVfVoQ==
X-CSE-MsgGUID: zJBqqdsfS+WvtnpB1oFFOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49821907"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49821907"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 12:45:16 -0700
X-CSE-ConnectionGUID: fmXEuRWiRom1fnAC6xMyLw==
X-CSE-MsgGUID: tkvViFTkQ3KhRptcCxtS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140845037"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 20 May 2025 12:45:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5DFB0368; Tue, 20 May 2025 22:45:13 +0300 (EEST)
Date: Tue, 20 May 2025 22:45:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.16-1
Message-ID: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
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

for you to fetch changes up to 6f09a17d60410e805ae112fbbfa3ed8ecd0636dd:

  gpiolib-acpi: Update file references in the Documentation and MAINTAINERS (2025-05-20 22:30:51 +0300)

----------------------------------------------------------------
intel-gpio for v6.16-1

* Converted two Intel GPIO drivers to use new value setters
* Split GPIO ACPI quirks to its own file
* Refactored GPIO ACPI library to shrink the code

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Update file references in the Documentation and MAINTAINERS
 -  acpi: Move quirks to a separate file
 -  acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
 -  acpi: Handle deferred list via new API
 -  acpi: Switch to use enum in acpi_gpio_in_ignore_list()
 -  acpi: Make sure we fill struct acpi_gpio_info
 -  acpi: Use temporary variable for struct acpi_gpio_info
 -  acpi: Deduplicate some code in __acpi_find_gpio()
 -  acpi: Reuse struct acpi_gpio_params in struct acpi_gpio_lookup
 -  acpi: Rename par to params for better readability
 -  acpi: Reduce memory footprint for struct acpi_gpio_params
 -  acpi: Remove index parameter from acpi_gpio_property_lookup()
 -  acpi: Improve struct acpi_gpio_info memory footprint

graniterapids:
 -  use new line value setter callbacks

ich:
 -  use new line value setter callbacks

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
      gpiolib: acpi: Make sure we fill struct acpi_gpio_info
      Merge patch series "gpiolib: acpi: Fix missing info filling"
      gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
      gpiolib: acpi: Handle deferred list via new API
      gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
      gpiolib: acpi: Move quirks to a separate file
      Merge patch series "gpiolib: acpi: Split quirks to its own file"
      gpiolib-acpi: Update file references in the Documentation and MAINTAINERS

Bartosz Golaszewski (2):
      gpio: graniterapids: use new line value setter callbacks
      gpio: ich: use new line value setter callbacks

 Documentation/driver-api/gpio/index.rst            |   2 +-
 .../translations/zh_CN/driver-api/gpio/index.rst   |   2 +-
 MAINTAINERS                                        |   2 +-
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-graniterapids.c                  |   6 +-
 drivers/gpio/gpio-ich.c                            |  12 +-
 .../gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c}   | 522 ++++-----------------
 drivers/gpio/gpiolib-acpi-quirks.c                 | 363 ++++++++++++++
 drivers/gpio/gpiolib-acpi.h                        |  15 +
 drivers/platform/x86/intel/int0002_vgpio.c         |   2 +-
 include/linux/gpio/consumer.h                      |   2 +-
 11 files changed, 497 insertions(+), 432 deletions(-)
 rename drivers/gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c} (72%)
 create mode 100644 drivers/gpio/gpiolib-acpi-quirks.c

-- 
With Best Regards,
Andy Shevchenko



