Return-Path: <linux-gpio+bounces-23845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34A8B12D15
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 01:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1218D7A5022
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 23:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93318202C26;
	Sat, 26 Jul 2025 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ow4xGNir"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF41BF58
	for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753572916; cv=none; b=TTZbeh/LZ9qCf2G3PdpxH13LwNlgoNZ/eMxJygRIMU+dsAKeLs19TIHLZLq0J/oEiiaIOE7Bln00tQLjVdDAtFP8KD+WQEK/X6wu9jdA7RmFxopKxMjkbcQvnjjT5OE0GWTjY7r0bSyXuzFfl9iNJxUHfxM7GJyOMbLIRk9bMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753572916; c=relaxed/simple;
	bh=7Bvz/Fkx6aurAI0aXJve54uxK34nZw5V7KMI+Xs3iIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ViqgER2RSQjsN8KziSDpd74hivUrZ+HhV0Dqq0eMa1cLCGcUA47lJvspBlHdkA6sVV1cEOJtfarJa5cNiKwD0ohfOnL44FMx3iZe0X0yRnguVIoi1jHi463P+/h/+LBC72YhdaG6h2VECWi67T7HYg3nOzIZcCn+Onbl0HE1Xj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ow4xGNir; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753572914; x=1785108914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Bvz/Fkx6aurAI0aXJve54uxK34nZw5V7KMI+Xs3iIY=;
  b=Ow4xGNirKRCkhiXg0touAwB5tMcR6vIOHeZHbgzOyKk7tVb0skMfBIsn
   DN06/kmMkpxatG1BiYLaNDESfK+b1QhfT+g02oeypKrP6+5Be4W42drKD
   YEqCIGO85GBNZC/xvnEd9tKXPG+BWyFyHwFXr7Vr5MJNVeO8PImr7PAj8
   Ym6nmULl5KCcuUV69bWfbmRFNFRoMbXaomsvItL9BB6fQUMpWQ+ASU9R9
   UpO6l9W5DAtmMCF4vLsgwU/Xzbnj3fM/KOS6LCTpeBdqIWXx83xh2+2T2
   P1Wacjk+cAD26QimoUYqfe/89oLCC/vHFU6QqORQ093mSrS999OTJkm2y
   w==;
X-CSE-ConnectionGUID: 92Fwl4uES3ChhNlSlAtJwQ==
X-CSE-MsgGUID: dfycf8mxTPuf/XGIdt1+mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="58487179"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58487179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 16:34:37 -0700
X-CSE-ConnectionGUID: a5pnr+mWQu+3PvlbGuxJyg==
X-CSE-MsgGUID: VuVOT6cISZuFaIqyNsHtFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162321448"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2025 16:34:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufoPS-000MLj-1O;
	Sat, 26 Jul 2025 23:34:34 +0000
Date: Sun, 27 Jul 2025 07:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel 2/2] arch/mips/alchemy/common/gpiolib.c:100:12:
 error: incompatible function pointer types initializing 'int (*)(struct
 gpio_chip *, unsigned int, int)' with an expression of type 'void (struct
 gpio_chip *, unsigned int, int)'
Message-ID: <202507270738.rj7En3F7-lkp@intel.com>
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
head:   2c924414c5d54d7ffc883039176b66efbb735b72
commit: 2c924414c5d54d7ffc883039176b66efbb735b72 [2/2] treewide: rename GPIO set callbacks back to their original names
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20250727/202507270738.rj7En3F7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270738.rj7En3F7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270738.rj7En3F7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/alchemy/common/gpiolib.c:100:12: error: incompatible function pointer types initializing 'int (*)(struct gpio_chip *, unsigned int, int)' with an expression of type 'void (struct gpio_chip *, unsigned int, int)' [-Wincompatible-function-pointer-types]
     100 |                 .set                    = gpio1_set,
         |                                           ^~~~~~~~~
   arch/mips/alchemy/common/gpiolib.c:110:12: error: incompatible function pointer types initializing 'int (*)(struct gpio_chip *, unsigned int, int)' with an expression of type 'void (struct gpio_chip *, unsigned int, int)' [-Wincompatible-function-pointer-types]
     110 |                 .set                    = gpio2_set,
         |                                           ^~~~~~~~~
   2 errors generated.


vim +100 arch/mips/alchemy/common/gpiolib.c

51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06   93  
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06   94  struct gpio_chip alchemy_gpio_chip[] = {
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06   95  	[0] = {
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06   96  		.label			= "alchemy-gpio1",
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06   97  		.direction_input	= gpio1_direction_input,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06   98  		.direction_output	= gpio1_direction_output,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06   99  		.get			= gpio1_get,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06 @100  		.set			= gpio1_set,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  101  		.to_irq			= gpio1_to_irq,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  102  		.base			= ALCHEMY_GPIO1_BASE,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  103  		.ngpio			= ALCHEMY_GPIO1_NUM,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  104  	},
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  105  	[1] = {
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  106  		.label			= "alchemy-gpio2",
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  107  		.direction_input	= gpio2_direction_input,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  108  		.direction_output	= gpio2_direction_output,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  109  		.get			= gpio2_get,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  110  		.set			= gpio2_set,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  111  		.to_irq			= gpio2_to_irq,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  112  		.base			= ALCHEMY_GPIO2_BASE,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  113  		.ngpio			= ALCHEMY_GPIO2_NUM,
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  114  	},
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  115  };
51e02b02e65018 arch/mips/alchemy/common/gpiolib-au1000.c Manuel Lauss 2009-06-06  116  

:::::: The code at line 100 was first introduced by commit
:::::: 51e02b02e650183ff1277bcbad6a01d6ea0e9edb MIPS: Alchemy: Rewrite GPIO support.

:::::: TO: Manuel Lauss <manuel.lauss@googlemail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

