Return-Path: <linux-gpio+bounces-5283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF689EF07
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 11:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FF5B2142B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCF7155722;
	Wed, 10 Apr 2024 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8btygZS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D276056
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712741918; cv=none; b=bYegiLGZGcRBSbej8LnhL0Qj8K8Qgfsn5yUV4jFs+vUoag4+UfVzTfMVS6eyIDLlNX3Q1sSG8f1Hb9KXhTXufxlzv3jzUe798XaGK2z+15dPrYXrpY+2fUD7VBrPxhN/0MyTLDVmG27lJ6/t3Q+pcJZ7BsLKfXxEGMUsOrmFPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712741918; c=relaxed/simple;
	bh=ZtQ+CcKc7SvoszzWvpFfFAFDcYAXjrfdMl0YCKL1wtw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iF54a4EzZ3eaDGqBtNM80IhlOwrFx17QzOuxgyzrz+ZgPCWb5sL2vhLv72r40wvXC/IrQFUQp0RUEg22NCu5fyqjI847e6fERZUx4zfcR4uHUXR2SEPVK7Cus9SlQ/CVvajqbAUCp8emtmmq7MZItN/SFMkR0I1UfoUohxg4+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8btygZS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712741916; x=1744277916;
  h=date:from:to:cc:subject:message-id;
  bh=ZtQ+CcKc7SvoszzWvpFfFAFDcYAXjrfdMl0YCKL1wtw=;
  b=Z8btygZSAkUZqiNhx2cHL4nro7JOwPJkqO66dSO27Y4yUmR6nALlWeW2
   +4xThVJucMVMN6xDSFWVDrQFUuzbCcBb52F0GRBKnCDBKjaMUUvyiqr/W
   Si5VdbCt1910d2eZz4Gw9k4pgw9tBFKbD7JMfyi+oLN9HzxPJ/i0ENNmu
   xiwHq+xCRURr4mawIDx3m8/ej6YBgkS7K2WKR1Jv/BEbOzT/isES2JWSL
   Gd5cJT9R5J81GFaMq8mbNkHy5jzxRUSxxbplWKkg4ckI5sYqRLSpXi3lv
   c4TkdBnnZ5n+9RIEqKOtZdoQk3F1FL1nadj2cnjuDGfIobRIEoWxRqrdR
   A==;
X-CSE-ConnectionGUID: 9cKmtAU0S72Mn9HX2dSeTQ==
X-CSE-MsgGUID: SA7XwfDfQ4+cll5/TsjfKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11884606"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11884606"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 02:38:34 -0700
X-CSE-ConnectionGUID: I9OGShK2Quu7lGgwftbxgA==
X-CSE-MsgGUID: +tFihJueRXOr/ojwfIs7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25003318"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2024 02:38:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruUPW-0007At-0S;
	Wed, 10 Apr 2024 09:38:30 +0000
Date: Wed, 10 Apr 2024 17:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless] BUILD REGRESSION
 3ca0eec7ecfa5c404f41e9b1e7690ec64de77b53
