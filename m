Return-Path: <linux-gpio+bounces-4238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 813EE87769B
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 13:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6511B2110F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 12:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624EF200D2;
	Sun, 10 Mar 2024 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKi/4M7e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC81DDDB
	for <linux-gpio@vger.kernel.org>; Sun, 10 Mar 2024 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710074291; cv=none; b=s/4x+5Jut4sIDXWC70eQQkLFwPrwEBzWogA6HIZcyPuJurdloIRd2d0dSkngm401UD0xC41AiKwbQMwp+XFd4IIsJWZnnDndpsseAtV5SqmZIzlxXI1ckWIVoGY3cA5xqQx0d3KC8NcqMSVsk91kZ9rEPSlCHVq9fm6DRtjl8Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710074291; c=relaxed/simple;
	bh=cxNtWrKMxflWvCw9A8mpFC/x+qBjldLoOyDLBkBENT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xw7s8Nofw49sWwv1L3kqaSYSVtkb4nja2vlGKibMsbsTsLKhsrMrmurT8bP58pf8chCaKjXewwLluy5uucFZFIpLBHja8/N8ODX90iuxUhtSKLghBAgte45VXI1CY6TWJityvq1qztIyWCwuUE8xsRihimogDX0OggY6J1EO0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKi/4M7e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710074289; x=1741610289;
  h=date:from:to:cc:subject:message-id;
  bh=cxNtWrKMxflWvCw9A8mpFC/x+qBjldLoOyDLBkBENT0=;
  b=HKi/4M7e5WYpfXVbOqPpxHbDQ6dUXYQ6Tv7Bxz/nx5HnJhr66VhianI+
   HNX5/QouX5i4CgBhM7kGTxeBiEjUD/eMzitPIBnMEX0QDotkOvuawMeDH
   7o3Zv663ijupJXS+Ww/kZ3sgxqWGGAL489X6naP9aoRrIwDw28YA/N5l0
   /XFeYf8LxSkyETSv+CKKh42P+elMSG7CS93pgNTGweZoMWqA9npTri3Pc
   t1fm9yXUpZj/HKN8oamVQIuLjLBPBYCleySHTWFTesCn+uErUpE7w7d6a
   gBMMHd197+6ILjT3hNK8ErzRe1+IZKA8f6bqgRAzWMI1zrnkAfiRB+Y4k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="22266396"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="22266396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 05:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="10804386"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2024 05:38:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjIRJ-0008EO-08;
	Sun, 10 Mar 2024 12:38:05 +0000
Date: Sun, 10 Mar 2024 20:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/fix-nmk-debugfs] BUILD SUCCESS
 b240755731f7e93fdfec3ac39535bbd05d987ede
Message-ID: <202403102036.eBbubkm3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/fix-nmk-debugfs
branch HEAD: b240755731f7e93fdfec3ac39535bbd05d987ede  gpio: nomadik: Fix debugfs without debugfs

elapsed time: 721m

configs tested: 185
configs skipped: 4

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
arc                   randconfig-001-20240310   gcc  
arc                   randconfig-002-20240310   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   clang
arm                   randconfig-001-20240310   gcc  
arm                   randconfig-002-20240310   gcc  
arm                   randconfig-003-20240310   gcc  
arm                   randconfig-004-20240310   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240310   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240310   gcc  
csky                  randconfig-002-20240310   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240310   clang
i386         buildonly-randconfig-002-20240310   clang
i386         buildonly-randconfig-003-20240310   clang
i386         buildonly-randconfig-004-20240310   clang
i386         buildonly-randconfig-005-20240310   gcc  
i386         buildonly-randconfig-006-20240310   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240310   gcc  
i386                  randconfig-002-20240310   gcc  
i386                  randconfig-003-20240310   clang
i386                  randconfig-004-20240310   gcc  
i386                  randconfig-005-20240310   gcc  
i386                  randconfig-006-20240310   gcc  
i386                  randconfig-011-20240310   clang
i386                  randconfig-012-20240310   clang
i386                  randconfig-013-20240310   clang
i386                  randconfig-014-20240310   clang
i386                  randconfig-015-20240310   clang
i386                  randconfig-016-20240310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240310   gcc  
loongarch             randconfig-002-20240310   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                           ip22_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240310   gcc  
nios2                 randconfig-002-20240310   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240310   gcc  
parisc                randconfig-002-20240310   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ksi8560_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc               randconfig-001-20240310   gcc  
powerpc64             randconfig-001-20240310   gcc  
powerpc64             randconfig-002-20240310   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240310   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240310   gcc  
sh                    randconfig-002-20240310   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240310   gcc  
sparc64               randconfig-002-20240310   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240310   gcc  
um                    randconfig-002-20240310   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240310   clang
x86_64       buildonly-randconfig-002-20240310   gcc  
x86_64       buildonly-randconfig-003-20240310   clang
x86_64       buildonly-randconfig-004-20240310   gcc  
x86_64       buildonly-randconfig-005-20240310   clang
x86_64       buildonly-randconfig-006-20240310   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240310   clang
x86_64                randconfig-002-20240310   gcc  
x86_64                randconfig-003-20240310   gcc  
x86_64                randconfig-004-20240310   gcc  
x86_64                randconfig-005-20240310   clang
x86_64                randconfig-006-20240310   gcc  
x86_64                randconfig-011-20240310   gcc  
x86_64                randconfig-012-20240310   clang
x86_64                randconfig-013-20240310   clang
x86_64                randconfig-014-20240310   gcc  
x86_64                randconfig-015-20240310   clang
x86_64                randconfig-016-20240310   gcc  
x86_64                randconfig-071-20240310   gcc  
x86_64                randconfig-072-20240310   gcc  
x86_64                randconfig-073-20240310   gcc  
x86_64                randconfig-074-20240310   gcc  
x86_64                randconfig-075-20240310   clang
x86_64                randconfig-076-20240310   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20240310   gcc  
xtensa                randconfig-002-20240310   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

