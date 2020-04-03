Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8960D19CF0D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2020 06:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgDCEL3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Apr 2020 00:11:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:8547 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgDCEL3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 3 Apr 2020 00:11:29 -0400
IronPort-SDR: CrNVxqeEVAqic766IKH+h1Kx02ikr5gMgptyExKw8oyp9sSVOKiZPqW9Tu27PkabMNmIM4LO8I
 rdyjfDAfOPPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 21:11:28 -0700
IronPort-SDR: 4mX2v26aFWukXPqYdMaCltFMz4OmpHcki/8hDi0ySp+SpOiA7BRRVQpkAGLKlhrpv1CpAsAR7D
 aHD20BSOzA3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,338,1580803200"; 
   d="scan'208";a="360410798"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2020 21:11:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jKDfy-000E33-I1; Fri, 03 Apr 2020 12:11:26 +0800
Date:   Fri, 03 Apr 2020 12:11:15 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a
Message-ID: <5e86b763.Fs0nnntoUeLPmu1c%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a  Revert "gpio: eic-sprd: Use devm_platform_ioremap_resource()"

elapsed time: 891m

configs tested: 143
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
s390                             allyesconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                            allnoconfig
x86_64               randconfig-a003-20200402
i386                 randconfig-a002-20200402
x86_64               randconfig-a002-20200402
x86_64               randconfig-a001-20200402
i386                 randconfig-a003-20200402
i386                 randconfig-a001-20200402
alpha                randconfig-a001-20200402
m68k                 randconfig-a001-20200402
mips                 randconfig-a001-20200402
nds32                randconfig-a001-20200402
parisc               randconfig-a001-20200402
riscv                randconfig-a001-20200402
c6x                  randconfig-a001-20200402
h8300                randconfig-a001-20200402
microblaze           randconfig-a001-20200402
nios2                randconfig-a001-20200402
sparc64              randconfig-a001-20200402
csky                 randconfig-a001-20200402
openrisc             randconfig-a001-20200402
s390                 randconfig-a001-20200402
sh                   randconfig-a001-20200402
xtensa               randconfig-a001-20200402
i386                 randconfig-c003-20200402
i386                 randconfig-c001-20200402
x86_64               randconfig-c002-20200402
x86_64               randconfig-c003-20200402
i386                 randconfig-c002-20200402
x86_64               randconfig-c001-20200402
x86_64               randconfig-d003-20200402
x86_64               randconfig-d001-20200402
i386                 randconfig-d001-20200402
x86_64               randconfig-d002-20200402
i386                 randconfig-e001-20200402
x86_64               randconfig-e002-20200402
i386                 randconfig-e003-20200402
x86_64               randconfig-e001-20200402
x86_64               randconfig-e003-20200402
i386                 randconfig-e002-20200402
x86_64               randconfig-g003-20200402
i386                 randconfig-g003-20200402
x86_64               randconfig-g002-20200402
i386                 randconfig-g001-20200402
i386                 randconfig-g002-20200402
x86_64               randconfig-g001-20200402
x86_64               randconfig-h002-20200402
i386                 randconfig-h002-20200402
i386                 randconfig-h003-20200402
i386                 randconfig-h001-20200402
x86_64               randconfig-h001-20200402
x86_64               randconfig-h003-20200402
arc                  randconfig-a001-20200402
arm                  randconfig-a001-20200402
arm64                randconfig-a001-20200402
ia64                 randconfig-a001-20200402
powerpc              randconfig-a001-20200402
sparc                randconfig-a001-20200402
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