Message-ID: <202404101748.RvmaNVlS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
branch HEAD: 3ca0eec7ecfa5c404f41e9b1e7690ec64de77b53  wifi: ath9k: Obtain system GPIOS from descriptors

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202404100624.vZIIfZvs-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404100626.HQOO79B8-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404100659.1H9VKoBw-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404101357.XagbwkcW-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-ath79.c:240:32: error: 'pdev' undeclared (first use in this function); did you mean 'dev'?
drivers/gpio/gpio-ath79.c:240:32: error: use of undeclared identifier 'pdev'; did you mean 'dev'?
drivers/gpio/gpio-ath79.c:240:38: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
drivers/gpio/gpio-ath79.c:250:22: error: used type 'struct gpiod_lookup' where arithmetic or pointer type is required
drivers/gpio/gpio-ath79.c:251:25: error: implicit declaration of function 'PIO_LOOKUP_IDX'; did you mean 'GPIO_LOOKUP_IDX'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-ath79.c:251:4: error: call to undeclared function 'PIO_LOOKUP_IDX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-ath79.c:252:40: error: conversion to non-scalar type requested
drivers/gpio/gpio-ath79.c:263:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/gpio/gpio-ath79.c:263:1: warning: non-void function does not return a value [-Wreturn-type]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- alpha-randconfig-r051-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- alpha-randconfig-r062-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- arc-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- arc-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- arm-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- arm-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- arm-randconfig-001-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- arm64-randconfig-002-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- arm64-randconfig-004-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- csky-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- csky-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- csky-randconfig-002-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- csky-randconfig-r054-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- i386-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- i386-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- i386-buildonly-randconfig-005-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- i386-buildonly-randconfig-006-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- loongarch-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- loongarch-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- loongarch-randconfig-001-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- loongarch-randconfig-002-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- m68k-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- m68k-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- microblaze-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- microblaze-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- mips-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- mips-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- nios2-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- nios2-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- openrisc-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- openrisc-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-r052-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- parisc-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- parisc-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- powerpc-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- powerpc64-randconfig-001-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- s390-allyesconfig
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- sh-allyesconfig
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- sh-randconfig-001-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- sparc-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- sparc-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- sparc-randconfig-001-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- sparc64-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- sparc64-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-002-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- sparc64-randconfig-r064-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- um-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- x86_64-buildonly-randconfig-004-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- x86_64-buildonly-randconfig-006-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- xtensa-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:conversion-to-non-scalar-type-requested
|   |-- drivers-gpio-gpio-ath79.c:error:implicit-declaration-of-function-PIO_LOOKUP_IDX
|   `-- drivers-gpio-gpio-ath79.c:error:pdev-undeclared-(first-use-in-this-function)
|-- xtensa-randconfig-001-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
`-- xtensa-randconfig-002-20240410
    `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
clang_recent_errors
|-- arm-randconfig-002-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value
|-- hexagon-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:call-to-undeclared-function-PIO_LOOKUP_IDX-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-ath79.c:error:no-member-named-dev-in-struct-device
|   |-- drivers-gpio-gpio-ath79.c:error:use-of-undeclared-identifier-pdev
|   `-- drivers-gpio-gpio-ath79.c:error:used-type-struct-gpiod_lookup-where-arithmetic-or-pointer-type-is-required
|-- hexagon-randconfig-001-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value
|-- hexagon-randconfig-002-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value
|-- i386-buildonly-randconfig-002-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value
|-- i386-buildonly-randconfig-003-20240410
|   `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value
|-- riscv-allmodconfig
|   |-- drivers-gpio-gpio-ath79.c:error:call-to-undeclared-function-PIO_LOOKUP_IDX-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-ath79.c:error:no-member-named-dev-in-struct-device
|   |-- drivers-gpio-gpio-ath79.c:error:use-of-undeclared-identifier-pdev
|   `-- drivers-gpio-gpio-ath79.c:error:used-type-struct-gpiod_lookup-where-arithmetic-or-pointer-type-is-required
|-- riscv-allyesconfig
|   |-- drivers-gpio-gpio-ath79.c:error:call-to-undeclared-function-PIO_LOOKUP_IDX-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-ath79.c:error:no-member-named-dev-in-struct-device
|   |-- drivers-gpio-gpio-ath79.c:error:use-of-undeclared-identifier-pdev
|   `-- drivers-gpio-gpio-ath79.c:error:used-type-struct-gpiod_lookup-where-arithmetic-or-pointer-type-is-required
|-- s390-allmodconfig
|   `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value
`-- x86_64-buildonly-randconfig-002-20240410
    `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value

elapsed time: 1182m

configs tested: 166
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240410   gcc  
arc                   randconfig-002-20240410   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240410   gcc  
arm                   randconfig-002-20240410   clang
arm                   randconfig-003-20240410   gcc  
arm                   randconfig-004-20240410   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240410   clang
arm64                 randconfig-002-20240410   gcc  
arm64                 randconfig-003-20240410   gcc  
arm64                 randconfig-004-20240410   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240410   gcc  
csky                  randconfig-002-20240410   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240410   clang
hexagon               randconfig-002-20240410   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240410   gcc  
i386         buildonly-randconfig-002-20240410   clang
i386         buildonly-randconfig-003-20240410   clang
i386         buildonly-randconfig-004-20240410   clang
i386         buildonly-randconfig-005-20240410   gcc  
i386         buildonly-randconfig-006-20240410   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240410   clang
i386                  randconfig-002-20240410   clang
i386                  randconfig-003-20240410   gcc  
i386                  randconfig-004-20240410   gcc  
i386                  randconfig-005-20240410   gcc  
i386                  randconfig-006-20240410   clang
i386                  randconfig-011-20240410   clang
i386                  randconfig-012-20240410   clang
i386                  randconfig-013-20240410   gcc  
i386                  randconfig-014-20240410   clang
i386                  randconfig-015-20240410   gcc  
i386                  randconfig-016-20240410   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240410   gcc  
loongarch             randconfig-002-20240410   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240410   gcc  
nios2                 randconfig-002-20240410   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240410   gcc  
parisc                randconfig-002-20240410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc               randconfig-001-20240410   gcc  
powerpc               randconfig-002-20240410   gcc  
powerpc               randconfig-003-20240410   gcc  
powerpc64             randconfig-001-20240410   gcc  
powerpc64             randconfig-002-20240410   gcc  
powerpc64             randconfig-003-20240410   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240410   gcc  
riscv                 randconfig-002-20240410   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240410   clang
s390                  randconfig-002-20240410   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240410   gcc  
sh                    randconfig-002-20240410   gcc  
sh                           se7712_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240410   gcc  
sparc64               randconfig-002-20240410   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240410   clang
um                    randconfig-002-20240410   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240410   clang
x86_64       buildonly-randconfig-003-20240410   clang
x86_64       buildonly-randconfig-005-20240410   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240410   clang
x86_64                randconfig-003-20240410   clang
x86_64                randconfig-004-20240410   clang
x86_64                randconfig-006-20240410   clang
x86_64                randconfig-014-20240410   clang
x86_64                randconfig-016-20240410   clang
x86_64                randconfig-072-20240410   clang
x86_64                randconfig-074-20240410   clang
x86_64                randconfig-076-20240410   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240410   gcc  
xtensa                randconfig-002-20240410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

