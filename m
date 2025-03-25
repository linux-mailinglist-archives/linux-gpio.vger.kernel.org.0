Return-Path: <linux-gpio+bounces-17950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91128A6EB8C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF5B188CD40
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA9C19F42F;
	Tue, 25 Mar 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsJPwaUZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEA1419A9
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891376; cv=none; b=ELlNLzhRo2sKT1P0dlA+3IWR5AJ8YFC7t927MLBdjDOm9MlXLR8641l7Dm6Br7eb2WpheyWM2XJQhw4VtkEqKKohanTA5kGPg6Vjo81ULURRq+oK/kUgQ34m1YiJMekUQNxXveQBJ7tnMQrTJz1DNdO1vYBhs/jfoNujfPoJ2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891376; c=relaxed/simple;
	bh=NGSTZ00MMt0vcIine/zUBpDkShCX7ZcLJNJebkUMnbE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HGTwqx4umXfRHlUQlOuANIdhHLq5k2LFAnA9RRqRcg98PUfdbHIa/8afR0DvXOoKd++s0eTCOfTgl6R/Don279YUgPFL9HrVER2311MD2Di/yArjkyudlLE4qcxZA6qnYHcJ/T2jSKkxzLOW8ZJa9ILv2D/l4YH7go3BsyiyHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsJPwaUZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742891374; x=1774427374;
  h=date:from:to:cc:subject:message-id;
  bh=NGSTZ00MMt0vcIine/zUBpDkShCX7ZcLJNJebkUMnbE=;
  b=IsJPwaUZXdD9LqtY6IO2ne5glqek0VmaZayvnkT9bFlTByMJ/gd3x0lW
   mjQ5UggDwz2UqvPk80Mb5UHxg+seZn9RiIQORC1N5z3OFrfIAFYC2x5gZ
   PWyWnTtZ/NZSyOcecGOBYTGtkiHJ9n/7Ne1XmY1Jgn1IHqPxclCwm8y7A
   r8xTwo0vYZqKqssDuuRg2INORAFReLBNWDwgfYFpnKhFFnN4D5Ohsu7p+
   lIZ5PXmb+jBj8F199xmtPx28WTPI9EyIhRirJblKH5QMNlYUnhGGLLZoM
   ba0pySD6lkfiu2pupARezGE2eK7y6Cqnykdw7IkspQGVcIj/08VY7Ad9V
   w==;
X-CSE-ConnectionGUID: UCSen1WFT3OjtDPBahlUQw==
X-CSE-MsgGUID: rgD52yLvRu2mG+HXl6zPng==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="31727908"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="31727908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 01:29:33 -0700
X-CSE-ConnectionGUID: +mC7zxtkT7+q/Hbh/134Gw==
X-CSE-MsgGUID: iJvc360uRbaI2IE5K3enHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="155318119"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 01:29:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twzf8-0004Ez-1a;
	Tue, 25 Mar 2025 08:29:30 +0000
Date: Tue, 25 Mar 2025 16:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 89a32b6bc6bddaf1779e2c8e302f817ea32b69d4
Message-ID: <202503251644.1zyAtbAJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 89a32b6bc6bddaf1779e2c8e302f817ea32b69d4  Merge branch 'devel' into for-next

elapsed time: 1453m

configs tested: 139
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250324    gcc-12.4.0
arc                   randconfig-002-20250324    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-14
arm                          ep93xx_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                         orion5x_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250324    gcc-8.5.0
arm                   randconfig-002-20250324    gcc-7.5.0
arm                   randconfig-003-20250324    clang-21
arm                   randconfig-004-20250324    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250324    gcc-8.5.0
arm64                 randconfig-002-20250324    clang-14
arm64                 randconfig-003-20250324    clang-21
arm64                 randconfig-004-20250324    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250324    gcc-14.2.0
csky                  randconfig-002-20250324    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250324    clang-21
hexagon               randconfig-002-20250324    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250324    clang-20
i386        buildonly-randconfig-002-20250324    clang-20
i386        buildonly-randconfig-003-20250324    gcc-12
i386        buildonly-randconfig-004-20250324    clang-20
i386        buildonly-randconfig-005-20250324    gcc-12
i386        buildonly-randconfig-006-20250324    gcc-12
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250324    gcc-14.2.0
loongarch             randconfig-002-20250324    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250324    gcc-8.5.0
nios2                 randconfig-002-20250324    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250324    gcc-13.3.0
parisc                randconfig-002-20250324    gcc-5.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250324    gcc-6.5.0
powerpc               randconfig-002-20250324    clang-19
powerpc               randconfig-003-20250324    clang-21
powerpc64             randconfig-001-20250324    gcc-6.5.0
powerpc64             randconfig-002-20250324    clang-15
powerpc64             randconfig-003-20250324    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250324    clang-21
riscv                 randconfig-002-20250324    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250324    clang-15
s390                  randconfig-002-20250324    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250324    gcc-12.4.0
sh                    randconfig-002-20250324    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250324    gcc-5.5.0
sparc                 randconfig-002-20250324    gcc-11.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250324    gcc-13.3.0
sparc64               randconfig-002-20250324    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250324    clang-21
um                    randconfig-002-20250324    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250324    clang-20
x86_64      buildonly-randconfig-002-20250324    gcc-12
x86_64      buildonly-randconfig-003-20250324    clang-20
x86_64      buildonly-randconfig-004-20250324    clang-20
x86_64      buildonly-randconfig-005-20250324    clang-20
x86_64      buildonly-randconfig-006-20250324    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250324    gcc-13.3.0
xtensa                randconfig-002-20250324    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

