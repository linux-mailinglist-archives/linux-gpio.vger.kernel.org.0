Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6101B19A31B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 02:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732399AbgDAA4i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 20:56:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:31238 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732397AbgDAA4i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Mar 2020 20:56:38 -0400
IronPort-SDR: qrJnLavAVaVNDfSomQT3tHvGZdPB0Zt/PQqvShuvkeA5za3WC/R30zSAZQ7tAqW5wO3NTo5x3O
 cs5JLsjUoOzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 17:56:37 -0700
IronPort-SDR: gM8+PbfOn47m6ptcnx00uFaFQ3rns/7d+he2WnwOZwZhRrr7IXrr2ayrcqRex9+cNEfinnQitq
 rMgnZOD4msVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,329,1580803200"; 
   d="scan'208";a="252432642"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Mar 2020 17:56:36 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJRgJ-0002Ao-NI; Wed, 01 Apr 2020 08:56:35 +0800
Date:   Wed, 01 Apr 2020 06:48:55 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 c42f69b4207e104229242c3d9da43b55d4b95d6d
Message-ID: <5e83c8d7.+U09lbdwa1vJfb81%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: c42f69b4207e104229242c3d9da43b55d4b95d6d  pinctrl: qcom: fix compilation error

elapsed time: 481m

configs tested: 180
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
ia64                             alldefconfig
microblaze                      mmu_defconfig
ia64                                defconfig
powerpc                             defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200331
x86_64               randconfig-a002-20200331
x86_64               randconfig-a003-20200331
i386                 randconfig-a001-20200331
i386                 randconfig-a002-20200331
i386                 randconfig-a003-20200331
alpha                randconfig-a001-20200331
m68k                 randconfig-a001-20200331
mips                 randconfig-a001-20200331
nds32                randconfig-a001-20200331
parisc               randconfig-a001-20200331
alpha                randconfig-a001-20200401
m68k                 randconfig-a001-20200401
mips                 randconfig-a001-20200401
nds32                randconfig-a001-20200401
parisc               randconfig-a001-20200401
riscv                randconfig-a001-20200401
microblaze           randconfig-a001-20200331
h8300                randconfig-a001-20200331
nios2                randconfig-a001-20200331
c6x                  randconfig-a001-20200331
c6x                  randconfig-a001-20200401
h8300                randconfig-a001-20200401
microblaze           randconfig-a001-20200401
nios2                randconfig-a001-20200401
sparc64              randconfig-a001-20200401
sparc64              randconfig-a001-20200331
csky                 randconfig-a001-20200331
openrisc             randconfig-a001-20200331
s390                 randconfig-a001-20200331
sh                   randconfig-a001-20200331
xtensa               randconfig-a001-20200331
x86_64               randconfig-b001-20200331
x86_64               randconfig-b002-20200331
x86_64               randconfig-b003-20200331
i386                 randconfig-b001-20200331
i386                 randconfig-b002-20200331
i386                 randconfig-b003-20200331
x86_64               randconfig-c001-20200331
x86_64               randconfig-c002-20200331
x86_64               randconfig-c003-20200331
i386                 randconfig-c001-20200331
i386                 randconfig-c002-20200331
i386                 randconfig-c003-20200331
x86_64               randconfig-d001-20200331
x86_64               randconfig-d002-20200331
x86_64               randconfig-d003-20200331
i386                 randconfig-d001-20200331
i386                 randconfig-d002-20200331
i386                 randconfig-d003-20200331
x86_64               randconfig-e001-20200331
x86_64               randconfig-e002-20200331
x86_64               randconfig-e003-20200331
i386                 randconfig-e001-20200331
i386                 randconfig-e002-20200331
i386                 randconfig-e003-20200331
x86_64               randconfig-f001-20200331
x86_64               randconfig-f002-20200331
x86_64               randconfig-f003-20200331
i386                 randconfig-f001-20200331
i386                 randconfig-f002-20200331
i386                 randconfig-f003-20200331
x86_64               randconfig-g001-20200331
x86_64               randconfig-g002-20200331
x86_64               randconfig-g003-20200331
i386                 randconfig-g001-20200331
i386                 randconfig-g002-20200331
i386                 randconfig-g003-20200331
x86_64               randconfig-h001-20200331
x86_64               randconfig-h002-20200331
x86_64               randconfig-h003-20200331
i386                 randconfig-h001-20200331
i386                 randconfig-h002-20200331
i386                 randconfig-h003-20200331
arc                  randconfig-a001-20200331
arm                  randconfig-a001-20200331
arm64                randconfig-a001-20200331
ia64                 randconfig-a001-20200331
powerpc              randconfig-a001-20200331
sparc                randconfig-a001-20200331
arc                  randconfig-a001-20200401
arm                  randconfig-a001-20200401
arm64                randconfig-a001-20200401
ia64                 randconfig-a001-20200401
powerpc              randconfig-a001-20200401
sparc                randconfig-a001-20200401
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc64                             defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
