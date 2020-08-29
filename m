Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B47256455
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 05:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgH2D3G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 23:29:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:60645 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726814AbgH2D3E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 23:29:04 -0400
IronPort-SDR: HVR1TJxG0wjCxS0fflGS+Q+KyP1Hi2O8w1c3MqbveN/ulswhwwWlgb9J6qA4yc98WU1J+9XMnC
 TLKaIM0bmibg==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="144519642"
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="144519642"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 20:29:04 -0700
IronPort-SDR: bNUfwck+d+F6eQHiiH5K2l4PiA8J/1vVsFGJ0K/u8YwnWNVJ0f0eD1af6sWFs9bvc8l1Q4h+ga
 DLc0lJwLxoBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="300441751"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2020 20:29:02 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBrY6-0000Kl-7Z; Sat, 29 Aug 2020 03:29:02 +0000
Date:   Sat, 29 Aug 2020 11:28:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-extcon-cleanup] BUILD REGRESSION
 c85fda5dfe98dcadd69c4a6d56b17be80720305a
Message-ID: <5f49cb63.MyIHhwNeAeAguwdw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-extcon-cleanup
branch HEAD: c85fda5dfe98dcadd69c4a6d56b17be80720305a  extcon: gpio: Always check state on resume

Error/Warning in current branch:

drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'
drivers/extcon/extcon-gpio.c:85:12: error: no member named 'extcon_id' in 'struct gpio_extcon_data'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- ia64-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- ia64-randconfig-r003-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- mips-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- powerpc-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
`-- sparc-allyesconfig
    `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id

clang_recent_errors
|-- arm-randconfig-r024-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
|-- arm-randconfig-r025-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
|-- mips-randconfig-r026-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
|-- powerpc-randconfig-r004-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
|-- powerpc64-randconfig-r006-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
|-- x86_64-randconfig-a002-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
|-- x86_64-randconfig-a004-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
|-- x86_64-randconfig-a005-20200828
|   `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data
`-- x86_64-randconfig-r002-20200828
    `-- drivers-extcon-extcon-gpio.c:error:no-member-named-extcon_id-in-struct-gpio_extcon_data

elapsed time: 726m

configs tested: 113
configs skipped: 8

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         cm_x300_defconfig
arc                        nsim_700_defconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
sh                          sdk7786_defconfig
arm                        multi_v5_defconfig
arm                      integrator_defconfig
mips                        nlm_xlp_defconfig
m68k                             alldefconfig
mips                      malta_kvm_defconfig
sh                   secureedge5410_defconfig
microblaze                    nommu_defconfig
mips                     cu1830-neo_defconfig
arm                              zx_defconfig
arm                         s3c6400_defconfig
arm                        vexpress_defconfig
mips                   sb1250_swarm_defconfig
sh                        edosk7760_defconfig
arm                        realview_defconfig
mips                          rb532_defconfig
ia64                         bigsur_defconfig
arm                           viper_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
arm                          tango4_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
sh                           se7750_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                        spear3xx_defconfig
xtensa                generic_kc705_defconfig
arm                        magician_defconfig
arm                        multi_v7_defconfig
s390                       zfcpdump_defconfig
arc                     haps_hs_smp_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5275evb_defconfig
arm                             pxa_defconfig
sh                          sdk7780_defconfig
arm                          ixp4xx_defconfig
sh                   rts7751r2dplus_defconfig
arm                           sunxi_defconfig
powerpc                         wii_defconfig
arm                            dove_defconfig
sh                ecovec24-romimage_defconfig
m68k                          sun3x_defconfig
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
arc                                 defconfig
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
powerpc                             defconfig
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a016-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
