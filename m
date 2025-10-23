Return-Path: <linux-gpio+bounces-27503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D67BFFBF7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F64A3A3FC5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 07:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26252DCF5B;
	Thu, 23 Oct 2025 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afzpglhK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729722417C6
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206228; cv=none; b=U77X+Ma71zh1TckW9qt3mvWlTk4a5fBP32Z14KpQBb98UqxCg+0It5YrjbqdXefSx6xNxzOWp3G86slhfJAAevKs+Vq+U5ibGNyO/kpOegHpWdioaxQh5W3UpAX74TPCqt6dR211PKer30BmBH//uFJVDhLF/OJPlWhUsGj0IAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206228; c=relaxed/simple;
	bh=IhLdMJeha3EtfT5kgWFXNqYMM8EQsaNhJFMD832Wkeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yvz9m2268P3wS5hPal87UMh9xrfYQaGkpUSY/T99eyYM/EEXiwczYtF1B9tZyofK8scjjHxmXBnr2uB9ln1lSYzIPbRe0XorPWbUQmYCVcUQ76w2LMTYYBVFuhZmkQTm5dmKLAJOJaazkoArlC3wvHDrwaMZpYfrTkzLX1XWR5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afzpglhK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761206226; x=1792742226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IhLdMJeha3EtfT5kgWFXNqYMM8EQsaNhJFMD832Wkeg=;
  b=afzpglhKqW3wQt+FdFCsPJDRRNHtAXXxcmaRhwwMKIy8IGVyUAfWoAge
   nTymN3KN2yX3N3ZrXviWE2flX0qLkTwTSRstQNGsyBcKcHtM8i7dZ13h4
   FGIzm91uJLcJnNlQ/2Yh271GtBbCvBSlaNDsDsKDCndXY6zHPsX/B3g2I
   vS0v3c2BL89ocZrjsHpNtWAXJRXVLswsYURzQE0pfwlczYvkAf9fqcQto
   3sFKK7Gn3mib6pdGxFzCda/Bsd1jIlLc9m1cKd2JEqIr4h11FgXqUiXJ/
   vyw791oMQUVyIfkosz8/fZDRC1egRq0NRBw2XLSwdE+JyMZPzhgCt/QS4
   A==;
X-CSE-ConnectionGUID: NWIHbw27QYGjdOaXe9i6ow==
X-CSE-MsgGUID: RHhGZFzVTTWmqJllTWJHRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63462839"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63462839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:57:03 -0700
X-CSE-ConnectionGUID: B6U8F7cETMGRwuMKPp5yEg==
X-CSE-MsgGUID: tXSyNcUDRsuno//iykKcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184571352"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2025 00:57:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0B89495; Thu, 23 Oct 2025 09:57:01 +0200 (CEST)
Date: Thu, 23 Oct 2025 09:57:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.18-1
Message-ID: <aPnfzZk30goFltb2@black.igk.intel.com>
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

Emergency fixes for the regression found in last cycle. Please, pull for
v6.18-rc3.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.18-1

for you to fetch changes up to b1055678a0160b2952c322ad1b61805562698f99:

  gpiolib: acpi: Use %pe when passing an error pointer to dev_err() (2025-10-23 08:40:46 +0200)

----------------------------------------------------------------
intel-gpio for v6.18-1

* Make set debounce errors non-fatal in GPIO ACPI case
* Use human readable error when printing a message in GPIO ACPI code

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: acpi: Use %pe when passing an error pointer to dev_err()

Hans de Goede (1):
      gpiolib: acpi: Make set debounce errors non fatal

 drivers/gpio/gpiolib-acpi-core.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



