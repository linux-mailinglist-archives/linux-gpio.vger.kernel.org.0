Return-Path: <linux-gpio+bounces-4133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD6871969
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 10:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F8631C223DB
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C56452F6F;
	Tue,  5 Mar 2024 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpoxuKON"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AFD5026E
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630385; cv=none; b=Rev6+YapPRIJ3TL3ksoXbS/yTkY/7ixBD2jFQ4gCbgcbfckIzlBYsYgyJnhVp+bzPifKDhPP8d0+BEZKBLGz8rgRw71VTy+ORwOdVa272h/Nt/4Y2m309mvGdaiiCFWXm7P/guugSQuSPeS1+7ahctEJXG825in1+7iPNw3FjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630385; c=relaxed/simple;
	bh=l0e/RYxFoAD6OIyR/tbTKx7tlpaEt8Mwn0xLUXJEeig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DJ7pRu7Zh8gBs2BDhxYxomdmIPR7DF1H8Ux/1kNdQ/A/jZ2KgaxqQk0vXvNdOPZjn64u239QvVyw8VbA9TDBKEQ+4mCxCjwicQlAg7XrPTs52LtnG8TtMV4uAhOR7FGUupdkSVRji3i5hXfFkXabMbYyR3kOFNgVcFWE56u/cxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpoxuKON; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709630383; x=1741166383;
  h=date:from:to:cc:subject:message-id;
  bh=l0e/RYxFoAD6OIyR/tbTKx7tlpaEt8Mwn0xLUXJEeig=;
  b=hpoxuKON/K9QA2VslvaKdV9WGtOqxCtVDePTgfo3gaWijDPro7rjIYab
   Id/EMZsVFiSs6QCLCfV6hWttI80H9QMuCxphJjx+87KtrupT45p/l1xx+
   jHvic1JWmgD8KZz8iQJbrPiSK7a2/yRM0TN/ycJvUJqb9CJzmxaGxzWOO
   /yf/3LupoL8Qq5txNLMzHsEDByT8jbWDhavVmilO6JfopXembpeGxp8u4
   /B1T3nIlo2LL9WoagapE9NEfP6hBJAH3LaUYBIxLdHb7qPElGDY0HPP31
   S9ShYUFtWMCh3SuEz0yVZrJ9EL+Vm/oo3Fd0DzyTNU4PNaK382MOc/Dop
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4032718"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4032718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13962717"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2024 01:19:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhQxV-0003Bj-1D;
	Tue, 05 Mar 2024 09:19:37 +0000
Date: Tue, 05 Mar 2024 17:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/awinic-aw9523] BUILD REGRESSION
 70c38171f464ba4b47c120a90c11388a43fffa6a
