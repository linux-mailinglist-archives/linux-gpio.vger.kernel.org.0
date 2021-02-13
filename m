Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91CA931A99D
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Feb 2021 03:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhBMCIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 21:08:54 -0500
Received: from mga05.intel.com ([192.55.52.43]:37699 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhBMCIy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 21:08:54 -0500
IronPort-SDR: tEcsoO07J+yLeFpkE8a/WiANTiP0bMviiXgjM3gB16mMLeompvL58QXRmp6zWTfbDEWayL2n8m
 kCsVSoETT9dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="267348949"
X-IronPort-AV: E=Sophos;i="5.81,175,1610438400"; 
   d="scan'208";a="267348949"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 18:08:13 -0800
IronPort-SDR: iA+tvtTx2fF0BrRgQtnSYRmkCkon4DtFgoUFx+/Vq7Y5qgwWyMi0qXcICQCEDqsbjqbGw0g9qt
 RuJhkZbhk+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,175,1610438400"; 
   d="scan'208";a="400064196"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2021 18:08:12 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lAkLz-000516-Bo; Sat, 13 Feb 2021 02:08:11 +0000
Date:   Sat, 13 Feb 2021 10:07:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 74f2dd447900256e8aa986be868bcd835d3c60d1
Message-ID: <6027346c.ihMfSbItEcd4lxPY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 74f2dd447900256e8aa986be868bcd835d3c60d1  dt-bindings: pinctrl: Group tuples in pin control properties

elapsed time: 721m

configs tested: 155
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
arm                     davinci_all_defconfig
arc                        vdk_hs38_defconfig
sh                        sh7763rdp_defconfig
c6x                        evmc6474_defconfig
nios2                         3c120_defconfig
powerpc                     tqm5200_defconfig
arm                           u8500_defconfig
mips                        nlm_xlp_defconfig
sh                      rts7751r2d1_defconfig
m68k                            q40_defconfig
arm                            lart_defconfig
arm                            pleb_defconfig
arm                   milbeaut_m10v_defconfig
h8300                            alldefconfig
arm                         axm55xx_defconfig
sparc                            allyesconfig
sh                        apsh4ad0a_defconfig
mips                       bmips_be_defconfig
powerpc                  iss476-smp_defconfig
sh                           se7705_defconfig
m68k                          hp300_defconfig
powerpc                 linkstation_defconfig
sh                            migor_defconfig
mips                      maltasmvp_defconfig
m68k                                defconfig
arm                          pxa3xx_defconfig
sh                           se7206_defconfig
sh                         ap325rxa_defconfig
powerpc                       eiger_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                        m5407c3_defconfig
c6x                              allyesconfig
powerpc64                           defconfig
arc                              alldefconfig
microblaze                      mmu_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
mips                           ci20_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7203_defconfig
powerpc                    gamecube_defconfig
mips                          ath79_defconfig
powerpc64                        alldefconfig
s390                          debug_defconfig
powerpc                       holly_defconfig
powerpc                     kmeter1_defconfig
powerpc                     mpc5200_defconfig
openrisc                  or1klitex_defconfig
arm                       cns3420vb_defconfig
arm                           h5000_defconfig
arm                        clps711x_defconfig
arc                        nsim_700_defconfig
powerpc                      pmac32_defconfig
openrisc                 simple_smp_defconfig
powerpc                        icon_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    socrates_defconfig
arm                        neponset_defconfig
arm                         orion5x_defconfig
xtensa                         virt_defconfig
mips                         bigsur_defconfig
sparc                               defconfig
m68k                             allmodconfig
arm                        magician_defconfig
mips                            e55_defconfig
parisc                              defconfig
parisc                generic-32bit_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a003-20210212
i386                 randconfig-a005-20210212
i386                 randconfig-a002-20210212
i386                 randconfig-a001-20210212
i386                 randconfig-a004-20210212
i386                 randconfig-a006-20210212
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
i386                 randconfig-a016-20210211
i386                 randconfig-a014-20210211
i386                 randconfig-a012-20210211
i386                 randconfig-a013-20210211
i386                 randconfig-a011-20210211
i386                 randconfig-a015-20210211
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
