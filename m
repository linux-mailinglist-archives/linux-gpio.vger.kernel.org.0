Return-Path: <linux-gpio+bounces-7835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6647591CFC3
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jun 2024 03:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52D20B217D4
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jun 2024 01:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E198E110A;
	Sun, 30 Jun 2024 01:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hujPdQaL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E60620
	for <linux-gpio@vger.kernel.org>; Sun, 30 Jun 2024 01:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719709565; cv=none; b=s5RozZZOuZlx6LxgS8gJwKaD1qLtIZa1RnCHybvr8xe7Wxhpuz9wxGJETmVSEi8SXc7PCJAWToEvdtGC8e7a42YDP6bhnqkogJF6aJYhYGA1GZAHkLFbF7B2fY+Ghx0thPjm8lTCaJ//lvzPkhgpd5jxY1NmZGLbZrhGSQRvwlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719709565; c=relaxed/simple;
	bh=HlRp5mZezh9SUA0BsQ07FYFETy4XP9Owvlljt0CsEvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AxiHaniXl9RvAxf/BihWO+FUyn+FPoiGfDlVek6JVHQID35RwReHHIwVDeFQNCdGyvKuNc/oDZTfR+pcLA17Fch8XW+B3BRxD7sGBk7z8BE1FLsQAfyKKvz+aSBbv1RAMpB/Io7eYZRi2gfO29FbP8dm03tqh1zvi9C8m++Mfhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hujPdQaL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719709563; x=1751245563;
  h=date:from:to:cc:subject:message-id;
  bh=HlRp5mZezh9SUA0BsQ07FYFETy4XP9Owvlljt0CsEvg=;
  b=hujPdQaLTOOqxfEKHsNqSggUhsaJZM2eXQJyRKwWQ94SM1bR/s4LsFZX
   QRNz5H3Qx5XGx9HZc0SQgqA6OzX5AXmsjocdKbpAQ4LjUmUsLc0jZMfiB
   J7Hp2Vw6caJgyOVuZO/wgI7vDITRKVPJbTY+DvlK3OsOzSDXbfIEOt1I/
   6IwepX81PD8pdie/+IgbhW8EaGgYdwA2SNSBJFPAT6wmqW8FZREUROO/B
   Q9AzoR/+WZ7uUF2Cv1VpMY5vXK13EUewUo56Lo9dywQU1uc6T6CaA3DLm
   EO9ebg2BusD2r4nqI//AU90BVK/nrv9t2oUtgpva2uVLKWcqBtw9TEmvi
   w==;
X-CSE-ConnectionGUID: 6OOh3PVfQb+teE0GEnlaTQ==
X-CSE-MsgGUID: 3u1zBt5aQoS29q/+OcF2Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="39372208"
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; 
   d="scan'208";a="39372208"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 18:06:03 -0700
X-CSE-ConnectionGUID: DYTfFV9YTxCYhtwiKG47bw==
X-CSE-MsgGUID: jFyDNUEXS9+C1pSTr9bV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; 
   d="scan'208";a="45010131"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2024 18:06:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNj0y-000KUy-0I;
	Sun, 30 Jun 2024 01:06:00 +0000
Date: Sun, 30 Jun 2024 09:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 0cd9f140389bcd876e23aa3c06eea07f42892ad4
Message-ID: <202406300914.2KsI8kWS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 0cd9f140389bcd876e23aa3c06eea07f42892ad4  pinctrl: mlxbf3: Fix return value check for devm_platform_ioremap_resource

elapsed time: 5109m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                          collie_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                          exynos_defconfig   clang-17
arm                       imx_v6_v7_defconfig   clang-19
arm                       versatile_defconfig   gcc-13.2.0
arm64                            alldefconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                             alldefconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                            q40_defconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                malta_qemu_32r6_defconfig   gcc-13.2.0
mips                        qi_lb60_defconfig   clang-19
nios2                               defconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                      chrp32_defconfig   clang-19
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   clang-14
powerpc                    mvme5100_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   clang-19
powerpc                     redwood_defconfig   clang-19
powerpc                    sam440ep_defconfig   gcc-13.2.0
powerpc                         wii_defconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                    nommu_virt_defconfig   clang-19
s390                                defconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                   secureedge5410_defconfig   gcc-13.2.0
sh                   sh7770_generic_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240628   gcc-13
x86_64       buildonly-randconfig-002-20240628   clang-18
x86_64       buildonly-randconfig-003-20240628   gcc-13
x86_64       buildonly-randconfig-004-20240628   gcc-13
x86_64       buildonly-randconfig-005-20240628   gcc-13
x86_64       buildonly-randconfig-006-20240628   clang-18
x86_64                randconfig-001-20240628   clang-18
x86_64                randconfig-002-20240628   clang-18
x86_64                randconfig-003-20240628   gcc-11
x86_64                randconfig-004-20240628   gcc-7
x86_64                randconfig-005-20240628   clang-18
x86_64                randconfig-006-20240628   clang-18
x86_64                randconfig-011-20240628   clang-18
x86_64                randconfig-012-20240628   gcc-10
x86_64                randconfig-013-20240628   gcc-13
x86_64                randconfig-014-20240628   clang-18
x86_64                randconfig-015-20240628   clang-18
x86_64                randconfig-016-20240628   gcc-12
x86_64                randconfig-071-20240628   clang-18
x86_64                randconfig-072-20240628   gcc-13
x86_64                randconfig-073-20240628   clang-18
x86_64                randconfig-074-20240628   gcc-13
x86_64                randconfig-075-20240628   gcc-13
x86_64                randconfig-076-20240628   gcc-13
xtensa                  cadence_csp_defconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

