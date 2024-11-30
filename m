Return-Path: <linux-gpio+bounces-13368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5570A9DF01D
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Nov 2024 12:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1114128236E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Nov 2024 11:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3525D15665C;
	Sat, 30 Nov 2024 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+oEn0kY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13C9141987
	for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2024 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732966359; cv=none; b=Eb4a73CToNGPrPueY/hdDAsJvMvZmqYIO3h5nOG8Md70H3WUi1Nu3feluy3KCD8JXvX4OKNKgr0XoKWUG/1aOAptwbuUHsY5dLqTsiAPHdlleSrJSjvbg4UH11tezDvTlAg/t06HUSVPwCjIZSWhZp1ZKMkyTnRgmzeIxvgX3TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732966359; c=relaxed/simple;
	bh=IFotXtOytYxZmJtFwzjtHwQN1GQQWi5ndULeeLVY5+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oD9aq7Khg4pDaUjDKhZiQDMMo9Sk4FamucPnhlIMcIp2idMN84WfEG07uCHUatpVoGqlzBC+6uiozCle45UNnEH5wFcCLQntdb0GmjQz+rpENkazMvnIRxaPRAj562dzVA0Zd99rZVOfDgiY2ypxFmyQ68kEQ/xujlZGmRXWe/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+oEn0kY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732966357; x=1764502357;
  h=date:from:to:cc:subject:message-id;
  bh=IFotXtOytYxZmJtFwzjtHwQN1GQQWi5ndULeeLVY5+M=;
  b=S+oEn0kYOceM4ykn47vzbZgM44dBsR05MQsj1eSZZvdHcq7sSrHhUqiO
   bGny42POOE+1sacMcs+lOiYgzGcLzft+7POHuqmPL2ZPqM5N8az4IRbn3
   4bmzbSMPFlAm5rbD+AtBc2eFgRY/iyCr3+7eotaRDrguQN2L3CfSd41bo
   uq7hleIgJlDEgmCVih+z26m1m8jZcvTQjhzmVCNSuCytieUTLJI9VtGx5
   /PpDxTnJ0JTddadmYeA5tsQaOq4SlGJuryoUeau1m6LbskM1l1/lxCdUY
   3pULd0xV/nKYfsan3ZdpT5x/X0p+GaKVMdkyo7Vz7u/IwFuYVAlJRBG58
   Q==;
X-CSE-ConnectionGUID: hHM3bHfqRsOKJNDuJ5Addw==
X-CSE-MsgGUID: W/WsDh6KSo6+2bkPS0ArZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33307896"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33307896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 03:32:36 -0800
X-CSE-ConnectionGUID: TRXlthk8TciO2iSqCV9dYQ==
X-CSE-MsgGUID: UsjyOLvnQpuPkGVX5pyNew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97712093"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Nov 2024 03:32:35 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHLi8-0000cJ-2D;
	Sat, 30 Nov 2024 11:32:29 +0000
Date: Sat, 30 Nov 2024 19:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 39c53afeb5993c46edeeaac2214e53ba4bece49e
Message-ID: <202411301956.0ZbYDIuQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 39c53afeb5993c46edeeaac2214e53ba4bece49e  ARM: imx: Re-introduce the PINCTRL selection

elapsed time: 726m

configs tested: 139
configs skipped: 83

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20241130    gcc-13.2.0
arc                   randconfig-001-20241130    gcc-14.2.0
arc                   randconfig-002-20241130    gcc-13.2.0
arc                   randconfig-002-20241130    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              alldefconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    gcc-14.2.0
arm                         bcm2835_defconfig    gcc-14.2.0
arm                     davinci_all_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                      integrator_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    gcc-14.2.0
arm                        multi_v5_defconfig    clang-20
arm                             mxs_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20241130    gcc-14.2.0
arm                   randconfig-002-20241130    gcc-14.2.0
arm                   randconfig-003-20241130    gcc-14.2.0
arm                   randconfig-004-20241130    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241130    gcc-14.2.0
arm64                 randconfig-002-20241130    clang-20
arm64                 randconfig-002-20241130    gcc-14.2.0
arm64                 randconfig-003-20241130    clang-17
arm64                 randconfig-003-20241130    gcc-14.2.0
arm64                 randconfig-004-20241130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          alldefconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241130    gcc-12
i386        buildonly-randconfig-002-20241130    gcc-12
i386        buildonly-randconfig-003-20241130    gcc-12
i386        buildonly-randconfig-004-20241130    gcc-12
i386        buildonly-randconfig-005-20241130    gcc-12
i386        buildonly-randconfig-006-20241130    gcc-12
loongarch                        alldefconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    clang-20
m68k                        stmark2_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           ci20_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    gcc-14.2.0
mips                           xway_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                    gamecube_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    clang-20
powerpc                 linkstation_defconfig    clang-20
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    clang-20
sh                          rsk7201_defconfig    clang-20
sh                          rsk7201_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    clang-20
sh                           se7705_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    clang-20
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                           x86_64_defconfig    gcc-14.2.0
x86_64                           alldefconfig    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241130    gcc-12
x86_64      buildonly-randconfig-002-20241130    gcc-12
x86_64      buildonly-randconfig-003-20241130    gcc-12
x86_64      buildonly-randconfig-004-20241130    gcc-12
x86_64      buildonly-randconfig-005-20241130    gcc-12
x86_64      buildonly-randconfig-006-20241130    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    clang-20
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

