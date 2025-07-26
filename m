Return-Path: <linux-gpio+bounces-23839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79436B12A22
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 12:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DBCE543733
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 10:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1CC21A425;
	Sat, 26 Jul 2025 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQXZLywz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DBBFBF6
	for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753526853; cv=none; b=f5VjhFPqL4IDL+yR5D1QUUIsLDOKVjSeMs6AdbYP/WyK904bUneoQsilnag+ArO4Sy/cK0pWHp+cvhH61RVp0+eJpdRI7vxsAjBmmQ3CgHK37mM5annhTeKfxOGgPGSgHAVkTJiB9EBpJ8Jykv4atIvNHSIQwQTi2ikgh2Tn0kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753526853; c=relaxed/simple;
	bh=d3wh+auK8JS9nDbMkZkWzVfSW4/1Q4l7HgCkEroUO0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VK9kEQzXK7LvyQzPKaHfsP6bT7yyEbQWkSFiQOlwabBKo2Tuh/s9xm9y2i7WsCQaH5UzxIOgIdCxjXAffMSS+i38tvotMDkSZvEpWwBJC1B+IQmxjHD1dQoJIITDPCHr/EQUuSDw+hfFQsqynHIrRHhj5Iz4CT4UK1W5L1XZ2rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQXZLywz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753526850; x=1785062850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d3wh+auK8JS9nDbMkZkWzVfSW4/1Q4l7HgCkEroUO0E=;
  b=KQXZLywz97LwUmNTVw8tYE7ZqvH+i5GyJ+9jIU+3s3ln3MMZq25U+wDs
   vInVHOyr6X5sAAy0tivEOQ5uVDjfh3Z0k3jhwFeKU95aBPEDo5yzTVXU2
   J0S3WA+GV+T4na0tQFiQHWMglyypSdWThpmIAWeFkIRTPEGgl7LbPWJfa
   PKIdMijjBvg0Pb27hNQeF9/Fc37e+DEKXz8AXf25tnLkGBkkI3kofR8we
   N79LxVMe/J41BgOIcXVb5MRbmPFJc1nNo5cklFFE4Zq9O5AhASirdew/h
   Ts50riDdQYvRMPZ5vt4Kvw3gWczh68Vhp3wNspUdAqHQ6Ccu7iOu7sOTu
   g==;
X-CSE-ConnectionGUID: BrRoNAzNR1Wg2eqc/ga9oQ==
X-CSE-MsgGUID: xszRV0wtR5CcLIX3hAQhOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="73429555"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73429555"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:47:30 -0700
X-CSE-ConnectionGUID: HSXs1TRtTPqXRbhcLQk4wQ==
X-CSE-MsgGUID: iOExHqwjRbaU899QNZ6l6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161204019"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Jul 2025 03:47:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcR3-000LtH-2D;
	Sat, 26 Jul 2025 10:47:25 +0000
Date: Sat, 26 Jul 2025 18:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel 2/2] drivers/gpio/gpio-tps65219.c:206:3: error:
 field designator 'set_rv' does not refer to any field in type 'const struct
 gpio_chip'
Message-ID: <202507261836.9dWs6Hqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
head:   e27a47cfa1fdbfa754664ae3dbac450008831fa0
commit: e27a47cfa1fdbfa754664ae3dbac450008831fa0 [2/2] treewide: rename GPIO set callbacks back to their original names
config: riscv-randconfig-002-20250725 (https://download.01.org/0day-ci/archive/20250726/202507261836.9dWs6Hqk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261836.9dWs6Hqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261836.9dWs6Hqk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-tps65219.c:206:3: error: field designator 'set_rv' does not refer to any field in type 'const struct gpio_chip'
     206 |         .set_rv                 = tps65219_gpio_set,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +206 drivers/gpio/gpio-tps65219.c

57e30e00bd5baa Jerome Neanne     2023-06-07  198  
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  199  static const struct gpio_chip tps65214_template_chip = {
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  200  	.label			= "tps65214-gpio",
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  201  	.owner			= THIS_MODULE,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  202  	.get_direction		= tps65214_gpio_get_direction,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  203  	.direction_input	= tps65219_gpio_direction_input,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  204  	.direction_output	= tps65219_gpio_direction_output,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  205  	.get			= tps65219_gpio_get,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22 @206  	.set_rv			= tps65219_gpio_set,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  207  	.base			= -1,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  208  	.ngpio			= 2,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  209  	.can_sleep		= true,
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  210  };
1b6ab07c0c800e Shree Ramamoorthy 2025-07-22  211  

:::::: The code at line 206 was first introduced by commit
:::::: 1b6ab07c0c800ed32ce417b71b32bb1baa91b493 gpio: tps65219: Add support for TI TPS65214 PMIC

:::::: TO: Shree Ramamoorthy <s-ramamoorthy@ti.com>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

