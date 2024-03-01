Return-Path: <linux-gpio+bounces-4015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB8B86DC15
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 08:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A6BA283F89
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 07:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE886994F;
	Fri,  1 Mar 2024 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnQPYAEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1013692FE
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709278160; cv=none; b=ERClXCYfz/iS19TjbEKHvqXarZfL7lVM624qFsako1lF++bZp/yNcjT7qHOHfU0p3k2LiQi9Vk0l3bdxGQihslUUX6W0FTolNd9db3YlabR0V0r81uhwea2QnjvliXtjJTLFOiOaIrDBX+SzZHbxJHFoMHCGeDzC/O06p0eUHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709278160; c=relaxed/simple;
	bh=XNkAkfAUHjqcsvsxXxFcQOljH2NkjG05DEoL695K/q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFbzYWi2JEaF5hR24wy0/xp/346OL9bV4TQbmuMg53DlXPk4vD5APzrJPs1pxDsWIKwZ0DGK7VeOO/VbiBVby/eLZ60qCSDMB4+CSNcZ5ca3bhSItCWHnJgHeGf0wzBw2y757bLRt/Bd4qmsc5zEIznjrkBLRxmm5sT+G5TEEMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnQPYAEr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709278159; x=1740814159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNkAkfAUHjqcsvsxXxFcQOljH2NkjG05DEoL695K/q4=;
  b=gnQPYAErTBC7EEilCnhcjNT11PsD9bqUlt9CMdfPgz7ddP1+FcFWndGk
   ysnMfaeRRUM7jsibnxFVpYm9wdleTA7Cj+7JVu3KQT2aRtRJC/SF9M+pw
   7PL7T8xh8/7+nCtTFyYImaAibuJU6oAzwxMrGY3AiqyWkfllPBg8nf3ra
   Y2rcnlh748xE/iNwqsaYf25THP2jp2L77bX6z1Cy9Y7/aynnxRqGGUmS4
   8liC+DZdaJWAdTHCrRCfm4gyr3JKsJbBAJnr0EiOXFuKfbVw/D2ha5zMC
   p5ol0EbD9lxGMNQcl/u5dQKtbbtrCdDa16+nAGsYt9WPTZWXlFivnHydp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3961336"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3961336"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 23:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="38958647"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Feb 2024 23:29:17 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfxKB-000Dcx-1Y;
	Fri, 01 Mar 2024 07:29:01 +0000
Date: Fri, 1 Mar 2024 15:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-nomadik-gpio 6/25] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by GPIO_NOMADIK
Message-ID: <202403011546.Hpt8sBTa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
head:   6ad679cfaeea9291e9dce3247e34656080fc1d29
commit: 966942ae493650210b9514f3d4bfc95f78ef0129 [6/25] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_GPIO_NOMADIK-0-0 (https://download.01.org/0day-ci/archive/20240301/202403011546.Hpt8sBTa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403011546.Hpt8sBTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011546.Hpt8sBTa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by GPIO_NOMADIK
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_NOMADIK [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
     Selected by [y]:
     - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

