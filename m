Return-Path: <linux-gpio+bounces-17863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84345A6BCD2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 15:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5159167112
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA841D86C3;
	Fri, 21 Mar 2025 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEbj4MbP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE341D90AD
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566657; cv=none; b=T0Y5qHZkbBY2AAXZbtPn4pqkpB6/kKRu4j6ljEhSffIem2CDNkPXdveqTMv7z99HhW+6Wk+N7A5lcJIaVRG0FZ91obMWizvdHC+Uvv1VjnKnSIQ/jzlGW0p73yqaDEQH/n3tS8T5p3JJT8WZ3iAVyDRNB2SxYxAQtyY5xgxksuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566657; c=relaxed/simple;
	bh=i6zKyWmmDMKDFBNFp4V4S3edNjrmbP6dF05nkm4blAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OssanyKE4SsqOQuVG69NeQ/s1/9XID/r47mQQq0c4KQapWNps2/RE+iHAgAcT/c44pKlqeMOtbCETVs8iu1lgLB7esJuWOpdljPIgNo7C3sxV057OAf6lo4MvqitJX7aWz7oT7Z4oPyyE3A8CpSBNkgZfQNlHdpNMGiOZRci9uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEbj4MbP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742566656; x=1774102656;
  h=date:from:to:cc:subject:message-id;
  bh=i6zKyWmmDMKDFBNFp4V4S3edNjrmbP6dF05nkm4blAU=;
  b=nEbj4MbPNCMuR/rR1lK881Q+yfmeUgOYKQg7FsEvL+HEjm5kiRqs/3dS
   BE9OxTNLL42NKiPdJjYjyETjRBEwOV2RYBVaUZ889QmDSv3ZJs3uFa2jp
   wCrOUrvKhCYW9F7UUrEi3oK9FW9FMc6gv2MVmAGcl9rlRu3KET7vsTm0U
   xOMxbqxVsg+h3H04ydRsX0LJmGwATPSXwJtn5WDghoUIgAvt+WMg474YB
   orZ2k66UiqkjNb71lhWcm4w3ykt0KcpqzK1CvqoMddN6jNg61tXoMkXIs
   7JuIbvZ9Zuf0C+60anUmzzpQW0ooMmpk0aWgx/dL0Q5CfciYazSWreGd1
   Q==;
X-CSE-ConnectionGUID: J7US3EJdRbCIHQHufzsgOw==
X-CSE-MsgGUID: LkPQl5s+Rm2A3hR6CpQ24A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43075944"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="43075944"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 07:17:35 -0700
X-CSE-ConnectionGUID: SKbXlLKcQDWIdN/Cg5BnDw==
X-CSE-MsgGUID: hdH0z7uHSdKEM3ZQWzF94g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123391568"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2025 07:17:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvdBZ-0001Na-2O;
	Fri, 21 Mar 2025 14:17:23 +0000
Date: Fri, 21 Mar 2025 22:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 693c9ecd832669c55e8d8067eba064440d9a4709
Message-ID: <202503212208.H8kUzHFg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 693c9ecd832669c55e8d8067eba064440d9a4709  pinctrl: nuvoton: Reduce use of OF-specific APIs

elapsed time: 1450m

configs tested: 126
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250320    gcc-10.5.0
arc                   randconfig-002-20250320    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-21
arm                          collie_defconfig    gcc-14.2.0
arm                   randconfig-001-20250320    clang-20
arm                   randconfig-002-20250320    clang-16
arm                   randconfig-003-20250320    gcc-8.5.0
arm                   randconfig-004-20250320    gcc-7.5.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250320    clang-21
arm64                 randconfig-002-20250320    clang-21
arm64                 randconfig-003-20250320    clang-19
arm64                 randconfig-004-20250320    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250321    gcc-13.3.0
csky                  randconfig-002-20250321    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250321    clang-21
hexagon               randconfig-002-20250321    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250320    gcc-12
i386        buildonly-randconfig-002-20250320    clang-20
i386        buildonly-randconfig-003-20250320    clang-20
i386        buildonly-randconfig-004-20250320    clang-20
i386        buildonly-randconfig-005-20250320    gcc-12
i386        buildonly-randconfig-006-20250320    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250321    gcc-14.2.0
loongarch             randconfig-002-20250321    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250321    gcc-13.3.0
nios2                 randconfig-002-20250321    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250321    gcc-8.5.0
parisc                randconfig-002-20250321    gcc-6.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    gamecube_defconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250321    clang-21
powerpc               randconfig-002-20250321    gcc-7.5.0
powerpc               randconfig-003-20250321    gcc-7.5.0
powerpc64             randconfig-001-20250321    gcc-5.5.0
powerpc64             randconfig-002-20250321    clang-16
powerpc64             randconfig-003-20250321    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250320    clang-21
riscv                 randconfig-002-20250320    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250320    gcc-6.5.0
s390                  randconfig-002-20250320    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250320    gcc-14.2.0
sh                    randconfig-002-20250320    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250320    gcc-7.5.0
sparc                 randconfig-002-20250320    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250320    gcc-5.5.0
sparc64               randconfig-002-20250320    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250320    gcc-12
um                    randconfig-002-20250320    clang-16
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250320    clang-20
x86_64      buildonly-randconfig-002-20250320    gcc-12
x86_64      buildonly-randconfig-003-20250320    clang-20
x86_64      buildonly-randconfig-004-20250320    clang-20
x86_64      buildonly-randconfig-005-20250320    clang-20
x86_64      buildonly-randconfig-006-20250320    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250320    gcc-9.3.0
xtensa                randconfig-002-20250320    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

