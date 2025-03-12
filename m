Return-Path: <linux-gpio+bounces-17493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 621B1A5DB19
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 12:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0FE23B86B8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB0023E35A;
	Wed, 12 Mar 2025 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEUNcsU+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBB1E3DDE
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777886; cv=none; b=AaCytqAgvXvlYGNJl3p9l8+npAwths3rk4jDMUvo11XYyysNgeVKFZjAPJyLkEA3aB9KU0mPH//d6a0ZjOZEEUkSiQTMHcy57t3mtN9KdA9sJHfIA5cyU/pqMxLbDNbGMlEgml6TU9bt6H0/JZ8GfverKH8MRinGGMZbD39ZqU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777886; c=relaxed/simple;
	bh=XmdxTj1O6utEGyhC8pagVBoBcksCZ5Lqi7Nx2+aVc44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRL511JEqKCm2ZYmeBsQMqNOQgYWfr2Ivq9l6NSzv0ud922lyz3R4Z50AQq7Gj8aHVAXYBPd0lu4INv+h4O2453tEo6UKfyeJocfRLMIlXmA666CJ1MjK+IhET2JRR7hokWc5HuqK5+Dz8H9aKIppRDRRcMDMg0J/RZpJrUj7to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEUNcsU+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777886; x=1773313886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmdxTj1O6utEGyhC8pagVBoBcksCZ5Lqi7Nx2+aVc44=;
  b=iEUNcsU+zvjt6TSwnSmhac45wq1CP4ftlrZj8v39SOtqO6FmlJVMzTqf
   lGDZnc0zb5IW2384T2hEQapxpHnmKRFowKzkjF0kdj7Ohps8wrtEREykC
   UWxsHaUuLXSJbOomE1MpaNxDmsPs6L6/C+LRSp+MGt7hvM71+t6mqJYfc
   RfdwLC0Nwrypq6t48coZiBgdkVfbWwH8Mg+GLz8+yhNsAXZRSM5idYQo4
   SaVSUsN02JX7dfHwt7+QTsIu6Torgypyt/Kf0By8dRvggykqfBt9LDcSb
   Uw7tLhUHLrTX9mhT7BbXga2DljJoBCTDDaATH9wKdDn9LWKQkw8TGLqEt
   A==;
X-CSE-ConnectionGUID: Hy6pNO8+RrGK3zyBFvPlbQ==
X-CSE-MsgGUID: k9MswZJzQ8+DJD7v0JbVzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46497600"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="46497600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:11:25 -0700
X-CSE-ConnectionGUID: Rob67XDEQ5C1P0+ZHhl/Yw==
X-CSE-MsgGUID: 4JR3O1R3TUCXSCy+9HMq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="121112310"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2025 04:11:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 66C591F2; Wed, 12 Mar 2025 13:11:21 +0200 (EET)
Date: Wed, 12 Mar 2025 13:11:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.15-1
Message-ID: <Z9Fr2ZMczDUg35JH@black.fi.intel.com>
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

One of the calmest cycle for Intel GPIO and GPIO ACPI library, hence just this
little pull request for v6.15-rc1. Please, take it.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.15-1

for you to fetch changes up to e646f0dae7b0f099b36d12d9cb5ca733b8273f10:

  gpiolib-acpi: Drop unneeded ERR_CAST() in __acpi_find_gpio() (2025-03-04 16:47:10 +0200)

----------------------------------------------------------------
intel-gpio for v6.15-1

* A cleanup to remove unneeded ERR_CAST() in GPIO ACPI library

The following is an automated git shortlog grouped by driver:

gpiolib-acpi:
 -  Drop unneeded ERR_CAST() in __acpi_find_gpio()

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib-acpi: Drop unneeded ERR_CAST() in __acpi_find_gpio()

 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko



