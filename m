Return-Path: <linux-gpio+bounces-4127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559C8716F1
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 08:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B9DD281D8C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 07:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2797F492;
	Tue,  5 Mar 2024 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPUxxYnr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A6C7E59D
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709623901; cv=none; b=BKPCJA3OripyoTFlCgL9Wx2V/ONxJzWWod0eXh8Csm8RGdBRZKk4SV239b9hHomeCHk9gVaoOFz+gUhR1YWQOyZk4NWCK6nEPgiaYlzzziAs1UXw2NvAmyF7dB1nhjff9gqenYH4mc+5OgiPDX6YV0AQgBxrhlKyqdCsqf0ksVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709623901; c=relaxed/simple;
	bh=VJcCgpZSXyisfhYE7OkbxZrkKT3NOQqqaFI4bcx+ZYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwSwvsK78JlEiAUl1O5+xkCeItlDG9YZ9rCBmEQcjPiR9SMtbaSnR4aXVYZhXzLxM1hIpgGWRj5bHYQTJ1p0ofEUnZwQlY+mqXZrHSWBmPJtn+EO1Zn/n4w1wYdmqWsPueYsAwp6JD3UuHUlinwTquESXh8efgCFUVYguMM20hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPUxxYnr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709623901; x=1741159901;
  h=date:from:to:cc:subject:message-id;
  bh=VJcCgpZSXyisfhYE7OkbxZrkKT3NOQqqaFI4bcx+ZYo=;
  b=HPUxxYnrYIWQ19k/eDgDi1uEJRO/dNpCvg9JWe8QALvmsT9feKd9+a5L
   KShUbx6FJ7EhjwAcmYPiH5klo66fdh8ZCqN4YUGPTYM25yeEmTwSayJ4Y
   Yobikz4f9/jNZCGj0gPUyjwZx8UcdLc4xxlBDFCXtPrsI12iv3Sqj1Tkr
   cEmqRn+2NPm4BjtpgrN5QZCh841rxTXOPULdrVnnLIcl9we8tF9jmxJN6
   yf82MBfe3qsRfsODjvl8fH2LF4HDaz3ihX64hp56wMPqHixBvI/ULeco4
   FMTPv+MQCSQotqoc92PZXXEwdpAwk+gOyK/1tr8q23WtqzpfIho9OK82r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4325906"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4325906"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 23:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13966201"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 23:31:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhPGx-00037L-0G;
	Tue, 05 Mar 2024 07:31:35 +0000
Date: Tue, 05 Mar 2024 15:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-nomadik-gpio] BUILD SUCCESS
 97bc5f06dbb12c775206da00855dcbdfa8d3e162
Message-ID: <202403051534.1PjBN68e-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
branch HEAD: 97bc5f06dbb12c775206da00855dcbdfa8d3e162  gpio: nomadik: Finish conversion to use firmware node APIs

elapsed time: 1287m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

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
arm                       netwinder_defconfig   gcc  
arm                   randconfig-002-20240305   gcc  
arm                   randconfig-004-20240305   gcc  
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
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
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          g5_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                   motionpro_defconfig   clang
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
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240305   gcc  
sh                    randconfig-002-20240305   gcc  
sh                           se7206_defconfig   gcc  
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

