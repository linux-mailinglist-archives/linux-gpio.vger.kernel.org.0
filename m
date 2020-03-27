Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78A41195E72
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 20:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgC0TQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 15:16:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:62053 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgC0TQg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 15:16:36 -0400
IronPort-SDR: l8E/2uV/9qJuw0d8UetQWetfwy6vRYZU9TORQUcQd9p3iTxNhx0qIPOaTBo0yElwSSrwLEAdjH
 8VGkimyg9pDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 12:16:34 -0700
IronPort-SDR: j2t8RWl6Ft6IDGdVEAH2+h4xAviAYOAyqIjsnNIO0v//+a/HPDFWnCCQ+6ej+9XT9eyyk3AQM5
 oUp+Mtk6DHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; 
   d="scan'208";a="449117831"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2020 12:16:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jHuT2-000Bfr-JU; Sat, 28 Mar 2020 03:16:32 +0800
Date:   Sat, 28 Mar 2020 03:16:18 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 368b62f2fd077d4c7db09461e8e24f07491a513d
Message-ID: <5e7e5102.oa4Vyy/5trM3kTQu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 368b62f2fd077d4c7db09461e8e24f07491a513d  pinctrl: tegra: Add SFIO/GPIO programming on Tegra194

elapsed time: 494m

configs tested: 164
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
mips                      fuloong2e_defconfig
s390                       zfcpdump_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                              allyesconfig
um                             i386_defconfig
h8300                     edosk2674_defconfig
um                                  defconfig
sh                            titan_defconfig
ia64                             allmodconfig
parisc                            allnoconfig
ia64                             alldefconfig
m68k                           sun3_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
riscv                          rv32_defconfig
parisc                generic-32bit_defconfig
s390                          debug_defconfig
alpha                               defconfig
sh                          rsk7269_defconfig
um                           x86_64_defconfig
sparc64                          allyesconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      malta_kvm_defconfig
parisc                           allyesconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200327
x86_64               randconfig-a002-20200327
x86_64               randconfig-a003-20200327
i386                 randconfig-a001-20200327
i386                 randconfig-a002-20200327
i386                 randconfig-a003-20200327
alpha                randconfig-a001-20200327
m68k                 randconfig-a001-20200327
mips                 randconfig-a001-20200327
nds32                randconfig-a001-20200327
parisc               randconfig-a001-20200327
riscv                randconfig-a001-20200327
c6x                  randconfig-a001-20200327
h8300                randconfig-a001-20200327
microblaze           randconfig-a001-20200327
nios2                randconfig-a001-20200327
sparc64              randconfig-a001-20200327
csky                 randconfig-a001-20200327
openrisc             randconfig-a001-20200327
s390                 randconfig-a001-20200327
sh                   randconfig-a001-20200327
xtensa               randconfig-a001-20200327
x86_64               randconfig-b001-20200327
x86_64               randconfig-b002-20200327
x86_64               randconfig-b003-20200327
i386                 randconfig-b001-20200327
i386                 randconfig-b002-20200327
i386                 randconfig-b003-20200327
x86_64               randconfig-c001-20200327
x86_64               randconfig-c002-20200327
x86_64               randconfig-c003-20200327
i386                 randconfig-c001-20200327
i386                 randconfig-c002-20200327
i386                 randconfig-c003-20200327
x86_64               randconfig-d001-20200327
x86_64               randconfig-d002-20200327
x86_64               randconfig-d003-20200327
i386                 randconfig-d001-20200327
i386                 randconfig-d002-20200327
i386                 randconfig-d003-20200327
x86_64               randconfig-e001-20200327
x86_64               randconfig-e002-20200327
x86_64               randconfig-e003-20200327
i386                 randconfig-e001-20200327
i386                 randconfig-e002-20200327
i386                 randconfig-e003-20200327
x86_64               randconfig-f001-20200327
x86_64               randconfig-f002-20200327
x86_64               randconfig-f003-20200327
i386                 randconfig-f001-20200327
i386                 randconfig-f002-20200327
i386                 randconfig-f003-20200327
x86_64               randconfig-g001-20200327
x86_64               randconfig-g002-20200327
x86_64               randconfig-g003-20200327
i386                 randconfig-g001-20200327
i386                 randconfig-g002-20200327
i386                 randconfig-g003-20200327
x86_64               randconfig-h001-20200327
x86_64               randconfig-h002-20200327
x86_64               randconfig-h003-20200327
i386                 randconfig-h001-20200327
i386                 randconfig-h002-20200327
i386                 randconfig-h003-20200327
arm                  randconfig-a001-20200327
arm64                randconfig-a001-20200327
ia64                 randconfig-a001-20200327
powerpc              randconfig-a001-20200327
sparc                randconfig-a001-20200327
arc                  randconfig-a001-20200327
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                               allmodconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
