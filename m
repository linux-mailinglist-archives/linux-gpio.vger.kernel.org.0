Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E9C2AC3ED
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 19:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgKISgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 13:36:11 -0500
Received: from mga06.intel.com ([134.134.136.31]:54300 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729829AbgKISgL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 13:36:11 -0500
IronPort-SDR: GzUF3ZhJTpjcne8sS82eCh3A+CDnKEW2VNESioQLOQR8igrPehlkivcYS+FCAxYI+zSpToG5iM
 eiWiLSCmj0KQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="231480366"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="231480366"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 10:36:07 -0800
IronPort-SDR: BGBu5TcNhZWL+AiuO/qXpgVMQ/ts09UUguTfTbYLXDty8C1V8tjcN2yq+QUqICnSiggaXl3HOD
 2UhrJxg19gvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="359794701"
Received: from lkp-server01.sh.intel.com (HELO d0be80f1a028) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2020 10:35:58 -0800
Received: from kbuild by d0be80f1a028 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcC1D-0000M7-8U; Mon, 09 Nov 2020 18:35:55 +0000
Date:   Tue, 10 Nov 2020 02:34:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-extcon-cleanup] BUILD REGRESSION
 b22cd8b5becaca1b51a7b8f0b8bcbad0b288c41d
Message-ID: <5fa98bd3.dNjaaRGL3iZd1qlZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-extcon-cleanup
branch HEAD: b22cd8b5becaca1b51a7b8f0b8bcbad0b288c41d  extcon: gpio: Always check state on resume

Error/Warning reports:

https://lore.kernel.org/linux-gpio/202011091819.tK6Nf2GM-lkp@intel.com

Error/Warning in current branch:

drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- alpha-randconfig-r021-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-r005-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-r013-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-r034-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm64-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- c6x-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- c6x-randconfig-r005-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- c6x-randconfig-r022-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- h8300-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-a001-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-a002-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-a003-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-a004-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-a005-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-a006-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-r004-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-r005-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-r006-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-r031-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- ia64-randconfig-r022-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-randconfig-r001-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-randconfig-r036-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- microblaze-randconfig-r033-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- mips-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- mips-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- mips-randconfig-r021-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nds32-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nios2-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nios2-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- openrisc-randconfig-r006-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- openrisc-randconfig-s032-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- parisc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- parisc-randconfig-r004-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- powerpc-randconfig-m031-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- powerpc-randconfig-r006-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-randconfig-r025-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-randconfig-s031-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- s390-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sh-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sh-randconfig-r022-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sh-randconfig-r023-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc-randconfig-r033-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc64-randconfig-m031-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc64-randconfig-r003-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-randconfig-p002-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-randconfig-r035-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-randconfig-s032-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- xtensa-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- xtensa-randconfig-r005-20201109
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
`-- xtensa-randconfig-r006-20201109
    `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id

elapsed time: 720m

configs tested: 117
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                        nsim_700_defconfig
powerpc                       holly_defconfig
xtensa                  audio_kc705_defconfig
sh                           se7343_defconfig
arm                  colibri_pxa270_defconfig
x86_64                           allyesconfig
openrisc                 simple_smp_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltaaprp_defconfig
powerpc                    sam440ep_defconfig
powerpc                     pseries_defconfig
m68k                         amcore_defconfig
arm                         s5pv210_defconfig
mips                  cavium_octeon_defconfig
m68k                             alldefconfig
nios2                         10m50_defconfig
powerpc                     tqm8548_defconfig
c6x                        evmc6474_defconfig
sh                          rsk7201_defconfig
nios2                         3c120_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          badge4_defconfig
arm                       multi_v4t_defconfig
h8300                               defconfig
arm                          collie_defconfig
arc                                 defconfig
mips                      fuloong2e_defconfig
sh                         microdev_defconfig
arm                            mmp2_defconfig
sh                        sh7757lcr_defconfig
um                           x86_64_defconfig
mips                          rm200_defconfig
powerpc                      bamboo_defconfig
arm                            u300_defconfig
arm                       versatile_defconfig
arc                              alldefconfig
arm                        multi_v5_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                        m5307c3_defconfig
arm                             rpc_defconfig
m68k                        m5272c3_defconfig
c6x                              alldefconfig
powerpc                      pmac32_defconfig
arm                          imote2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201109
x86_64               randconfig-a002-20201109
x86_64               randconfig-a003-20201109
x86_64               randconfig-a005-20201109
x86_64               randconfig-a006-20201109
x86_64               randconfig-a001-20201109
i386                 randconfig-a004-20201109
i386                 randconfig-a006-20201109
i386                 randconfig-a005-20201109
i386                 randconfig-a001-20201109
i386                 randconfig-a003-20201109
i386                 randconfig-a002-20201109
i386                 randconfig-a014-20201109
i386                 randconfig-a015-20201109
i386                 randconfig-a013-20201109
i386                 randconfig-a016-20201109
i386                 randconfig-a011-20201109
i386                 randconfig-a012-20201109
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201109
x86_64               randconfig-a015-20201109
x86_64               randconfig-a013-20201109
x86_64               randconfig-a011-20201109
x86_64               randconfig-a014-20201109
x86_64               randconfig-a016-20201109

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
