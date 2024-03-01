Return-Path: <linux-gpio+bounces-4008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FED86DA0B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 04:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A5B1C20F38
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 03:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B92944368;
	Fri,  1 Mar 2024 03:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA4AY0Mx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766C041C93
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 03:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709263876; cv=none; b=FR32fof3RSL1wYYRPTm+EsXjvemg+NyQ1fBtLiT16kGgwjmrdQgpCzPX6fr9twG33hR/E5yZx+WbJMZ2I3aKv7lKUF1GiJ31WyBRQrU3T2BmCF587P5lYDCgClHBAuJd6JEqwFp0f2+i4GSgpLoj/0LXAk1UnAUIzXxZ2mhSdYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709263876; c=relaxed/simple;
	bh=f47sz9GvyaVlXz/qEFYbb7mL3QkJ0fvnhOx21rkzugM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cRp2CE0rx9RCGn+Rh6o+lzGrvpYMk0r/ABdnOdqb4B1g0lQNUwkEcfam92nTeVwn0s7SWM9yHqoS+zIr9lfG9L9ij93cCL+rKz6P3ipdMLOEDzmt9/o7xI7l1oYsNL1Iq0tfbOwIRE3bVrNmTI/Y4GNSetdD56tnKRxyK15s/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA4AY0Mx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709263874; x=1740799874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f47sz9GvyaVlXz/qEFYbb7mL3QkJ0fvnhOx21rkzugM=;
  b=iA4AY0MxqrJIaZNxIkHw+lIArcnTgG45BW1YZcnU8JLGd2esN6ve7+be
   3famzwwvtqy5HB8LOlVXInctcU40LiKhRYoRh4O9VaQY397QbowfZ7/Lr
   FdrrvDKz+R9VYcvAIAl7MRyKLyOmolxtXkOZosZgVHKAma23KgfnqPImm
   XJz6iQLIuFKG95LjnXudnsNxawOA7huIlaZ35QOkU735bBz4FlW4oitaS
   M2MYtHFKeDmNcY2h5UfuIg5PwMtlg9QTql4CzVIwUg9EoeBAt0P0k6GzU
   GlfZ3fIXe/SFLV37J0EJOs9ukqlGewE4ru2A3VV3Wi0F6k13mkT+7PVTn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7557546"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="7557546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 19:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="39075635"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Feb 2024 19:31:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rftbq-000DVH-23;
	Fri, 01 Mar 2024 03:31:01 +0000
Date: Fri, 1 Mar 2024 11:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-nomadik-gpio 6/25] kismet: WARNING: unmet direct
 dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
Message-ID: <202403011102.v8w2zPOU-lkp@intel.com>
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
config: alpha-kismet-CONFIG_GPIO_SYSCON-CONFIG_GPIO_SAMA5D2_PIOBU-0-0 (https://download.01.org/0day-ci/archive/20240301/202403011102.v8w2zPOU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403011102.v8w2zPOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011102.v8w2zPOU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_NOMADIK [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]
   
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
     Selected by [y]:
     - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

