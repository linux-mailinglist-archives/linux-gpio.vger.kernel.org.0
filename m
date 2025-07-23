Return-Path: <linux-gpio+bounces-23662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A062B0EC54
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 09:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4234356125A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 07:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FD72777F7;
	Wed, 23 Jul 2025 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkM1mpBR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28432E3702
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257001; cv=none; b=gJNHtmP5ywEhCOVCOV4bOy8IPI40LnuN4l4JiwqZ4tlNYZr4cjk9D4EfFCgeSfDR4jcegMHovxAODr9Ih7/O/qyoS/jQW/5zqG8UknNa5MNBtfEfkxN1jPJdOPUbMCnog6PeQ8q6WNjkQNyuhufMTX0ipH6ocCAQZJbTOnnL6zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257001; c=relaxed/simple;
	bh=0ZOrKROh0FjE/Dhs5RpOiBFDO/jb+W/sa+dWW08lvZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bDi92sH7KEnhSGjV9MN0BGLTGCfpK0mj88ewl5FDf2QSAEpB3B7f2CA5wCFGslBPjt54f4Qc1gXyn1zXiIt2//GEeHhGcP66FaV6I3j/81fgxdc6HyRYiqfK46ieFhnmoUKY7AqoBti6NOEN2az72Wgn3ci8UGfQ0a3PQNw0DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkM1mpBR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753256999; x=1784792999;
  h=date:from:to:cc:subject:message-id;
  bh=0ZOrKROh0FjE/Dhs5RpOiBFDO/jb+W/sa+dWW08lvZA=;
  b=NkM1mpBRpZt7d1b12VmbJG6/f/RsVzsEMwowCz4QPmhAhrDEbmleDKqz
   zP2ThM4ZCLb51DE+8It/UHUOUR20fpLLTCIRKgaVQJvdWufwtC6CX1Ken
   38Q9B2NesN4kaOUwKATAi5GiTGwXMUqxGbiWIiCC8+bVj9LyFr7jvu43c
   Fy5dk+jzdWqTR7N9YAzJGrHNPwPbb07g7eL4Xx0ATU8OgYN4iPxk7Pm9C
   HArSNv69VtDNh9+OjDMTVJlQKeIfyItKrfopD8WLEvKVQX7J7QouIxa+M
   JZsmeEYHwx/vALWPjTPOitqImkBvqsqN5j30S72iqrnOPU4Bw0yD29+V3
   Q==;
X-CSE-ConnectionGUID: uiIUd1FVQSSfoW8n9Cxmew==
X-CSE-MsgGUID: 55QqCDBbRFm0Poxnf9UeIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55627208"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55627208"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 00:49:58 -0700
X-CSE-ConnectionGUID: BwJMDxnyRMCO6dsfmdmjNA==
X-CSE-MsgGUID: x1sFO+YwTZuRo1pujHN4+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159028722"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2025 00:49:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueUEd-000J67-0B;
	Wed, 23 Jul 2025 07:49:55 +0000
Date: Wed, 23 Jul 2025 15:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD REGRESSION
 8e086515870834f08e425976c50d3b51c22150ae
Message-ID: <202507231503.lCBWnRWa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: 8e086515870834f08e425976c50d3b51c22150ae  treewide: rename GPIO set callbacks back to their original names

Error/Warning ids grouped by kconfigs:

recent_errors
`-- mips-allyesconfig
    `-- drivers-ssb-driver_gpio.c:error:assignment-to-int-(-)(struct-gpio_chip-unsigned-int-int)-from-incompatible-pointer-type-void-(-)(struct-gpio_chip-unsigned-int-int)

elapsed time: 1460m

configs tested: 123
configs skipped: 9

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250722    gcc-10.5.0
arc                   randconfig-002-20250722    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20250722    gcc-12.5.0
arm                   randconfig-002-20250722    clang-22
arm                   randconfig-003-20250722    gcc-8.5.0
arm                   randconfig-004-20250722    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250722    clang-22
arm64                 randconfig-002-20250722    clang-22
arm64                 randconfig-003-20250722    clang-22
arm64                 randconfig-004-20250722    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250722    gcc-11.5.0
csky                  randconfig-002-20250722    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20250722    clang-20
hexagon               randconfig-002-20250722    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250722    gcc-12
i386        buildonly-randconfig-002-20250722    gcc-12
i386        buildonly-randconfig-003-20250722    clang-20
i386        buildonly-randconfig-004-20250722    gcc-12
i386        buildonly-randconfig-005-20250722    clang-20
i386        buildonly-randconfig-006-20250722    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250722    gcc-15.1.0
loongarch             randconfig-002-20250722    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250722    gcc-11.5.0
nios2                 randconfig-002-20250722    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250722    gcc-8.5.0
parisc                randconfig-002-20250722    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250722    gcc-13.4.0
powerpc               randconfig-002-20250722    clang-22
powerpc               randconfig-003-20250722    gcc-14.3.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250722    gcc-8.5.0
powerpc64             randconfig-002-20250722    clang-22
powerpc64             randconfig-003-20250722    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250722    clang-16
riscv                 randconfig-002-20250722    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250722    clang-22
s390                  randconfig-002-20250722    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250722    gcc-15.1.0
sh                    randconfig-002-20250722    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250722    gcc-13.4.0
sparc                 randconfig-002-20250722    gcc-15.1.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250722    gcc-8.5.0
sparc64               randconfig-002-20250722    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250722    gcc-12
um                    randconfig-002-20250722    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250722    gcc-12
x86_64      buildonly-randconfig-002-20250722    gcc-12
x86_64      buildonly-randconfig-003-20250722    gcc-12
x86_64      buildonly-randconfig-004-20250722    clang-20
x86_64      buildonly-randconfig-005-20250722    gcc-12
x86_64      buildonly-randconfig-006-20250722    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250722    gcc-15.1.0
xtensa                randconfig-002-20250722    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