Message-ID: <202403051741.jUxyiWld-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/awinic-aw9523
branch HEAD: 70c38171f464ba4b47c120a90c11388a43fffa6a  pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403050916.KBtE6eEj-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202403051235.HMdG0ybN-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/pinctrl/pinctrl-aw9523.c:582: warning: Excess function parameter 'pin' description in '_aw9523_gpio_get_multiple'
drivers/pinctrl/pinctrl-aw9523.c:582: warning: Excess function parameter 'regmap' description in '_aw9523_gpio_get_multiple'
drivers/pinctrl/pinctrl-aw9523.c:582: warning: Function parameter or struct member 'awi' not described in '_aw9523_gpio_get_multiple'
drivers/pinctrl/pinctrl-aw9523.c:582: warning: Function parameter or struct member 'mask' not described in '_aw9523_gpio_get_multiple'
pinctrl-aw9523.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
pinctrl-aw9523.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
pinctrl-aw9523.c:(.text+0x167c): undefined reference to `__devm_regmap_init_i2c'
sparc64-linux-ld: pinctrl-aw9523.c:(.text+0x16f8): undefined reference to `i2c_adapter_depth'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- arc-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- arc-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- arc-randconfig-r063-20240305
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- arm-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- arm-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- csky-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- csky-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- i386-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- i386-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- loongarch-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- loongarch-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- m68k-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- m68k-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- microblaze-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- microblaze-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- mips-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- mips-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- nios2-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- nios2-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- openrisc-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- openrisc-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- parisc-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- parisc-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- powerpc-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- powerpc64-randconfig-r052-20240305
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- s390-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- sh-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- sh-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- sparc-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|   |-- pinctrl-aw9523.c:(.exit.text):undefined-reference-to-i2c_del_driver
|   |-- pinctrl-aw9523.c:(.init.text):undefined-reference-to-i2c_register_driver
|   |-- pinctrl-aw9523.c:(.text):undefined-reference-to-__devm_regmap_init_i2c
|   `-- sparc64-linux-ld:pinctrl-aw9523.c:(.text):undefined-reference-to-i2c_adapter_depth
|-- sparc-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- sparc-randconfig-r053-20240305
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- sparc-randconfig-r081-20240305
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- sparc64-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- sparc64-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- um-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
`-- xtensa-allyesconfig
    |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
    |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
    |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
    `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
clang_recent_errors
|-- arm64-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- arm64-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- hexagon-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- hexagon-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- powerpc-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- powerpc-randconfig-r081-20240305
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- riscv-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- riscv-allyesconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- s390-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
|-- x86_64-allmodconfig
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
|   |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
|   `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple
`-- x86_64-allyesconfig
    |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-pin-description-in-_aw9523_gpio_get_multiple
    |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Excess-function-parameter-regmap-description-in-_aw9523_gpio_get_multiple
    |-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-awi-not-described-in-_aw9523_gpio_get_multiple
    `-- drivers-pinctrl-pinctrl-aw9523.c:warning:Function-parameter-or-struct-member-mask-not-described-in-_aw9523_gpio_get_multiple

elapsed time: 1468m

configs tested: 181
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240305   gcc  
arc                   randconfig-002-20240305   gcc  
arc                           tb10x_defconfig   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                           imxrt_defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-002-20240305   gcc  
arm                   randconfig-004-20240305   gcc  
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240305   gcc  
arm64                 randconfig-003-20240305   gcc  
arm64                 randconfig-004-20240305   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240305   gcc  
csky                  randconfig-002-20240305   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240305   clang
i386         buildonly-randconfig-004-20240305   clang
i386         buildonly-randconfig-005-20240305   clang
i386                                defconfig   clang
i386                  randconfig-001-20240305   clang
i386                  randconfig-003-20240305   clang
i386                  randconfig-015-20240305   clang
i386                  randconfig-016-20240305   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240305   gcc  
loongarch             randconfig-002-20240305   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240305   gcc  
nios2                 randconfig-002-20240305   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240305   gcc  
parisc                randconfig-002-20240305   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                          g5_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                   motionpro_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240305   gcc  
powerpc               randconfig-002-20240305   gcc  
powerpc               randconfig-003-20240305   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-003-20240305   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240305   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240305   gcc  
s390                  randconfig-002-20240305   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240305   gcc  
sh                    randconfig-002-20240305   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240305   gcc  
sparc64               randconfig-002-20240305   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240305   gcc  
um                    randconfig-002-20240305   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240305   clang
x86_64       buildonly-randconfig-002-20240305   clang
x86_64       buildonly-randconfig-003-20240305   clang
x86_64       buildonly-randconfig-004-20240305   clang
x86_64       buildonly-randconfig-005-20240305   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240305   clang
x86_64                randconfig-002-20240305   clang
x86_64                randconfig-004-20240305   clang
x86_64                randconfig-005-20240305   clang
x86_64                randconfig-013-20240305   clang
x86_64                randconfig-015-20240305   clang
x86_64                randconfig-016-20240305   clang
x86_64                randconfig-073-20240305   clang
x86_64                randconfig-074-20240305   clang
x86_64                randconfig-076-20240305   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240305   gcc  
xtensa                randconfig-002-20240305   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

