Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A054E5497
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 15:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237776AbiCWOyE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 10:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235513AbiCWOyD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 10:54:03 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E4E8118B
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648047153; x=1679583153;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dz0C6iw8Fl6MmxGUdTpnv6X52U6SlnNFoKhZNvqQ2sk=;
  b=bikmxHqr0r/5hPml6kanmmBJVEho2YUs9d4RwixWTNLQG9XjlSIC3Yez
   k2I8nr2RJcKUZ2KfcvQdJP2q5eKojaWmCiS7r0UdDr8jdRfqmjxj5FuS8
   VI3bJLi9xw5CDAOJ9BjG6ynZ2l3YJJV/C7rTFVDtQIIzRj3iD8cy22lEC
   dBURvf0vuR/0SR2nCS57O4Ntk/vFR2zv8UsdVIozHTVpa3oJLBkrviFSO
   iDG+wb9/7f5hyEqNLZXe7CorqJSYbFJSnbhgkuzPJZlZat/qaiSlGlGeR
   d8IyCBYFiEgLVjNFy16YCK+Um0jwVqJy6bIitBXgc+CUvesL608tTSSGe
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238730772"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="238730772"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 07:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="601321372"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2022 07:52:32 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nX2Lf-000K9T-U8; Wed, 23 Mar 2022 14:52:31 +0000
Date:   Wed, 23 Mar 2022 22:51:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD REGRESSION
 0c3c8458428ab471178a0d155222eaa62083d033
Message-ID: <623b33fa.pb2pVWdVg3WqlK6+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 0c3c8458428ab471178a0d155222eaa62083d033  pinctrl: nuvoton: Fix sparse warning

Error/Warning reports:

https://lore.kernel.org/linux-gpio/202203222145.UcCrXHfm-lkp@intel.com

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:26: error: array type has incomplete element type 'struct group_desc'
drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:40: error: array has incomplete element type 'struct group_desc'
drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:824:56: warning: parameter 'selector' set but not used [-Wunused-but-set-parameter]
drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:888:48: warning: parameter 'group' set but not used [-Wunused-but-set-parameter]
include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- microblaze-randconfig-c024-20220323
|   `-- drivers-pinctrl-mediatek-pinctrl-mtk-common.c:Unneeded-semicolon
`-- parisc-randconfig-r006-20220323
    |-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:error:array-type-has-incomplete-element-type-struct-group_desc
    |-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:warning:parameter-group-set-but-not-used
    |-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:warning:parameter-selector-set-but-not-used
    `-- include-linux-build_bug.h:error:bit-field-anonymous-width-not-an-integer-constant

clang_recent_errors
`-- hexagon-buildonly-randconfig-r005-20220323
    `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:error:array-has-incomplete-element-type-struct-group_desc

elapsed time: 729m

configs tested: 131
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220323
arm                         axm55xx_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    sam440ep_defconfig
mips                           jazz_defconfig
powerpc                      pasemi_defconfig
arm                           h3600_defconfig
sh                   sh7770_generic_defconfig
sh                            hp6xx_defconfig
arm                       omap2plus_defconfig
alpha                               defconfig
powerpc                     tqm8548_defconfig
ia64                             alldefconfig
sh                      rts7751r2d1_defconfig
sh                             sh03_defconfig
m68k                        mvme16x_defconfig
arm                            xcep_defconfig
s390                             allmodconfig
sh                          rsk7264_defconfig
arm                          simpad_defconfig
arm                           h5000_defconfig
nios2                         3c120_defconfig
sh                             espt_defconfig
powerpc                     pq2fads_defconfig
arm                         assabet_defconfig
um                               alldefconfig
ia64                         bigsur_defconfig
mips                         db1xxx_defconfig
parisc                generic-32bit_defconfig
sh                          rsk7203_defconfig
alpha                            alldefconfig
mips                      fuloong2e_defconfig
powerpc                        warp_defconfig
m68k                        mvme147_defconfig
sh                         ecovec24_defconfig
arm                             rpc_defconfig
riscv                               defconfig
sh                  sh7785lcr_32bit_defconfig
arm                  randconfig-c002-20220323
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
alpha                            allyesconfig
csky                                defconfig
nds32                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220323
riscv                randconfig-r042-20220323
s390                 randconfig-r044-20220323
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220323
arm                  randconfig-c002-20220323
powerpc              randconfig-c003-20220323
riscv                randconfig-c006-20220323
i386                          randconfig-c001
arm                    vt8500_v6_v7_defconfig
arm                       imx_v4_v5_defconfig
powerpc                     ksi8560_defconfig
powerpc                    mvme5100_defconfig
arm                              alldefconfig
powerpc                     kilauea_defconfig
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
hexagon              randconfig-r041-20220323
hexagon              randconfig-r045-20220323

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
