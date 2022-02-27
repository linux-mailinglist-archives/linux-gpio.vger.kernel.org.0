Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7404C5B5A
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Feb 2022 14:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbiB0NhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Feb 2022 08:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiB0NhM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Feb 2022 08:37:12 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B326D4D8
        for <linux-gpio@vger.kernel.org>; Sun, 27 Feb 2022 05:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645968996; x=1677504996;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qy2ZxkCql5R4X77PRVZq6YbU5C2lRhlRPFes2l7DQHs=;
  b=IjC85J4y2RE89j4Cwr5htL7aFuIDMVMXLMz878gll3uCWOfVL1yApdiU
   RbYtOcQZdr+K+JJBveoI1eSJ3sO4flli0XqA7evB3ghzQ+z59sjuclx4v
   Ttf1ATYbMVqjVGwnemNyCq3Xq43SgazqmDHm8b/Ne8VGufHpun053qoYd
   2HxfmboMTkNQWDdZyybFRDHxuOl9I9zYFbz8hpF1cScY2oau6VeOI2YZK
   I1AnVh3tgd/fJmKOYw/enwMoJtLqCP02IkWnHav+pA5P0KKErkKp3pCqs
   Ajng1ndvGkqv+1PyTml0fBCkFHzWULUAB1MDEpCRwhUcEHZLx3+vEC1hz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="252464376"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="252464376"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 05:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="509777417"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Feb 2022 05:36:34 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOJiz-0006X8-KI; Sun, 27 Feb 2022 13:36:33 +0000
Date:   Sun, 27 Feb 2022 21:36:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 1f02c8efa17fac30802fb50ab76d9128fc496384
Message-ID: <621b7e48.B3Nr2S0avkUn1SH1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1f02c8efa17fac30802fb50ab76d9128fc496384  Merge tag 'renesas-pinctrl-for-v5.18-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 723m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
riscv                            allyesconfig
sparc                            allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
arc                         haps_hs_defconfig
parisc                generic-32bit_defconfig
m68k                       m5275evb_defconfig
sh                            migor_defconfig
mips                  decstation_64_defconfig
openrisc                 simple_smp_defconfig
mips                           ci20_defconfig
sh                           se7780_defconfig
mips                      fuloong2e_defconfig
openrisc                  or1klitex_defconfig
powerpc                         wii_defconfig
arc                        nsim_700_defconfig
sh                           se7712_defconfig
sh                          landisk_defconfig
powerpc                      pcm030_defconfig
m68k                          sun3x_defconfig
m68k                            mac_defconfig
arm                         axm55xx_defconfig
mips                           jazz_defconfig
sh                            shmin_defconfig
m68k                           sun3_defconfig
sh                   sh7724_generic_defconfig
mips                            ar7_defconfig
sh                               j2_defconfig
m68k                       m5475evb_defconfig
nds32                               defconfig
xtensa                           alldefconfig
arm                            pleb_defconfig
parisc                generic-64bit_defconfig
m68k                       m5249evb_defconfig
arm                  randconfig-c002-20220227
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220227
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
s390                 randconfig-c005-20220227
powerpc                      acadia_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           mtx1_defconfig
powerpc                     mpc5200_defconfig
mips                        omega2p_defconfig
arm                           sama7_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227
s390                 randconfig-r044-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
