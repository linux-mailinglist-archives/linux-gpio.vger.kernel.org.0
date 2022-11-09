Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4AAB622385
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 06:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiKIFoY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 00:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiKIFoY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 00:44:24 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9A015A3E
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 21:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667972663; x=1699508663;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rBSSyfGFfSHRAZMJ2u8A8MpYv7naWx/zXNKvDo7h7io=;
  b=AuNGHU4jtz2/rQFXZDeufJAS28pknaqGG232Qb0M0lHTMYhtnCmfoahI
   bsxqooNrIZdrw4QcIwSHAFD3PpLSduJd3jvi0fmUoRSv5N2hoTJnANzeC
   oqMccm1kBM9W/kMItdoq579l0XASw188Ajp+JzEFrYtGFZEc4EadW/f0E
   8Wys01Werc4yhEdSEcKSiSj0+T/SplmgZywkRaMw+svnOH4y5hsCuFyKV
   J/vEZA6fXszKUwwc+rvKswHidjsml028f2J1wTs1TUXOXus7C1AX4BBqV
   GJOOjNNJZIaEw4JtD3VhMK1/5YF1KUgiTxtpoCIMY/P0IPeMsM18kWwKP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="312692917"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="312692917"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 21:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="965863242"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="965863242"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Nov 2022 21:44:20 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osdsp-00016F-2i;
        Wed, 09 Nov 2022 05:44:19 +0000
Date:   Wed, 09 Nov 2022 13:44:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING
 a2a68e9e10bad391b01a9f4b0f3a81ce03afc2ad
Message-ID: <636b3e2e.D1TOe4drQIdfFNu/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: a2a68e9e10bad391b01a9f4b0f3a81ce03afc2ad  docs/pinctrl: fix runtime pinmuxing example

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211090942.6OVKvIdY-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/pinctrl/pinctrl-loongson2.c:212:35: warning: excess elements in struct initializer
drivers/pinctrl/pinctrl-loongson2.c:223:43: warning: initialization of 'struct loongson2_pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- arc-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- arm-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- arm64-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- ia64-allmodconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- m68k-allmodconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- m68k-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- mips-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- openrisc-randconfig-r025-20221109
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- riscv-randconfig-c042-20221108
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- riscv-randconfig-s052-20221109
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- s390-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- sh-allmodconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
|-- sh-allyesconfig
|   |-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer
|   `-- drivers-pinctrl-pinctrl-loongson2.c:warning:initialization-of-struct-loongson2_pinctrl-from-int-makes-pointer-from-integer-without-a-cast
`-- xtensa-allyesconfig
    `-- drivers-pinctrl-pinctrl-loongson2.c:warning:excess-elements-in-struct-initializer

elapsed time: 748m

configs tested: 101
configs skipped: 3

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
i386                          randconfig-c001
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sparc                       sparc32_defconfig
csky                             alldefconfig
sh                           se7712_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
mips                      loongson3_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     sequoia_defconfig
arm                             ezx_defconfig
powerpc                     mpc83xx_defconfig
powerpc                       holly_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                              alldefconfig
arm                          exynos_defconfig
mips                          rb532_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
xtensa                           allyesconfig
powerpc                      makalu_defconfig
powerpc                       maple_defconfig
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
arm                        trizeps4_defconfig
arm                           sunxi_defconfig
arc                        vdk_hs38_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7269_defconfig
arm                             rpc_defconfig
arm                      integrator_defconfig
powerpc                        cell_defconfig
powerpc                     rainier_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                        clps711x_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
nios2                            alldefconfig
powerpc                    klondike_defconfig

clang tested configs:
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                       imx_v4_v5_defconfig
arm                          moxart_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                     cu1000-neo_defconfig
mips                        qi_lb60_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                          ath25_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
