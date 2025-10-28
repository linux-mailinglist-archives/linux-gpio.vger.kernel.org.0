Return-Path: <linux-gpio+bounces-27749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5741C130F5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 07:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52BC64E5565
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 06:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4718E29827E;
	Tue, 28 Oct 2025 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xx1CMRAp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678523BD17
	for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2025 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761631555; cv=none; b=avRwSI0plZOKr1+2sd86yjAA6hdmHmSCF05qgMKfm2SI4extataBdzut8x/SdlM1N1Kj+/Q2QLzTY1MWUc6DfF9YHTDS7Fo6Eah1RZaavn4m6E4hP7K9v/qn/I7MRhbTtWMBP0QW7BH4RSjF3A+tDMkutkjAJ5wRWRHRRQZ5LHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761631555; c=relaxed/simple;
	bh=B4n8JR8IYD6Oi8BOaYEqdlH4uMpklnkYlXCjt9o+iYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAlXnEWcViRN+lV/1Vu7YmjsrlNHo+zjtitvQIK8OHjJqOIRFiQFgsxmSzbRZ1OeI/4ooqXL9QYDmb0cq4tUkfD6JRNcmiWMnIq8uhqJiqtUntw6P4MTiCFI362/nt82cQ62EOl4xZcZGPj4/kdQp3cviinMzjOmBsCF55MUa3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xx1CMRAp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761631553; x=1793167553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4n8JR8IYD6Oi8BOaYEqdlH4uMpklnkYlXCjt9o+iYo=;
  b=Xx1CMRApQdwfr4EKiZwdT42uChH8k1BIvjxu2R+jm1fgsOJCYnvcz08i
   QpmHoyWlxsTSaFF12aSjHr7Njaik3jfSA/xReaCu1IhurTBijE+zx+glq
   TSlK1LcEs5cmEWECyh1Jq2qyXrtkrlr4npw72prg3HvKJ6W/12+klfm7B
   jK0tKSU2WUe8wcb+J1PmlYhHDyKPSbGpgyg9mrXJ7KsFI2xwRRMxdcrbY
   SJbQwJHheexxfm1hoxhN/yKvWQbaMdykEhy/ZOPVlUCeyWlCi5z1mG+Cz
   6G9KmhcZ+BXtjQ2xjQ1RZxgkwX9AVm9Viy2Wz2UUkHsDGaItVJ/p5t9U/
   g==;
X-CSE-ConnectionGUID: 9smHg3ryRWKgY8hqjg4BvQ==
X-CSE-MsgGUID: txk9oVijQwuL4uWD8nK0FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51297624"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="51297624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 23:05:53 -0700
X-CSE-ConnectionGUID: uHwqA17fQQSKUbyJVkC2EA==
X-CSE-MsgGUID: f09tCpg6Ru6fGacNhlQMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185341782"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2025 23:05:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDcq2-000IoP-28;
	Tue, 28 Oct 2025 06:05:46 +0000
Date: Tue, 28 Oct 2025 14:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 28/44]
 drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is
 not a compile-time constant
Message-ID: <202510281347.vx7j6b7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   505cc0dcdd551b03390d6b8aab9739f0ba1d939a
commit: 46397274da2284f46e550dc795de5ceeef8f89bf [28/44] pinctrl: add polarfire soc iomux0 pinmux driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251028/202510281347.vx7j6b7v-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510281347.vx7j6b7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510281347.vx7j6b7v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is not a compile-time constant
           MPFS_IOMUX0_GROUP(spi0),
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'MPFS_IOMUX0_GROUP'
           .mask = BIT(mpfs_iomux0_##_name##_pins[0]),     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   1 error generated.


vim +89 drivers/pinctrl/pinctrl-mpfs-iomux0.c

    87	
    88	static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
  > 89		MPFS_IOMUX0_GROUP(spi0),
    90		MPFS_IOMUX0_GROUP(spi1),
    91		MPFS_IOMUX0_GROUP(i2c0),
    92		MPFS_IOMUX0_GROUP(i2c1),
    93		MPFS_IOMUX0_GROUP(can0),
    94		MPFS_IOMUX0_GROUP(can1),
    95		MPFS_IOMUX0_GROUP(qspi),
    96		MPFS_IOMUX0_GROUP(uart0),
    97		MPFS_IOMUX0_GROUP(uart1),
    98		MPFS_IOMUX0_GROUP(uart2),
    99		MPFS_IOMUX0_GROUP(uart3),
   100		MPFS_IOMUX0_GROUP(uart4),
   101		MPFS_IOMUX0_GROUP(mdio0),
   102		MPFS_IOMUX0_GROUP(mdio1),
   103	};
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

